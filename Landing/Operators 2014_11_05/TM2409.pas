unit TM2409;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Global,StdCtrls, ExtCtrls, MyPanel;

type
  Tfm2409 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    d5: TMyPanel;
    d6: TMyPanel;
    d7: TMyPanel;
    d8: TMyPanel;
    Splitter1: TSplitter;
    Splitter20: TSplitter;
    Splitter25: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Splitter24: TSplitter;
    Splitter26: TSplitter;
    Splitter27: TSplitter;
    c1: TLabel;
    c2: TLabel;
    c3: TLabel;
    c4: TLabel;
    c5: TLabel;
    c6: TLabel;
    c7: TLabel;
    c8: TLabel;
    Splitter18: TSplitter;
    DE: TShape;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure ServMsu(var Msg: TMessage); message WM_NOTIFY_MSU;
  private
    mEM2409:TEm2409;
  public
    Device_ID:byte;
  end;
  
var
  fm2409: Tfm2409;

implementation

{$R *.dfm}

procedure Tfm2409.ServMsu(var Msg: TMessage);
begin
  if Msg.WParam<>DEVICE_ID then exit;  
  cs_ArrDevice[DEVICE_ID].Enter;
  mEM2409:=TEM2409(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  SetValues;
end;

procedure Tfm2409.SetValues;
var i:integer;
    State:TState;
    mColor:TColor;
    Panel:TMyPanel;
begin
  for i:=1 to 8 do
  begin
    State:=dsGray;
    case mEM2409.Channel[i] of
      0 : State:=dsRed;
      1 : State:=dsGreen;
      2 : State:=dsWhite;
      3 : State:=dsYellow;
      5 : State:=dsGray;
    end;
    Panel:=fm2409.FindComponent('d'+IntToStr(i)) as TMyPanel;
    if Panel=nil then continue;
    if Panel.DeviceState<>State then Panel.DeviceState:=State;
  end;
  case mEM2409.DataExh of
    0 : mColor:=Color_R;
    1 : mColor:=Color_G;
    2 : mColor:=Color_W;
    3 : mColor:=Color_Y;
  end;
  DE.Brush.Color:=mColor;
end;

procedure Tfm2409.FormActivate(Sender: TObject);
var x1,x2,y1,y2,i:integer;
begin
  case DEVICE_ID of
  12: begin
        d1.Caption:='TM-2411-1 (A5/A8)';
        c1.Caption:='COM11';
        c2.Caption:='COM12';
        c3.Caption:='COM13';
        d4.Caption:='EM-5401 (A5/A6/A14)';
        c4.Caption:='COM 14';
        d5.Caption:='EM-5402 (A5/A6/A16)';
        c5.Caption:='COM15';
        d6.Caption:='EM-3401 (A5/A6/A11)';
        c6.Caption:='COM16';
        if ExternalDevice.OLS<>0 then
          d7.Caption:='OLS "LUNA-3E" Ch.1';
        c7.Caption:='COM17';
        if ExternalDevice.PRLK<>0 then
          d8.Caption:='PRLK Ch.1';
        c8.Caption:='COM18';
      end;
  13: begin
        d1.Caption:='TM-2411-1 (A5/A7)';
        c1.Caption:='COM21';
        d2.Caption:='TM-2411-1 (A5/A9)';
        c2.Caption:='COM22';
        c3.Caption:='COM23';
        d4.Caption:='EM-5401 (A5/A6/A15)';
        c4.Caption:='COM 24';
        d5.Caption:='EM-5402 (A5/A6/A17)';
        c5.Caption:='COM25';
        c6.Caption:='COM26';
        if ExternalDevice.PRLK<>0 then
          d8.Caption:='PRLK Ch.2';
        c7.Caption:='COM27';
        if ExternalDevice.OLS<>0 then
          d7.Caption:='OLS "LUNA-3E" Ch.2';
        c8.Caption:='COM28';
      end;
  end;
  cs_ArrDevice[Device_ID].Enter;
     mEM2409:=TEM2409(ArrDevice[Device_ID]);
  cs_ArrDevice[Device_ID].Leave;
  SetValues;
end;

end.
