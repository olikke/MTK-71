unit VRD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls,Global;

type
  Tfm_VRD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel3: TPanel;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    i1: TImage;
    Label5: TLabel;
    Panel6: TPanel;
    StringGrid1: TStringGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    i2: TImage;
    Label6: TLabel;
    Panel12: TPanel;
    StringGrid2: TStringGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label1: TLabel;
    Panel9: TPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServMsa(var Msg: TMessage); message WM_NOTIFY_MSA;
    procedure SetValues;
    procedure SetNoValues;
  private
    { Private declarations }
  public
    Device_ID:Cardinal;
    ARM:TARM;
  end;

var
  fm_VRD: Tfm_VRD;

implementation

{$R *.dfm}

procedure Tfm_VRD.SetNoValues;
begin
  //GroupBox2.Visible:=false;
  StringGrid1.Visible:=false;
  StringGrid2.Visible:=false;
  //Label2.Visible:=false;
  Label1.Visible:=true;
  Label1.Top:=10;
  Label1.Font.Color:=clRed;
  Label1.Left:=90;
  Label1.Caption:='NO CONNECT!';
  Height:=Label1.Top+Label1.Height+40;
end;

procedure Tfm_VRD.SetValues;
var Count,i:integer;
    TotalSpace,FreeSpace:single;
begin
  if ARM.DataExh=0 then  begin SetNoValues; exit; end;
  if (not ARM.Lan[1].State) and (not ARM.Lan[2].State) then  begin SetNoValues; exit; end;
 // if ARM.VideoTDV then Shape3.Brush.Color:=Color_G else Shape3.Brush.Color:=Color_R;
  Count:=ARM.HDDCount;
  if Count<>0 then
  begin
    StringGrid1.RowCount:=Count+1;
    StringGrid1.Height:=(StringGrid1.DefaultRowHeight+2)*(Count+1);
    for i:= 1 to Count do
    begin
      TotalSpace:=ARM.HDD[i].TotalSpace;
      FreeSpace :=ARM.HDD[i].FreeSpace;
      StringGrid1.Cells[0,i]:=ARM.HDD[i].HDD_Name+':\';
      StringGrid1.Cells[1,i]:=FloatToStrF(TotalSpace/1024,ffFixed,6,2);
      StringGrid1.Cells[2,i]:=FloatToStrF(FreeSpace/1024,ffFixed,6,2);
      if TotalSpace<> 0 then
      StringGrid1.Cells[3,i]:=FloatToStrF((TotalSpace-FreeSpace)/TotalSpace*100,ffFixed,6,2);
    end;
  end else
  begin
    Count:=2;
    StringGrid1.RowCount:=Count+1;
    StringGrid1.Height:=(StringGrid1.DefaultRowHeight+2)*(Count+1);
    for i:= 1 to Count do
    begin
      StringGrid1.Cells[0,i]:='Not Found';
      StringGrid1.Cells[1,i]:='     ?     ';
      StringGrid1.Cells[2,i]:='     ?     ';
      StringGrid1.Cells[3,i]:='     ?     ';
    end;
  end;
 // Label2.Top:=StringGrid1.Top+StringGrid1.Height+10;
//  StringGrid2.Top:=Label2.Top+Label2.Height+10;
  Count:=Arm.LANCount;
  if Count<>0 then
  begin
    StringGrid2.RowCount:=Count+1;
    StringGrid2.Height:=(StringGrid2.DefaultRowHeight+2)*(Count+1);
    Height:=StringGrid2.Top+StringGrid2.Height+50;
    for i:=1 to Count do
    begin
      StringGrid2.Cells[0,i]:=ARM.Lan[i].LanIP;
      case i of
      1:  if ARM.Lan[1].State then StringGrid2.Cells[1,i]:='Connected' else StringGrid2.Cells[1,i]:='Not Connected!';
      2:  if ARM.Lan[2].State then StringGrid2.Cells[1,i]:='Connected' else StringGrid2.Cells[1,i]:='Not Connected!';
      end;
    end;
  end else
  begin
    Count:=2;
    StringGrid2.RowCount:=Count+1;
    StringGrid2.Height:=(StringGrid2.DefaultRowHeight+2)*(Count+1);
    Height:=StringGrid2.Top+StringGrid2.Height+50;
    for i:=1 to Count do
    begin
      StringGrid2.Cells[0,i]:='Not Found';
      StringGrid2.Cells[1,i]:='Not Connected!';
    end;
  end;
end;

procedure Tfm_VRD.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
    TotalSpace,FreeSpace:single;
begin
  with StringGrid1.Canvas do
  begin
    s:=StringGrid1.Cells[ACol,ARow];
    if ARow<>0 then TotalSpace:=ARM.HDD[ARow].TotalSpace;
    if ARow<>0 then FreeSpace:=ARM.HDD[ARow].FreeSpace;
    if TotalSpace<>0 then
    begin
      if (TotalSpace-FreeSpace)/TotalSpace<=0.95 then Brush.Color:=COLOR_Y;
      if (TotalSpace-FreeSpace)/TotalSpace<=0.9 then Brush.Color:=COLOR_G;
      if (TotalSpace-FreeSpace)/TotalSpace>=0.95 then Brush.Color:=COLOR_R;
    end;
    if (ACol<=2) then Brush.Color:=Color_W;
    if (ARow=0) then Brush.Color:=clBtnFace;
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure Tfm_VRD.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
 with StringGrid2.Canvas do
  begin
    s:=StringGrid2.Cells[ACol,ARow];
    if ARow<>0 then
      if ARM.Lan[ARow].State then Brush.Color:=COLOR_G else Brush.Color:=COLOR_R;
    if (ACol=0) then Brush.Color:=Color_W;
    if (ARow=0) then Brush.Color:=clBtnFace;
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;

procedure Tfm_VRD.ServMsa(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[DEVICE_ID].Enter;
  ARM:=TARM(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  SetValues;
end;

procedure Tfm_VRD.FormActivate(Sender: TObject);
var i:integer;
begin
  if ARM.HDDCount<=2 then StringGrid1.RowCount:=3 else StringGrid1.RowCount:=ARM.HDDCount+1;
  StringGrid1.Height:=(StringGrid1.DefaultRowHeight+2)*(ARM.HDDCount+1);
  //Label2.Top:=StringGrid1.Top+StringGrid1.Height+10;
 // StringGrid2.Top:=Label2.Top+Label2.Height+10;
  StringGrid2.RowCount:=3;
  StringGrid2.Height:=(StringGrid2.DefaultRowHeight+2)*(3);
  Height:=StringGrid2.Top+StringGrid2.Height+40;
  for i:=1 to 4 do
  if fm_VRD.FindComponent('i'+IntToStr(i))<>nil then
  with (fm_VRD.FindComponent('i'+IntToStr(i)) as TImage).Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect((fm_VRD.FindComponent('i'+IntToStr(i)) as TImage).ClientRect);
  end;
  SetValues;
end;

procedure Tfm_VRD.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:=' HDD';
  StringGrid1.Cells[1,0]:=' Total [GB]';
  StringGrid1.Cells[2,0]:=' Free [GB]';
  StringGrid1.Cells[3,0]:=' Use [%]';
  StringGrid2.Cells[0,0]:=' IP-address';
  StringGrid2.Cells[1,0]:=' State';
end;

end.
