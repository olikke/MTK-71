unit Betta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Global, Buttons, StdCtrls, Mask;

type
  TfmBetta = class(TForm)
    MaskEdit1: TMaskEdit;
    SpeedButton13: TSpeedButton;
    CheckBox1: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBetta: TfmBetta;

implementation

{$R *.dfm}

procedure TfmBetta.FormActivate(Sender: TObject);
var S1,S2:integer;
begin
 MaskEdit1.EditMask:='0'+Chr($B0)+ '00'+Chr($27)+';1;_';
 S1:=ABS(Trunc(aBETTA));
 S2:=Round(ABS(FRAC(aBETTA))*60);
 if aBETTA<0 then CheckBox1.Checked;
 if S2>9 then MaskEdit1.Text:=INtToStr(S1)+Chr($B0)+IntToStr(S2)+Chr($27)
         else MaskEdit1.Text:=INtToStr(S1)+Chr($B0)+'0'+IntToStr(S2)+Chr($27)
end;

procedure TfmBetta.MaskEdit1Change(Sender: TObject);
begin
MaskEdit1.Font.Color:=Color_R;
end;

procedure TfmBetta.SpeedButton13Click(Sender: TObject);
var S1,S2:integer;
begin
  if StrToIntDef(MaskEdit1.Text[1],-10)=-10 then exit;
  if StrToIntDef(MaskEdit1.Text[3],-10)=-10 then exit;
  if StrToIntDef(MaskEdit1.Text[4],-10)=-10 then exit;
  S1:=StrToInt(MaskEdit1.Text[1]);
  S2:=StrToInt(MaskEdit1.Text[3])*10+StrToInt(MaskEdit1.Text[4]);
  if S2>=60 then  exit;
  aBETTA:=S1+S2/60;
  if CheckBox1.Checked then aBetta:=-aBetta;
  MaskEdit1.Font.Color:=clWindowText;
end;

end.
