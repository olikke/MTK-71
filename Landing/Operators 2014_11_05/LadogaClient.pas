unit LadogaClient;

interface

uses
  Classes,Windows,WinSock,Dialogs,Global,SysUtils,BufferQueue;

type
  TSendLadogaWSP = class(TThread)
  private
    UAddr1:TSockAddr;
    UAddr2:TSockAddr;
    UHost1:string;
    UHost2:string;
    UPort:integer;
    USock1:integer;
    USock2:integer;
    UOwnAddr1:string;
    UOwnAddr2:string;
    function  SocketConnect(Num:byte):integer;
    function  SocketDisconnect(Num:byte):integer;
    procedure DoSend(Buffer:string);
  protected
    procedure Execute; override;
  public
    constructor Create(Host1:string; Host2:string; OwnAddr1:string; OwnAddr2:string; Port:integer);
  end;

function InetAddr(const AHost: AnsiString): DWORD;

implementation

uses Main;

constructor TSendLadogaWSP.Create(Host1: string; Host2: string; OwnAddr1:string; OwnAddr2:string; Port: Integer);
begin
  inherited Create(true);
  FreeOnTerminate:=false;
  UHost1:=Host1;
  UHost2:=Host2;
  UOwnAddr1:=OwnAddr1;
  UOwnAddr2:=OwnAddr2;
  UPort :=Port;
  Resume;
end;

function TSendLadogaWSP.SocketConnect(Num:byte):integer;
var i:integer;
    Addr: TSockAddr;
begin
  // Создание сокета
  Result := socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
  if Result = INVALID_SOCKET then
  begin
    Result:=-1;
    exit;
  end;
  // Адрес для привязки сокета для отправки
  FillChar(Addr.sin_zero, SizeOf(Addr.sin_zero), 0);
  Addr.sin_family := AF_INET;
  //каждый сокет привязан к своему адресу
  case Num of
    1: Addr.sin_addr.S_addr := InetAddr(UOwnAddr1);
    2: Addr.sin_addr.S_addr := InetAddr(UOwnAddr2);
  end;
  //а вот порт нас мало волнует
  Addr.sin_port := 0;
  // непосредственно привязка
  if bind(Result, Addr, SizeOf(Addr)) = SOCKET_ERROR then
  begin
    CloseSocket(Result);
    Result:=-1;
  end;

end;

function TSendLadogaWSP.SocketDisconnect(Num:byte):integer;
begin
  case Num of
    1: if USock1<>-1 then
       begin
         CloseSocket(USock1);
         USock1:=-1;
       end;
    2: if USock2<>-1 then
       begin
         CloseSocket(USock2);
         USock2:=-1;
       end;
  end;
  Result:=0;
end;

////////////////////////////////////////////////////////////////////////////////
///              Поскольку данные для нас критически важны,                  ///
///                    для избежания потери дейтаграмм,                      ///
///              будем выдавать их одновременно в двух подсетях              ///
////////////////////////////////////////////////////////////////////////////////

procedure TSendLadogaWSP.Execute;
var Wsa: TWSADATA;
var buff:string;
begin
  if WSAStartUp($0101, Wsa)=SOCKET_ERROR then
  begin
    exit;
  end;
  FillChar(UAddr1.sin_zero, SizeOf(UAddr1.sin_zero), 0);
  UAddr1.sin_family := AF_INET;
  UAddr1.sin_addr.s_addr := InetAddr(AnsiString(UHost1));
  UAddr1.sin_port := htons(UPort);
  FillChar(UAddr2.sin_zero, SizeOf(UAddr2.sin_zero), 0);
  UAddr2.sin_family := AF_INET;
  UAddr2.sin_addr.s_addr := InetAddr(AnsiString(UHost2));
  UAddr2.sin_port := htons(UPort);
  USock1:=-1;
  USock2:=-1;
  try
    while not Terminated do
    begin
      if USock1 = -1 then USock1:=SocketConnect(1);
      if USock2 = -1 then USock2:=SocketConnect(2);
      if (USock1<>-1) or (USock2<>-1) then
      begin
        if not SendQueue.Empty then      // если в очереди че-то есть
        if SendQueue.Get(buff) then      // и если оно взялось
        begin
          DoSend(buff);              // то отправляем
        end;
        if SendQueue.Empty then sleep(10);
      end else sleep(500);
    end;    
  finally
    SocketDisconnect(1);
    SocketDisconnect(2);
    WSACleanUp;
  end;
end;

procedure TSendLadogaWSP.DoSend(Buffer: string);
// отправка данных из буфера
// большие объемы данных отправляются по частям
var L,k:integer;
    Sends:string;
    flag:boolean;
  procedure Send_(pData:PByte; iLen:Integer);
  var n:integer;
  //собственно отправка
  begin
    if USock1<>-1 then
    n:=Sendto(USock1,pData^, iLen,0,UAddr1,SizeOf(UAddr1));
    if (n=SOCKET_ERROR) or (n<>iLen)
    then SocketDisconnect(1);
    if USock2<>-1 then
    n:=Sendto(USock2,pData^, iLen,0,UAddr2,SizeOf(UAddr2));
    if (n=SOCKET_ERROR) or (n<>iLen)
    then SocketDisconnect(2); 
  end;
begin
  L:=Length(Buffer);
  if L=0 then exit;
  if L<=PACKET_SLICE_BODY_SIZE then
  //отправка пакета целиком
  begin
    Send_(PByte(@Buffer[1]),L);
  end else
  //отправка по кусочкам
  //для данного случая - unreal - оставлено для совместимости
  begin
    ShowMessage('ByPies');
    SetLength(Sends,PACKET_SLICE_BODY_SIZE);
    flag:=false;
    k:=0;
    while not flag do
    begin
      Move(Buffer[1+k*PACKET_SLICE_BODY_SIZE],Sends[1],PACKET_SLICE_BODY_SIZE);
      Inc(k);
      Send_(PByte(@Sends[1]),L);
      if (k*PACKET_SLICE_BODY_SIZE)>=L then flag:=true else sleep(1);
    end;
  end;
end;

function InetAddr(const AHost: AnsiString): DWORD;
var
 PHost: PAnsiChar;
 HostEnt: PHostEnt;
begin
 if AHost = '' then
   result := DWORD($FFFFFFFF)
 else
   begin
     PHost := PAnsiChar(AHost);
     Result := inet_addr(PHost);
     if Result = DWORD($FFFFFFFF) then
       begin
         HostEnt := GetHostByName(PHost);
         if HostEnt <> nil then
           Result := DWORD(pointer(HostEnt^.h_addr^)^);
       end;
   end;
end;

end.
