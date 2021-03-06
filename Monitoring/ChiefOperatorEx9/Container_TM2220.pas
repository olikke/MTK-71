unit Container_TM2220;

interface

uses Global,BDRecord,Graphics,MyPanel,Windows;

type
  TMode = (auto,manual);
  TSt   = (green,yellow,red);

type
  TTM2220 = class
  private
    FNumb           :integer;
    FDataExh        :boolean;
    FTVDOn          :boolean;
    FU              :single;
    FTemp           :single;
    FTempAuthentic  :boolean;
    FHumidity       :single;
    FFAN            :boolean;
    FFANSpeed       :integer;
    FFANMode        :TMode;
    FHeater         :boolean;
    FHeaterAuthentic:boolean;
    FHeaterMode     :TMode;
    FSSP            :boolean;
    FColorSign      :boolean;
    FLED            :boolean;
    FYCG            :integer;
    FYCE            :integer;
    FCCG            :integer;
    FCCE            :integer;
    FbdYCG          :integer;
    FbdYCE          :integer;
    FbdCCG          :integer;
    FbdCCE          :integer;
    FHours          :integer;
    fStop           :int64;
    fStart          :int64;
    fPermissionToChange:boolean;
    function FAnaliz:TSt;
    function FState :TState;
    function FColor :TColor;
    function FDEState:TState;
    function fSSPState:TState;
  public
    property  TVDon          :boolean  read FTVDon           write FTVDon;
    property  U              :single   read FU               write FU;
    property  Temp           :single   read FTemp            write FTemp;
    property  TempAuthentic  :boolean  read FTempAuthentic   write FTempAuthentic;
    property  Humidity       :single   read FHumidity        write FHumidity;
    property  FAN            :boolean  read FFAN             write FFAN;
    property  FANSpeed       :integer  read FFANSpeed        write FFANSpeed;
    property  FANMode        :TMode    read FFANMode         write FFANMode;
    property  Heater         :boolean  read FHeater          write FHeater;
    property  HeaterAuthentic:boolean  read FHEaterAuthentic write FHeaterAuthentic;
    property  HeaterMode     :TMode    read FHeaterMode      write FHeaterMode;
    property  SSP            :boolean  read FSSP             write FSSP;
    property  ColorSign      :boolean  read FColorSign       write FColorSign;
    property  LED            :boolean  read FLED             write FLED;
    property  YCG            :integer  read FYCG;
    property  YCE            :integer  read FYCE;
    property  CCG            :integer  read FCCG;
    property  CCE            :integer  read FCCE;
    property  bdYCG          :integer  read FbdYCG;
    property  bdYCE          :integer  read FbdYCE;
    property  bdCCG          :integer  read FbdCCG;
    property  bdCCE          :integer  read FbdCCE;
    property  State          :TState   read FState;
    property  Color          :TColor   read fColor;
    property  DEState        :TState   read fDEState;
    property  SSPState       :TState   read fSSPState;
    property  PermissionToChange:boolean                    write fPermissionToChange;
    function  YCGWrite(YCG:integer):integer;
    function  YCEWrite(YCE:integer):integer;
    function  CCGWrite(CCG:integer):integer;
    function  CCEWrite(CCE:integer):integer;
    function  ColorU :TColor;
    function  ColorTemp:TColor;
    function  ColorHumidity:TColor;
    function  ColorFanSpeed:TColor;
    function  DataExh:boolean;
    procedure SetTime;
    constructor Create(numb:integer);
  end;

var
  TM2220:array[1..8] of TTM2220;
  First :array[1..8] of boolean;

implementation

function TTM2220.fSSPState;
begin
  if DataExh then
  if fSSP then result:=dsGreen else result:=dsRed else result:=dsRed;
end;

function TTM2220.FDEState:TState;
begin
  if DataExh then result:=dsGreen else result:=dsRed;
end;

function TTM2220.FState:TState;
begin
  result:=dsGray;
  case INTEGER(FAnaliz) of
    INTEGER(green):  result:=dsGreen;
    INTEGER(red):    result:=dsRed;
    INTEGER(yellow): result:=dsYellow;
  end;
end;

function TTM2220.FColor:TColor;
begin
  result:=clSilver;
  case INTEGER(FAnaliz) of
    INTEGER(green):  result:=_Green;
    INTEGER(red):    result:=_Red;
    INTEGER(yellow): result:=_Yell;
  end;
end;

function TTM2220.FAnaliz:TSt;
var St:TSt;
    Color1,Color2,Color3,Color4:TColor;
begin
  result:=green;  
  if not DataExh then
  begin
    result:=red;
    exit;
  end;
  if not FSSP or not ColorSign then
  begin
    result:=red;
    exit;
  end;
  Color1:=ColorU;
  Color2:=ColorTemp;
  Color3:=ColorHumidity;
  Color4:=ColorFanSpeed;
  if (Color1=_Red) or
     (Color2=_Red) or
     (Color3=_Red) or
     (Color4=_Red) then
  begin
    result:=red;
    exit;
  end else
  if (Color1=_Yell) or
     (Color2=_Yell) or
     (Color3=_Yell) or
     (Color4=_Yell) then result:=Yellow;
end;

function TTM2220.ColorFanSpeed:TColor;
begin
  if (fFanSpeed>bdKUParam.Nmin) then result:=_Green
                                else result:=_Red
end;

function TTM2220.ColorHumidity:TColor;
begin
  if fHumidity<bdKUParam.H1 then result:=_Green
  else
  if fHumidity<bdKUParam.H2 then result:=_Yell
  else result:=_Red;
end;

function TTM2220.ColorTemp:TColor;
begin
  if (fTemp>bdKUParam.Tmin2) and (fTemp<bdKUParam.Tmax1) then result:=_Green
  else
  if (fTemp<bdKUParam.Tmin1) and (fTemp>bdKUParam.Tmax2) then result:=_Red
  else result:=_Yell;
end;

function TTM2220.ColorU:TColor;
begin
  if (fU>bdKUParam.Umax) or (fU<bdKUParam.Umin) then result:=_Yell
                                                else result:=_Green;
end;

procedure TTM2220.SetTime;
begin
  QueryPerformanceCounter(fStart);
end;

function TTM2220.DataExh:boolean;
begin
  QueryPerformanceCounter(fStop);
  if GlobalFreq<>0 then
  if (fStop-fStart)/GlobalFreq*1000>TimeToUpdate*3 then result:=false
                                                   else result:=true
                                                   else
  QueryPerformanceFrequency(GlobalFreq);
end;

function TTM2220.YCGWrite(YCG: Integer):integer;
begin
  FYCG:=YCG;
  if fPermissionToChange then
  if FYCG<>FbdYCG then result:=FbdYCG
                  else result:=-1
                  else result:=-1;
end;

function TTM2220.YCEWrite(YCE: Integer):integer;
begin
  FYCE:=YCE;
  if fPermissionToChange then
  if FYCE<>FbdYCE then result:=FbdYCE
                  else result:=-1
                  else result:=-1;
end;

function TTM2220.CCGWrite(CCG: Integer):integer;
begin
  FCCG:=CCG;
  if fPermissionToChange then
  if FCCG<>FbdCCG then result:=FbdCCG
                  else result:=-1
                  else result:=-1;
end;

function TTM2220.CCEWrite(CCE: Integer):integer;
begin
  FCCE:=CCE;
  if fPermissionToChange then
  if FCCE<>FbdCCE then result:=FbdCCE
                  else result:=-1
                  else result:=-1;
end;

constructor TTM2220.Create(numb:integer);
begin
  inherited  Create;
  fStart :=0;
  fStop  :=0;
  fPermissionToChange:=false;
  FNumb  :=numb;
  FbdYCG :=bdKU[fNumb].YCG;
  FbdYCE :=bdKU[fNumb].YCE;
  FbdCCG :=bdKU[fNumb].CCG;
  FbdCCE :=bdKU[fNumb].CCE;
end;

end.
