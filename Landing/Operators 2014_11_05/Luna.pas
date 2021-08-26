unit Luna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,Global, ExtCtrls, StdCtrls, XPMan;

type
  TOLS = class(TForm)
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    Edit12: TEdit;
    Edit2: TEdit;
    Edit13: TEdit;
    Edit3: TEdit;
    e1: TEdit;
    f1: TEdit;
    Edit1: TEdit;
    e2: TEdit;
    f2: TEdit;
    Edit4: TEdit;
    e3: TEdit;
    f3: TEdit;
    Edit5: TEdit;
    e4: TEdit;
    f4: TEdit;
    Edit6: TEdit;
    e5: TEdit;
    f5: TEdit;
    Edit7: TEdit;
    e6: TEdit;
    f6: TEdit;
    Edit8: TEdit;
    e7: TEdit;
    f7: TEdit;
    Edit9: TEdit;
    e8: TEdit;
    f8: TEdit;
    Edit10: TEdit;
    e9: TEdit;
    f9: TEdit;
    Edit11: TEdit;
    e10: TEdit;
    f10: TEdit;
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetValues;
    procedure FillMe;
  private
    OLS_1:TLuna;
    OLS_2:TLuna;
  public
    { Public declarations }
  end;

var
  OLS: TOLS;

implementation

{$R *.dfm}

procedure TOLS.Edit3Enter(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=false;
end;

procedure TOLS.Edit3Exit(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=true;
end;

procedure TOLS.FillMe;
begin
  e1.Text :=' YES';    f1.Text :=' YES';
  e1.Color:=clLime;    f1.Color:=clLime;
  e2.Text :='Work';    f2.Text :='Work';
  e3.Text :='True';    f3.Text :='True';
  e4.Text :='True';    f4.Text :='True';
  e5.Text :='4.00';    f5.Text :='4.00';
  e6.Text :='2.78';    f6.Text :='2.72';
  e7.Text :='0.00';    f7.Text :='0.00';
  e8.Text :='1.10';    f8.Text :='1.10';
  e9.Text :='0.00';    f9.Text :='0.00';
  e10.Text:='0.00';    f10.Text:='0.00';
end;

procedure TOLS.FormCreate(Sender: TObject);
begin
  cs_ArrDevice[38].Enter;  try OLS_1:=TLuna((ArrDevice[38])); finally cs_ArrDevice[38].Leave; end;
  cs_ArrDevice[39].Enter;  try OLS_2:=TLuna((ArrDevice[39])); finally cs_ArrDevice[39].Leave; end;
  SetValues;
end;

procedure TOLS.SetValues;
begin
  with OLS_1 do
  if DataExh=1 then
  begin
    e1.Text:=' YES';   e1.Color:=clLime;
    if (Work AND $01)=$01 then e2.Text:=' Work'
                          else e2.Text:=' Test';
    if (Work AND $02)=$02 then e3.Text:=' True'
                          else e3.Text:=' False';
    if (Work AND $04)=$04 then e4.Text:=' True'
                          else e4.Text:=' False';
    e5.Text:=' '+FloatToStrF(AlphaST,ffFixed,6,2);
    e6.Text:=' '+FloatToStrF(AlphaGL,ffFixed,6,2);
    e7.Text:=' '+FloatToStrF(ErrorST,ffFixed,6,2);
    e8.Text:=' '+FloatToStrF(PsiShip,ffFixed,6,2);
    e9.Text:=' '+FloatToStrF(Betta,ffFixed,6,2);
    e10.Text:=' '+FloatToStrF(ErrorB,ffFixed,6,2);
  end else
  begin
    e1.Text:=' NO';   e1.Color:=Color_R;
    e2.Text:='';
    e3.Text:='';
    e4.Text:='';
    e5.Text:='';
    e6.Text:='';
    e7.Text:='';
    e8.Text:='';
    e9.Text:='';
    e10.Text:='';
  end;
  with OLS_2 do
  if DataExh=1 then
  begin
    f1.Text:=' YES';   f1.Color:=clLime;
    if (Work AND $01)=$01 then f2.Text:=' Work'
                          else f2.Text:=' Test';
    if (Work AND $02)=$02 then f3.Text:=' True'
                          else f3.Text:=' False';
    if (Work AND $04)=$04 then f4.Text:=' True'
                          else f4.Text:=' False';
    f5.Text:=' '+FloatToStrF(AlphaST,ffFixed,6,2);
    f6.Text:=' '+FloatToStrF(AlphaGL,ffFixed,6,2);
    f7.Text:=' '+FloatToStrF(ErrorST,ffFixed,6,2);
    f8.Text:=' '+FloatToStrF(PsiShip,ffFixed,6,2);
    f9.Text:=' '+FloatToStrF(Betta,ffFixed,6,2);
    f10.Text:=' '+FloatToStrF(ErrorB,ffFixed,6,2);
  end else
  begin
    f1.Text:=' NO';   f1.Color:=Color_R;
    f2.Text:='';
    f3.Text:='';
    f4.Text:='';
    f5.Text:='';
    f6.Text:='';
    f7.Text:='';
    f8.Text:='';
    f9.Text:='';
    f10.Text:='';
  end;
end;

procedure TOLS.Timer1Timer(Sender: TObject);
begin
  cs_ArrDevice[38].Enter;  try OLS_1:=TLuna((ArrDevice[38])); finally cs_ArrDevice[38].Leave; end;
  cs_ArrDevice[39].Enter;  try OLS_2:=TLuna((ArrDevice[39])); finally cs_ArrDevice[39].Leave; end;
  SetValues;
end;

end.
