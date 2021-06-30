unit TM2404;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,NoExh;

type
  Tfm_TM_2404 = class(TForm)
    GroupBox7: TGroupBox;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    GroupBox8: TGroupBox;
    Label14: TLabel;
    GroupBox13: TGroupBox;
    Label19: TLabel;
    GroupBox14: TGroupBox;
    Label20: TLabel;
    GroupBox15: TGroupBox;
    Label21: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    dev32: TShape;
    dev26: TShape;
    dev23: TShape;
    dev28: TShape;
    dev30: TShape;
    dev25: TShape;
    dev31: TShape;
    dev29: TShape;
    dev24: TShape;
    dev27: TShape;
    GroupBox17: TGroupBox;
    Label24: TLabel;
    dev21: TShape;
    GroupBox18: TGroupBox;
    Label25: TLabel;
    dev11: TShape;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    dev34: TShape;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    dev35: TShape;
    GroupBox6: TGroupBox;
    Label4: TLabel;
    dev33: TShape;
    GroupBox19: TGroupBox;
    Label5: TLabel;
    dev36: TShape;
    GroupBox20: TGroupBox;
    Label6: TLabel;
    dev37: TShape;
    GroupBox21: TGroupBox;
    Label11: TLabel;
    dev0: TShape;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure GroupBox17Click(Sender: TObject);
    procedure GroupBox18Click(Sender: TObject);
    procedure GroupBox10Click(Sender: TObject);
    procedure GroupBox12Click(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
    procedure GroupBox14Click(Sender: TObject);
    procedure GroupBox15Click(Sender: TObject);
    procedure GroupBox13Click(Sender: TObject);
    procedure GroupBox8Click(Sender: TObject);
    procedure GroupBox11Click(Sender: TObject);
    procedure GroupBox7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_TM_2404: Tfm_TM_2404;

implementation

uses EM5402,Global,EM7401,EM2437,EM5401,EM3401;

{$R *.dfm}                                    

procedure Tfm_TM_2404.FormCreate(Sender: TObject);
var mArrStateDevice:array [1..DevCount] of TArrStateDevice;
    i:integer;
    mColor:TColor;
begin
  cs_ArrStateDevice.Enter;
  for i:=1 to DevCount do mArrStateDevice[i]:=ArrStateDevice[i];
  cs_ArrStateDevice.Leave;
  //раскраска
  for i:=1 to DevCount do
  begin
    case mArrStateDevice[i].ResultState of
     0 : mColor:=Color_R;
     1 : mColor:=Color_G;
     2 : mColor:=Color_W;
     3 : mColor:=Color_Y;
    end;
    if fm_TM_2404.FindComponent('dev'+IntToStr(i))<>nil then
            TShape(fm_TM_2404.FindComponent('dev'+IntToStr(i))).Brush.Color:=mColor;
  end;
end;

procedure Tfm_TM_2404.GroupBox10Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A8)';
  fm2437.Device_ID:=27;
  fm2437.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox11Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5401,fm5401);
  fm5401.Caption:='Interface Unit EM-5401 (A5/A6/A14)';
  fm5401.Device_ID:=23;
  fm5401.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox12Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5401,fm5401);
  fm5401.Caption:='Interface Unit EM-5401 (A5/A6/A15)';
  fm5401.Device_ID:=24;
  fm5401.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox13Click(Sender: TObject);
begin
  Application.CreateForm(Tfm7401,fm7401);
  fm7401.Caption:='VideoSignals Commutator EM-7401 (A5/A6/A12)';
  fm7401.Device_ID:=30;
  fm7401.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox14Click(Sender: TObject);
begin
  Application.CreateForm(Tfm7401,fm7401);
  fm7401.Caption:='VideoSignals Commutator EM-7401 (A5/A6/A13)';
  fm7401.Device_ID:=31;
  fm7401.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox15Click(Sender: TObject);
begin
  Application.CreateForm(Tfm3401,fm3401);
  fm3401.Caption:='Mixer-Generator EM-3401 (A5/A6/A11)';
  fm3401.Device_ID:=25;
  fm3401.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox17Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5402,fm5402);
  fm5402.Caption:='RS-485 Channel Splitter EM-5402 (A5/A6/A17)';
  fm5402.Device_ID:=21;
  fm5402.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox18Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5402,fm5402);
  fm5402.Caption:='RS-485 Channel Splitter EM-5402 (A5/A6/A16)';
  fm5402.Device_ID:=11;
  fm5402.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox7Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A7)';
  fm2437.Device_ID:=26;
  fm2437.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox8Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A9)';
  fm2437.Device_ID:=28;
  fm2437.ShowModal;
end;

procedure Tfm_TM_2404.GroupBox9Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A10)';
  fm2437.Device_ID:=29;
  fm2437.ShowModal;
end;

procedure Tfm_TM_2404.Timer1Timer(Sender: TObject);
var mArrStateDevice:array [1..DevCount] of TArrStateDevice;
    i:integer;
    mColor:TColor;
begin
  cs_ArrStateDevice.Enter;
  for i:=1 to DevCount do mArrStateDevice[i]:=ArrStateDevice[i];
  cs_ArrStateDevice.Leave;
  //раскраска
  for i:=1 to DevCount do
  begin
    case mArrStateDevice[i].ResultState of
     0 : mColor:=Color_R;
     1 : mColor:=Color_G;
     2 : mColor:=Color_W;
     3 : mColor:=Color_Y;
    end;
    if fm_TM_2404.FindComponent('dev'+IntToStr(i))<>nil then
            TShape(fm_TM_2404.FindComponent('dev'+IntToStr(i))).Brush.Color:=mColor;
  end;
end;

end.
