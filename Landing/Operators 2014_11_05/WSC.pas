unit WSC;

interface
//отправка данных о сопровождении от левого и правого операторов центральному
uses
  Classes, Windows, SysUtils, Global,IdException,IdGlobal,IdUDPClient,IdSocketHandle,Dialogs;

type
  TWSC = class(TThread)
  private
    UDPCLient:TidUDPClient;
    Answer:String[3];
  protected
    procedure Execute; override;  
  public
    mData:string;
    IP_Srv:string;
    Port:integer;
    WS:String;
  end;


implementation
uses Main;

procedure TWSC.Execute;
begin
  //Создание клиента для передачи данных
  UDPClient:=TIdUDPClient.Create;
  UDPClient.BufferSize:=8192;
  UDPClient.IPVersion:=Id_IPv4;
  UDPClient.Port:=Port;
  UDPClient.ReceiveTimeout:=10;
  UDPClient.Tag:=0;
  UDPClient.BroadcastEnabled:=false;
  try UDPClient.Active:=True;
  except end;
  while not Terminated do
  begin
    if WS='111' then
    begin
      EventWC1.WaitFor(INFINITE);
      EventWC1.ResetEvent;
    end;
    if WS='222' then
    begin
      EventWC2.WaitFor(INFINITE);
      EventWC2.ResetEvent;
    end;
    try UDPClient.Send(IP_Srv,UDPClient.Port,mData);
    except  end;
    Answer:='';
    try Answer:=UDPClient.ReceiveString(3);
    except  end;
    if (Answer<>'') then
    if NMain<>nil then
    if NMain.Visible then PostMessage(NMain.Handle,WM_NOTIFY_MSG,StrToInt(ws),StrToInt(Answer));
    if terminated then
    exit;
  end;
end;

end.
