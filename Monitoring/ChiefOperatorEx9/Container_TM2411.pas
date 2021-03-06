unit Container_TM2411;

interface

uses   Global,Graphics,MyPanel,Windows,SysUtils;

type

  TUPSParam = Array[0..5] of Integer;
  TUPSColor = array[0..5] of TColor;

type
  TUPS = class
  private
    FDataExh       :boolean;
    FParams        :TUPSParam;
    FUPSState      :TUPSColor;
    fColor         :TColor;
    fState         :TState;
    fStart         :int64;
    fStop          :int64;
    fimage         :THandle;
  public
    constructor Create;
    property    FormHandle:THandle  write fimage;
    property    Color     :TColor   read  fColor;
    property    State     :TState   read  fState;
    procedure   Analiz(Params:TUPSParam; DataEx:boolean);
    function    GetParam(i:integer):string;
    function    GetState(i:integer):TColor;
    function    ParamsPosition(i:integer):integer;
    function    DataExh      :boolean;
  end;

const
//??????? ??????????  i-?????, k=0-?????? ???????, ?=1-??????? ???????
  G1Params:TUPSParam=(60,10,195,495,215,100);
  G2Params:TUPSParam=(100,40,250,505,225,900);
  Y1Params:TUPSParam=(40,0,187,490,190,45);
  Y2Params:TUPSParam=(59,45,264,510,250,1000);

var TM2411: array [1..5] of TUPS;

implementation

function TUPS.DataExh;
begin
  Result:=false;
  QueryPerformanceCounter(fStop);
  if GlobalFreq<>0 then
  if (fStop-fStart)/GlobalFreq*1000<TimeToUpdate*2 then Result:=true;
end;

constructor TUPS.Create;
begin
  inherited Create;
  fDataExh  :=false;
  fColor    :=_Gray;
  fState    :=dsGray;
  fStart    :=0;
end;

function TUPS.GetParam(i: Integer):string;
begin
  Result:='';
  if not i in [0..5] then exit;
  if i=3 then Result:='  '+FloatToStrF(0.1*FParams[i],ffFixed,3,1)
         else Result:='  '+IntToStr(FParams[i]);
end;

function TUPS.ParamsPosition(i: Integer):integer;
begin
  Result:=0;
  if not i in [0..5] then exit;
  case i of
    0,1,5:  Result:=FParams[i];
    2:      Result:=FParams[i]-180;
    3:      Result:=FParams[i]-500;
    4:      Result:=FParams[i]-220;
  end;
end;

function TUPS.GetState(i: Integer):TColor;
begin
  Result:=_Red;
  if not i in [0..5] then exit;
  Result:=FUPSState[i];
end;

procedure TUPS.Analiz(Params: TUPSParam; DataEx: Boolean);
var  State,Result:TColor;
     pState:TUPSColor;
     i:integer;
begin
  if not DataEx then
  begin
    FDataExh:=false;
    FColor  :=_Red;
    FState  :=dsRed;
    if fimage<>0 then PostMessage(fimage,WM_NOTIFY_2411,0,0);
    exit;
  end;
  QueryPerformanceCounter(fStart);
  Result:=_Green;
  for i:=0 to 5 do
  begin
    State:=_Red;
    if (Params[i]>=Y1Params[i])AND(Params[i]<=Y2Params[i])then State:=_Yell;
    if (Params[i]>=G1Params[i])AND(Params[i]<=G2Params[i])then State:=_Green;
    pState[i]:=State;
    if Result=_Green then Result:=State else
    if (Result=_Yell) and (State<>_Green) then Result:=State;
  end;
  FDataExh:=DataEx;
  FParams :=Params;
  FUPSState :=pState;
  FColor:=Result;
  if fColor=_Green then fState:=dsGreen else
  if fColor=_Red   then fState:=dsRed else
  if fColor=_Yell  then fState:=dsYellow;
  if fimage<>0 then PostMessage(fimage,WM_NOTIFY_2411,0,0);
end;



end.
