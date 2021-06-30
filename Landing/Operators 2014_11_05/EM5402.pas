unit EM5402;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Global,MyPanel;

type
  Tfm5402 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    PP1: TMyPanel;
    Label1: TLabel;
    Splitter1: TSplitter;
    Splitter20: TSplitter;
    Splitter25: TSplitter;
    Splitter22: TSplitter;
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure ServMsu(var Msg: TMessage); message WM_NOTIFY_MSU;
  private
    hEM5402:tEM5402;
  public
    DEVICE_ID:cardinal;
  end;

var
  fm5402: Tfm5402;

implementation

{$R *.dfm}

procedure Tfm5402.ServMsu(var Msg: TMessage);
begin
  cs_ArrDevice[DEVICE_ID].Enter;
  hEM5402:=TEM5402(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  SetValues;
end;

procedure Tfm5402.SetValues;
var State:TState;
    FullState:byte;
begin
  FullState:=0;
  if hEM5402.Use1 then
  case hEM5402.Ch1 of
  0: State:=dsRed;
  1: begin State:=dsGreen; INC(FullState); end;
  2: State:=dsGray;
  3: State:=dsYellow;
  end else State:=dsGray;
  if d1.DeviceState<>State then d1.DeviceState:=State;
  if hEM5402.Use2 then
  case hEM5402.Ch2 of
  0: State:=dsRed;
  1: begin State:=dsGreen; INC(FullState); end;
  2: State:=dsGray;
  3: State:=dsYellow;
  end else State:=dsGray;
  if d2.DeviceState<>State then d2.DeviceState:=State;
  if hEM5402.Use3 then
  case hEM5402.Ch3 of
  0: State:=dsRed;
  1: begin State:=dsGreen; INC(FullState); end;
  2: State:=dsGray;
  3: State:=dsYellow;
  end else State:=dsGray;
  if d3.DeviceState<>State then d3.DeviceState:=State;
  if hEM5402.Use4 then
  case hEM5402.Ch4 of
  0: State:=dsRed;
  1: begin State:=dsGreen; INC(FullState); end;
  2: State:=dsGray;
  3: State:=dsYellow;
  end else State:=dsGray;
  if d4.DeviceState<>State then d4.DeviceState:=State;
  case FullState of
    0: State:=dsRed;
    1: State:=dsYellow;
    2: State:=dsGreen;
  end;
  if PP1.DeviceState<>State then PP1.DeviceState:=State;
end;

procedure Tfm5402.FormActivate(Sender: TObject);
var x,y:integer;
begin
  cs_ArrDevice[DEVICE_ID].Enter;
  hEM5402:=TEM5402(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  if Device_ID=11 then
  begin
    if hEM5402.Use1 then d1.Caption:='TVD2 (axial1) TM-2220-1 (A2)';
    if hEM5402.Use2 then d2.Caption:='TVD4 (right) TM-2220-1 (A4)';
    Label1.Caption:='RS-485 Channel Splitter'+ #10#13+'EM-5402 (A16)';
  end else
  if Device_ID=21 then
  begin
    if hEM5402.Use3 then d3.Caption:='TVD1 (left) TM-2220-1 (A1)';
    if hEM5402.Use4 then d4.Caption:='TVD3 (axial2) TM-2220-1 (A3)';
    Label1.Caption:='RS-485 Channel Splitter'+ #10#13+'EM-5402 (A17)';
  end;
  SetValues;
end;

end.
