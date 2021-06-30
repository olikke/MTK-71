unit Ping;

interface

uses
  Classes,Windows, SysUtils, Global,icmp,WinSock;

type
  TPing = class(TThread)
  private

  protected
    procedure Execute; override;
    function Ping (Address: PAnsiChar; EchoString: PChar;
    PingTimeout: Integer):boolean;
  private
    fl_1:integer;
    fl_2:integer;
    fl_3:integer;
    fl_4:integer;
    fl_5:integer;
    fl_6:integer;
    fl_7:integer;
    Time1,Time2:int64;
    TimeToSleep:integer;
    Freq:int64;
  public
    IP_1:String; //два своих адреса
    IP_2:String;
    IP_3:String; //два центральных   VRD для центрального
    IP_4:string;
    //для центрального оператора
    IP_5:string; // 2409_1
    IP_6:string; // 2409_2
    IP_7:string; // 2320
    LAN_1:boolean;
    LAN_2:boolean;
    LAN_3:boolean;
    LAN_4:boolean;
    LAN_5:boolean;
    LAN_6:boolean;
    LAN_7:boolean;
  end;

implementation

uses main;

function TPing.Ping(Address: PAnsiChar; EchoString: PAnsiChar; PingTimeout: Integer):boolean;
var
IPAddress: TipAddr;
ICMPPort: THandle;
PingReply:TsmICMP_Echo_Reply;
Replay:word;
begin
  Result:=false;
  IPAddress:= inet_addr (Address);
  if IPAddress= INADDR_NONE then exit;
  ICMPPort:= IcmpCreateFile();
  if ICMPPort = INVALID_HANDLE_VALUE then exit;
  QueryPerformanceCounter(Time1);
  Replay:=ICMPSendEcho (ICMPPort, IPAddress,
  EchoString, Length (EchoString), nil,
  @PingReply, SizeOf (PingReply), PingTimeout);
  QueryPerformanceCounter(Time2);
  if Replay<>0 then  result:=true;
  IcmpCloseHandle (ICMPPort);
end;

procedure TPing.Execute;
var str:string;
begin
  LAN_1:=false;
  LAN_2:=false;
  fl_1:=0;
  fl_2:=0;
  fl_3:=0;
  fl_4:=0;
  fl_5:=0;
  fl_6:=0;
  fl_7:=0;
  TimeToSleep:=60;
  str:='aaaaaaaa';
  while not Terminated do
  begin
      QueryPerformanceFrequency(Freq);
      //первая подсеть
      if fl_1=0 then
      begin
       LAN_1:=ping(PAnsiChar(IP_1),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_1:=0  //слишком долгий запрос в случае отсутствия соединения
       else begin
         fl_1:=TimeToSleep;
         LAN_1:=false;
       end;
      end else Dec(fl_1);
      if (fl_3=0) and (LAN_1) then
      begin
       LAN_3:=ping(PAnsiChar(IP_3),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_3:=0
       else begin
         fl_3:=TimeToSleep;
         LAN_3:=false;
       end;
      end else Dec(fl_3);
      if {(fl_5=0) and} (LAN_1) and (IP_5<>'') then
      begin
       LAN_5:=ping(PAnsiChar(IP_5),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_5:=0
       else begin
         fl_5:=5;
         LAN_5:=false;
       end;
      end else Dec(fl_5);
      //вторая подсеть
      if fl_2=0 then
      begin
       LAN_2:=ping(PAnsiChar(IP_2),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_2:=0
       else begin
         fl_2:=TimeToSleep;
         LAN_2:=false;
       end;
      end else Dec(fl_2);
      if (fl_4=0) and (LAN_2) then
      begin
       LAN_4:=ping(PAnsiChar(IP_4),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_4:=0
       else begin
         fl_4:=TimeToSleep;
         LAN_4:=false;
       end;
      end else Dec(fl_4);
      if {(fl_6=0) and} (LAN_2) and (IP_6<>'') then
      begin
       LAN_6:=ping(PAnsiChar(IP_6),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_6:=0
       else begin
         fl_6:=5;
         LAN_6:=false;
       end;
      end else Dec(fl_6);
      if {(fl_7=0) and} (LAN_2) and (IP_7<>'') then
      begin
       LAN_7:=ping(PAnsiChar(IP_7),PAnsiChar(str),10);
       if (Time2-Time1)/Freq*1000<=10 then fl_7:=0
       else begin
         fl_7:=5;
         LAN_7:=false;
       end;
      end else Dec(fl_7);
      if ((not LAN_3) and (not LAN_4)) //нет центрального
      or ((not LAN_1) and (not LAN_2)) //нет своих сетевых
      or ((not LAN_1) and (not LAN_4)) //перекрёстные проверки
      or ((not LAN_2) and (not LAN_3)) then
      begin
        fl_1:=0;
        fl_2:=0;
        fl_3:=0;
        fl_4:=0;
        fl_5:=0;
        fl_6:=0;
        fl_7:=0;
      end;
      Synchronize(NMain.ArmState);
      TimeOut(500);
  end;
  if terminated then exit;
end;

end.
