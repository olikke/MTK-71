unit fm2411;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, MyPanel,Container_TM2411,Global,
  GradProgress;

type
  Tf2411 = class(TForm)
    Panel7: TPanel;
    Panel8: TPanel;
    i0: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    e0: TEdit;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    Edit10: TEdit;
    e6: TEdit;
    Edit11: TEdit;
    MyPanel9: TMyPanel;
    MyPanel10: TMyPanel;
    MyPanel11: TMyPanel;
    MyPanel12: TMyPanel;
    Label3: TLabel;
    MyPanel13: TMyPanel;
    MyPanel14: TMyPanel;
    MyPanel16: TMyPanel;
    MyPanel17: TMyPanel;
    MyPanel15: TMyPanel;
    MyPanel18: TMyPanel;
    Label4: TLabel;
    MyPanel1: TMyPanel;
    MyPanel2: TMyPanel;
    MyPanel3: TMyPanel;
    MyPanel4: TMyPanel;
    MyPanel5: TMyPanel;
    MyPanel6: TMyPanel;
    Label1: TLabel;
    MyPanel7: TMyPanel;
    MyPanel8: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    MyPanel22: TMyPanel;
    Label5: TLabel;
    MyPanel23: TMyPanel;
    MyPanel24: TMyPanel;
    MyPanel25: TMyPanel;
    MyPanel26: TMyPanel;
    MyPanel27: TMyPanel;
    MyPanel28: TMyPanel;
    Label6: TLabel;
    MyPanel29: TMyPanel;
    MyPanel30: TMyPanel;
    MyPanel31: TMyPanel;
    MyPanel32: TMyPanel;
    MyPanel33: TMyPanel;
    MyPanel34: TMyPanel;
    Label7: TLabel;
    MyPanel35: TMyPanel;
    GradProgress1: TGradProgress;
    pb1: TGradProgress;
    pb2: TGradProgress;
    pb3: TGradProgress;
    pb4: TGradProgress;
    pb5: TGradProgress;
    pb6: TGradProgress;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure SetNoValues;
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2411;
  private
    fNumber:byte;
  public
    procedure fNumbe(n:byte);
  end;

var
  f2411: Tf2411;

implementation

{$R *.dfm}

procedure Tf2411.fNumbe(n: Byte);
begin
  fNumber:=n;
end;

procedure Tf2411.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TM2411[fNumber].FormHandle:=0;
end;

procedure Tf2411.ServMsd(var Msg: TMessage);
begin
  if TM2411[fNumber].DataExh then SetValues
                             else SetNoValues;
end;

procedure Tf2411.SetNoValues;
var i:integer;
begin
  e0.Color:=_Red;
  e0.Text :='  NO';
  for i:=1 to 6 do
  begin
    if f2411.FindComponent('e'+IntToStr(i))<>nil then
    begin
       TEdit(f2411.FindComponent('e'+IntToStr(i))).Text :='';
       TEdit(f2411.FindComponent('e'+IntToStr(i))).Color:=clWhite;
    end;
    if f2411.FindComponent('pb'+IntToStr(i))<>nil then
      TProgressBar(f2411.FindComponent('pb'+IntToStr(i))).Position:=
      TProgressBar(f2411.FindComponent('pb'+IntToStr(i))).Min;
  end;
end;

procedure Tf2411.SetValues;
var i:integer;
begin
  e0.Color :=_Green;
  e0.Text  :='  YES';
  for i := 1 to 6 do
  begin
    if f2411.FindComponent('e'+IntToStr(i))<>nil then
    begin
      TEdit(f2411.FindComponent('e'+IntToStr(i))).Text :=TM2411[fNumber].GetParam(i-1);
      TEdit(f2411.FindComponent('e'+IntToStr(i))).Color:=TM2411[fNumber].GetState(i-1);
    end;
  end;
  pb1.Position:=TM2411[fNumber].ParamsPosition(0);
  pb2.Position:=TM2411[fNumber].ParamsPosition(1)+10;
  pb3.Position:=TM2411[fNumber].ParamsPosition(2);
  pb4.Position:=TM2411[fNumber].ParamsPosition(3)+15;
  pb5.Position:=TM2411[fNumber].ParamsPosition(4)+40;
  pb6.Position:=TM2411[fNumber].ParamsPosition(5);
end;

procedure Tf2411.Timer1Timer(Sender: TObject);
begin
if (getkeyState(VK_ESCAPE)<0) or (getkeyState(VK_RBUTTON)<0) then close;
end;

procedure Tf2411.FormActivate(Sender: TObject);
begin
  with i0.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i0.ClientRect);
  end;
  Panel9.SetFocus;
  TM2411[fNumber].FormHandle:=f2411.Handle;
  if TM2411[fNumber].DataExh then SetValues
                             else SetNoValues;
end;

end.
