unit Container_TM2407;

interface

uses Graphics,Global;

type

  TGetState = function:boolean of object;
  TMyFunction = array [1..8] of TGetState;

  TTM2407 = class
  private
    FMyFunc  :TMyFunction;
    function  FColor:TColor;
  public
    property    Color :TColor   read FColor;
    constructor Create(funcEM24371,funcEM24372,funcEM24373,funcEM24374,funcEM5401,funcEM54021,funcEM54022,funcEM3401:TGetState);
end;

var TM2407:TTM2407;

implementation

constructor TTM2407.Create(funcEM24371: TGetState; funcEM24372: TGetState;
                           funcEM24373: TGetState; funcEM24374: TGetState;
                           funcEM5401 : TGetState; funcEM54021: TGetState;
                           funcEM54022: TGetState; funcEM3401 : TGetState);
begin
  FMyFunc[1]:=funcEM24371;
  FMyFunc[2]:=funcEM24372;
  FMyFunc[3]:=funcEM24373;
  FMyFunc[4]:=funcEM24374;
  FMyFunc[5]:=funcEM5401;
  FMyFunc[6]:=funcEM54021;
  FMyFunc[7]:=funcEM54022;
  FMyFunc[8]:=funcEM3401;
end;

function TTM2407.FColor:TColor;
var i:integer;
begin
  result:=_Red;
  for i:=1 to 8 do
    if not FMyFunc[i] then exit;
  result:=_Green;
end;

end.
