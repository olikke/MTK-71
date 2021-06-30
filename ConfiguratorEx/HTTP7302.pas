unit HTTP7302;
interface

uses
 Windows, Messages, Sysutils, Classes, SyncObjs, Winsock, EncdDecd,Global,idUDPClient,IdGlobal,Dialogs;

const
 CRLF = #13#10;

type
 TDeviceType   = (TEM7303,TEM7302);
 TRequestType  = (IP,Mask,Gateway,IPUpdate,Zero,AutoConfig,DispIntens);
 TRequestField = record
                   Text   :string;
                   GO     :string;
                   Value  :string;
                   Length :integer;
                 end;
 TRequest      = array [TRequestType] of TRequestField;

 TArrayField   = record
                   Text   :string;
                   GO     :string;
                   Length :integer;
                 end;
 TArrayRequest = array [1..16] of TArrayField;

var  Request    :TRequest;
     SourceL1   :TArrayRequest;
     SourceL2   :TArrayRequest;
     DestinL1   :TArrayRequest;
     DestinL2   :TArrayRequest;
     SwitchTable:TArrayRequest;

type
 THTTPInputThread = class(TThread)
 private
   FHost           :Stric;
   FPort           :integer;
   FSock           :integer;
   FAddr           :TSockAddr;
   FTimeout        :TTimeVal;
   FContentLength  :integer;
   FWND            :HWND;
   FIP             :Stric;
   FMask           :Stric;
   FGateway        :Stric;
   FResult         :boolean;
   Wsa             :TWSADATA;
   fDeviceType     :TDeviceType;
   function  SocketConnect: integer;
   function  Init: integer;
   function  SendRequest(RequestType:TRequestType): integer;
   function  SendNewName(Field:TArrayField):integer;
   function  ReadData(BytesExpected: integer): integer;
   function  GetResponse: integer;
   function  SocketDisconnect: integer;
   procedure SendToForm(Step:TStep;result:TResult);
   procedure SendToFormEx(Step:TStep;result:TResult;number:integer);
   procedure RequestPrepare;
   function  NewRequest(RequestType:TRequestType;Step:TStep):boolean;
   function  NewName   (Field:TArrayField;Step:TStep;number:integer):boolean;
   function  Switch    (Field:TArrayField;Step:TStep;number:integer):boolean;
 protected
   procedure Execute; override;
 public
   constructor Create(IdentIP:Stric;WND:HWND;IP,Mask,Gateway:stric;DeviceType:TDeviceType);
 end;

 var EM7302:THTTPInputThread;
     EM7303:THTTPInputThread;

implementation

procedure THTTPInputThread.SendToForm(Step:TStep;result:TResult);
begin
  if IsWindow(FWnd) then
  PostMessage(FWND,WM_NOTIFY_MAIN,Integer(Step),Integer(Result));
end;

procedure tHTTPInputThread.SendToFormEx(Step: TStep; result: TResult; number: Integer);
begin
  if IsWindow(FWnd) then
  PostMessage(FWND,WM_NOTIFY_MAIN,Integer(Step),Integer(Result)+number shl 4);
end;

constructor THTTPInputThread.Create(IdentIP:Stric;WND:HWND;IP,Mask,Gateway:stric;DeviceType:TDeviceType);
begin
  inherited Create(true);
  FHost    := IdentIP;
  FPort    := 80;
  FWND     :=WND;
  FIP      :=IP;
  FMask    :=Mask;
  FGateway :=Gateway;
  fDeviceType:=DeviceType;
  RequestPrepare;
  Resume;
end;

procedure THTTPInputThread.RequestPrepare;
var
   FHead1          :string;
   FHead2          :string;
   FHead3          :string;
   i               :integer;
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

  Request[IP].Value        :=IntToStr(IPStringToInt(FIP));
  Request[IP].Text         :='newValue='+Request[IP].Value+'&paramName=eParamID_IPAddress_3&alt=text-plain'+CRLF+CRLF;
  Request[IP].Length       :=Length(Request[IP].Text);
  Request[IP].GO           :=FHead1+IntToStr(Request[IP].Length)+FHead2+Request[IP].Text;

  Request[Mask].Value      :=IntToStr(IPStringToInt(FMask));
  Request[Mask].Text       :='newValue='+Request[Mask].Value+'&paramName=eParamID_SubnetMask_3&alt=text-plain'+CRLF+CRLF;
  Request[Mask].Length     :=Length(Request[Mask].Text);
  Request[Mask].GO         :=FHead1+IntToStr(Request[Mask].Length)+FHead2+Request[Mask].Text;

  Request[Gateway].Value   :=IntToStr(IPStringToInt(FGateway));
  Request[Gateway].Text    :='newValue='+Request[Gateway].Value+'&paramName=eParamID_DefaultGateway_3&alt=text-plain'+CRLF+CRLF;
  Request[Gateway].Length  :=Length(Request[Gateway].Text);
  Request[Gateway].GO      :=FHead1+IntToStr(Request[Gateway].Length)+FHead2+Request[Gateway].Text;

  Request[IPUpdate].Value  :='2';
  Request[IPUpdate].Text   :='new_ip_type=2'+CRLF+CRLF;
  Request[IPUpdate].Length :=Length(Request[IpUpdate].Text);
  Request[IPUpdate].GO     :=FHead3+IntToStr(Request[IPUpdate].Length)+FHead2+Request[IPUpdate].Text;

  Request[AutoConfig].Value:='';
  Request[AutoConfig].Text :='paramName=eParamID_AutoconfigEnabled&newValue=1'+CRLF+CRLF;
  Request[AutoConfig].Length:=Length(Request[AutoConfig].Text);
  Request[AutoConfig].GO   :=FHead1+IntToStr(Request[AutoConfig].Length)+FHead2+Request[AutoConfig].Text;

  Request[DispIntens].Value:='';
  Request[DispIntens].Text :='paramName=eParamID_DisplayIntensity&newValue=3'+CRLF+CRLF;
  Request[DispIntens].Length:=Length(Request[DispIntens].Text);
  Request[DispIntens].GO   :=FHead1+IntToStr(Request[DispIntens].Length)+FHead2+Request[DispIntens].Text;

  for i:=1 to 16 do
  begin
    SourceL1[i].Text         :='paramName=eParamID_XPT_Source'+IntToStr(i)+'_Line_1&newValue=S'+IntToHex(i-1,1);
    SourceL1[i].Length       :=Length(SourceL1[i].Text);
    SourceL1[i].GO           :=FHead1+IntToStr(SourceL1[i].Length)+FHead2+SourceL1[i].Text;

    SourceL2[i].Text         :='paramName=eParamID_XPT_Source'+IntToStr(i)+'_Line_2&newValue=';
    SourceL2[i].Length       :=Length(SourceL2[i].Text);
    SourceL2[i].GO           :=FHead1+IntToStr(SourceL2[i].Length)+FHead2+SourceL2[i].Text;

    DestinL1[i].Text         :='paramName=eParamID_XPT_Destination'+IntToStr(i)+'_Line_1&newValue=D'+IntToHex(i-1,1);
    DestinL1[i].Length       :=Length(DestinL1[i].Text);
    DestinL1[i].GO           :=FHead1+IntToStr(DestinL1[i].Length)+FHead2+DestinL1[i].Text;

    DestinL2[i].Text         :='paramName=eParamID_XPT_Destination'+IntToStr(i)+'_Line_2&newValue=';
    DestinL2[i].Length       :=Length(DestinL2[i].Text);
    DestinL2[i].GO           :=FHead1+IntToStr(DestinL2[i].Length)+FHead2+DestinL2[i].Text;

    //коммутация по умолчанию - на 2-ой канал - multiscreen
    SwitchTable[i].Text      :='paramName=eParamID_XPT_Destination'+IntToStr(i)+'_Status&newValue=04';
    SwitchTable[i].Length    :=Length(SwitchTable[i].Text);
    SwitchTable[i].GO        :=FHead1+IntToStr(SwitchTable[i].Length)+FHead2+SwitchTable[i].Text;
  end;
end;

function THTTPInputThread.SocketConnect: integer;
var
 NoBlock: integer;
 Wfd, EFd: TFDSet;
 TimeVal: TTimeVal;
begin
 Result := socket(AF_INET, SOCK_STREAM, 0);
 if Result = INVALID_SOCKET then
   begin
     SendToForm(stCreation,Failure);
     Result := -1;
     exit;
   end;
 NoBlock := 1;
 if ioctlsocket(Result, FIONBIO, NoBlock) = SOCKET_ERROR then
   begin
     SendToForm(stCreation,Failure);
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
                        SendToForm(stConnection,Failure);
                        exit;
                      end;
               SOCKET_ERROR:
                 begin 
                   NoBlock := 0;
                   ioctlsocket(Result, FIONBIO, NoBlock);
                   CloseSocket(Result);
                   SendToForm(stConnection,Failure);
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
          SendToForm(stConnection,Failure);
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

function THTTPInputThread.SocketDisconnect(): integer;
begin 
 if FSock <> -1 then
   begin
     ShutDown(FSock, SD_BOTH);
     CloseSocket(FSock);
     FSock := -1;
   end;
 Result := 0;
end;

function THTTPInputThread.Init: integer;
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

function THTTPInputThread.SendRequest(RequestType:TRequestType): integer;
var
 ReturnCode: integer;
 Req: AnsiString;
begin
 FResult    :=false;
 Req        :=AnsiString(Request[RequestType].GO);
 ReturnCode := send(FSock, Req[1], Length(Req), 0);
 if ReturnCode = SOCKET_ERROR then
 begin
   Result := -1;
   SocketDisconnect();
   FSock:=SocketConnect;
   if FSock<>-1 then
   ReturnCode := send(FSock, Req[1], Length(Req), 0);
   if ReturnCode = SOCKET_ERROR then
   begin
     Result := -1;
     SocketDisconnect();
   end else result:=0
 end else result:=0
end;

function THTTPInputThread.SendNewName(Field:TArrayField):integer;
var
 ReturnCode: integer;
 Req: AnsiString;
 str:string;
begin
 FResult    :=false;
 Req        :=AnsiString(Field.GO);
 ReturnCode := send(FSock, Req[1], Length(Req), 0);
 if ReturnCode = SOCKET_ERROR then
 begin
   Result := -1;
   SocketDisconnect();
   FSock:=SocketConnect;
   if FSock<>-1 then
   ReturnCode := send(FSock, Req[1], Length(Req), 0);
   if ReturnCode = SOCKET_ERROR then
   begin
     Result := -1;
     SocketDisconnect();
   end else result:=0
 end else result:=0;
end;

function THTTPInputThread.ReadData(BytesExpected: integer): integer;
const
 MaxLen = 262144;
var
 TotalBytesToRead, Found, TotalBytesRead, BytesToRead, BytesRead: integer;
 Rfds: TFDSet;
 TempBuff: array [0..Pred(MaxLen)] of AnsiChar;
 buff:string;
begin
 FD_ZERO(Rfds);
 FD_SET(FSock, Rfds);
 Found := select(FSock, @Rfds, nil, nil, @FTimeout);
 if Found = 0 then
   begin
     Result := -1;
     exit;
   end
 else
   if Found = SOCKET_ERROR then
     begin
       Result := -1;
       exit;
     end;
 TotalBytesToRead := 0;
 if BytesExpected <> 0 then
   begin
     TotalBytesToRead := BytesExpected;
   end
 else
   begin
     if ioctlsocket(FSock, FIONREAD, TotalBytesToRead) = SOCKET_ERROR then
       begin
         Result := -1;
         exit;
       end;
     if TotalBytesToRead = 0  then
       begin
         SocketDisconnect();
         Result := 0;
         exit;
       end;
   end;
 TotalBytesRead := 0;
 repeat
   if TotalBytesToRead > MaxLen then
     BytesToRead := MaxLen
   else
     BytesToRead := TotalBytesToRead;
   ZeroMemory(@TempBuff[0], MaxLen);
   BytesRead := recv(FSock, TempBuff, BytesToRead, 0);
   if BytesRead = SOCKET_ERROR then
     begin
       SocketDisconnect();
       Result := -1;
       exit;
     end
   else
     if BytesRead = 0 then
       begin
         SocketDisconnect();
         Result := 0;
         exit;
       end
     else
       begin
         SetLength(buff,BytesRead);
         Move(TempBuff[0],Buff[1],BytesRead);
         if not FResult then FResult:=Pos('200 OK',buff)<>0;
         TotalBytesRead := TotalBytesRead + BytesRead;
         TotalBytesToRead := TotalBytesToRead - BytesRead;
       end;
 until TotalBytesToRead <= 0;
 Result := TotalBytesRead;
end;

function THTTPInputThread.GetResponse(): integer;
var
 StartPtr, EndPtr: PAnsiChar;
 BufferLen, Offset: integer;
 GotStartMarker: Boolean;
begin
 result := -1;
 Offset := 0;
 GotStartMarker := False;
 while (not Terminated) do
   begin
     BufferLen := ReadData(0);
     if BufferLen < 0 then
       begin
         result := -1;
         exit;
       end;
   end;
end;

procedure THTTPInputThread.Execute;
var i:integer;
begin
 FreeOnTerminate:=true;
 WSAStartUp($0101, Wsa);
 try
       INIT;
       SendToForm(stStart,Success);
       FSock := SocketConnect();
       if FSock<>-1 then
       begin
          SendToForm(stConnection,Success);
          if not NewRequest(IP,stIP) then exit;
          if not NewRequest(Mask,stMask) then  exit;
          if not NewRequest(Gateway,stGateway) then  exit;
          if not NewRequest(IPUpdate,stUpdate) then  exit;
          SocketDisconnect;
          FHost:=FIP;
          INIT;
          if fDeviceType=TEM7302 then
          begin
            for i:=1 to 16 do
            begin
              if not NewName(SourceL1[i],stSource,i) then exit;
              if not NewName(SourceL2[i],stSource,i) then exit;
              SendToFormEx(stSource,Success,i)
            end;
            for i:=1 to 16 do
            begin
              if not NewName(DestinL1[i],stDestination,i) then exit;
              if not NewName(DestinL2[i],stDestination,i) then exit;
              SendToFormEx(stDestination,Success,i)
            end;
            for i:=1 to 16 do
            begin
              if not Switch(SwitchTable[i],stSwitch,i) then exit;
              SendToFormEx(stSwitch,Success,i)
            end;
          end else
          if fDeviceType=TEM7303 then
          begin
            if not NewRequest(AutoConfig,stAutoConfig) then exit;
            if not NewRequest(DispIntens,stDispIntens) then exit;
          end;
          SendToForm(stStop,Success);
       end else  SendToForm(stError,Failure);
 finally
    SocketDisconnect;
    WSACleanUp;
 end;
end;

function THTTPInputThread.Switch(Field: TArrayField; Step: TStep;number:integer):boolean;
begin
  result:=NewName(Field,Step,number)
end;

function THTTPInputThread.NewName(Field: TArrayField; Step: TStep;number:integer):boolean;
begin
  result:=true;
  if SendNewName(Field) <> 0 then
  begin
    SendToFormEx(Step,Failure,number);
    result:=false;
    SendToForm(stError,Failure);
    exit;
  end;
  repeat
    FContentLength := GetResponse;
  until Terminated or (FContentLength = -1);
  if not FResult then
  begin
    SendToFormEx(Step,Failure,number);
    result:=false;
    SendToForm(stError,Failure);
  end;
end;

function THTTPInputThread.NewRequest(RequestType:TRequestType;Step:TStep):boolean;
begin
  result:=true;
  if SendRequest(RequestType) <> 0 then
  begin
    SendToForm(Step,Failure);
    result:=false;
    SendToForm(stError,Failure);
    exit;
  end;
  repeat
    FContentLength := GetResponse;
  until Terminated or (FContentLength = -1);
  if not FResult then
  begin
    SendToForm(Step,Failure);
    result:=false;
    SendToForm(stError,Failure);
  end else SendToForm(Step,Success);
end;

end.
