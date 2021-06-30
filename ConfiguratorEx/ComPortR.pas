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

 {��� ������� ��� ��������� �����}
 TReadPacketEvent = procedure (const Packet:Pointer;
                               const Size:Integer;
                               const ErrCode:Cardinal;
                               const NumComPort:Word)of object;

 TComPortR = class; {����������� ��������}

 {�������� �����}

 TReadThread = class(TThread)
   FOwner      : TComPortR;
   FInBuffer   : Pointer;   {������� �����}
   FErrCode    : Cardinal;  {��������� ��� ������}
   FCount      : Integer;   {������� ����������� ����� ����}
   FWaitResult : Word;      {����� �������� ������}
   FComNumber  : Word;      {����� ComPort}
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
   FBaudRate    : TBaudRate; {�������� ������ (���)}
   FByteSize    : TByteSize; {����� ��� � �����}
   FParity      : TParity;   {��������}
   FStopbits    : TStopbits; {����� ����-���}
   FEnableRTS   : Boolean;   {��������� ��������� RTS}
   FEnableDTR   : Boolean;   {��������� ��������� DTR}
   FWaitResult  : Word;      {����� �������� ������}
   function  GetDCB: TDCB;
   procedure SetDCB(const Value: TDCB);
  Public
   Property DCB : TDCB read GetDCB write SetDCB;
   {�������� ����� ��� ������ �������� ���� ����}
   procedure GetWaitTxDelay;
  Published
   {�������� ������}
   Property BaudRate  : TBaudRate read FBaudRate write FBaudRate;
   {����� ��� � �����}
   Property ByteSize  : TByteSize read FByteSize write FByteSize;
   {��������}
   Property Parity    : TParity   read FParity   write FParity;
   {����� ����-���}
   Property Stopbits  : TStopbits read FStopbits write FStopbits;
   {��������� ��������� RTS}
   Property EnableRTS : Boolean read FEnableRTS  write FEnableRTS;
   {��������� ��������� DTR}
   Property EnableDTR : Boolean read FEnableDTR  write FEnableDTR;
   Property WaitResult: Word    read FWaitResult write FWaitResult;
 End;

 TComPortR = class(TComponent)
  Protected
    FComNumber      : Integer;     {����� �����}
    FHandle         : THandle;     {���������� �����}
    FOnReadPacket   : TReadPacketEvent;{������� "��������� ������"}
    FReadThread     : TReadThread; {�������� �����}
    FInBufSize      : Cardinal;    {����. ������ ������� ������� }
    FWaitFullBuffer : Boolean;     {�������� ���������� ������}
    FComProp        : TComProp;    {�������� �����}
    Procedure DoOpenPort;          {�������� �����}
    Procedure DoClosePort;         {�������� �����}
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
    {���������/��������� ����}
    Procedure Open;
    Procedure Close;
    {���������� True, ���� ���� ������}
    Function  Connect : Boolean;
    {���������� ��������� ��������� ����� ComStat, � �    }
    {���������� CodeError ������������ ������� ��� ������ }
    Function  GetState(var CodeError : Cardinal) : TComStat;
    {���������� ��������� ������}
    Function  GetModemState : Cardinal;
    {�������� �����. � ������ ������ ���������� True}
    Function  WriteBuffer(const P : Pointer; const Size : Integer) : Boolean;
    {�������� ������. � ������ ������ ���������� True}
    Function  WriteString(const S : String) : Boolean;
    {���������� ��������� ��� �����}
    Function  GetComName(FullName : Boolean) : String;
    {������ ��������� ���������� �����}
    Function  CommDialog : Boolean;
  Public  
    {���������� ������ �����}
    Property ReadActive : Boolean  read GetReadActive write SetReadActive;
    {���������� True, ���� ���� ������}
    Property Connected : Boolean read GetConnected write SetConnected;
    {����� �����. ��� ��������� ���� ���������������, ���� ��� ������}
    Property ComNumber  : Integer read FComNumber    write SetComNumber;
    {��������� �����}
    Property ComProp : TComProp read FComProp write FComProp;
    {������ �������� ������}
    Property InBufSize  : Cardinal read FInBufSize write SetInBufSize;
    {�������� ���������� ������}
    Property WaitFullBuffer : Boolean  read FWaitFullBuffer write FWaitFullBuffer;
   Published
    {�������, ���������� ��� ��������� �����}
    Property OnReadPacket : TReadPacketEvent read FOnReadPacket write FOnReadPacket;
   Public {�������������� �������}
    {��������� �������� ������}
    Function GetBaseAddress : Word;
    {���������� ������ DTR}
    Procedure ToggleDTR(State : Boolean);
    {���������� ������ RTS}
    Procedure ToggleRTS(State : Boolean);
    {������������ ���� COM ������}
    Class procedure EnumComPorts(Ports: TStrings);
    Class procedure EnumComPortsEx(Ports: TStrings);
 End;

implementation

uses Dialogs, WinSpool, Math,Global;

Const
  WindowsBaudRates: array[br110..br115200] of DWORD = (
    CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400, CBR_4800, CBR_9600,
    CBR_14400, CBR_19200, CBR_38400, CBR_56000, CBR_57600, CBR_115200
    {CRB_128000, CBR_256000 - ������� � Windows.pas, �� �� ������������}
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
 FComProp  := TComProp.Create; {�������� �����}
 FHandle := INVALID_HANDLE_VALUE;
 FReadThread:= nil;
 FInBufSize := 10;
 FWaitFullBuffer := False; 
End;

Destructor  TComPortR.Destroy;
Begin
 {��������� ���� � ����������}
 DoClosePort;
 FComProp.Free;
 Inherited Destroy;
End;

Procedure TComPortR.ApplyComSettings;
Begin
 If not Connected then Exit;
 { ���������� ��������� �����, �������� DCB }
 SetCommState(FHandle, FComProp.DCB);
End;

{������ ��������� ���������� �����}
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

{��������� ������� �������� ������}
procedure TComPortR.SetInBufSize(const Value: Cardinal);
begin
 {��������� ������ ������ ��� ����������� ����������}
 If Connected then Exit;
 {������ ������ ������� ��� �������� �������� �������}
 If Value <= 0 then Exit;
 {���������� ����� ������ ������}
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

{��������� ����������}
Function TComPortR.Connect : Boolean;
Begin
 DoOpenPort;
 Result:= Connected;
End;

{��������� ���������� (��������� Connect:= True)}
Procedure TComPortR.Open;
Begin
 DoOpenPort;
End;

{�������� ���������� (��������� Connect:= False)}
Procedure TComPortR.Close;
Begin
 DoClosePort;
End;

{��������� ������ �����}
procedure TComPortR.SetComNumber(const Value: Integer);
var Active : Boolean;
begin
 If FComNumber = Value then Exit;
 Active:= Connected; {�������� �������� ���������� �����}
 If Active then DoClosePort; {������� ���� ����� ���������� �������}
 FComNumber:= Value; {������������� ����� �������� ������ �����}
 If Active then DoOpenPort; {������� ����, ���� �� ��� ������}
end;

{���������� ��������� ��� �����}
Function TComPortR.GetComName(FullName : Boolean) : String;
Begin
 {��� ������ 1..9 ����� ������������ ������� ����� COM1..COM9,}
 {�� ��� ������ 10-256 ���� ������ ������ ���. ��� ��������   }
 {����� ������ ������������ ������ ��� �����, �� �����������  }
 {������ CommConfigDialog }
 If FullName then Result:= Format('\\.\COM%-d', [FComNumber])
             else Result:= Format('COM%-d', [FComNumber]);
End;

{�������� �����}
Procedure TComPortR.DoOpenPort;
Begin
 If Connected then Exit;
 {��������� ����������� � ����� ����������}
 If csDesigning in ComponentState then Exit;

 {�������� ����������������� ����� }
 FHandle:= CreateFile(
            PChar(GetComName(True)), {�������� ��� ������������ �����}
            GENERIC_READ or GENERIC_WRITE, {������ ��� ������ � ������}
            0, { �� ����������� ������ }
            nil, { ��� ��������� ������ }
            OPEN_EXISTING, {������� ������, ���� ������ �� ����������}
            FILE_ATTRIBUTE_NORMAL or FILE_FLAG_OVERLAPPED, {����������� ����� �������}
            0 { ������ ���� 0 ��� COM ������ }
            );
 {���� ������ �������� ����� - �����}
 If not Connected then Exit;
 {������� ���������� �����}
 ApplyComSettings;
 {�������� ��������� ������}
 If not Assigned(FReadThread)then FReadThread:=TReadThread.Create(Self);
End;

{�������� �����}
Procedure TComPortR.DoClosePort;
Begin
 If not Connected then Exit;
 {������������ ����� ������}
 ReadActive:= False;
 {����������� ��������� ������}
 FReadThread.FreeOnTerminate:= True;
 FReadThread.Terminate;
 FReadThread:= nil;
 {������������ ����������� �����}
 CloseHandle(FHandle);
 {����� ����������� �����}
 FHandle:= INVALID_HANDLE_VALUE;
End;

{���������� ��������� ��������� ����� � ��� ������}
Function TComPortR.GetState(var CodeError : Cardinal) : TComStat;
Begin
 ClearCommError(FHandle, CodeError, @Result);
End;

{�������� ������}
Function  TComPortR.WriteString(const S : String) : Boolean;
Begin
 Result:= WriteBuffer(PChar(S),Length(S));
End;

{�������� ������ ������}
Function  TComPortR.WriteBuffer(const P : Pointer; const Size : Integer) : Boolean;
Var Signaled, RealWrite, BytesTrans : Cardinal;
    WriteOL : TOverLapped; {��������� ��� ����������� ������}
Begin
 Result:= False;
 If P = nil then Exit;
 {�������� ������� ��� ����������� ������}
 FillChar(WriteOL, SizeOf(WriteOL), 0);
 WriteOL.hEvent:= CreateEvent(nil, True, True, nil);
 Try
   {������ ����������� ������}
   WriteFile(FHandle, P^, Size, RealWrite, @WriteOL);
   {�������� ���������� ����������� ��������}
   Signaled:= WaitForSingleObject(WriteOL.hEvent, INFINITE);
   {��������� ���������� ����������� ��������}
   Result:=(Signaled = WAIT_OBJECT_0) and
           (GetOverlappedResult(FHandle,WriteOL,BytesTrans,False));
 Finally
  {������������ ����������� �������}
  CloseHandle(WriteOL.hEvent);
 End;  
End;

{���������� ��������� ������}
Function TComPortR.GetModemState : Cardinal;
Begin
 GetCommModemStatus(FHandle, Result);
End;

{���������� ������ �����}
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

{ ������������������� ��� ������� - ��������� �������� ������ � dx}
Function TComPortR.GetBaseAddress : Word;
Begin
 EscapeCommFunction(FHandle, 10);
 Asm
  mov  Result, dx
 End;
End;

{���������� ������ DTR}
Procedure TComPortR.ToggleDTR(State : Boolean);
const Funcs: Array[Boolean] of Cardinal = (CLRDTR, SETDTR);
Begin
 If Connected then
  EscapeCommFunction(FHandle, Funcs[State]);
End;

{���������� ������ RTS}
Procedure TComPortR.ToggleRTS(State : Boolean);
const Funcs: Array[Boolean] of Cardinal = (CLRRTS, SETRTS);
Begin
 If Connected then
  EscapeCommFunction(FHandle, Funcs[State]);
End;

{ ������������ ���� ���� ��������� ���������������� ������}
class procedure TComPortR.EnumComPorts(Ports: TStrings);
var
  BytesNeeded, Returned, I: DWORD;
  Success: Boolean;
  PortsPtr: Pointer;
  InfoPtr: PPortInfo1;
  TempStr: string;
begin
 {������ ������� ������� ������}
 Success := EnumPorts(nil, 1, nil, 0, BytesNeeded, Returned);

 If (not Success) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then begin
  {������� ������ ���� ������}
  GetMem(PortsPtr, BytesNeeded);
  Try
   {�������� ������ ���� ������}
  Success := EnumPorts(nil, 1, PortsPtr, BytesNeeded, BytesNeeded, Returned);

   {������������ ����� � StringList, �������� �� COM-�����}
  For I := 0 to Returned - 1 do
    begin
      InfoPtr := PPortInfo1(DWORD(PortsPtr) + I * SizeOf(TPortInfo1));
      TempStr := InfoPtr^.pName;
      If Copy(TempStr, 1, 3) = 'COM' then Ports.Add(TempStr);
    end;
  Finally
   {����������� �����}
  FreeMem(PortsPtr);
  End;
 End;
end;

{ ������������ ���� ��������� ���������������� ������ � �� ��������}
class procedure TComPortR.EnumComPortsEx(Ports: TStrings);
var
  BytesNeeded, Returned, I: DWORD;
  Success: Boolean;
  PortsPtr: Pointer;
  InfoPtr: PPortInfo2;
  TempStr: string;
  Description : string;
begin
 {������ ������� ������� ������}
 Success := EnumPorts(nil, 2, nil, 0, BytesNeeded, Returned);

 If (not Success) and (GetLastError = ERROR_INSUFFICIENT_BUFFER) then begin
  {������� ������ ���� ������}
  GetMem(PortsPtr, BytesNeeded);
  Try
   {�������� ������ ���� ������ � �� ��������}
   Success := EnumPorts(nil, 2, PortsPtr, BytesNeeded, BytesNeeded, Returned);

   {������������ ����� � StringList, �������� �� COM-�����}
   For I := 0 to Returned - 1 do begin
    InfoPtr := PPortInfo2(DWORD(PortsPtr) + I * SizeOf(TPortInfo2));
    TempStr := InfoPtr^.pPortName;

    {��������� �������� �����, ���� ��� ����}
    Description:= '';
    If InfoPtr^.pDescription <> nil then
     Description:= ' ' + InfoPtr^.pDescription;

    {������������ ����� � StringList, �������� �� COM-�����}
    If Copy(TempStr, 1, 3) = 'COM' then begin
     TempStr:= TempStr + Description;
     Ports.Add(TempStr);
    End;
   End;
  Finally
   {����������� �����}
   FreeMem(PortsPtr);
  End;
 end;
end;

{����� TReadThread }
Constructor TReadThread.Create(AOwner : TComPortR);
Begin
 Inherited Create(True);
 FOwner:= AOwner;
 FComNumber:=AOwner.FComNumber;
 {������� ����� �����}
 GetMem(FInBuffer, FOwner.FInBufSize);
 WaitResult := FOwner.FComProp.WaitResult;  {����� �������� ������}
End;

Destructor  TReadThread.Destroy;
Begin
 {����������� �����}
 FreeMem(FInBuffer);
 Inherited Destroy;
End;

{�������� ������� ������}
Procedure TReadThread.Execute;
Var CurrentState : TComStat;
    AvaibleBytes, ErrCode, RealRead : Cardinal;
    ReadOL : TOverLapped; {��������� ��� ������������ ������}
    Signaled, Mask : DWORD;
    BytesTrans : DWORD; {�� ������������ ��� WaitCommEvent}
    bReadable : Boolean; {���������� � ������ ������}
Begin
 With FOwner do
  begin
    Try
    {�������� ������� ��� ������������ ������}
    FillChar(ReadOL, SizeOf(ReadOL), 0);
    ReadOL.hEvent:= CreateEvent(nil, True, True, nil);
    {����� �������, ������� ����� ����������� �������� ����� }
    {���� ��� ������ ��������� �������                       }
    SetCommMask(FHandle, EV_RXCHAR);
    While (not Terminated) and Connected do
     begin {���� ���� ������}
     { ���� ������ �� ������� }
     WaitCommEvent(FHandle, Mask, @ReadOL);
     Signaled:= WaitForSingleObject(ReadOL.hEvent,WaitResult); //INFINITE);
     If (Signaled = WAIT_OBJECT_0) then             
       begin
         If GetOverlappedResult(FHandle, ReadOL, BytesTrans, False) then
           begin
             {����� GetOverlappedResult � ���������� mask, �������}
             {������������ � WaitCommEvent, �������� ����� ������������ }
             {�������, ���� 0 � ������ ������.}
             If (Mask and EV_RXCHAR) <> 0 then
               begin {�������� ��������� ����� (����� � ������)}
                 CurrentState:= GetState(ErrCode);
                 { ����� ����������, �� ��� �� ����������� ����}
                 AvaibleBytes:= CurrentState.cbInQue;
                 { �������� ����� ��������� ����}
                 If FWaitFullBuffer then
                   begin { ����� ������ ������� ������}
                     bReadable:= AvaibleBytes >= FInBufSize;
                   End else
                   begin { ����� ������ ����� ����}
                     bReadable:= AvaibleBytes > 0;
                   End;
                 If bReadable then
                   begin {������ ������}
                     ZeroMemory(FInBuffer, FInBufSize);
                     If ReadFile(FHandle, FInBuffer^, 
                                 AvaibleBytes,  //������ ��� ���������
                                 RealRead, @ReadOL) then

{                     If ReadFile(FHandle, FInBuffer^,
                                 Min(FInBufSize,AvaibleBytes),
                                 RealRead, @ReadOL) then }

                       begin {��������� ��������� ������ �������}
                         FErrCode:= ErrCode;
                         FCount  := RealRead;
                         {�������� ������� OnReadByte. ��� ������������� � VCL}
                         {���� ������� ����� Synchronize              }
                         Synchronize(DoReadPacket);
                       End;
               End;
           End;
       End;
     End;
    End; //TRY
    Finally
   {�������� ����������� ����������� �������}
   CloseHandle(ReadOL.hEvent);
   {����� ������� � ����� ��������}
   SetCommMask(FHandle, 0);
    End;
  End;
End;

{���������� ��� �������� ������� � ������� �����}
{� �������� ��������� ����� ����� Synchronize   }
Procedure TReadThread.DoReadPacket;
Begin
 With FOwner do If Assigned(OnReadPacket)
   then OnReadPacket(FInBuffer,FCount,FErrCode,FComNumber);
End;

{ TComProp }

function TComProp.GetDCB: TDCB;
begin
 { ������ ��������� }
 ZeroMemory(@Result, SizeOf(TDCB));
 { ���� DCBLength ������ ��������� ������ ��������� }
 Result.DCBLength:= SizeOf(TDCB);
 { �������� ������ (���) }
 Result.BaudRate := WindowsBaudRates[FBaudRate];
 { Windows �� ������������ �� �������� ����� ������ ���������������� ������ }
 Result.Flags    := dcb_Binary;
 { ����� ��� � ����� }
 Result.ByteSize := 5 + Ord(FByteSize);
 { �������� �������� }
 Result.Parity   := Ord(FParity);
 { ����� ���� ��� }
 Result.StopBits := Ord(FStopbits);
 If FEnableRTS then {��������� ��������� RTS}
  Result.Flags:= Result.Flags or dcb_DtrControlEnable;
 If FEnableDTR then {��������� ��������� DTR}
  Result.Flags:= Result.Flags or dcb_RtsControlEnable;
end;

procedure TComProp.SetDCB(const Value: TDCB);
var i : TBaudRate;
begin
 {�������� ������ (���)}
 FBaudRate:= br110;
 For i:= Low(WindowsBaudRates) to High(WindowsBaudRates) do
   begin
     If Value.BaudRate = WindowsBaudRates[i] then
       begin
         FBaudRate:= i;
         Break;
       end;
   end;
 {����� ��� � �����}
 FByteSize:= TByteSize(Value.ByteSize-5);
 {��������}
 FParity  := TParity(Value.Parity);
 {����� ����-���}
 FStopbits:= TStopBits(Value.StopBits);
end;

{�������� ����� ��� ������ �������� ���� ����}
procedure TComProp.GetWaitTxDelay;
Var BitsPerChar, MicroSecsPerBit, MicroSecs, MilliSecs : Cardinal;
begin
 {�������� ����� ���, ����������� ��� �������� ������ �������:}
 {     ����� ��� � ����� + 1 �����-��� + 1 ����-���           }
 BitsPerChar := DCB.ByteSize + 2;
 {���� ���� �������� ��������, �� ��� ���� ��� }
 if (FParity <> ptNONE) then inc(BitsPerChar);
 {���� ������������ 2 ����-���� - �� ���� ��� ���� ��� }
 if (FStopBits = sb2BITS) then inc(BitsPerChar);
 {Baund �������� � ���/��� - ��������� ���-�� �����������}
 {����������� �� ���� ���                                }
 MicroSecsPerBit:= 10000000 div WindowsBaudRates[FBaudRate];
 {����������� �� �����. 18 �������� �� 16 �������� ������}
 {TX FIFO, 1 ������ � TX Output � 1 ���� ������, ���� �� }
 {��� ����� ������������}
 MicroSecs := MicroSecsPerBit * BitsPerChar * 18;
 {����������� �����}
 if (MicroSecs < 10000) then MicroSecs := MicroSecs + MicroSecs;
 {������������ ��������� � ������������}
  MilliSecs := Microsecs div 10000;
 {��������� �����}
 if( (Microsecs mod 10000) <> 0 ) then inc(MilliSecs);
 {����� �� ���������� ����� �����������}
 Sleep(MilliSecs);
End;

end.
