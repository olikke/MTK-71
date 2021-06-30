unit fm3401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,Client_EM3401,Global;

type
  Tf3401 = class(TForm)
    f3401: TPanel;
    Panel3: TPanel;
    i1: TImage;
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
    s1: TShape;
    Panel1: TPanel;
    s2: TShape;
    Panel2: TPanel;
    s3: TShape;
    Panel5: TPanel;
    s4: TShape;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValue;
    procedure SetNoValue;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f3401: Tf3401;

implementation

{$R *.dfm}

procedure Tf3401.FormActivate(Sender: TObject);
begin
  with i1.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i1.ClientRect);
  end;
  Panel4.SetFocus;
  Timer1Timer(self);
end;

procedure Tf3401.Timer1Timer(Sender: TObject);
begin
  if EM3401.DataExh then SetValue else SetNoValue;
end;

procedure Tf3401.SetValue;
begin
  Edit4.Text :=' YES';
  Edit4.Color:=_Green;
  s1.Brush.Color:=EM3401.Synchro1;
  s2.Brush.Color:=EM3401.Synchro2;
  s3.Brush.Color:=EM3401.Summ1;
  s4.Brush.Color:=EM3401.Summ2;
end;

procedure Tf3401.SetNoValue;
begin
  Edit4.Text :=' NO';
  Edit4.Color:=_Red;
  s1.Brush.Color:=clWhite;
  s2.Brush.Color:=clWhite;
  s3.Brush.Color:=clWhite;
  s4.Brush.Color:=clWhite;
end;

end.
