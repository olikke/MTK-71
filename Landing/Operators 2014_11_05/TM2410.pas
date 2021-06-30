unit TM2410;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Global, MyPanel;

type
  Tfm2410 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    d5: TMyPanel;
    d6: TMyPanel;
    d7: TMyPanel;
    d8: TMyPanel;
    d9: TMyPanel;
    d10: TMyPanel;
    d11: TMyPanel;
    d12: TMyPanel;
    d13: TMyPanel;
    d14: TMyPanel;
    d15: TMyPanel;
    d16: TMyPanel;
    MyPanel17: TMyPanel;
    MyPanel18: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    MyPanel22: TMyPanel;
    MyPanel23: TMyPanel;
    MyPanel24: TMyPanel;
    MyPanel25: TMyPanel;
    MyPanel26: TMyPanel;
    MyPanel27: TMyPanel;
    MyPanel28: TMyPanel;
    MyPanel29: TMyPanel;
    MyPanel30: TMyPanel;
    MyPanel31: TMyPanel;
    MyPanel32: TMyPanel;
    Splitter18: TSplitter;
    Splitter1: TSplitter;
    Splitter20: TSplitter;
    Splitter25: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Splitter24: TSplitter;
    Splitter26: TSplitter;
    Splitter27: TSplitter;
    Splitter28: TSplitter;
    Splitter19: TSplitter;
    Splitter29: TSplitter;
    Splitter30: TSplitter;
    Splitter31: TSplitter;
    Splitter32: TSplitter;
    Splitter33: TSplitter;
    Splitter34: TSplitter;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    l9: TLabel;
    l10: TLabel;
    l11: TLabel;
    l12: TLabel;
    l13: TLabel;
    l14: TLabel;
    l15: TLabel;
    l16: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure ServMsu(var Msg: TMessage); message WM_NOTIFY_MSU;
  private
    mEM2410:TEM2410;
  public
    Device_ID:byte;
  end;

var
  fm2410: Tfm2410;

implementation

{$R *.dfm}

procedure Tfm2410.ServMsu(var Msg: TMessage);
begin
  if Msg.WParam<>DEVICE_ID then exit;
  cs_ArrDevice[DEVICE_ID].Enter;
  mEM2410:=TEM2410(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  SetValues;
end;

procedure Tfm2410.SetValues;
var i:integer;
    State:TState;
    Panel:TMyPanel;
begin
  for i:=1 to 16 do
  begin
    State:=dsGray;
    case mEM2410.Channel[i] of
      0 : State:=dsRed;
      1 : State:=dsGreen;
      2 : State:=dsGray;
      3 : State:=dsYellow;
      5 : State:=dsGray;
    end;
    Panel:=TMyPanel(fm2410.FindComponent('d'+IntToStr(i)));
    if Panel=nil then continue;
    if Panel.DeviceState<>State then Panel.DeviceState:=State;
  end;
end;

procedure Tfm2410.FormActivate(Sender: TObject);
var x1,y1,x2,y2,i:integer;
begin
  case Device_ID of
  14: begin
        d1.Caption  :='WSP TM-2322-2 (A7)';
        l1.Caption:=IP_SrvWSC1;
        d3.Caption  :='WSL TM-2322-2 (A9)';
        l3.Caption:=IP_SrvWSL1;
        d4.Caption :='TM-2411-1 (A5/A7)';
        l4.Caption:=IP_2411_1;
        d5.Caption :='WSR TM-2322-2 (A10)';
        l5.Caption:=IP_SrvWSR1;
        d6.Caption :='TM-2411-1 (A5/A9)';
        l6.Caption:=IP_2411_3;
        d7.Caption :='VRD1 TM-2408-1 (A8)';
        l7.Caption:=IP_SrvVRD1;
        d8.Caption :='TM-2409-1 (A5/A4)';
        l8.Caption:=IP_2409_1;
        d9.Caption:='TM-2320 (A11)';
        l9.Caption:=IP_Printer;
      end;
  15: begin
        d1.Caption :='WSP TM-2322-2 (A7)';
        l1.Caption:=IP_SrvWSC2;
        d3.Caption :='WSL TM-2322-2 (A9)';
        l3.Caption:=IP_SrvWSL2;
        d4.Caption :='TM-2411-1 (A5/A8)';
        l4.Caption:=IP_2411_2;
        d5.Caption :='WSR TM-2322-2 (A10)';
        l5.Caption:=IP_SrvWSR2;
        d7.Caption :='VRD1 TM-2408-1 (A8)';
        l7.Caption:=IP_SrvVRD2;
        d8.Caption :='TM-2409-1 (A5/A5)';
        l8.Caption:=IP_2409_2;
      end;
  end;
  cs_ArrDevice[Device_ID].Enter;
     mEM2410:=TEM2410(ArrDevice[Device_ID]);
  cs_ArrDevice[Device_ID].Leave;
  SetValues;
end;

end.
