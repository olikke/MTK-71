unit fm2408;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, ExtCtrls,Container_TM2408,Global;

type
  Tf2408 = class(TForm)
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
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
    Panel10: TPanel;
    Panel11: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel12: TPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2408;
    procedure TableVisible(vis:boolean);
  private
    fHDDCount  :byte;
    LastDataExh:boolean;
    FirstTime  :boolean;
  public
    { Public declarations }
  end;

var
  f2408: Tf2408;

implementation

{$R *.dfm}

procedure Tf2408.ServMsd(var Msg: TMessage);
begin
  //SetValues(false);
end;

procedure Tf2408.TableVisible(vis: Boolean);
begin
  if vis then
  begin
    Edit4.Text:='  YES';
    Edit4.Color:=_Green;
  end else
  begin
    Edit4.Text:='  NO';
    edit4.Color:=_Red;
  end;
  Panel7.Visible:=vis;
  Panel2.Visible:=vis;
  Panel1.Visible:=vis;
  if not vis then Height:=Panel10.Top+Panel10.Height+50;
end;

procedure Tf2408.SetValues(First: Boolean);
var i:integer;
begin
  if First then
  begin
    fHDDCount             :=TM2408.HDDCount;
    StringGrid1.RowCount  :=fHDDCount+1;
    StringGrid1.Height    :=StringGrid1.DefaultRowHeight*StringGrid1.RowCount+30;
    Panel2.Height         :=StringGrid1.Height+3+Panel3.Height;
    Panel1.Top            :=Panel2.Top+Panel2.Height+15;
    f2408.Height          :=Panel1.Top+Panel1.Height+50;
    StringGrid2.Cells[0,1]:=TM2408.IP1;
    StringGrid2.Cells[0,2]:=TM2408.IP2;
    StringGrid2.Cells[0,3]:=TM2408.IP3;
    StringGrid2.Cells[0,4]:=TM2408.IP4;
  end;
  for i:=1 to 4 do
  StringGrid2.Cells[1,i]:=TM2408.Text(i);
  for i:=1 to FHDDCount do
  begin
    StringGrid1.Cells[0,i]:=TM2408.HDDChar(i+1)+':\';
    StringGrid1.Cells[1,i]:=TM2408.HDDTotal(i);
    StringGrid1.Cells[2,i]:=TM2408.HDDFree(i);
    StringGrid1.Cells[3,i]:=TM2408.HDDUse(i);
  end;
  if TM2408.Video then
  begin
    Edit2.Color:=_Green;
    Edit2.Text :=' YES';
  end else
  begin
    Edit2.Color:=_Red;
    Edit2.Text :=' NO';
  end;
end;

procedure Tf2408.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
  if ARow=0  then exit;
  if ACol<>3 then exit;
  with StringGrid1.Canvas do
  begin
    s:=StringGrid1.Cells[ACol,ARow];
    Brush.Color:=TM2408.HDDColor(ARow);
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure Tf2408.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
  if ARow=0 then exit;
  if ACol=0 then exit;
  with StringGrid2.Canvas do
  begin
    s:=StringGrid2.Cells[ACol,ARow];
    Brush.Color:=TM2408.EColor(ARow);
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure Tf2408.Timer1Timer(Sender: TObject);
begin
  if TM2408.DataExh then
  begin
    if not LastDataExh then TableVisible(true);
    SetValues(not LastDataExh);
    LastDataExh:=true;
  end else
  begin
    if LastDataExh or FirstTime then TableVisible(false);
    LastDataExh:=false;
    FirstTime:=false;
  end;
end;

procedure Tf2408.FormActivate(Sender: TObject);
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
  with i4.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i4.ClientRect);
  end;
  Panel12.SetFocus;
  TM2408.FormHandle:=f2408.Handle;
  FirstTime  :=true;
  LastDataExh:=false;
  Timer1Timer(self);
end;

procedure Tf2408.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TM2408.FormHandle:=0;
end;

procedure Tf2408.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:=' HDD';
  StringGrid1.Cells[1,0]:=' Total [GB]';
  StringGrid1.Cells[2,0]:=' Free [GB]';
  StringGrid1.Cells[3,0]:=' Use [%]';
  StringGrid2.Cells[0,0]:=' IP-address';
  StringGrid2.Cells[1,0]:=' State';
end;

end.
