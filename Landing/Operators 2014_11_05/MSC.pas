unit MSC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Global;

type
  TMS = class(TForm)
    Panel5: TPanel;
    Panel6: TPanel;
    Image4: TImage;
    Label161: TLabel;
    Panel7: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    Image2: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Image3: TImage;
    Label3: TLabel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Image5: TImage;
    Label4: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Image6: TImage;
    Label5: TLabel;
    Panel18: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    rb6: TRadioButton;
    rb7: TRadioButton;
    rb8: TRadioButton;
    rb10: TRadioButton;
    rb9: TRadioButton;
    rb11: TRadioButton;
    rb12: TRadioButton;
    procedure rb9Click(Sender: TObject);
    procedure rb11Click(Sender: TObject);
    procedure rb7Click(Sender: TObject);
    procedure rb5Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MS: TMS;

implementation

{$R *.dfm}

procedure TMS.FormCreate(Sender: TObject);
var i:integer;
begin
  for i:=1 to 6 do
  if MS.FindComponent('image'+IntToStr(i))<>nil then
  with (MS.FindComponent('image'+IntToStr(i)) as TImage).Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect((MS.FindComponent('image'+IntToStr(i)) as TImage).ClientRect);
  end;
  if MK1=1.00 then rb1.Checked :=true else rb2.Checked:=true;
  if MK2=1.00 then rb3.Checked :=true else rb4.Checked:=true;
  if MK3=1.00 then rb5.Checked :=true else rb6.Checked:=true;
  if MK4=1.00 then rb7.Checked :=true else rb8.Checked:=true;
  if MK5=1.00 then rb9.Checked :=true else rb10.Checked:=true;
  if MK6=1.00 then rb11.Checked:=true else rb12.Checked:=true;
end;

procedure TMS.rb11Click(Sender: TObject);
begin
  if rb11.Checked then MK6:=1 else MK6:=1000/mile;
end;

procedure TMS.rb1Click(Sender: TObject);
begin
  if rb1.Checked then MK1:=1 else MK1:=mile;
end;

procedure TMS.rb3Click(Sender: TObject);
begin
  if rb3.Checked then MK2:=1 else MK2:=foot;
end;

procedure TMS.rb5Click(Sender: TObject);
begin
  if rb5.Checked then MK3:=1 else MK3:=foot;
end;

procedure TMS.rb7Click(Sender: TObject);
begin
  if rb7.Checked then MK4:=1 else MK4:=1000/mile;
end;

procedure TMS.rb9Click(Sender: TObject);
begin
  if rb9.Checked then MK5:=1 else MK5:=60/foot;
end;

end.
