unit Container_TM2322;

interface
uses Classes,MyPanel,SyncObjs,Global,Windows,hPing,Graphics,SysUtils;

type
  TypeOfState=(Red,Yellow,Green);
type
  TTM2322 = class(TThread)
  private
    const
      GreenLimit:double  = 90;
      YellowLimit:double = 95;
    var
    fPing    :TPing;
    fPEvent  :TEvent;
    fEvent   :TEvent;
    fip1     :tStric;
    fip2     :tStric;
    fip3     :tStric;
    fip4     :tStric;
    fExh1    :boolean;
    fExh2    :boolean;
    fExh3    :boolean;
    fExh4    :boolean;
    fimage   :THandle;
    fHDDCount:integer;
    fColor   :TColor;
    fState   :TState;
    fVideo   :boolean;
    fHDDChar :array of Char;
    fHDDTotal:array of double;
    fHDDFree :array of double;
    fHDDUse  :array of double;
    fHDDColor:array of TColor;
    fHDDState:TypeOfState;
    procedure CalcAllHDDParameter;
    procedure CalcHDDParameter(num:byte);
    procedure FindHDD;
    procedure FullState;
  public
    property    HDDCount:integer read fHDDCount;
    property    IP1 :TStric   read fip1;
    property    IP2 :TStric   read fip2;
    property    IP3 :TStric   read fip3;
    property    IP4 :TStric   read fip4;
    property    Color:TColor  read fColor;
    property    State:TState  read fState;
    property    Video:boolean write fVideo;
    property    FormHandle:THandle  write fimage;
    function    HDDChar (num:byte):char;
    function    HDDTotal(num:byte):TStric;
    function    HDDFree (num:byte):TStric;
    function    HDDUse  (num:byte):TStric;
    function    HDDColor(num:byte):TColor;
    function    HDDT    (num:byte):single;
    function    HDDF    (num:byte):single;
    function    Exh1:boolean;
    function    Exh2:boolean;
    function    Exh3:boolean;
    function    Exh4:boolean;
    function    dsExh(numb:byte) :TState;
    function    EColor(numb:byte):TColor;
    function    Text (numb:byte) :TStric;
    constructor Create(Event:TEvent;ip1,ip2,ip3,ip4:TStric);
  protected
    procedure Execute; override;
  end;

var TM2408:TTM2322;

implementation

function TTM2322.HDDT(num: Byte):single;
begin
  result:=0;
  if num>fHDDCount then exit;
  result:=fHDDTotal[num];
end;

function TTM2322.HDDF(num: Byte):single;
begin
  result:=0;
  if num>fHDDCount then exit;
  result:=fHDDFree[num];
end;

procedure TTM2322.FullState;
var St:TypeOfState;
     i:integer;
begin
  St:=Green;
  if not fVideo then St:=Red;
  if St<>Red then
    if not fExh1 then
      if not fExh2 then St:=Red
                   else St:=Yellow;
  if fHDDState=Red then St:=Red else
    if (FHDDState=Yellow) and (St<>Red) then St:=Yellow;
  case INTEGER(St) of
    INTEGER(Red)   : begin fColor:=clRed;    fState:=dsRed;    end;
    INTEGER(Yellow): begin fColor:=clYellow; fState:=dsYellow; end;
    INTEGER(Green) : begin fColor:=clLime;   fState:=dsGreen;  end;
  end; 
end;


function TTM2322.HDDChar(num: Byte):char;
begin
  if num>fHDDCount then exit;
  result:=fHDDChar[num-1];
end;

function TTM2322.HDDTotal(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDTotal[num-1],ffFixed,6,2)+'';
end;

function TTM2322.HDDFree(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDFree[num-1],ffFixed,6,2)+'';
end;

function TTM2322.HDDUse(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDUse[num-1],ffFixed,6,2)+'';
end;

function TTM2322.HDDColor(num: Byte):TColor;
begin
  if num>fHDDCount then exit;
  result:=fHDDColor[num-1];
end;

procedure TTM2322.CalcHDDParameter(num:byte);
var   FreeBytesAvailableToCaller:TLargeInteger;
      TotalSize:TLargeInteger;
      FreeSize:TLargeInteger;
begin
  GetDiskFreeSpaceEx(PChar(fHDDChar[num]+':\'),
                           FreeBytesAvailableToCaller,
                           Totalsize,
                           @FreeSize);
  fHDDTotal[num]:=TotalSize/1024/1024/1024;
  fHDDFree[num] :=FreeSize/1024/1024/1024;
  if TotalSize<>0 then
    fHDDUse[num]     :=(TotalSize-FreeSize)/TotalSize*100
  else
    fHDDUse[num]     :=0;
  if fHDDUse[num]<=GreenLimit  then fHDDColor[num]:=clLime else
  if fHDDUse[num]<=YellowLimit then fHDDColor[num]:=clYellow else
                                    fHDDColor[num]:=clRed;
end;

procedure TTM2322.CalcAllHDDParameter;
var i:integer;
    c:TypeOfState;
begin
  c:=Green;
  for i:=0 to fHDDCount-1 do
  begin
    CalcHDDParameter(i);
    if (fHDDColor[i]=clYellow) and (c<>Red) then c:=Yellow;
    if  fHDDColor[i]=clRed then c:=Red;
  end;
  fHDDState:=c;
end;

procedure TTM2322.FindHDD;
var c:char;
    str:string;
    i:integer;
begin
  fHDDCount:=0;
  str:='';
  for c in ['A' .. 'Z'] do
  if GetDriveType(PChar(c+':\'))=DRIVE_FIXED then
  begin
    INC(fHDDCount);
    str:=str+c;
  end;
  if fHDDCount=0 then exit;
  SetLength(fHDDChar ,fHDDCount);
  SetLength(fHDDTotal,fHDDCount);
  SetLength(fHDDFree ,fHDDCount);
  SetLength(fHDDUse  ,fHDDCount);
  SetLength(fHDDColor,fHDDCount);
  for i:=0 to fHDDCount-1 do
  fHDDChar[i]:=str[i+1];
end;

function TTM2322.Text(numb: Byte):TStric;
begin
  result:='  Not connected';
  case numb of
    1: if fExh1 then result:='  Connected';
    2: if fExh2 then result:='  Connected';
    3: if fExh3 then result:='  Connected';
    4: if fExh4 then result:='  Connected';
  end;
end;

function TTM2322.EColor(numb: Byte):TColor;
begin
  result:=clRed;
  case numb of
    1:  if fExh1 then result:=clLime;
    2:  if fExh2 then result:=clLime;
    3:  if fExh3 then result:=clLime;
    4:  if fExh4 then result:=clLime;
  end;
end;

function TTM2322.Exh1:boolean;
begin
  result:=fExh1;
end;

function TTM2322.Exh2:boolean;
begin
  result:=fExh2;
end;

function TTM2322.Exh3:boolean;
begin
  result:=fExh3;
end;

function TTM2322.Exh4:boolean;
begin
  result:=fExh4;
end;

function TTM2322.dsExh(numb: Byte):TState;
begin
  result:=dsRed;
  case numb of
    1:  if fExh1 then result:=dsGreen;
    2:  if fExh2 then result:=dsGreen;
    3:  if fExh3 then result:=dsGreen;
    4:  if fExh4 then result:=dsGreen;
  end;
end;

constructor TTM2322.Create(Event: TEvent; ip1: TStric; ip2: TStric; ip3: TStric; ip4: TStric);
begin
  inherited Create(true);
  fEvent :=Event;
  fimage :=0;
  fColor :=clRed;
  fState :=dsRed;
  fVideo :=true;
  fip1   :=ip1;
  fip2   :=ip2;
  fip3   :=ip3;
  fip4   :=ip4;
  fExh1  :=false;
  fExh2  :=false;
  fExh3  :=false;
  fExh4  :=false;
  fPEvent:=TEvent.Create(nil,false,false,'fPEvent');
  fPing  :=TPing.Create(fPEvent,
                        true,fip1,
                        true,fip2,
                        true,fip3,
                        true,fip4);
  FindHDD;
  resume;
end;

procedure TTM2322.Execute;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    fExh1:=fPing.Exh1;
    fExh2:=fPing.Exh2;
    fExh3:=fPing.Exh3;
    fExh4:=fPing.Exh4;
    CalcAllHDDParameter;
    FullState;
    if fimage<>0 then
    PostMessage(fimage,WM_NOTIFY_MAIN,0,0);
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      fPing.Terminate;
      fPEvent.SetEvent;
      fPing.WaitFor;
      fPing:=nil;
      fPEvent.Free;
      fPEvent:=nil;
      exit;
    end;
  end;
end;

end.
