unit FullState;

interface
uses Classes,Graphics,Global,Windows,BDRecord,Container_TM2407,Container_TM2410,
     Container_TM2409,Client_EM7212,Container_EM7302,Container_TM2411,ContainerLanding,
     Container_Tm2322,Container_TM2408,Container_TM2220,Container_EM7210;

type
  TFullState=class(TThread)
  private
    fCCTVColor:TColor;
    fFullColor:tColor;
    procedure AnalizCCTV;
    procedure AnalizFull;
  public
    constructor Create;
    property CCTVColor:TColor  read fCCTVColor;
    property FullColor:TColor  read fFullColor;

  protected
    procedure Execute;override;
  end;

var MTKState:TFullState;

implementation

constructor TFullState.Create;
begin
  inherited Create(true);
  fCCTVColor:=clWhite;
  fFullColor:=clWhite;
  resume;
end;

procedure tFullState.Execute;
begin
  FreeOnTerminate:=false;
  while not terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(StopEventFull.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if terminated then exit;
    AnalizCCTV;
    AnalizFull;
  end;
end;

procedure TFullState.AnalizCCTV;
var YellowGroup,i:integer;
  function CalcColor(Color:TColor):boolean;
  begin
    result:=false;
    if Color=_Red then result:=true else
    if Color=_Yell then INC(YellowGroup);
  end;
begin
  YellowGroup:=0;
  if CalcColor(TM2322.Color)       then  begin fCCTVColor:=_Red; exit; end;
  if not TM2408.DataExh            then  begin fCCTVColor:=_Red; exit; end else
    if CalcColor(TM2408.Color)     then  begin fCCTVColor:=_Red; exit; end;
  for i:=1 to 8 do if bdKU[i].Use  then
    if CalcColor(TM2220[i].Color)  then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(TM2407.Color)       then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(TM24101.Color)      then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(TM2409[1].Color)    then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(TM2409[2].Color)    then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(EM72121.Color)      then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(EM7302[1].Color)    then  begin fCCTVColor:=_Red; exit; end;
  if CalcColor(EM7302[2].Color)    then  begin fCCTVColor:=_Red; exit; end;
  for i:=1 to 3 do
    if CalcColor(TM2411[i].Color) then begin fCCTVColor:=_Red; exit; end;
  for i:=0 to 13 do if EM7210[i].Use then
    if CalcColor(EM7210[i].Color) then begin fCCTVColor:=_Red; exit; end;
  if YellowGroup<>0 then fCCTVColor:=_Yell
                    else fCCTVColor:=_Green;
end;

procedure TFullState.AnalizFull;
begin
  if Landing.Color=_Red then
    fFullColor:=_Red else
  if Landing.Color=_Yell then
    if fCCTVColor<>_Red then fFullColor:=_Yell else fFullColor:=_Red else
  if Landing.Color=_Green then
    if fCCTVColor=_Green then fFullColor:=_Green   else fFullColor:=fCCTVColor else
  if Landing.Color=clWhite then
    fFullColor:=clWhite;
end;

end.
