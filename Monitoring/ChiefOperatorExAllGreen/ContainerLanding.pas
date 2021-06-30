unit ContainerLanding;

interface

uses MyPanel,Global,Windows,Graphics;

type
  TPacket = record
    Numb:int64;
    LandingState,
    ShipPower,
    OLS1,OLS2,
    RACS1,RACS2,
    Ilmen1,Ilmen2,
    WSP,WSL,WSR,VRD,
    KU1,KU2,KU3,KU4,
    tm2320,tm2402:TState;
  end;

type
  TLanding = class
  private
    fShipPower,
    fLandingState,
    fOLS1,fOLS2,
    fRACS1,fRACS2,
    fIlmen1,fIlmen2,
    fWSP,fWSL,fWSR,fVRD,
    fKU1,fKU2,fKU3,fKU4,
    ftm2320,ftm2402:TState;
    fStop       : int64;
    fStart      : int64;
    fState      : TState;
    fColor      : TColor;
    LastNumb    : int64;
    function  fMyColor:TColor;
    function  fMyState:TState;
  public
    constructor Create;
    procedure   NewPacket(Pack:TPacket);
    function    DataExh :boolean;
    property    LandingState:TState read fLandingState;
    property    ShipPower:TState read fShipPower;
    property    OLS1    :TState  read fOLS1;
    property    OLS2    :TState  read fOLS2;
    property    RACS1   :TState  read fRACS1;
    property    RACS2   :TState  read fRACS2;
    property    Ilmen1  :TState  read fIlmen1;
    property    Ilmen2  :TState  read fIlmen2;
    property    WSP     :TState  read fWSP;
    property    WSL     :TState  read fWSL;
    property    WSR     :TState  read fWSR;
    property    VRD     :TState  read fVRD;
    property    KU1     :TState  read fKU1;
    property    KU2     :TState  read fKU2;
    property    KU3     :TState  read fKU3;
    property    KU4     :TState  read fKU4;
    property    tm2320  :TState  read ftm2320;
    property    tm2402  :TState  read ftm2402;
    property    Color   :TColor  read fmyColor;
    property    State   :TState  read fmyState;
  end;

var Landing:TLanding;

implementation

procedure TLanding.NewPacket(Pack: TPacket);
begin
  QueryPerformanceCounter(fStart);
  if (Pack.Numb<>LastNumb) or (LastNumb=0) then
  begin
    LastNumb:=Pack.Numb;
    fLandingState:=Pack.LandingState;
    fShipPower:=Pack.ShipPower;
    fOLS1:=Pack.OLS1;
    fOLS2:=Pack.OLS2;
    fRACS1:=Pack.RACS1;
    fRACS2:=Pack.RACS2;
    fIlmen1:=Pack.Ilmen1;
    fIlmen2:=Pack.Ilmen2;
    fWSP:=Pack.WSP;
    fWSL:=Pack.WSL;
    fWSR:=Pack.WSR;
    fVRD:=Pack.VRD;
    fKU1:=Pack.KU1;
    fKU2:=Pack.KU2;
    fKU3:=Pack.KU3;
    fKU4:=Pack.KU4;
    ftm2320:=Pack.tm2320;
    ftm2402:=Pack.tm2402;
  end;
end;

function TLanding.DataExh;
begin
  result:=false;
  QueryPerformanceCounter(fStop);
  if GlobalFreq<>0 then
  if (fStop-fStart)/GlobalFreq*1000<TimeToUpdate*2 then Result:=true;
end;

constructor TLanding.Create;
begin
  fStop:=0;
  fStart:=0;
  LastNumb:=0;
end;

function TLanding.fMyColor;
begin
  if not DataExh then
  begin
    result:=clWhite;
    exit;
  end;
  case INTEGER(fLandingState) of
    INTEGER(dsGreen):  result:=_Green;
    INTEGER(dsYellow): result:=_Yell;
    INTEGER(dsGray):  result:=clWhite;
    INTEGER(dsRed):    result:=_Red;
  end;
end;

function TLanding.fMyState;
begin
  if not DataExh then result:=dsGray
                 else result:=fLandingState;
end;
end.
