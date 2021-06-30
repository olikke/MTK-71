unit ToMonitoringSystem;

interface

uses Classes,IdException,IdGlobal,IdUDPClient,IdSocketHandle,Global,MyPanel,Graphics,Dialogs,Sysutils;

type
  TMonitoring = class(TThread)
  private
    UDPCLient1:TidUDPClient;
    UDPCLient2:TidUDPClient;
    Number:int64;
    procedure Analiz;
  protected
    procedure Execute; override;

  end;

type
  TPacket = record
    Numb:int64;
    FullLanding,
    ShipPower,
    OLS1,OLS2,
    RACS1,RACS2,
    Ilmen1,Ilmen2,
    WSP,WSL,WSR,VRD,
    KU1,KU2,KU3,KU4,
    tm2320,tm2402:TState;
  end;

var Packet:TPacket;
const
  IP_Srv1='192.168.1.127';
  IP_Srv2='192.168.1.255';

implementation

procedure TMonitoring.Analiz;
var i:integer;
    mArrStateDevice:array [1..DevCount] of TArrStateDevice;
    ds:TState;
    RedCount,YellowCount:byte;
begin
    INC(Number);
    cs_ArrStateDevice.Enter;
    try
      for i:=1 to DevCount do mArrStateDevice[i]:=ArrStateDevice[i];
    finally
      cs_ArrStateDevice.Leave;
    end;
    ds:=dsGreen;
    case MTK201i of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
    end;
    Packet.FullLanding:=ds;
    for i in [1..3,7..10,16,20] do
    begin
      case mArrStateDevice[i].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      with Packet do
      case i of
        1: WSP:=ds;
        2: WSL:=ds;
        3: WSR:=ds;
        7: KU1:=ds;
        8: KU2:=ds;
        9: KU4:=ds;
        10:KU3:=ds;
        16:VRD:=ds;
        20:tm2320:=ds;
      end;
    end;
    if ExternalDevice.OLS=1 then
    begin
      case mArrStateDevice[38].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.OLS1:=ds;
      case mArrStateDevice[39].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.OLS2:=ds;
    end else
    begin
      Packet.OLS1:=dsGray;
      Packet.OLS2:=dsGray;
    end;
    if ExternalDevice.PRLK = 1 then
    begin
      case mArrStateDevice[45].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.RACS1:=ds;
      case mArrStateDevice[46].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.RACS2:=ds;
    end else
    begin
      Packet.RACS1:=dsGray;
      Packet.RACS2:=dsGray;
    end;
    if ExternalDevice.Telem=1 then
    begin
      case mArrStateDevice[40].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.Ilmen1:=ds;
      case mArrStateDevice[41].ResultState of
        0 : ds:=dsRed;
        1 : ds:=dsGreen;
        2 : ds:=dsWhite;
        3 : ds:=dsYellow;
      end;
      Packet.Ilmen2:=ds;
    end else
    begin
      Packet.Ilmen1:=dsGray;
      Packet.Ilmen2:=dsGray;
    end;
    i:=0;
    if TUPS(ArrDevice[17]).DataExh<>0 then
    if TUPS(ArrDevice[17]).Params[2]>0 then  Inc(i);
    if TUPS(ArrDevice[18]).DataExh<>0 then
    if TUPS(ArrDevice[18]).Params[2]>0 then  Inc(i);
    if TUPS(ArrDevice[19]).DataExh<>0 then
    if TUPS(ArrDevice[19]).Params[2]>0 then  Inc(i);
    case i of
      0:    Packet.ShipPower:=dsRed;
      1,2:  Packet.ShipPower:=dsYellow;
      3:    Packet.ShipPower:=dsGreen;
    end;
    RedCount:=0;
    YellowCount:=0;
    for i in [12..15,17..19] do
    case mArrStateDevice[i].ResultState of
      0 : INC(RedCount);
      3 : INC(YellowCount);
    end;
    case TM2404i of
      0: INC(RedCount);
      3: INC(YellowCount);
    end;
    with Packet do
    if RedCount>0 then Packet.tm2402:=dsRed else
    if YellowCount>0 then Packet.tm2402:=dsYellow else
                            Packet.tm2402:=dsGreen;
    Packet.Numb:=Number;
end;

procedure TMonitoring.Execute;
var mData:string;
begin
  UDPClient1:=TIdUDPClient.Create;
  UDPClient1.BufferSize:=8192;
  UDPClient1.IPVersion:=Id_IPv4;
  UDPClient1.Port:=4444;
  UDPClient1.ReceiveTimeout:=10;
  UDPClient1.Tag:=0;
  UDPClient1.BroadcastEnabled:=true;
  try UDPClient1.Active:=True;
  except end;
  UDPClient2:=TIdUDPClient.Create;
  UDPClient2.BufferSize:=8192;
  UDPClient2.IPVersion:=Id_IPv4;
  UDPClient2.Port:=4445;
  UDPClient2.ReceiveTimeout:=10;
  UDPClient2.Tag:=0;
  UDPClient2.BroadcastEnabled:=true;
  try UDPClient2.Active:=True;
  except end;
  sleep(1000);
  Number:=0;
  while not Terminated do
  begin
    sleep(500);
    if terminated then exit;
    Analiz;
    setLength(mData,SizeOf(Packet));
    move(Packet, mData[1],sizeof(Packet));
    try UDPClient1.Send(IP_Srv1,UDPClient1.Port,mData);
    except  end;
    try UDPClient2.Send(IP_Srv2,UDPClient2.Port,mData);
    except  end;
  end;
end;

end.
