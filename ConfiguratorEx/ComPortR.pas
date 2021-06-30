unit ComPortR;

interface

uses
  Windows, Classes, SysUtils, Forms;

Type
 TBaudRate = (br110, br300, br600, br1200, br2400, br4800, br9600,
              br14400, br19200, br38400, br56000, br57600, br115200);
 TByteSize = (bs5, bs6, bs7, bs8);
 TParity   = (ptNONE, ptODD, ptEVEN, ptMARK, ptSPACE);
 TStopbits = (sb1BITS, sb1HALFBITS, sb2BITS);

 {тип события при получении байта}
 TReadPacketEvent = procedure (const Packet:Pointer;
                               const Size:Integer;
                               const ErrCode:Cardinal;
                               const NumComPort:Word)of object;

 TComPortR = class; {опережающее описание}

 {читающий поток}

 TReadThread = class(TThread)
   FOwner      : TComPortR;
   FInBuffer   : Pointer;   {входной буфер}
   FErrCode    : Cardinal;  {сохраняет код ошибок}
   FCount      : Integer;   {реально прочитанное число байт}
   FWaitResult : Word;      {время ожидания ответа}
   FComNumber  : Word;      {номер ComPort}
  Protected
   Procedure Execute; override;
   Procedure DoReadPacket;
  Public
   Constructor Create(AOwner : TComPortR);
   Destructor  Destroy; override;
   Property WaitResult : Word read FWaitResult write FWaitResult;
   Property ComNumber  : Word read FComNumber  write FComNumber;
 End;

 TComProp = class(TPersistent)
  Private
   FBaudRate    : TBaudRate; {скорость обмена (бод)}
   FByteSize    : TByteSize; {число бит в байте}
   FParity      : TParity;   {четность}
   FStopbits    : TStopbits; {число стоп-бит}
   FEnableRTS   : Boolean;   {разрешить управлять RTS}
   FEnableDTR   : Boolean;   {разрешить управлять DTR}
   FWaitResult  : Word;      {время ожидания ответа}
   function  GetDCB: TDCB;
   procedure SetDCB(const Value: TDCB);
  Public
   Property DCB : TDCB read GetDCB write SetDCB;
   {значение паузы для полной передачи всех байт}
   procedure GetWaitTxDelay;
  Published
   {Скорость обмена}
   Property BaudRate  : TBaudRate read FBaudRate write FBaudRate;
   {Число бит в байте}
   Property ByteSize  : TByteSize read FByteSize write FByteSize;
   {Четность}
   Property Parity    : TParity   read FParity   write FParity;
   {Число стоп-бит}
   Property Stopbits  : TStopbits read FStopbits write FStopbits;
   {разрешить управлять RTS}
   Property EnableRTS : Boolean read FEnableRTS  write FEnableRTS;
   {разрешить управлять DTR}
   Property EnableDTR : Boolean read FEnableDTR  write FEnableDTR;
   Property WaitResult: Word    read FWaitResult write FWaitResult;
 End;

 TComPortR = class(TComponent)
  Protected
    FComNumber      : Integer;     {номер порта}
    FHandle         : THandle;     {дескриптор порта}
    FOnReadPacket   : TReadPacketEvent;{событие "получение пакета"}
    FReadThread     : TReadThread; {читающий поток}
    FInBufSize      : Cardinal;    {макс. размер входной очереди }
    FWaitFullBuffer : Boolean;     {ожидание наполнения буфера}
    FComProp        : TComProp;    {свойства порта}
    Procedure DoOpenPort;          {открытие порта}
    Procedure DoClosePort;         {закрытие порта}
    Procedure ApplyComSettings;
  Private
    function  GetConnected: Boolean;
    procedure SetConnected(const Value: Boolean);
    procedure SetComNumber(const Value: Integer);
    procedure SetReadActive(const Value: Boolean);
    function  GetReadActive: Boolean;
    procedure SetInBufSize(const Value: Cardinal);
  Public
    Constructor Create(AOwner : TComponent); override;
    Destructor  Destroy; override;
    {Открывает/закрывает порт}
    Procedure Open;
    Procedure Close;
    {Возвращает True, если порт открыт}
    Function  Connect : Boolean;
    {Возвращает структуру состояния порта ComStat, а в    }
    {переменной CodeError возвращается текущий код ошибки }
    Function  GetState(var CodeError : Cardinal) : TComStat;
    {Возвращает состояние модема}
    Function  GetModemState : Cardinal;
    {Передает буфер. В случае успеха возвращает True}
    Function  WriteBuffer(const P : Pointer; const Size : Integer) : Boolean;
    {Передает строку. В случае успеха возвращает True}
    Function  WriteString(const S : String) : Boolean;
    {Возвращает строковое имя порта}
    Function  GetComName(FullName : Boolean) : String;
    {Диалог настройки параметров порта}
    Function  CommDialog : Boolean;
  Public  
    {Активность чтения порта}
    Property ReadActive : Boolean  read GetReadActive write SetReadActive;
    {Возвращает True, если порт открыт}
    Property Connected : Boolean read GetConnected write SetConnected;
    {Номер порта. При изменении порт переоткрывается, если был открыт}
    Property ComNumber  : Integer read FComNumber    write SetComNumber;
    {Параметры порта}
    Property ComProp : TComProp read FComProp write FComProp;
    {Размер входного буфера}
    Property InBufSize  : Cardinal read FInBufSize write SetInBufSize;
    {Ожидание наполнения буфера}
    Property WaitFullBuffer : Boolean  read FWaitFullBuffer write FWaitFullBuffer;
   Published
    {Событие, вызываемое при получении байта}
    Property OnReadPacket : TReadPacketEvent read FOnReadPacket write FOnReadPacket;
   Public {Дополнительные функции}
    {Получение базового адреса}
    Function GetBaseAddress : Word;
    {Управление линией DTR}
    Procedure ToggleDTR(State : Boolean);
    {Управление линией RTS}
    Procedure ToggleRTS(State : Boolean);
    {Перечисление всех COM портов}
    Class procedure EnumComPorts(Ports: TStrings);
    Class procedure EnumComPortsEx(Ports: TStrings);
 End;

implementation

uses Dialogs, WinSpool, Math,Global;

Const
  WindowsBaudRates: array[br110..br115200] of DWORD = (
    CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400, CBR_4800, CBR_9600,
    CBR_14400, CBR_19200, CBR_38400, CBR_56000, CBR_57600, CBR_115200
    {CRB_128000, CBR_256000 - описаны в Windows.pas, но не используются}
  );

Const
  dcb_Binary              = $00000001;
  dcb_ParityCheck         = $00000002;
  dcb_OutxCtsFlow         = $00000004;
  dcb_OutxDsrFlow         = $00000008;
  dcb_DtrControlMask      = $00000030;
  dcb_DtrControlDisable   = $00000000;
  dcb_DtrControlEnable    = $00000010;
  dcb_DtrControlHandshake = $00000020;
  dcb_DsrSensivity        = $00000040;
  dcb_TXContinueOnXoff    = $00000080;
  dcb_OutX                = $00000100;
  dcb_InX                 = $00000200;
  dcb_ErrorChar           = $00000400;
  dcb_NullStrip           = $00000800;
  dcb_RtsControlMask      = $00003000;
  dcb_RtsControlDisable   = $00000000;
  dcb_RtsControlEnable    = $00001000;
  dcb_RtsControlHandshake = $00002000;
  dcb_RtsControlToggle    = $00003000;
  dcb_AbortOnError        = $00004000;
  dcb_Reserveds           = $FFFF8000;

Constructor TComPortR.Create(AOwner : TComponent);
Begin
 Inherited Create(AOwner);
 FComProp  := TComProp.Create; {свойства порта}
 FHandle := INVALID_HANDLE_VALUE;
 FReadThread:= nil;
 FInBufSize := 10;
 FWaitFullBuffer := False; 
End;

Destructor  TComPortR.Destroy;
Begin
 {Закрываем порт и соединение}
 DoClosePort;
 FComProp.Free;
 Inherited Destroy;
End;

Procedure TComPortR.ApplyComSettings;
Begin
 If not Connected then Exit;
 { Установить настройки порта, согласно DCB }
 SetCommState(FHandle, FComProp.DCB);
End;

{Диалог настройки параметров порта}
Function TComPortR.CommDialog : Boolean;
Var ComCfg : TCommConfig;
Begin
 ZeroMemory(@ComCfg, SizeOf(TCommConfig));
 ComCfg.dwSize:= SizeOf(TCommConfig);
 ComCfg.dcb   := FComProp.DCB;
 Result := CommConfigDialog(PChar(GetComName(False)), 0, ComCfg);
 If Result then
   begin
     FComProp.DCB:= ComCfg.dcb;
     ApplyComSettings;
   end;
End;

{Изменение размера входного буфера}
procedure TComPortR.SetInBufSize(const Value: Cardinal);
begin
 {Разрешаем менять только при выключенном соединении}
 If Connected then Exit;
 {Нельзя задать нулевое или неверное значение размера}
 If Value <= 0 then Exit;
 {Запоминаем новый размер буфера}
 FInBufSize:= Value;
end;

function TComPortR.GetConnected: Boolean;
begin
 Result:= (FHandle <> INVALID_HANDLE_VALUE);
end;

procedure TComPortR.SetConnected(const Value: Boolean);
begin
 If Value then DoOpenPort else DoClosePort;
end;

{Установка соединения}
Function TComPortR.Connect : Boolean;
Begin
 DoOpenPort;
 Result:= Connected;
End;

{Установка соединения (дублирует Connect:= True)}
Procedure TComPortR.Open;
Begin
 DoOpenPort;
End;

{Закрытие соединения (дублирует Connect:= False)}
Procedure TComPortR.Close;
Begin
 DoClosePort;
End;

{Установка номера порта}
procedure TComPortR.SetComNumber(const Value: Integer);
var Active : Boolean;
begin
 If FComNumber = Value then Exit;
 Active:= Connected; {сохраним значение активности порта}
 If Active then DoClosePort; {закрыть порт перед изменением индекса}
 FComNumber:= Value; {устанавливаем новое значение номера порта}
 If Active then DoOpenPort; {открыть порт, если он был открыт}
end;

{Возвращает строковое имя порта}
Function TComPortR.GetComName(FullName : Boolean) : String;
Begin
 {Для портов 1..9 можно использовать простые имена COM1..COM9,}
 {но для портов 10-256 надо писать полное имя. Для общности   }
 {будем всегда использовать полное имя порта, за исключением  }
 {вызова CommConfigDialog }
 If FullName then Result:= Format('\\.\COM%-d', [FComNumber])
             else Result:= Format('COM%-d', [FComNumber]);
End;

{открытие порта}
Procedure TComPortR.DoOpenPort;
Begin
 If Connected then Exit;
 {Запрещаем подключение в среде разработки}
 If csDesigning in ComponentState then Exit;

 {Открытие последовательного порта }
 FHandle:= CreateFile(
            PChar(GetComName(True)), {передаем имя открываемого порта}
            GENERIC_READ or GENERIC_WRITE, {ресурс для чтения и записи}
            0, { не разделяемый ресурс }
            nil, { Нет атрибутов защиты }
            OPEN_EXISTING, {вернуть ошибку, если ресурс не существует}
            FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, {асинхронный режим доступа}
            0 { Должно быть 0 для COM портов }
            );
 {Если ошибка открытия порта - выход}
 If not Connected then Exit;
 {Задание параметров порта}
 ApplyComSettings;
 {Создание читающего потока}
 If not Assigned(FReadThread)then FReadThread:=TReadThread.Create(Self);
End;

{закрытие порта}
Procedure TComPortR.DoClosePort;
Begin
 If not Connected then Exit;
 {Замораживаем поток чтения}
 ReadActive:= False;
 {Уничтожение читающего потока}
 FReadThread.FreeOnTerminate:= True;
 FReadThread.Terminate;
 FReadThread:= nil;
 {Освобождение дескриптора порта}
 CloseHandle(FHandle);
 {Сброс дескриптора порта}
 FHandle:= INVALID_HANDLE_VALUE;
End;

{Возвращает структуру состояния порта и код ошибок}
Function TComPortR.GetState(var CodeError : Cardinal) : TComStat;
Begin
 ClearCommError(FHandle, CodeError, @Result);
End;

{Передача строки}
Function  TComPortR.WriteString(const S : String) : Boolean;
Begin
 Result:= WriteBuffer(PChar(S),Length(S));
End;

{Передача буфера данных}
Function  TComPortR.WriteBuffer(const P : Pointer; const Size : Integer) : Boolean;
Var Signaled, RealWrite, BytesTrans : Cardinal;
    WriteOL : TOverLapped; {структура для асинхронной записи}
Begin
 Result:= False;
 If P = nil then Exit;
 {создание события для асинхронной записи}
 FillChar(WriteOL, SizeOf(WriteOL), 0);
 WriteOL.hEvent:= CreateEvent(nil, True, True, nil);
 Try
   {начало асинхронной записи}
   WriteFile(FHandle, P^, Size, RealWrite, @WriteOL);
   {ожидания завершения асинхронной операции}
   Signaled:= WaitForSingleObject(WriteOL.hEvent, INFINITE);
   {получение результата асинхронной операции}
   Result:=(Signaled = WAIT_OBJECT_0) and
           (GetOverlappedResult(FHandle,WriteOL,BytesTrans,False));
 Finally
  {освобождение дескриптора события}
  CloseHandle(WriteOL.hEvent);
 End;  
End;

{Возвращает состояние модема}
Function TComPortR.GetModemState : Cardinal;
Begin
 GetCommModemStatus(FHandle, Result);
End;

{Активность чтения порта}
procedure TComPortR.SetReadActive(const Value: Boolean);
begin
 If Assigned(FReadThread) then
   begin
     If Value then If FReadThread.Suspended then FReadThread.Resume
              else If not FReadThread.Suspended then FReadThread.Suspend;
   end;
end;

function TComPortR.GetReadActive: Boolean;
begin
 Result:= False;
 If Assigned(FReadThread) then Result:= not FReadThread.Suspended;
end;

{ недокументированный код функции - получение базового адреса в dx}
Function TComPortR.GetBaseAddress : Word;
Begin
 EscapeCommFunction(FHandle, 10);
 Asm
  mov  Result, dx
 End;
End;

{Управление линией DTR}
Procedure TComPortR.ToggleDTR(State : Boolean);
const Funcs: Array[Boolean] of Cardinal = (CLRDTR, SETDTR);
Begin
 If Connected then
  EscapeCommFunction(FHandle, Funcs[State]);
End;

{Управление линией RTS}
Procedure TComPortR.ToggleRTS(State : Boolean);
const Funcs: Array[Boolean] of Cardinal = (CLRRTS, SETRTS);
Begin
 If Connected then
  EscapeCommFunction(FHandle, Funcs[State]);
End;

{ перечисление имен всех доступных коммуникационных портов}
class procedure TComPortR.EnumComPorts(Ports: TStrings);
var
  BytesNeeded, Returned, I: DWORD;
  Success: Boolean;
  PortsPtr: Pointer;
  InfoPtr: PPortInfo1;
  TempStr: string;
begin
 {Запрос размера нужного буфера}
 Success := EnumPorts(nil, 1, nil, 0, BytesNeeded, Returned);

 If (not Success) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then begin
  {Отводим нужный блок памяти}
  GetMem(PortsPtr, BytesNeeded);
  Try
   {Получаем список имен портов}
  Success := EnumPorts(nil, 1, PortsPtr, BytesNeeded, BytesNeeded, Returned);

   {Переписываем имена в StringList, отсеивая не COM-порты}
  For I := 0 to Returned - 1 do
    begin
      InfoPtr := PPortInfo1(DWORD(PortsPtr) + I * SizeOf(TPortInfo1));
      TempStr := InfoPtr^.pName;
      If Copy(TempStr, 1, 3) = 'COM' then Ports.Add(TempStr);
    end;
  Finally
   {Освобождаем буфер}
  FreeMem(PortsPtr);
  End;
 End;
end;

{ перечисление всех доступных коммуникационных портов и их описаний}
class procedure TComPortR.EnumComPortsEx(Ports: TStrings);
var
  BytesNeeded, Returned, I: DWORD;
  Success: Boolean;
  PortsPtr: Pointer;
  InfoPtr: PPortInfo2;
  TempStr: string;
  Description : string;
begin
 {Запрос размера нужного буфера}
 Success := EnumPorts(nil, 2, nil, 0, BytesNeeded, Returned);

 If (not Success) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then begin
  {Отводим нужный блок памяти}
  GetMem(PortsPtr, BytesNeeded);
  Try
   {Получаем список имен портов и их описания}
   Success := EnumPorts(nil, 2, PortsPtr, BytesNeeded, BytesNeeded, Returned);

   {Переписываем имена в StringList, отсеивая не COM-порты}
   For I := 0 to Returned - 1 do begin
    InfoPtr := PPortInfo2(DWORD(PortsPtr) + I * SizeOf(TPortInfo2));
    TempStr := InfoPtr^.pPortName;

    {Добавляем описание порта, если оно есть}
    Description:= '';
    If InfoPtr^.pDescription <> nil then
     Description:= ' ' + InfoPtr^.pDescription;

    {Переписываем имена в StringList, отсеивая не COM-порты}
    If Copy(TempStr, 1, 3) = 'COM' then begin
     TempStr:= TempStr + Description;
     Ports.Add(TempStr);
    End;
   End;
  Finally
   {Освобождаем буфер}
   FreeMem(PortsPtr);
  End;
 end;
end;

{Класс TReadThread }
Constructor TReadThread.Create(AOwner : TComPortR);
Begin
 Inherited Create(True);
 FOwner:= AOwner;
 FComNumber:=AOwner.FComNumber;
 {Создаем новый буфер}
 GetMem(FInBuffer, FOwner.FInBufSize);
 WaitResult := FOwner.FComProp.WaitResult;  {время ожидания ответа}
End;

Destructor  TReadThread.Destroy;
Begin
 {Освобождаем буфер}
 FreeMem(FInBuffer);
 Inherited Destroy;
End;

{Основная функция потока}
Procedure TReadThread.Execute;
Var CurrentState : TComStat;
    AvaibleBytes, ErrCode, RealRead : Cardinal;
    ReadOL : TOverLapped; {структура для асинхронного чтения}
    Signaled, Mask : DWORD;
    BytesTrans : DWORD; {не используется для WaitCommEvent}
    bReadable : Boolean; {готовность к чтению данных}
Begin
 With FOwner do
  begin
    Try
    {создание события для асинхронного чтения}
    FillChar(ReadOL, SizeOf(ReadOL), 0);
    ReadOL.hEvent:= CreateEvent(nil, True, True, nil);
    {Маска событий, которые будет отслеживать читающий поток }
    {Пока это только получение символа                       }
    SetCommMask(FHandle, EV_RXCHAR);
    While (not Terminated) and Connected do
     begin {пока порт открыт}
     { Ждем одного из событий }
     WaitCommEvent(FHandle, Mask, @ReadOL);
     Signaled:= WaitForSingleObject(ReadOL.hEvent,WaitResult); //INFINITE);
     If (Signaled = WAIT_OBJECT_0) then             
       begin
         If GetOverlappedResult(FHandle, ReadOL, BytesTrans, False) then
           begin
             {после GetOverlappedResult в переменной mask, которая}
             {передавалась в WaitCommEvent, появятся флаги произошедших }
             {событий, либо 0 в случае ошибки.}
             If (Mask and EV_RXCHAR) <> 0 then
               begin {Получаем состояние порта (линий и модема)}
                 CurrentState:= GetState(ErrCode);
                 { Число полученных, но еще не прочитанных байт}
                 AvaibleBytes:= CurrentState.cbInQue;
                 { Проверка числа доступных байт}
                 If FWaitFullBuffer then
                   begin { ждать только полного буфера}
                     bReadable:= AvaibleBytes >= FInBufSize;
                   End else
                   begin { ждать любого числа байт}
                     bReadable:= AvaibleBytes > 0;
                   End;
                 If bReadable then
                   begin {Чистка буфера}
                     ZeroMemory(FInBuffer, FInBufSize);
                     If ReadFile(FHandle, FInBuffer^, 
                                 AvaibleBytes,  //Читать все пришедшее
                                 RealRead, @ReadOL) then

{                     If ReadFile(FHandle, FInBuffer^,
                                 Min(FInBufSize,AvaibleBytes),
                                 RealRead, @ReadOL) then }

                       begin {сохраняем параметры вызова события}
                         FErrCode:= ErrCode;
                         FCount  := RealRead;
                         {Вызываем событие OnReadByte. Для синхронизации с VCL}
                         {надо вызвать метод Synchronize              }
                         Synchronize(DoReadPacket);
                       End;
               End;
           End;
       End;
     End;
    End; //TRY
    Finally
   {закрытие дескриптора сигнального объекта}
   CloseHandle(ReadOL.hEvent);
   {Сброс события и маски ожидания}
   SetCommMask(FHandle, 0);
    End;
  End;
End;

{Вызывается для передачи события о приходе байта}
{в основной компонент через метод Synchronize   }
Procedure TReadThread.DoReadPacket;
Begin
 With FOwner do If Assigned(OnReadPacket)
   then OnReadPacket(FInBuffer,FCount,FErrCode,FComNumber);
End;

{ TComProp }

function TComProp.GetDCB: TDCB;
begin
 { Чистка структуры }
 ZeroMemory(@Result, SizeOf(TDCB));
 { Пеле DCBLength должно содержать размер структуры }
 Result.DCBLength:= SizeOf(TDCB);
 { Скорость обмена (бод) }
 Result.BaudRate := WindowsBaudRates[FBaudRate];
 { Windows не поддерживает не бинарный режим работы последовательных портов }
 Result.Flags    := dcb_Binary;
 { Число бит в байте }
 Result.ByteSize := 5 + Ord(FByteSize);
 { Контроль четности }
 Result.Parity   := Ord(FParity);
 { Число стоп бит }
 Result.StopBits := Ord(FStopbits);
 If FEnableRTS then {разрешить управлять RTS}
  Result.Flags:= Result.Flags or dcb_DtrControlEnable;
 If FEnableDTR then {разрешить управлять DTR}
  Result.Flags:= Result.Flags or dcb_RtsControlEnable;
end;

procedure TComProp.SetDCB(const Value: TDCB);
var i : TBaudRate;
begin
 {скорость обмена (бод)}
 FBaudRate:= br110;
 For i:= Low(WindowsBaudRates) to High(WindowsBaudRates) do
   begin
     If Value.BaudRate = WindowsBaudRates[i] then
       begin
         FBaudRate:= i;
         Break;
       end;
   end;
 {число бит в байте}
 FByteSize:= TByteSize(Value.ByteSize-5);
 {четность}
 FParity  := TParity(Value.Parity);
 {число стоп-бит}
 FStopbits:= TStopBits(Value.StopBits);
end;

{значение паузы для полной передачи всех байт}
procedure TComProp.GetWaitTxDelay;
Var BitsPerChar, MicroSecsPerBit, MicroSecs, MilliSecs : Cardinal;
begin
 {вычислим число бит, необходимых для передачи одного символа:}
 {     число бит в байте + 1 старт-бит + 1 стоп-бит           }
 BitsPerChar := DCB.ByteSize + 2;
 {если есть контроль четности, то еще один бит }
 if (FParity <> ptNONE) then inc(BitsPerChar);
 {если используется 2 стоп-бита - то плюс еще один бит }
 if (FStopBits = sb2BITS) then inc(BitsPerChar);
 {Baund задается в бит/сек - вычисляем кол-во необходимых}
 {микросекунд на один бит                                }
 MicroSecsPerBit:= 10000000 div WindowsBaudRates[FBaudRate];
 {Микросекунд на буфер. 18 получено из 16 символов буфера}
 {TX FIFO, 1 символ в TX Output и 1 один символ, если он }
 {уже начал передаваться}
 MicroSecs := MicroSecsPerBit * BitsPerChar * 18;
 {Ограничение снизу}
 if (MicroSecs < 10000) then MicroSecs := MicroSecs + MicroSecs;
 {Микросекунды переводим в миллисекунды}
  MilliSecs := Microsecs div 10000;
 {Округляем вверх}
 if( (Microsecs mod 10000) <> 0 ) then inc(MilliSecs);
 {Пауза на полученное число миллисекунд}
 Sleep(MilliSecs);
End;

end.
