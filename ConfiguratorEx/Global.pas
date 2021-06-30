unit Global;

interface

uses Windows,SysUtils,winsock,Messages,ICMP,ShellAPI;

const WM_NOTIFY_MAIN = WM_USER + 123;
      WM_NOTIFY_UPS  = WM_USER + 124;
      WM_NOTIFY_NP   = WM_USER + 125;
      WM_NOTIFY_BT   = WM_USER + 126;

type cBaudRate = (b110,b134,b150,b300,b600,b1200,b1800,b2400,b4800,b7200,b9600,b19200,b38400,b57600,b115200,b230400,b460800,b921600);
type cDataBits = (d5,d6,d7,d8);
type cStopBits = (s1,s15,s2);
type cParity   = (pNONE,pODD,pEVEN,pMARK,pSPACE);
type cType     = (rs232,rs482,rs485wire2,rs485wire4);

var UPSStartWork:boolean =false;

const Parity  : array [cParity] of string = ('00','08','24','40','56');   

type TStep   =(stStart,stStop,stError,stCreation,stConnection,stIP,stMask,stGateway,stMethod,stUpdate,stSource,stDestination,stSwitch,stAutoConfig,stDispIntens);
type TResult =(Success,Failure);
type TUPSStep=(upsCOMOpen,upsCOMClose,upsFIND,upsLOGIN,upsPASSWORD,upsCRASH,upsBoot,upsReboot,upsSetip,upsBootManual,upsSave,upsYes,upsExit,upsSetipFull);
type TNPStep =(npStart,npStartChangeIP,npStopChangeIP,npNewIP,npStop,np1,np2,np3,np4,np5,np6,np7,np8,npBasic,npo1,npo2,npo3,npo4,npo5,npo6,npo7,npo8);
type TBtStep =(btStart,btStop,btCreation,btConnection);
type TDevType= (dt7302,dt2411,dt2409,dt7303,dtzero);
type Stric  = string[15];

type TComSettings = record
       Alias   :string;
       BaudRate:string;
       DataBits:string;
       StopBits:string;
       Parity  :string;
       ifType  :string;
     end;

var ComSettings : array [1..8] of TComSettings;
    HOST_TP     : byte = 0;
    HOSt_NAME   : string; 
    DeviceTM    : array [0..10] of TDevType;
    DeviceNm    : array [0..10] of byte;

type TNew2409 = record
       IP  :string;
       MAC :string;
     end;

type ArrStric=array[1..4] of Stric;

var  New2409  :array of TNew2409;
     Count2409:integer;
     MyIP     :array of Stric;
     CountMyIP:integer;


function   IPStringToInt(IP:Stric):integer;
function   Ping(Address: PAnsiChar; EchoString: PAnsiChar; PingTimeout: Integer):boolean;
function   InetAddr(const AHost: AnsiString): DWORD;
function   ChangeIP(fOldIP:string):Stric;
function   BreakIP(ip:stric):ArrStric;
function   NeedToChange(NewIP: String;Enbled:boolean;Handle:Hwnd):boolean;

implementation

function NeedToChange(NewIP: String;Enbled:boolean;Handle:Hwnd):boolean;
  procedure NETSH(str: string);
  begin
    ShellExecute(Handle,'open','netsh',PChar(str),nil,sw_HIDE);
    sleep(10000);
  end;
var str:string;
begin
  str:='interface ip'; {v4 for windows 7}
  if Enbled then str:=str+' add'
             else str:=str+' delete';
  //olikke - а если она не работает?
  str:=str+' address "LAN1" '+NewIP+' 255.255.255.0';
  NETSH(str);
  result:=ping(PAnsiChar(NewIP),PAnsiChar('aaaaaaaa'),10);
end;

function BreakIP(ip: Stric):ArrStric;
var i,k:integer;
    Tempstr:ArrStric;
begin
  result[1]:='NoBreak';
  for i:=1 to 4 do
  if i<4 then
  begin
    if Pos('.',IP)=0 then exit;
    TempStr[i]:=Copy(IP,1,Pos('.',IP)-1);
    Delete(IP,1,Pos('.',IP));
  end else
    TempStr[i]:=IP;
  for i:=1 to 4 do
  begin
    k:=StrToInt(TempStr[i]);
    if k=-1 then exit;
    if (k>254) or (k<1) then exit;
  end;
  for i:=1 to 4 do
    Result[i]:=TempStr[i];
end;

function ChangeIP(fOldIP:string):Stric;
var
   Need     :ArrStric;
   Available:array of ArrStric;
   Suitable :array of boolean;
   i,j      :integer;
begin
  result:='';
  Need:=BreakIP(foldIP);
  if Need[1]='NoBreak' then exit;
  SetLength(Available,CountMyIP);
  SetLength(Suitable,CountMyIP);
  for i:=0 to CountMyIP-1 do
  begin
    Available[i]:=BreakIP(MyIP[i]);
    if Available[i][1]='NoBreak' then Suitable[i]:=false
                                 else Suitable[i]:=true;
  end;
  for i:=0 to CountMyIP-1 do
  for j:=1 to 3 do
  begin
    if Suitable[i] then
      if Available[i][j]<>Need[j] then
      begin
        Suitable[i]:=false;
        break;
      end;
  end;
  for i:=0 to CountMyIP-1 do
  if Suitable[i] then
    begin
      result:='NoChange';
      exit;
    end;
  result:=Need[1]+'.'+Need[2]+'.'+Need[3]+'.';
  //нет проверки на конфликты
  if Need[4]<>'123' then result:=result+'123'
                    else result:=result+'124';
end;

function IPStringToInt(IP:Stric):integer;
var i:integer;
    n:array [1..4] of integer;
    v:array [1..4] of Stric;
    j:integer;
begin
  result:=$FFFFFFFF;
  j:=1;
  v[1]:='';v[2]:='';v[3]:='';v[4]:='';
  for i:=1 to Length(IP) do
  begin
    if IP[i]<>'.' then v[j]:=v[j]+IP[i]
                  else INC(j);
    if j>4 then break;
  end;
  for i:=1 to 4 do
  begin
    n[i]:=StrToIntDef(v[i],-1);
    if n[i]=-1 then exit;
  end;
  result:= n[1] and $FF shl 24
         + n[2] and $FF shl 16
         + n[3] and $FF shl 08
         + n[4];
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
