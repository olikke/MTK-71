unit UPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids,Global, GradProgress, MyPanel;

type
  Tfm_UPS = class(TForm)
    Panel1: TPanel;
    Panel11: TPanel;
    i0: TImage;
    Label2: TLabel;
    Panel12: TPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    e0: TEdit;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    Edit21: TEdit;
    e6: TEdit;
    Edit22: TEdit;
    MyPanel9: TMyPanel;
    Label3: TLabel;
    pb1: TGradProgress;
    MyPanel10: TMyPanel;
    MyPanel11: TMyPanel;
    MyPanel12: TMyPanel;
    MyPanel13: TMyPanel;
    Label4: TLabel;
    pb2: TGradProgress;
    MyPanel14: TMyPanel;
    MyPanel16: TMyPanel;
    MyPanel17: TMyPanel;
    MyPanel15: TMyPanel;
    MyPanel18: TMyPanel;
    MyPanel1: TMyPanel;
    Label1: TLabel;
    pb3: TGradProgress;
    MyPanel2: TMyPanel;
    MyPanel3: TMyPanel;
    MyPanel4: TMyPanel;
    MyPanel5: TMyPanel;
    MyPanel6: TMyPanel;
    MyPanel7: TMyPanel;
    Label5: TLabel;
    pb4: TGradProgress;
    MyPanel8: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    MyPanel22: TMyPanel;
    MyPanel23: TMyPanel;
    Label6: TLabel;
    pb5: TGradProgress;
    MyPanel24: TMyPanel;
    MyPanel25: TMyPanel;
    MyPanel26: TMyPanel;
    MyPanel27: TMyPanel;
    MyPanel28: TMyPanel;
    MyPanel29: TMyPanel;
    Label7: TLabel;
    pb6: TGradProgress;
    MyPanel30: TMyPanel;
    MyPanel31: TMyPanel;
    MyPanel32: TMyPanel;
    MyPanel33: TMyPanel;
    MyPanel34: TMyPanel;
    MyPanel35: TMyPanel;
    procedure FormActivate(Sender: TObject);
    procedure ServMsg(var Msg: TMessage); message WM_NOTIFY_MSG;
    procedure SetValues;
    procedure SetNoValues;
  private
    mUPS:TUPS;
  public
    Device_ID:cardinal;
  end;

var
  fm_UPS: Tfm_UPS;

implementation

{$R *.dfm}

procedure Tfm_UPS.SetValues;
var i:integer;
    Color:TColor;
begin
  cs_ArrDevice[DEVICE_ID].Enter; try mUPS:=TUPS((ArrDevice[DEVICE_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  if mUPS.DataExh=0 then
  begin
    SetNoValues;
    exit;
  end;
  e0.Color :=clLime;
  e0.Text  :='  YES';
  With mUPS do
  begin
    for i := 0 to 5 do
    if fm_UPS.FindComponent('e'+IntToStr(i+1))<>nil then
    begin
      if i=3 then TEdit(fm_UPS.FindComponent('e'+IntToStr(i+1))).Text :='  '+FloatToStrF(0.1*Params[i],ffFixed,3,1)
             else TEdit(fm_UPS.FindComponent('e'+IntToStr(i+1))).Text :='  '+'  '+IntToStr(Params[i]);

      Color:=clWhite;
      case PState[i] of
        0 : Color:=Color_R;
        1 : Color:=Color_G;
        2 : Color:=clWhite;
        3 : Color:=Color_Y;
      end;
      TEdit(fm_UPS.FindComponent('e'+IntToStr(i+1))).Color:=Color;
    end;
    pb1.Position:=Params[0];
    pb2.Position:=Params[1]+10;
    pb3.Position:=Params[2]-180;
    pb4.Position:=Params[3]-500+15;
    pb5.Position:=Params[4]-220+40;
    pb6.Position:=Params[5];
  end;
end;

procedure Tfm_UPS.SetNoValues;
var i:integer;
begin
  e0.Color:=clRed;
  e0.Text :='  NO';
  for i:=1 to 5 do
  begin
    if fm_UPS.FindComponent('e'+IntToStr(i))<>nil then
    begin
       TEdit(fm_UPS.FindComponent('e'+IntToStr(i))).Text :='';
       TEdit(fm_UPS.FindComponent('e'+IntToStr(i))).Color:=clWhite;
    end;
    if fm_UPS.FindComponent('pb'+IntToStr(i))<>nil then
      TProgressBar(fm_UPS.FindComponent('pb'+IntToStr(i))).Position:=
      TProgressBar(fm_UPS.FindComponent('pb'+IntToStr(i))).Min;
  end;
end;

procedure Tfm_UPS.ServMsg(var Msg: TMessage);
begin
  if Msg.LParam=Device_ID then  SetValues;
end;

procedure Tfm_UPS.FormActivate(Sender: TObject);
begin
  with i0.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i0.ClientRect);
  end;
  Panel12.SetFocus;
  SetValues;
end;


end.
