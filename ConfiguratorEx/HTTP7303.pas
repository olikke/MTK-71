unit HTTP7303;

interface

uses Global,Classes,Windows,Winsock;

const
 CRLF = #13#10;

type
 TRequestType  = (IP,Mask,Gateway,IPUpdate,Zero,ss);
 TRequestField = record
                   Text   :string;
                   GO     :string;
                   Value  :string;
                   Length :integer;
                 end;
 TRequest      = array [TRequestType] of TRequestField;

 var  Request    :TRequest;

type
  THTTP7303 = class (TThread)
  private
    fHost:   Stric;
    fPort:   integer;
    fWND :   HWND;
    FIP  :   Stric;
    FMask:   Stric;
    FGateway:Stric;
    FSock:   integer;
    FAddr:   TSockAddr;
    FTimeout:TTimeVal;
    procedure RequestPrepare;
    function  SocketDisconnect: integer;
    function  INIT:integer;
    procedure SendToForm(Step:TBTStep;result:TResult);
    function  SocketConnect: integer;
  protected
    procedure Execute; override;
  public
   constructor Create(IdentIP:Stric;WND:HWND;IP,Mask,Gateway:stric);
  end;

var EM7303:THTTP7303;

implementation

procedure THTTP7303.RequestPrepare;
var
   FHead1          :string;
   FHead2          :string;
   FHead3          :string;
begin
  FHead1:=    'POST /options HTTP/1.1'+CRLF +
              'Host: '+FHost+CRLF +
              'Connection: keep-alive'+CRLF +
              'Content-Length: ';
  FHead3:=    'POST /network_update HTTP/1.1'+CRLF +
              'Host: '+FHost+CRLF +
              'Connection: keep-alive'+CRLF +
              'Content-Length: ';
  FHead2:=    'Origin: http://'+FHost+CRLF +
              'X-Requested-With: XMLHttpRequest'+CRLF +
              'User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.874.122 Safari/535.2 YE'+CRLF +
              'Content-Type: application/x-www-form-urlencoded'+CRLF +
              'Accept: text/html, */*'+CRLF +
              'Referer: http://'+FHost+'/network.tmpl'+CRLF +
              'Accept-Encoding: gzip,deflate,sdch'+CRLF +
              'Accept-Language: ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4'+CRLF +
              'Accept-Charset: windows-1251,utf-8;q=0.7,*;q=0.3'+CRLF +
              ''+CRLF;
  //Request[IP].Value        :=IntToStr(IPStringToInt(FIP));
//  Request[IP].Text         :='newValue='+Request[IP].Value+'&paramName=eParamID_IPAddress_3&alt=text-plain'+CRLF+CRLF;
//  Request[IP].Length       :=Length(Request[IP].Text);
 // Request[IP].GO           :=FHead1+IntToStr(Request[IP].Length)+FHead2+Request[IP].Text;
end;

procedure THTTP7303.SendToForm(Step: TBTStep; result: TResult);
begin
  if IsWindow(FWnd) then
  PostMessage(FWND,WM_NOTIFY_MAIN,Integer(Step),Integer(Result));
end;

constructor THTTP7303.Create(IdentIP:Stric;WND:HWND;IP,Mask,Gateway:stric);
begin
  inherited create(true);
  FHost    := IdentIP;
  FPort    := 80;
  FWND     :=WND;
  FIP      :=IP;
  FMask    :=Mask;
  FGateway :=Gateway;
  RequestPrepare;
  resume;
end;

procedure THTTP7303.Execute;
var Wsa :TWSADATA;
begin
 FreeOnTerminate:=true; 
 WSAStartUp($0101, Wsa);
 try
   Init;
   SendToForm(btStart,Success);
   FSock := SocketConnect();
   if FSock<>-1 then
   begin
     SendToForm(btConnection,Success);

   end;

 finally
    SocketDisconnect;
    WSACleanUp;
 end;
end;

function THTTP7303.SocketDisconnect:integer;
begin
   if FSock <> -1 then
   begin
     ShutDown(FSock, SD_BOTH);
     CloseSocket(FSock);
     FSock := -1;
   end;
 Result := 0;
end;

function THTTP7303.INIT:integer;
begin
  ZeroMemory(@FAddr, SizeOf(FAddr));
  FAddr.sin_family := PF_INET;
  FAddr.sin_addr.s_addr := InetAddr(AnsiString(FHost));
  FAddr.sin_port := htons(FPort);
  FTimeout.tv_sec := 0;
  FTimeout.tv_usec := 500000;
  FSock := -1;
  Result := 0;
end;

function THTTP7303.SocketConnect:integer;
var
 NoBlock: integer;
 Wfd, EFd: TFDSet;
 TimeVal: TTimeVal;
begin
 Result := socket(AF_INET, SOCK_STREAM, 0);
 if Result = INVALID_SOCKET then
   begin
     SendToForm(btCreation,Failure);
     Result := -1;
     exit;
   end;
 NoBlock := 1;
 if ioctlsocket(Result, FIONBIO, NoBlock) = SOCKET_ERROR then
   begin
     SendToForm(btCreation,Failure);
     CloseSocket(Result);
     Result := -1;
     exit;
   end;
 if Connect(Result, FAddr, SizeOf(FAddr)) = SOCKET_ERROR then
   begin
     if WSAGetLastError =  WSAEWOULDBLOCK then
       begin 
         while not Terminated do
           begin
             FD_ZERO(wfd);
             FD_SET(result, wfd);

             FD_ZERO(efd);
             FD_SET(result, efd);

             TimeVal.tv_sec := 0;
             TimeVal.tv_usec := 100;

             case select(0, nil, @wfd, @efd, @TimeVal) of
               0: sleep(50);
               1: if FD_ISSET(Result, wfd) then
                    break
                  else
                    if FD_ISSET(Result, efd) then
                      begin  
                        NoBlock := 0;
                        ioctlsocket(Result, FIONBIO, NoBlock);
                        CloseSocket(Result);
                        Result := -1;
                        SendToForm(btConnection,Failure);
                        exit;
                      end;
               SOCKET_ERROR:
                 begin 
                   NoBlock := 0;
                   ioctlsocket(Result, FIONBIO, NoBlock);
                   CloseSocket(Result);
                   SendToForm(btConnection,Failure);
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
          SendToForm(btConnection,Failure);
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
end;

end.
