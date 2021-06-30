unit fm7210;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Container_EM7210,BDRecord,fm7302,Global;

type
  Tf7210 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    a1: TEdit;
    a2: TEdit;
    a3: TEdit;
    a4: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure SetNoValues;
  private
    { Private declarations }
  public
    PostNumber:integer;
  end;

var
  f7210: Tf7210;

implementation

{$R *.dfm}

procedure Tf7210.SetValues(First: Boolean);
var str:string;
begin
  if First then
  begin
    str:=EM7210[PostNumber].Hint;
    Delete(str,Pos('TM-2226',str),Length(str));
    Caption:=TRIM(str);
    str:=EM7210[PostNumber].Hint;
    Delete(str,1,Pos('TM-2226',str)-1);
    Caption:=Caption+' '+str;
    a1.Text:='  '+Caption;
  end;
  if EM7210[PostNumber].DataExh then
  begin
    e2.Text:='  YES';
    e2.Color:=_Green;
    if EM7210[PostNumber].VideoExh then
    begin
      e3.Text :='  YES';
      e3.Color:=_Green;
    end else
    begin
      e3.Text :='  NO';
      e3.Color:=_Red;
    end;
    case EM7210[PostNumber].Source of
      1: e4.Text:='  LANDING';
      2: e4.Text:='  MULTISCREEN';
      3..10: e4.Text:='  '+bdKU[KUToPort[EM7210[PostNumber].Source-2]].Name;
      11..15:e4.Text:='  NO USE';
      16: e4.Text:=DeviceArr[d2408].Name;
    end;
  end else
  begin
    e2.Text:='  NO';
    e2.Color:=_Red;
    e3.Text  :='';
    e3.Color :=_Gray;
    e4.Color :=_Gray;
  end;
end;

procedure Tf7210.Timer1Timer(Sender: TObject);
begin
  if EM7210[PostNumber]<>nil then
  if EM7210[PostNumber].DataExh then SetValues(false)
                                else SetNoValues
                                else SetNoValues;
end;

procedure Tf7210.SetNoValues;
begin
  e2.Text  :='  NO';
  e2.Color :=_Red;
  e3.Text  :='';
  e3.Color :=_Gray;
  e4.Text  :='';
  e4.Color :=_Gray;
end;

procedure Tf7210.FormActivate(Sender: TObject);
begin
  with I1.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i1.ClientRect);
  end;
  if EM7210[PostNumber]<>nil then SetValues(True)
                             else SetNoValues;
  Panel4.SetFocus;
end;

end.
