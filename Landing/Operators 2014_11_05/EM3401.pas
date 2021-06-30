unit EM3401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Global;

type
  Tfm3401 = class(TForm)
    Timer1: TTimer;
    f3401: TPanel;
    Panel3: TPanel;
    imim: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit4: TEdit;
    Panel7: TPanel;
    Shape5: TShape;
    Panel1: TPanel;
    Shape1: TShape;
    Panel2: TPanel;
    Shape2: TShape;
    Panel5: TPanel;
    Shape3: TShape;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
  private
    { Private declarations }
  public
    DEVICE_ID:cardinal;
    mEM3401:TEM3401;
  end;

var
  fm3401: Tfm3401;

implementation

{$R *.dfm}

procedure Tfm3401.FormActivate(Sender: TObject);
begin
  if Device_ID<>25 then  exit;
  if fm3401.FindComponent('imim')<>nil then
  with TImage(fm3401.FindComponent('imim')).Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(TImage(fm3401.FindComponent('imim')).ClientRect);
   end;
  Panel4.SetFocus;
  cs_ArrDevice[Device_ID].Enter; try mEM3401:=TEM3401((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  SetValues;
end;

procedure Tfm3401.SetValues;
begin
  with mEM3401 do
  if DataExh=0 then
  begin
    Edit4.Text:=' NO';
    Edit4.Color:=Color_R;
    Shape2.Brush.Color:=clWhite;
    Shape5.Brush.Color:=clWhite;
    Shape3.Brush.Color:=clWhite;
  end else
  begin
    Edit4.Text:=' YES';
    Edit4.Color:=Color_G;
    if SignY1=1 then Shape5.Brush.Color:=Color_G else Shape5.Brush.Color:=Color_R;
    if CSumm1=1 then Shape2.Brush.Color:=Color_G else Shape2.Brush.Color:=Color_R;
    if CSumm0=1 then Shape3.Brush.Color:=Color_G else Shape3.Brush.Color:=Color_R;
  end;
end;

procedure Tfm3401.Timer1Timer(Sender: TObject);
begin
  cs_ArrDevice[Device_ID].Enter; try mEM3401:=TEM3401((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  SetValues;
end;

end.
