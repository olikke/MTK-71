unit WSL;

interface

uses
  //отправка информации о своём состоянии центральному оператору
  Classes,Windows, SysUtils, Global,IdTCPConnection,IdTCPClient,IdGlobal,dIALOGS,idException;
type
  TWSL = class(TThread)
    private
      WSClient:TidTCPClient;
      MemStr:TMemoryStream;
  protected
    procedure Execute; override;
  public
    IP_Srv:string;
    Port:integer;
    cSMS:TvSMS;
    WS:String;
  end;

implementation
uses Main;

procedure TWSL.Execute;
begin
  WSClient:=TidTCPClient.Create;
  WSClient.BoundPort:=0;
  WSClient.ConnectTimeout:=10;
  WSClient.Host:=IP_Srv;
  WSClient.IPVersion:=Id_IPv4;
  WSClient.Port:=Port;
  WSClient.ReadTimeout:=10;
  WSClient.Tag:=0;
  MemStr:=TMemoryStream.Create;
  MemStr.SetSize(SizeOf(cSMS));
  try WSClient.connect;
    except
      on E:EidException do
    end;
  while not Terminated do
  begin
    if WS='VRD1' then
    begin
      EventWS1.WaitFor(INFINITE);
      EventWS1.ResetEvent;
    end;
    if WS='VRD2' then
    begin
      EventWS2.WaitFor(INFINITE);
      EventWS2.ResetEvent;
    end;
    if not WSClient.Connected then
      try WSClient.connect;
      except  end;
    if WSClient.Connected then
    try
     MemStr.Position:=0;
     MemStr.WriteBuffer(cSMS,sizeOf(cSMS));
     MemStr.Position:=0;
     WSClient.IOHandler.Write(MemStr,SizeOf(cSMS),false);
     except on E:EidException do
     end;
    if terminated then
    begin
      WSClient.Disconnect;
      WSClient.Free;
      MemStr.Free;
      exit;
    end;
  end;
end;

end.
