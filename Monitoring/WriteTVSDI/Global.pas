unit Global;

interface

uses winsock,icmp,Windows,Messages,SyncObjs;

const
  WM_NOTIFY_MAIN = WM_USER + 123;
  IP23221 = '192.168.3.1';
  IP24081 = '192.168.3.3';
  IP23222 = '192.168.3.5';
  IP24082 = '192.168.3.7';
  IPMTK1  = '192.168.?.?';
  IPMTK2  = '192.168.?.?';
  IP24083 = '192.168.105.2';
  IP24084 = '192.168.105.3';

type
  TStric = string[15];

  THDD       = record
    Name     :char;
    Total    :single;
    Free     :single;
  end;

  TWSCPacket = record
    Numb     :int64;
    VideoExh :boolean;
    LAN1     :boolean;
    LAN2     :boolean;
    LAN3     :boolean;
    LAN4     :boolean;
    HDDCount :byte;
    HDD      :array [0..9] of THDD;
  end;

var
  //хотим выключаться быстрее - используем WaitForSingleObject
  //загрузка ЦП при это растёт, естественно
  NeedForSpeed    :boolean = true;
  TimeToUpdate    :integer=500;
  StopEvent2408   :TEvent;
  WSCPacket       :TWSCPacket;

function Ping(Address: PAnsiChar; EchoString: PAnsiChar; PingTimeout: Integer):boolean;

implementation

function Ping(Address: PAnsiChar; EchoString: PAnsiChar; PingTimeout: Integer):boolean;
var
IPAddress: TipAddr;
ICMPPort: THandle;
PingReply:TsmICMP_Echo_Reply;
Replay:word;
begin
  IPAddress:= inet_addr (Address);
  if IPAddress= INADDR_NONE then exit;
  ICMPPort:= IcmpCreateFile();
  if ICMPPort = INVALID_HANDLE_VALUE then exit;
  Result:=false;
  Replay:=ICMPSendEcho (ICMPPort, IPAddress,
  EchoString, Length (EchoString), nil,
  @PingReply, SizeOf (PingReply), PingTimeout);
  if Replay<>0 then  result:=true;
  IcmpCloseHandle (ICMPPort);
end;

end.
