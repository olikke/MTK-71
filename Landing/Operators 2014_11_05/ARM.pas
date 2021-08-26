unit ARM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls,Global;

type
  Tfm_ARM = class(TForm)
    Panel7: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    Label1: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label4: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Label5: TLabel;
    StringGrid3: TStringGrid;
    Label6: TLabel;
    StringGrid4: TStringGrid;
    procedure Edit9Exit(Sender: TObject);
    procedure Edit9Enter(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SetValues;
    procedure SetNoValues;
    procedure ServMsa(var Msg: TMessage); message WM_NOTIFY_MSA;
  private
    { Private declarations }
  public
    Device_ID:Cardinal;
    ARM:TARM;
    Extended:byte;
  end;

var
  fm_ARM: Tfm_ARM;

implementation

{$R *.dfm}

procedure Tfm_ARM.ServMsa(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[DEVICE_ID].Enter;
  ARM:=TARM(ArrDevice[Device_ID]);
  cs_ArrDevice[DEVICE_ID].Leave;
  SetValues;
end;

procedure Tfm_ARM.Edit9Enter(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=false;
end;

procedure Tfm_ARM.Edit9Exit(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=true;
end;

procedure Tfm_ARM.FormActivate(Sender: TObject);
begin
  if (Device_ID=3) or (Device_ID=16) then
  begin
    Panel7.Visible:=false;
    Panel1.Top    :=Panel13.Top+Panel13.Height-1;
  end else
  begin
    Panel7.Visible:=true;
    Panel1.Top    :=Panel7.Top+Panel7.Height-1;
    if ExternalDevice.OLS=0 then
    begin
      Edit1.Enabled:=false;
      Edit2.Text   :='no use';
      Edit2.Color  :=clMedGray;
    end;
    if ExternalDevice.Telem=0 then
    begin
      Edit3.Enabled:=false;
      Edit4.Text   :='no use';
      Edit4.Color  :=clMedGray;
    end;
    if ExternalDevice.PRLK=0 then
    begin
      Edit5.Enabled:=false;
      Edit6.Text   :='no use';
      Edit6.Color  :=clMedGray;
    end;
  end;
  Panel4.Top:=Panel1.Top+Panel1.Height-1;
  if ARM.HDDCount<=2 then StringGrid3.RowCount:=3 else StringGrid3.RowCount:=ARM.HDDCount+1;
  StringGrid3.Height:=(StringGrid3.DefaultRowHeight+2)*(ARM.HDDCount+1);
  Panel4.Height:=StringGrid3.Top+StringGrid3.Height+10;
  Panel10.Top:=Panel4.Top+Panel4.Height-1;
  Height:=Panel10.Top+Panel10.Height+40;
  SetValues;
end;

procedure Tfm_ARM.SetNoValues;
begin
  Panel7.Visible :=false;
  Panel1.Visible :=false;
  Panel4.Visible :=false;
  Panel10.Visible:=false;
  Edit10.Text:=' No';
  Edit10.Color:=Color_R;
  Height:=Panel13.Top+Panel13.Height+45;
end;

procedure Tfm_ARM.SetValues;
  procedure SetEdit(Edit:TEdit;ok:boolean;ColorNo:TColor);
  begin
    if ok then
    begin
      Edit.Text :=' Yes';
      Edit.Color:=Color_G;
    end else
    begin
      Edit.Text :=' No';
      Edit.Color:=ColorNo;
    end;
  end;
var Count,i:integer;
    TotalSpace,FreeSpace:single;
begin
  if ARM.DataExh=0 then  begin SetNoValues; exit; end;
  SetEdit(Edit10,true,Color_R);
  if (not ARM.Lan[1].State) and (not ARM.Lan[2].State) and (DEVICE_ID<>1) then  begin SetNoValues; exit; end;
  SetEdit(Edit8,ARM.VideoTDV,Color_R);
  Count:=ARM.HDDCount;
  if Count<>0 then
  begin
    StringGrid3.RowCount:=Count+1;
    StringGrid3.Height:=(StringGrid3.DefaultRowHeight+2)*(Count+1);
    Panel4.Height:=StringGrid3.Top+StringGrid3.Height+10;
    for i:= 1 to Count do
    begin
      TotalSpace:=ARM.HDD[i].TotalSpace;
      FreeSpace :=ARM.HDD[i].FreeSpace;
      StringGrid3.Cells[0,i]:=ARM.HDD[i].HDD_Name+':\';
      StringGrid3.Cells[1,i]:=FloatToStrF(TotalSpace/1024,ffFixed,6,2);
      StringGrid3.Cells[2,i]:=FloatToStrF(FreeSpace/1024,ffFixed,6,2);
      if TotalSpace<> 0 then
      StringGrid3.Cells[3,i]:=FloatToStrF((TotalSpace-FreeSpace)/TotalSpace*100,ffFixed,6,2);
    end;
  end else
  begin
    Count:=2;
    StringGrid3.RowCount:=Count+1;
    StringGrid3.Height:=(StringGrid3.DefaultRowHeight+2)*(Count+1);
    for i:= 1 to Count do
    begin
      StringGrid3.Cells[0,i]:='Not Found';
      StringGrid3.Cells[1,i]:='     ?     ';
      StringGrid3.Cells[2,i]:='     ?     ';
      StringGrid3.Cells[3,i]:='     ?     ';
    end;
  end;
  Panel10.Top:=Panel4.Top+Panel4.Height-1;
  Count:=Arm.LANCount;
  if Count<>0 then
  begin
    StringGrid4.RowCount:=Count+1;
    StringGrid4.Height:=(StringGrid4.DefaultRowHeight+2)*(Count+1);
    for i:=1 to Count do
    begin
      StringGrid4.Cells[0,i]:=ARM.Lan[i].LanIP;
      case i of
      1:  if ARM.Lan[1].State then StringGrid4.Cells[1,i]:='Connected' else StringGrid4.Cells[1,i]:='Not Connected!';
      2:  if ARM.Lan[2].State then StringGrid4.Cells[1,i]:='Connected' else StringGrid4.Cells[1,i]:='Not Connected!';
      end;
    end;
  end else
  begin
    Count:=2;
    StringGrid4.RowCount:=Count+1;
    StringGrid4.Height:=(StringGrid4.DefaultRowHeight+2)*(Count+1);
    for i:=1 to Count do
    begin
      StringGrid4.Cells[0,i]:='Not Found';
      StringGrid4.Cells[1,i]:='Not Connected!';
    end;
  end;
  if Device_ID<>3 then
  begin
    if ExternalDevice.OLS<>0   then SetEdit(Edit2,ARM.LunExh=1,Color_W);
    if ExternalDevice.Telem<>0 then SetEdit(Edit4,ARM.TelExh<>2,Color_W);
    if ExternalDevice.PRLK<>0  then SetEdit(Edit6,ARM.RezExh=1,Color_W);
  end;
  Height:=Panel10.Top+Panel10.Height+40;
end;

procedure Tfm_ARM.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
    TotalSpace,FreeSpace:single;
begin
  with StringGrid3.Canvas do
  begin
    s:=StringGrid3.Cells[ACol,ARow];
    if ARow<>0 then TotalSpace:=ARM.HDD[ARow].TotalSpace;
    if ARow<>0 then FreeSpace:=ARM.HDD[ARow].FreeSpace;
    if TotalSpace<>0 then
    begin
      if (TotalSpace-FreeSpace)/TotalSpace<=0.95 then Brush.Color:=COLOR_Y;
      if (TotalSpace-FreeSpace)/TotalSpace<=0.90 then Brush.Color:=COLOR_G;
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

procedure Tfm_ARM.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
begin
 with StringGrid4.Canvas do
  begin
    s:=StringGrid4.Cells[ACol,ARow];
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

procedure Tfm_ARM.FormCreate(Sender: TObject);
var i:integer;
begin
  StringGrid3.Cells[0,0]:=' HDD';
  StringGrid3.Cells[1,0]:=' Total [GB]';
  StringGrid3.Cells[2,0]:=' Free [GB]';
  StringGrid3.Cells[3,0]:=' Use [%]';
  StringGrid4.Cells[0,0]:=' IP-address';
  StringGrid4.Cells[1,0]:=' State';
  for i:=1 to 5 do
  if fm_ARM.FindComponent('i'+IntToStr(i))<>nil then
  with (fm_ARM.FindComponent('i'+IntToStr(i)) as TImage).Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect((fm_ARM.FindComponent('i'+IntToStr(i)) as TImage).ClientRect);
  end;
end;

end.
