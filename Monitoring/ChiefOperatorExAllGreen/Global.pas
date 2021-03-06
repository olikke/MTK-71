unit Global;

interface

USES SyncObjs,winsock,Windows,Messages,Classes,icmp,Graphics;

const WM_NOTIFY_KUMO = WM_USER + 123;
      WM_NOTIFY_7212 = WM_USER + 124;
      WM_NOTIFY_5401 = WM_USER + 125;
      WM_NOTIFY_2409 = WM_USER + 126;
      WM_NOTIFY_2410 = WM_USER + 127;
      WM_NOTIFY_2322 = WM_USER + 128;
      WM_NOTIFY_2220 = WM_USER + 129;
      WM_NOTIFY_5402 = WM_USER + 130;
      WM_NOTIFY_MAIN = WM_USER + 131;
      WM_NOTIFY_VRD  = WM_USER + 132;
      WM_NOTIFY_2411 = WM_USER + 133;
      WM_NOTIFY_2408 = WM_USER + 134;
      WM_NOTIFY_2437 = WM_USER + 135;
      WM_NOTIFY_Graph= WM_USER + 139;

const
  ByteToASCII   : array [0..15] of byte = ($30,$31,$32,$33,$34,$35,$36,$37,$38,$39,$41,$42,$43,$44,$45,$46);
  ByteToHEX     : array [0..15] of char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
  //KUTo2437Arr   : array [1..8]  of byte = (5,8,3,4,1,2,7,6);
  KUtoPort      : array [1..8]  of byte = (1,3,4,2,5,6,7,8);//(1,4,2,3,5,7,6,8);
  EM2437toPort  : array [1..8]  of byte = (5,8,4,2,1,3,7,6);
  PR            = '100781';

type
  TStric     = string[15];
  TDeviceNameArr = (d2407, d24101, d24102, d24091, d24092, d24093, d72121,  d73021, d73022, d24111, d24112, d24113, d24114,d24115,d2408, d2322, d7303, d5401,
                    d3401, d24371, d24372, d24373, d24374, d54021, d54022, dpsu1,  dpsu2,  dpsu3, dpsu4, dpsu5, dpsu6,
                    dpsu7, dpsu8,  dpsu9,  d7402,  d2404,  d72131, d72132, d72133, d7305,  dMTK1, dMTK2, d0401,
                     d72122,dku,dzero);
  TDeviceArray     = record
    FullName   :string;
    Name       :string;
    SchemeName :string;
    ShortSchemeName:string;
  end;

  TDeviceArr = array [TDeviceNameArr] of TDeviceArray;

const
  DeviceArr:TDeviceArr =
  ((FullName:'Signal generation module ';Name:'TM-2407';    SchemeName:' (A28/A12)';    ShortSchemeName:  '(A12)';),
   (FullName:'Network switch '          ;Name:'TM-2410';    SchemeName:' (A28/A2)' ;    ShortSchemeName:  '(A2)';),
   (FullName:'Network switch '          ;Name:'TM-2410';    SchemeName:' (A51/A2)' ;    ShortSchemeName:  '(A2)';),
   (FullName:'Gateway module '          ;Name:'TM-2409-1';  SchemeName:' (A28/A3)' ;    ShortSchemeName:  '(A3)';),
   (FullName:'Gateway module '          ;Name:'TM-2409-1';  SchemeName:' (A28/A4)' ;    ShortSchemeName:  '(A4)';),
   (FullName:'Gateway module '          ;Name:'TM-2409-1';  SchemeName:' (A51/A3)' ;    ShortSchemeName:  '(A3)';),
   (FullName:'Modulator '               ;Name:'EM-7212-1';  SchemeName:' (A28/A5)' ;    ShortSchemeName:  '(A5)';),
   (FullName:'Remultiplexer '           ;Name:'EM-7302-1';  SchemeName:' (A28/A7)' ;    ShortSchemeName:  '(A7)';),
   (FullName:'Remultiplexer '           ;Name:'EM-7302-1';  SchemeName:' (A51/A5)' ;    ShortSchemeName:  '(A5)';),
   (FullName:'UPS module '              ;Name:'TM-2411-1';  SchemeName:' (A28/A14)';    ShortSchemeName:  '(A14)';),
   (FullName:'UPS module '              ;Name:'TM-2411-1';  SchemeName:' (A28/A15)';    ShortSchemeName:  '(A15)';),
   (FullName:'UPS module '              ;Name:'TM-2411-1';  SchemeName:' (A28/A16)';    ShortSchemeName:  '(A16)';),
   (FullName:'UPS module '              ;Name:'TM-2411-1';  SchemeName:' (A51/A7)';     ShortSchemeName:  '(A7)';),
   (FullName:'UPS module '              ;Name:'TM-2411-1';  SchemeName:' (A51/A8)';     ShortSchemeName:  '(A8)';),
   (FullName:'Videorecording device 2 ' ;Name:'TM-2408-1';  SchemeName:' (A30)'    ;    ShortSchemeName:  '(A30)';),
   (FullName:'WS of chief operator '    ;Name:'TM-2322-2';  SchemeName:' (A29)'    ;    ShortSchemeName:  '(A29)';),
   (FullName:'Channels selector '       ;Name:'EM-7303-1';  SchemeName:' (A28/A6)' ;    ShortSchemeName:  '(A6)';),
   (FullName:'Interface block '         ;Name:'EM-5401';    SchemeName:' (A28/A12/A7)'; ShortSchemeName:  '(A7)';),
   (FullName:'Mixer-generator '         ;Name:'EM-3401';    SchemeName:' (A28/A12/A6)'; ShortSchemeName:  '(A6)';),
   (FullName:'Matching unit '           ;Name:'EM-2437';    SchemeName:' (A28/A12/A2)'; ShortSchemeName:  '(A2)';),
   (FullName:'Matching unit '           ;Name:'EM-2437';    SchemeName:' (A28/A12/A3)'; ShortSchemeName:  '(A3)';),
   (FullName:'Matching unit '           ;Name:'EM-2437';    SchemeName:' (A28/A12/A4)'; ShortSchemeName:  '(A4)';),
   (FullName:'Matching unit '           ;Name:'EM-2437';    SchemeName:' (A28/A12/A5)'; ShortSchemeName:  '(A5)';),
   (FullName:'RS-485 channel splitter ' ;Name:'EM-5402';    SchemeName:' (A28/A12/A8)'; ShortSchemeName:  '(A8)';),
   (FullName:'RS-485 channel splitter ' ;Name:'EM-5402';    SchemeName:' (A28/A12/A9)'; ShortSchemeName:  '(A9)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A11)';ShortSchemeName:  '(A11)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A12)';ShortSchemeName:  '(A12)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A13)';ShortSchemeName:  '(A13)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A14)';ShortSchemeName:  '(A14)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A15)';ShortSchemeName:  '(A15)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A16)';ShortSchemeName:  '(A16)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A17)';ShortSchemeName:  '(A17)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A18)';ShortSchemeName:  '(A18)';),
   (FullName:'Power unit '              ;Name:'PSU-192-b';  SchemeName:' (A28/A12/A19)';ShortSchemeName:  '(A19)';),
   (FullName:'Multiscreen video signal generator ';Name:'EM-7402';  SchemeName:' (A28/A12/A1)';ShortSchemeName:  '(A1)';),
   (FullName:'Signals distribution module'        ;Name:'TM-2404';  SchemeName:' (A5/A6)';     ShortSchemeName:  '(A6)';),
   (FullName:'Coder'                   ;Name:'EM-7213-1';  SchemeName:' (A28/A8)';      ShortSchemeName:  '(A8)';),
   (FullName:'Coder'                   ;Name:'EM-7213-1';  SchemeName:' (A28/A9)';      ShortSchemeName:  '(A9)';),
   (FullName:'Coder'                   ;Name:'EM-7213-1';  SchemeName:' (A28/A10)';     ShortSchemeName:  '(A10)';),
   (FullName:'Test signals unit'       ;Name:'EM-7305-1';  SchemeName:' (A28/A11)';     ShortSchemeName:  '(A11)';),
   (FullName:'Landing system'          ;Name:'Landing system';           SchemeName:'';               ShortSchemeName:  '';),
   (FullName:'Network switch'          ;Name:'TM-2410';    SchemeName:'?';              ShortSchemeName:  '(A?)';),
   (FullName:'Block of technological connection';Name:'EM-0401'; SchemeName:'';         ShortSchemeName:  '(A10)';),
   (FullName:'Modulator '               ;Name:'EM-7212-1';  SchemeName:' (A51/A4)' ;    ShortSchemeName:  '(A4)';),
   (FullName:'           '              ;Name:' ';  SchemeName:'  ';     ShortSchemeName:  '';),
   (FullName:''                         ;Name:'';           SchemeName:'';               ShortSchemeName:  '(A)';));

   IP23221 = '192.168.3.1';
   IP23222 = '192.168.4.1';
   IP24081 = '192.168.3.3';
   IP24082 = '192.168.4.3';
   IP24091 = '192.168.3.2';
   IP24092 = '192.168.3.4';
   IP24093 = '192.168.4.2';
   IP73021 = '192.168.3.6';
   IP73022 = '192.168.4.6';
   IP7303  = '192.168.3.8';
   IPMTK1  = '192.168.1.1';
   IP24111 = '192.168.3.12';
   IP24112 = '192.168.3.14';
   IP24113 = '192.168.3.16';
   IP24114 = '192.168.4.12';
   IP24115 = '192.168.4.14';
   IP23223 = '192.168.1.100';
   IP23224 = '192.168.1.200';
   IP24083 = '192.168.1.101';
   IP24084 = '192.168.1.201';

   EM5401Addr  = $15;
   EM2437Addr  = $30;

   _Red  :TColor = $0066DD22;//$005577FF;
   _Green:TColor = $0066DD22;
   _Gray :TColor = $0066DD22;//$00DAE0DE;
   _Yell :TColor = $0066DD22;//$0000DDFF;


type
  T13   = array [0..13] of byte;
  T25   = array [0..25] of byte;
  T15   = array [0..15] of byte;
  T255  = array [0..255] of byte;
  T05   = array [0..4] of byte;
  T20   = array [0..20] of byte;
  TKUMO_Command = (BK_I,BK_N,BK_T,BK_R,BK_D,QD_B,QD_N,TI,QN_S,QN_D,MA_C,Zerro);
  T5401_Command = (UnknownCommand5401,StatusOfDevice5401,StatusOfSynchro,StatusOfTest,
                   StateOfInternalLine,RunningTime5401,Identification5401,StatusOfFeed1,
                   StatusOfFeed2,ThresholdOfFeed1,ThresholdOfFeed2);
  T2437_Command = (UnknownCommand,StatusOfDevice,StatusOfVideo,StatusOfFeed,RunningTime,
                   Identification,CorrectionCh1,CorrectionCh2,CorrectionCh3,
                   CorrectionCh4,StatusOfFeed11,StatusOfFeed12,StatusOfFeed21,
                   StatusOfFeed22,ThresholdOfFeed11,ThresholdOfFeed12,
                   ThresholdOfFeed21,ThresholdOfFeed22,MaskOfVideo);
  TDeviceType  =(dtEM5401,dtEM2437);
  T2220_Command = (TVDon,TVDoff,LEDon,LEDoff,HEATERon,HEATERoff,HEATERauto,FANon,FANoff,FANauto,TVDd,YCG,YCE,CCG,CCE,Unknown);
  TResult       = (Success,NoReply,NoSend,ErrorCheckSum,NotOpened,NotIdent,Processing,Error1,Error2,Error3,NeedToInit,InitSuccess,InitNewDevice,NeedToRefresh,RefreshSuccess,RefreshFail);
  TB    = array of Byte;
  pmm   = ^TB;
  pnn   = ^T255;
  TKUMOQuest  = record
    MASS   :T255;
    length :integer;
    Comm   :TKUMO_Command;
  end;
  TKUMOQuestion = ^TKUMOQuest;

  T5401Quest = record
    MASS    :T25;
    length  :integer;
    Comm5401:T5401_Command;
    Comm2437:T2437_Command;
    DevType :TDeviceType;
    DevNumb :byte;
  end;

  T5401Question = ^T5401Quest;

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

const Command2437: array [T2437_Command] of byte =
                   (0,1,2,5,8,9,11,12,13,14,21,22,23,24,25,26,27,28,32);
      Command5401: array [T5401_Command] of byte =
                   (0,1,2,3,6,8,9,21,22,25,26);

var
  QuestionList   :TList;
  cs_QuestionList:tCriticalSection;
  FSN            :array [0..9] of string;
  ReadTableFromKumo: array [1..2] of boolean;
  FirstVRDMessage:boolean;


var
  //????? ??????????? ??????? - ?????????? WaitForSingleObject
  //???????? ?? ??? ??? ??????, ???????????
  NeedForSpeed    :boolean = true;
  StopEvent73021  :TEvent;
  StopEvent73022  :TEvent;
  StopEvent72121  :TEvent;
  StopEvent72122  :TEvent;
  StopEvent5401   :TEvent;
  StopEvent24091  :TEvent;
  StopEvent24092  :TEvent;
  StopEvent24093  :TEvent;
  StopEvent24101  :TEvent;
  StopEvent24102  :TEvent;
  StopEvent24101d :TEvent;
  StopEvent24102d :TEvent;
  StopEvent2322   :TEvent;
  StopEvent54021  :TEvent;
  StopEvent54022  :TEvent;
  StopEvent24111  :TEvent;
  StopEvent24112  :TEvent;
  StopEvent24113  :TEvent;
  StopEvent24114  :TEvent;
  StopEvent24115  :TEvent;
  StopEvent3401   :TEvent;
  StopEventFull   :TEvent;
  StopEventGraph  :array [1..2] of TEvent;
  GlobalFreq      :int64;
  TimeToUpdate    :integer=500;
  cs_KUMOList     :array [1..2] of TCriticalSection;
  KUMOList        :array [1..2] of TList;
  WSCPacket       :TWSCPacket;
  cs_WSCPacket    :TCriticalSection;
  GraphBM1,GraphBM2:TBitmap;
  GraphCS1,GraphCS2:TCriticalSection;


  function  InetAddr(const AHost: AnsiString): DWORD;
  procedure CheckSumCalculation(var N:T255;Count:integer);
  function  Ping(Address: PAnsiChar; EchoString: PAnsiChar; PingTimeout: Integer):boolean;

implementation

procedure CheckSumCalculation(var N:T255;Count:integer);
var Cd:integer;
     i:integer;
begin
  Cd:=0;
  for i:=1 to Count-1 do Cd:=Cd+N[i];
  Cd:=$100 - Cd MOD $100;
  if CD DIV 16 in [0..15] then N[Count]  :=ByteToASCII[CD DIV 16]
                          else N[Count]  :=0;
  if CD MOD 16 in [0..15] then N[Count+1]:=ByteToASCII[CD MOD 16]
                          else N[Count+1]:=0;
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
