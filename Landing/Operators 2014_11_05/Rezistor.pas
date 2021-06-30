unit Rezistor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,Global, ExtCtrls, StdCtrls;

type
  TRACS = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Edit2: TEdit;
    n1: TEdit;
    n2: TEdit;
    n3: TEdit;
    n4: TEdit;
    n5: TEdit;
    n6: TEdit;
    n7: TEdit;
    n8: TEdit;
    n9: TEdit;
    n10: TEdit;
    Edit12: TEdit;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    e7: TEdit;
    e8: TEdit;
    e9: TEdit;
    e10: TEdit;
    Edit13: TEdit;
    f1: TEdit;
    f2: TEdit;
    f3: TEdit;
    f4: TEdit;
    f5: TEdit;
    f6: TEdit;
    f7: TEdit;
    f8: TEdit;
    f9: TEdit;
    f10: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SetValues;
    procedure FillMe;
  private
    RACS1:TResistor;
    RACS2:TResistor;
  public
    { Public declarations }
  end;

var
  RACS: TRACS;

implementation

{$R *.dfm}

procedure TRACS.FormActivate(Sender: TObject);
begin
  if SI then n5.Text:=' Distance [m]'
        else n5.Text:=' Distance [ft]';
  if SI then n8.Text:=' SAC speed [km/h]'
        else n8.Text:=' SAC speed [mi/h]';
  if SI then n9.Text:=' SAC vertical speed [m/s]'
        else n9.Text:=' SAC vertical speed [ft/s]';
  cs_ArrDevice[45].Enter;  try RACS1:=TResistor((ArrDevice[45])); finally cs_ArrDevice[45].Leave; end;
  cs_ArrDevice[46].Enter;  try RACS2:=TResistor((ArrDevice[46])); finally cs_ArrDevice[46].Leave; end;
  Panel1.SetFocus;
  SetValues;
end;

procedure TRACS.SetValues;
begin
  with RACS1 do
  if DataExh=1 then
  begin
    e1.Text:=' YES';    e1.Color:=clLime;
    if Accomp=1  then e2.text:=' YES'
                 else e2.Text:=' NO';
    e3.Text:=' '+IntToStr(LandPoint);
    e4.Text:=' '+IntToStr(NomLA);
    e5.Text:=' '+FloatToStrF(Distanse,ffFixed,6,2);
    e6.Text:=' '+FloatToStrF(Corse,ffFixed,6,2);
    e7.Text:=' '+FloatToStrF(Altitude,ffFixed,6,2);
    e8.Text:=' '+FloatToStrF(SpeedLA,ffFixed,6,2);
    e9.Text:=' '+FloatToStrF(SpeedVr,ffFixed,6,2);
    e10.Text:=' '+FloatToStrF(Glissad,ffFixed,6,2);
  end else
  begin
    e1.Text:=' NO';     e1.Color:=Color_R;
    e2.Text:=' ';
    e3.Text:=' ';
    e4.Text:=' ';
    e5.Text:=' ';
    e6.Text:=' ';
    e7.Text:=' ';
    e8.Text:=' ';
    e9.Text:=' ';
    e10.Text:='';
  end;  
  with RACS2 do
  if DataExh=1 then
  begin
    f1.Text:=' YES';    f1.Color:=clLime;
    if Accomp=1  then f2.text:=' YES'
                 else f2.Text:=' NO';
    f3.Text:=' '+IntToStr(LandPoint);
    f4.Text:=' '+IntToStr(NomLA);
    f5.Text:=' '+FloatToStrF(Distanse,ffFixed,6,2);
    f6.Text:=' '+FloatToStrF(Corse,ffFixed,6,2);
    f7.Text:=' '+FloatToStrF(Altitude,ffFixed,6,2);
    f8.Text:=' '+FloatToStrF(SpeedLA,ffFixed,6,2);
    f9.Text:=' '+FloatToStrF(SpeedVr,ffFixed,6,2);
    f10.Text:=' '+FloatToStrF(Glissad,ffFixed,6,2);
  end else
  begin
    f1.Text:=' NO';     f1.Color:=Color_R;
    f2.Text:=' ';
    f3.Text:=' ';
    f4.Text:=' ';
    f5.Text:=' ';
    f6.Text:=' ';
    f7.Text:=' ';
    f8.Text:=' ';
    f9.Text:=' ';
    f10.Text:='';
  end;
end;


procedure TRACS.Timer1Timer(Sender: TObject);
begin
  cs_ArrDevice[45].Enter;  try RACS1:=TResistor((ArrDevice[45])); finally cs_ArrDevice[45].Leave; end;
  cs_ArrDevice[46].Enter;  try RACS2:=TResistor((ArrDevice[46])); finally cs_ArrDevice[46].Leave; end;
  SetValues;
end;

procedure TRACS.FillMe;
begin
  e1.Text:=' YES';
  e1.Color:=clLime;
  e2.Text:=' YES';
  e3.Text:=' 1';
  e4.Text:=' 0';
  e5.Text:=' 4064.00';
  e6.Text:=' 183.15';
  e7.Text:=' 1.08';
  e8.Text:=' 2.05';
  e9.Text:=' 0.16';
  e10.Text:=' 4.30';
  f1.Text:=' YES';
  f1.Color:=clLime;
  f2.Text:=' YES';
  f3.Text:=' 1';
  f4.Text:=' 0';
  f5.Text:=' 4064.00';
  f6.Text:=' 183.15';
  f7.Text:=' 1.08';
  f8.Text:=' 2.05';
  f9.Text:=' 0.16';
  f10.Text:=' 4.30';
end;

end.
