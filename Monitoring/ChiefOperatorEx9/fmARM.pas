unit fmARM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls, XPMan,Container_TM2322,Global;

type
  TfARM = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    Panel5: TPanel;
    i2: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    StringGrid2: TStringGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2322;
  private
    fHDDCount:byte;
  public
    { Public declarations }
  end;

var
  fARM: TfARM;

implementation

{$R *.dfm}

procedure TfARM.ServMsd(var Msg: TMessage);
begin
  SetValues(false);
end;

procedure TfARM.SetValues(First: Boolean);
var i:integer;
begin
  if First then
  begin
    fHDDCount             :=TM2322.HDDCount;
    StringGrid1.RowCount  :=fHDDCount+1;
    StringGrid1.Height    :=StringGrid1.DefaultRowHeight*StringGrid1.RowCount+10;
    Panel2.Height         :=StringGrid1.Height+3+Panel3.Height;
    Panel1.Top            :=Panel2.Top+Panel2.Height+15;
    fArm.Height           :=Panel1.Top+Panel1.Height+50;
    StringGrid2.Cells[0,1]:=TM2322.IP1;
    StringGrid2.Cells[0,2]:=TM2322.IP2;
    StringGrid2.Cells[0,3]:=TM2322.IP3;
    StringGrid2.Cells[0,4]:=TM2322.IP4;
  end;
  if TM2322.VideoExh then
  begin
    Edit2.Color:=_Green;
    Edit2.Text :='  YES';
  end else
  begin
    Edit2.Color:=_Red;
    Edit2.Text :='  NO';
  end;
  for i:=1 to 4 do
  StringGrid2.Cells[1,i]:=TM2322.Text(i);
  for i:=1 to FHDDCount do
  begin
    StringGrid1.Cells[0,i]:=TM2322.HDDChar(i)+':\';
    StringGrid1.Cells[1,i]:=TM2322.HDDTotal(i);
    StringGrid1.Cells[2,i]:=TM2322.HDDFree(i);
    StringGrid1.Cells[3,i]:=TM2322.HDDUse(i);
  end;
end;

procedure TfARM.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
  if ARow=0  then exit;
  if ACol<>3 then exit;
  with StringGrid1.Canvas do
  begin
    s:=StringGrid1.Cells[ACol,ARow];
    Brush.Color:=TM2322.HDDColor(ARow);
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure TfARM.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
  if ARow=0 then exit;
  if ACol=0 then exit;
  with StringGrid2.Canvas do
  begin
    s:=StringGrid2.Cells[ACol,ARow];
    Brush.Color:=TM2322.EColor(ARow);
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure TfARM.Timer1Timer(Sender: TObject);
begin
if (getkeyState(VK_ESCAPE)<0) or (getkeyState(VK_RBUTTON)<0) then close;
end;

procedure TfARM.FormActivate(Sender: TObject);
begin
  with i1.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i1.ClientRect);
  end;
  with i2.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i2.ClientRect);
  end;
  with i3.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i3.ClientRect);
  end;
  Panel4.SetFocus;
  TM2322.FormHandle:=fARM.Handle;
  SetValues(true);
end;

procedure TfARM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TM2322.FormHandle:=0;
end;

procedure TfARM.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:=' HDD';
  StringGrid1.Cells[1,0]:=' Total [GB]';
  StringGrid1.Cells[2,0]:=' Free [GB]';
  StringGrid1.Cells[3,0]:=' Use [%]';
  StringGrid2.Cells[0,0]:=' IP-address';
  StringGrid2.Cells[1,0]:=' State';
end;

end.
