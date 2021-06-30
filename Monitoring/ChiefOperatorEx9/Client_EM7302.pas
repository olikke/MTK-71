unit Client_EM7302;

interface

uses Global,Container_EM7302,Windows,WinSock,SysUtils,Classes,Dialogs,Forms;

type

  TTCPClient = class(TThread)
  private
    Port       :integer;
    IP         :string;
    fErrCount  :byte;
    FAddr      :TSockAddr;
    FOwnAddr   :TSockAddr;
    fstrMAC    :string;
    AnswerB    :TB;
    FSocket    :integer;
    FTimeout   :TTimeVal;
    fConnState :boolean;
    TempList   :TList;
    fAdapter   :byte;
    fEM7302    :TEM7302;
    fnumb      :integer;
    procedure  INIT;
    function   MessageWait:integer;
    function   SendComm(Comm:T255;Len:byte):integer;
    procedure  SocketDisconnect;
    function   SocketConnect:integer;
    procedure  CheckList;
    function   SendCommand(Command:TKUMOQuestion):boolean;
  public
    property    ConnectionState:boolean read fConnState;
    constructor Create(IPa:string;em7302:TEM7302; numb:integer);
    procedure   UpdateMAC;
   protected
    procedure   Execute; override;
  end;
  TM=array [0..5] of byte;
  function SendARP( DESTIP,SrcIP:DWord;
                    pMACAddr:PULONG;
                    PhyAddrLen:PULONG):DWORD; stdcall; external 'IPHLPAPI.DLL';

implementation

procedure TTCPClient.CheckList;
var i:integer;
    Quest:TKUMOQuestion;
    r:integer;
begin
  cs_KUMOList[fnumb].Enter;
  try
    TempList.Assign(KUMOList[fnumb]);
    KUMOList[fnumb].Clear;
  finally
    cs_KUMOList[fnumb].Leave;
  end;
  r:=TempList.Count;
  if r>0 then
  begin
    for i:=0 to r-1 do
    begin
      Quest:=TempList[i];
      SendCommand(Quest);
      sleep(1);
    end;
    for i:=0 to r-1 do
    begin
      Quest:=TempList[i];
      Dispose(Quest);
    end;
  end;
  TempList.Clear;
end;

procedure TTCpClient.UpdateMAC;
function GetMAC(Value:TM; Length:DWord):string;
  var i:integer;
  begin
    if Length=0 then Result:='00-00-00-00-00-00' else
    begin
      Result:='';
      for i:=0 to length-2 do
      result:=result+IntToHex(Value[i],2)+'-';
      result:=result+IntToHex(Value[length-1],2);
    end;
  end;
var
  DestIP:integer;
  pMACAddr: TM;
  phyAddrLen:U_LONG;
begin
  DestIP:=inet_addr(PAnsiChar(IP));
  PhyAddrLen:=6;
  SendARP(DESTIP,0,PULONG(@pMACAddr),@PhyAddrLEn);
  fstrMAC:=GetMAC(pMACAddr,PhyAddrLen);
  fEM7302.MAC:=fstrMAC;
end;

procedure TTCpClient.SocketDisconnect;
begin
   if FSocket <> -1 then
   begin
     ShutDown(FSocket, SD_BOTH);
     CloseSocket(FSocket);
     FSocket := -1;
     fConnState:=false;
   end;
end;

function TTCpClient.SendCommand(Command:TKUMOQuestion):boolean;
var  pn:pnn; pm:pmm;
     EndOfResponse:boolean;
     MASS   :T255;
     Len    :integer;
     ComCode:TKUMO_Command;
begin
  EndOfResponse:=false;
  MASS:=Command^.MASS;
  Len :=Command^.length;
  ComCode:=Command^.Comm;
  if SendComm(MASS,Len)=-1 then
  begin
    result:=false;
    New(pn);
    pn^:=MASS;
    fEM7302.Err(Len,pn,NoSend);
    exit;
  end;
  while not EndOfResponse do
    if MessageWait>=0 then
    begin
      result:=true;
      New(pm);
      pm^:=Copy(AnswerB,0,Length(AnswerB));
      EndOfResponse:=fEM7302.PacketAnaliz(Length(AnswerB),pm,ComCode);
      if EndOfResponse then sleep(1);
    end else
    begin
      result:=false;
      New(pn);
      pn^:=MASS;
      fEM7302.Err(Len,pn,NoReply);
      EndOfResponse:=true;
    end;
end;

function TTCpClient.MessageWait:integer;
const MaxLen=262144;
var Rfds: TFDSet;
    Found:integer;
    TotalBytesRead, BytesToRead, BytesRead,TotalBytesToRead:integer;
    Buffer: array[0..Pred(MaxLen)] of AnsiChar;
    RecvAddr: TSockAddr;
    AddrLen:integer;
begin
  FD_ZERO(Rfds);
  FD_SET(FSocket, Rfds);
  Found := select(FSocket, @Rfds, nil, nil, @FTimeout);
  if Found = 0 then
  begin
    Result := -1;
    exit;
  end else
  if Found = SOCKET_ERROR then
  begin
    Result := -1;
    exit;
  end;
  TotalBytesToRead := 0;
  if ioctlsocket(FSocket, FIONREAD, TotalBytesToRead) = SOCKET_ERROR then
  begin
    Result := -1;
    exit;
  end;
  if TotalBytesToRead = 0  then
  begin
    SocketDisconnect();
    Result := -1; //0
    exit;
  end;
  TotalBytesRead := 0;
  if TotalBytesToRead > MaxLen then BytesToRead := MaxLen
  else  BytesToRead := TotalBytesToRead;
  ZeroMemory(@Buffer[0], MaxLen);
  AddrLen := SizeOf(RecvAddr);
  BytesRead := recvfrom(FSocket, Buffer, BytesToRead, 0,RecvAddr, AddrLen);
  if BytesRead = SOCKET_ERROR then
  begin
    SocketDisconnect();
    Result := -1;
    exit;
  end else
  if BytesRead = 0 then
  begin
  //  SocketDisconnect();
    Result := -1;   //0
    exit;
  end else
  begin
    Result:=1;
    SetLength(AnswerB,BytesRead);
    Move(Buffer[0],AnswerB[0],BytesRead);
  end;
end;

function TTCpClient.SendComm(Comm: T255; Len: Byte):integer;
var pn:pnn;
begin
  result:=-1;
  if FSocket=-1 then FSocket:=SocketConnect;
  if (FSocket<>-1) then
  begin
    result:=Send(FSocket,Comm[0],Len,0);
    if result = SOCKET_ERROR then
    begin
      SocketDisconnect();
    end else
    begin
      Result := 0;
    end;
  end else
  begin
    New(pn);
    pn^:=Comm;
    fEM7302.Err(Len,pn,NotOpened);
  end;
end;

constructor TTCpClient.Create(IPa: string;em7302:Tem7302;numb:integer);
begin
  inherited Create(true);
  fnumb:=numb;
  fAdapter:=numb;
  TempList:=TList.Create;
  IP:=IPa;
  Port:=12345;
  fErrCount:=0;
  fConnState:=false;
  fem7302:=em7302;
  resume;
end;

procedure TTCpClient.Execute;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    sleep(100);
    if Terminated then
    begin
      SocketDisconnect;
      TempList.Free;
      exit;
    end;
    CheckList;
  end;
end;

procedure TTCpClient.Init;
begin
  ZeroMemory(@FAddr,SizeOf(FAddr));
  FAddr.sin_family := PF_INET;
  FAddr.sin_addr.s_addr := InetAddr(AnsiString(IP));
  FAddr.sin_port := hTons(Port);
  ZeroMemory(@FOwnAddr,SizeOF(FOwnAddr));
  FOwnAddr.sin_family := PF_INET;
  if fadapter=1 then FOwnAddr.sin_addr.s_addr := InetAddr(AnsiString(IP23221))
                else FOwnAddr.sin_addr.s_addr := InetAddr(AnsiString(IP23222));
  FOwnAddr.sin_port := 0;
  FTimeout.tv_sec := 0;
  FTimeout.tv_usec := 300000;
  FSocket:=-1;
end;

function TTCpClient.SocketConnect:integer;
var
 NoBlock: integer;
 Wfd, EFd: TFDSet;
 TimeVal: TTimeVal;
 err:integer;
 FLAG:boolean;
begin
 INIT;
 FLAG:=false;
 Result := socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
 if Result = INVALID_SOCKET then
 begin
   Result := -1;
   exit;
 end;
 if bind(Result, FOwnAddr, SizeOf(FOwnAddr)) = SOCKET_ERROR then
 begin
   CloseSocket(Result);
   Result:=-1;
   exit;
 end;
 NoBlock := 1;
 if ioctlsocket(Result, FIONBIO, NoBlock) = SOCKET_ERROR then
 begin
   CloseSocket(Result);
   Result := -1;
   exit;
 end;
 if Connect(Result, FAddr, SizeOf(FAddr)) = SOCKET_ERROR then
 begin
   err:=WSAGetLastError;
   if  err =  WSAEWOULDBLOCK then
   begin
     //olikke - обязательный выход из цикла по завершению ПО
     while not FLAG do
     begin
       FD_ZERO(wfd);
       FD_SET(result, wfd);

       FD_ZERO(efd);
       FD_SET(result, efd);

       TimeVal.tv_sec := 0;
       TimeVal.tv_usec := 100;

       case select(0, nil, @wfd, @efd, @TimeVal) of
         0: sleep(50);
         1: if FD_ISSET(Result, wfd) then break
            else
            if FD_ISSET(Result, efd) then
            begin
              NoBlock := 0;
              ioctlsocket(Result, FIONBIO, NoBlock);
              CloseSocket(Result);
              Result := -1;
              exit;
            end;
         SOCKET_ERROR:
         begin
           NoBlock := 0;
           ioctlsocket(Result, FIONBIO, NoBlock);
           CloseSocket(Result);
           Result := -1;
           exit
         end;
       end;
     end;
   end
   else
   begin
     NoBlock := 0;
     ioctlsocket(Result, FIONBIO, NoBlock);
     CloseSocket(Result);
     Result := -1;
   end;
 end;
 //Возврат в блокирующий режим
 NoBlock := 0;
 if ioctlsocket(Result, FIONBIO, NoBlock) = SOCKET_ERROR then
 begin
   CloseSocket(Result);
   Result := -1;
 end;
 if Result<>-1 then fConnState:=true
               else fConnState:=false;
end;


end.
