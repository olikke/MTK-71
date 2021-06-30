unit TM2320;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, DBTables,UnitDM, ExtCtrls, RpRender,
  RpRenderCanvas, RpRenderPrinter, RpDefine, RpBase, RpFiler,Math, Buttons,
  ComCtrls,Global, TeEngine, Series, TeeProcs, Chart,fmHELP,Printers;

type
  Tfm2320 = class(TForm)
    QProtocol: TQuery;
    QProtocolCheck: TIntegerField;
    QProtocolProtocol_ID: TIntegerField;
    DProtocol: TDataSource;
    QProtocolStartDate: TDateTimeField;
    QProtocolGlidepath: TFloatField;
    QProtocolKUList: TStringField;
    DData: TDataSource;
    QData: TQuery;
    QDataProtocol_ID: TIntegerField;
    QDatanum: TIntegerField;
    QDataDrl: TFloatField;
    QDataDnrl: TFloatField;
    QDataDntv: TFloatField;
    QDataLRrl: TFloatField;
    QDataLRtv: TFloatField;
    QDataUDrl: TFloatField;
    QDataUDtv: TFloatField;
    QDataDTime: TDateTimeField;
    QDatafDrl: TStringField;
    QDatafDnrl: TStringField;
    QDatafLRrl: TStringField;
    QDatafUDrl: TStringField;
    QDatafDntv: TStringField;
    QDatafLRtv: TStringField;
    QDatafUDtv: TStringField;
    QDatafDTime: TStringField;
    QDataTracking: TStringField;
    QDataNumMAX: TIntegerField;
    QDatafTracking: TStringField;
    QDelete: TQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    DateTimeField1: TDateTimeField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    Panel1: TPanel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox4: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Button1: TButton;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    DBProtocol: TDBGrid;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Panel6: TPanel;
    Chart1: TChart;
    ColorDialog1: TColorDialog;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    Panel12: TPanel;
    Button3: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button2: TButton;
    QProtocolfGlidepath: TStringField;
    Panel7: TPanel;
    GroupBox5: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Panel8: TPanel;
    Panel9: TPanel;
    GroupBox6: TGroupBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Panel10: TPanel;
    Panel11: TPanel;
    Button4: TButton;
    CheckBox5: TCheckBox;
    Label9: TLabel;
    Edit6: TEdit;
    Label11: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Label12: TLabel;
    Label4: TLabel;
    Edit3: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    ComboBox2: TComboBox;
    SpeedButton2: TSpeedButton;
    StaticText1: TStaticText;
    PrintDialog1: TPrintDialog;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    QProtocolNumber: TStringField;
    QProtocolType: TStringField;
    QProtocolNameOp: TStringField;
    Button5: TButton;
    Label17: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Panel6Resize(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Panel10Click(Sender: TObject);
    procedure Panel9Click(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBProtocolCellClick(Column: TColumn);
    procedure QProtocolAfterScroll(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBProtocolDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PaintSeries;
    procedure PaintSeriesRACS;
    procedure PaintSeriesTV;
  private
    ss:String;
    LastCheck:integer;
  public
    { Public declarations }
  end;

type   //только в метрах
  TMD=record
    tD :double;
    tLR:double;
    tUD:double;
    pD :double;
    pLR:double;
    pUD:double;
    tdt:TDateTime;
  end;

var
  fm2320: Tfm2320;
  BList:TList;
  PrintList:TStringList;
  CountsInSample:integer;
  Count:integer;
  MD:array of TMD;
  tSKOv:double;
  tSKOh:double;
  pSKOv:double;
  pSKOh:double;
  ooo:integer=0;
  EN_START_DISTANCE:single=400;
  EN_STOP_DISTANCE:single=600;
  SI_START_DISTANCE:single;
  SI_STOP_DISTANCE:single;
  START_DISTANCE:single;
  STOP_DISTANCE:single;
  MIN_DISTANCE:single;
  MAX_DISTANCE:single;
  RACS_SDD:single;
  RACS_VDD:single;
  TV_SDD:single;
  TV_VDD:single;
  fl_Chang:boolean=false;
  PR_ID:int64;
implementation

{$R *.dfm}

procedure Tfm2320.PaintSeriesTV;
var i:integer;
    ChartMax,ChartMin:double;
    a,b:double;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  ChartMax:=-9999999;
  ChartMin:= 9999999;
  case ComboBox1.ItemIndex of
     1:  begin
           a:=mile;
           b:=foot;
           Chart1.LeftAxis.Title.Caption:='Deviation, ft';
           Chart1.BottomAxis.Title.Caption:='Distance, mi';
         end;
  0,-1:  begin
           a:=1;
           b:=1;
           Chart1.LeftAxis.Title.Caption:='Deviation, m';
           Chart1.BottomAxis.Title.Caption:='Distance, m';
         end;
  end;
  if CheckBox3.Checked then
  begin
    for i:=0 to Count - 1 do
    if (MD[i].tD>SI_START_DISTANCE) and (MD[i].tD<SI_STOP_DISTANCE) then
    begin
      Series3.AddXY(MD[i].tD/a,MD[i].tLR/b,'',clRed);
      if ChartMax<MD[i].tLR/b then  ChartMax:=MD[i].tLR/b;
      if ChartMin>MD[i].tLR/b then  ChartMin:=MD[i].tLR/b;
    end;
  end;
  if CheckBox4.Checked then
  begin
    for i:=0 to Count - 1 do
    if (MD[i].tD>SI_START_DISTANCE) and (MD[i].tD<SI_STOP_DISTANCE) then
    begin
      Series4.AddXY(MD[i].tD/a,MD[i].tUD/b,'',clRed);
      if ChartMax<MD[i].tUD/b then  ChartMax:=MD[i].tUD/b;
      if ChartMin>MD[i].tUD/b then  ChartMin:=MD[i].tUD/b;
    end;
  end;
  if (ChartMin=0) then ChartMin:=-1;
  if (ChartMax=0) then ChartMax:= 1;
  Chart1.LeftAxis.Minimum:=floor(ChartMin*0.95);
  Chart1.LeftAxis.Maximum:=ceil(ChartMax*1.05);
end;

procedure Tfm2320.PaintSeriesRACS;
var i:integer;
    ChartMax,ChartMin:double;
    a,b:double;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  ChartMax:=-9999999;
  ChartMin:= 9999999;
  case ComboBox1.ItemIndex of
     1:  begin
           a:=mile;
           b:=foot;
           Chart1.LeftAxis.Title.Caption:='Deviation, ft';
           Chart1.BottomAxis.Title.Caption:='Distance, mi';
         end;
  0,-1:  begin
           a:=1;
           b:=1;
           Chart1.LeftAxis.Title.Caption:='Deviation, m';
           Chart1.BottomAxis.Title.Caption:='Distance, m';
         end;
  end;
  if CheckBox1.Checked then
  begin
    for i:=0 to Count - 1 do
    if (MD[i].pD>SI_START_DISTANCE) and (MD[i].pD<SI_STOP_DISTANCE) then
    begin
      Series1.AddXY(MD[i].pD/a,MD[i].pLR/b,'',clRed);
      if ChartMax<MD[i].pLR/b then  ChartMax:=MD[i].pLR/b;
      if ChartMin>MD[i].pLR/b then  ChartMin:=MD[i].pLR/b;
    end;
  end;
  if CheckBox2.Checked then
  begin
    for i:=0 to Count - 1 do
    if (MD[i].pD>SI_START_DISTANCE) and (MD[i].pD<SI_STOP_DISTANCE) then
    begin
      Series2.AddXY(MD[i].pD/a,MD[i].pUD/b,'',clRed);
      if ChartMax<MD[i].pUD/b then  ChartMax:=MD[i].pUD/b;
      if ChartMin>MD[i].pUD/b then  ChartMin:=MD[i].pUD/b;
    end;
  end;
  if (ChartMin=0) and (ChartMax=0) then begin ChartMin:=-0.5; ChartMax:=0.5; end;
  Chart1.LeftAxis.Minimum:=floor(ChartMin*0.95);
  Chart1.LeftAxis.Maximum:=ceil(ChartMax*1.05);
end;

procedure Tfm2320.PaintSeries;
var i:integer;
    ChartMax,ChartMin:double;
    b:double;
begin
  Series1.Clear;
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;
  ChartMax:=-9999999;
  ChartMin:= 9999999;
  case ComboBox1.ItemIndex of
     1:  begin
           b:=foot;
           Chart1.LeftAxis.Title.Caption:='Deviation, ft';
           Chart1.BottomAxis.Title.Caption:='N';
         end;
  0,-1:  begin
           b:=1;
           Chart1.LeftAxis.Title.Caption:='Deviation, m';
           Chart1.BottomAxis.Title.Caption:='N';
         end;
  end;
  if CheckBox1.Checked then
  begin
    for i:=0 to Count - 1 do
    begin
      Series1.AddXY(i+1,MD[i].pLR/b,'',clRed);
      if ChartMax<MD[i].pLR/b then  ChartMax:=MD[i].pLR/b;
      if ChartMin>MD[i].pLR/b then  ChartMin:=MD[i].pLR/b;
    end;
  end;
  if CheckBox2.Checked then
  begin
    for i:=0 to Count - 1 do
    begin
      Series2.AddXY(i+1,MD[i].pUD/b,'',clRed);
      if ChartMax<MD[i].pUD/b then  ChartMax:=MD[i].pUD/b;
      if ChartMin>MD[i].pUD/b then  ChartMin:=MD[i].pUD/b;
    end;
  end;
  if CheckBox3.Checked then
  begin
    for i:=0 to Count - 1 do
    begin
      Series3.AddXY(i+1,MD[i].tLR/b,'',clRed);
      if ChartMax<MD[i].tLR/b then  ChartMax:=MD[i].tLR/b;
      if ChartMin>MD[i].tLR/b then  ChartMin:=MD[i].tLR/b;
    end;
  end;
  if CheckBox4.Checked then
  begin
    for i:=0 to Count - 1 do
    begin
      Series4.AddXY(i+1,MD[i].tUD/b,'',clRed);
      if ChartMax<MD[i].tUD/b then  ChartMax:=MD[i].tUD/b;
      if ChartMin>MD[i].tUD/b then  ChartMin:=MD[i].tUD/b;
    end;
  end;
  if (ChartMin=0) and (ChartMax=0) then begin ChartMin:=-0.5; ChartMax:=0.5; end;
  Chart1.LeftAxis.Minimum:=floor(ChartMin*0.95);
  Chart1.LeftAxis.Maximum:=ceil(ChartMax*1.05);
end;

procedure Tfm2320.Panel10Click(Sender: TObject);
begin
  ColorDialog1.Color:=Panel10.Color;
  if not ColorDialog1.Execute then exit;
  Series3.SeriesColor:=ColorDialog1.Color;
  Panel10.Color:=ColorDialog1.Color;
  ComboBox2Change(self);
end;

procedure Tfm2320.Panel11Click(Sender: TObject);
begin
  ColorDialog1.Color:=Panel11.Color;
  if not ColorDialog1.Execute then exit;
  Series4.SeriesColor:=ColorDialog1.Color;
  Panel11.Color:=ColorDialog1.Color;
  ComboBox2Change(self);
end;

procedure Tfm2320.Panel6Resize(Sender: TObject);
begin
  StaticText1.Top:=Panel6.Height-25;
  StaticText1.Left:=60;
end;

procedure Tfm2320.Panel8Click(Sender: TObject);
begin
  ColorDialog1.Color:=Panel8.Color;
  if not ColorDialog1.Execute then exit;
  Series1.SeriesColor:=ColorDialog1.Color;
  Panel8.Color:=ColorDialog1.Color;
  ComboBox2Change(self);
end;

procedure Tfm2320.Panel9Click(Sender: TObject);
begin
  ColorDialog1.Color:=Panel9.Color;
  if not ColorDialog1.Execute then exit;
  Series2.SeriesColor:=ColorDialog1.Color;
  Panel9.Color:=ColorDialog1.Color;
  ComboBox2Change(self);
end;

procedure Tfm2320.Button1Click(Sender: TObject);
var i,j:integer;
    tCount,pCount,ttC,ppC:integer;
    RoundV,RoundH:double;
    a,b:double;
    flag:boolean;
begin
  flag:=false;
  if (SI_START_DISTANCE<MIN_DISTANCE) then
  begin
    Edit6.Font.Color:=clRed;
    flag:=true;
  end else Edit6.Font.Color:=clBlack;
  if (SI_STOP_DISTANCE>MAX_DISTANCE) then
  begin
    Edit7.Font.Color:=clRed;
    flag:=true;
  end else Edit7.Font.Color:=clBlack;
  if flag then
  begin
    Edit4.Text:='0';
    Edit5.Text:='0';
    Edit8.Text:='0';
    Edit9.Text:='0';
    EXIT;
  end;
  tSKOv:=0;
  tSKOh:=0;
  pSKOv:=0;
  pSKOh:=0;
  tCount:=0;
  pCount:=0;
  ttC:=0;
  ppC:=0;
  for i:=0 to Count-1 do
  begin
    if (MD[i].tD>=SI_START_DISTANCE) and (MD[i].tD<=SI_STOP_DISTANCE) then
    begin
      INC(tCount);
      if tCount>=CountsInSample then
      begin
        RoundV:=0;
        RoundH:=0;
        for j:=1 to tCount do
        if (i-j>=0) and (i-j<Count-1)then
        begin
          RoundH:=RoundH+MD[i-j].tLR;
          RoundV:=RoundV+MD[i-j].tUD;
        end else break;
        RoundH:=RoundH/tCount;
        RoundV:=RoundV/tCount;
        a:=0;
        b:=0;
        for j:=1 to tCount do
        if i-j>=0 then
        begin
          a:=a+SQR(MD[i-j].tUD-RoundV);
          b:=b+SQR(MD[i-j].tLR-RoundH);
        end;
        tSKOv:=tSKOv+SQRT(b/(tCount-1));
        tSKOh:=tSKOh+SQRT(a/(tCount-1));
        tCount:=0;
        INC(ttC);
      end;
    end else tCount:=0;
    if (MD[i].pD>=SI_START_DISTANCE) and (MD[i].pD<=SI_STOP_DISTANCE) then
    begin
      INC(pCount);
      if pCount>=CountsInSample then
      begin
        RoundV:=0;
        RoundH:=0;
        for j:=1 to pCount do
        if (i-j>=0) and (i-j<Count-1)then
        begin
          RoundH:=RoundH+MD[i-j].pLR;
          RoundV:=RoundV+MD[i-j].pUD;
        end else break;
        RoundH:=RoundH/pCount;
        RoundV:=RoundV/pCount;
        a:=0;
        b:=0;
        for j:=1 to pCount do
        if i-j>=0 then
        begin
          a:=a+SQR(MD[i-j].pUD-RoundV);
          b:=b+SQR(MD[i-j].pLR-RoundH);
        end;
        pSKOv:=pSKOv+SQRT(b/(pCount-1));
        pSKOh:=pSKOh+SQRT(a/(pCount-1));
        pCount:=0;
        INC(ppC);
      end;
    end else pCount:=0;
  end;
  case ComboBox1.ItemIndex of
  -1,0: a:=1;
     1: a:=foot;
  end;
  if ttc<>0 then
  begin
    Edit8.Text:=FloatToStrF(tSKOv/ttC/a,ffFixed,6,2);
    Edit9.Text:=FloatToStrF(tSKOh/ttC/a,ffFixed,6,2);
  end else
  begin
    Edit8.Text:='0';
    Edit9.Text:='0';
  end;
  if ppc<>0 then
  begin
    Edit4.Text:=FloatToStrF(pSKOv/ppC/a,ffFixed,6,2);
    Edit5.Text:=FloatToStrF(pSKOh/ppC/a,ffFixed,6,2);
  end else
  begin
    Edit4.Text:='0';
    Edit5.Text:='0';
  end;


end;

procedure Tfm2320.Button2Click(Sender: TObject);
var flag:boolean;
    i:integer;
    x,y:integer;
    a,b:double;
    NumOn,NumOff:cardinal;
    ys:integer;
    kk,kpp:integer;
begin
  if PR_ID=0 then  exit;
  flag:=false;
  for i:=0 to Printer.Printers.Count-1 do
  if (Pos('HTTP://192.168',UpperCase(Printer.Printers.Strings[i]))<>0 ) and (Pos('VRD',UpperCase(Printer.Printers.Strings[i]))=0 ) then
  begin
    Printer.PrinterIndex:=i;
    flag:=true;
    break;
  end;
  if not flag then if not PrintDialog1.Execute  then exit;

  if not SI then
  begin
    a:=mile;
    b:=foot;
  end else
  begin
    a:=1;
    b:=1;
  end;

  NumON :=StrToIntDef(Edit1.Text,0);
  NumOFF:=StrToIntDef(Edit2.Text,0);
  {if NumOFF-NumOn>5000 then
  begin
    ShowMEssage('No possible.  Please enter  StopN-StartN<5000');
    exit;
  end;}
  kk:=1;
   if NumOFF-NumOn<=61 then kpp:=1 else  kpp:=Ceil((NumOFF-NumOn-61)/69)+1;
  QProtocol.Locate('Protocol_ID',Pr_ID,[LoPartialKey]);
  Printer.Orientation   :=poPortrait;
  Printer.BeginDoc;
  Printer.Canvas.Refresh;
  X:=Printer.PageWidth  div GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSX);
  Y:=Printer.PageHeight div GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSY);
  GroupBox1.Enabled:=false;
  Panel12.Enabled:=false;
  with Printer.Canvas do
  begin
    Font.Name:='Times New Roman';
    Font.Size:=13;
    TextOut(100*X,20*Y,'Date: '+DateToStr(QProtocolStartDate.value));
    TextOut(100*X,32*Y,'Time: '+TimeToStr(QProtocolStartDate.value));
    TextOut(100*X,44*Y,'Glidepath: '+IntToStr(TRUNC(QProtocolGlidepath.Value))+chr($B0)+IntToStr(TRUNC(FRAC(QProtocolGlidepath.Value)*60)) + chr($27) );
    TextOut(100*X,56*Y,'List of the TV cameras: '+QProtocolKUList.Value);
    TextOut(100*X,68*Y,'Central operator: '+QProtocolNameOp.Value);
    TextOut(100*X,80*Y,'Aircraft     N '+ QProtocolNumber.Value +'     '+QProtocolType.Value);
    Font.Size:=10;
    ys:=100;
    TextOut(60 *X,ys*Y,'N');
    TextOut(100*X,ys*Y,'Drl');
    TextOut(150*X,ys*Y,'Dnrl');
    TextOut(200*X,ys*Y,'Dntv');
    TextOut(250*X,ys*Y,'LRrl');
    TextOut(300*X,ys*Y,'LRtv');
    TextOut(350*X,ys*Y,'UDrl');
    TextOut(400*X,ys*Y,'UDtv');
    TextOut(450*X,ys*Y,'Time');
    TextOut(530*X,ys*Y,'Tracking');

    ys:=110;
    QData.DisableControls;
    QData.First;
    while (not QData.Eof) and (QDatanum.Value<=NumOFF) do
    begin
      if (QDatanum.Value>=NumOn) then
      begin
      TextOut(60 *X,ys*Y,FloatToStrF(QDatanum.Value,ffFixed,5,0));
      TextOut(100*X,ys*Y,FloatToStrF(QDataDrl.Value/a,ffFixed,8,3));
      TextOut(150*X,ys*Y,FloatToStrF(QDataDnrl.Value/a,ffFixed,8,3));
      TextOut(200*X,ys*Y,FloatToStrF(QDataDntv.Value/a,ffFixed,8,3));
      TextOut(250*X,ys*Y,FloatToStrF(QDataLRrl.Value/b,ffFixed,8,2));
      TextOut(300*X,ys*Y,FloatToStrF(QDataLRtv.Value/b,ffFixed,8,2));
      TextOut(350*X,ys*Y,FloatToStrF(QDataUDrl.Value/b,ffFixed,8,2));
      TextOut(400*X,ys*Y,FloatToStrF(QDataUDtv.Value/b,ffFixed,8,2));
      TextOut(450*X,ys*Y,FormatDateTime('hh:nn:ss.zz',QDataDTime.Value));
      TextOut(530*X,ys*Y,QDataTracking.Value);
      INC(ys,8);
      if ys>580 then
      begin
        TextOut(280*X,590*Y,'Page '+IntToStr(kk)+' of '+IntToStr(kpp));
        Label17.Caption:='Page '+IntToStr(kk)+' of '+IntToStr(kpp);
        Printer.NewPage;
        ys:=30;
        TextOut(60 *X,ys*Y,'N');
        TextOut(100*X,ys*Y,'Drl');
        TextOut(150*X,ys*Y,'Dnrl');
        TextOut(200*X,ys*Y,'Dntv');
        TextOut(250*X,ys*Y,'LRrl');
        TextOut(300*X,ys*Y,'LRtv');
        TextOut(350*X,ys*Y,'UDrl');
        TextOut(400*X,ys*Y,'UDtv');
        TextOut(450*X,ys*Y,'Time');
        TextOut(530*X,ys*Y,'Tracking');
        INC(kk);
        ys:=40;
      end;
      end;
      QData.Next;
    end;
    TextOut(280*X,590*Y,'Page '+IntToStr(kpp)+' of '+IntToStr(kpp));
    QData.EnableControls;
  end;
  Printer.EndDoc;
  Label17.Caption:='Ready';
  GroupBox1.Enabled:=true;
  Panel12.Enabled:=true;
end;

procedure Tfm2320.Button3Click(Sender: TObject);
var i:Word;
    s1,s2,s3:String;
begin
  if BList.Count > 0 then
   begin
    if MessageDlg('To delete '+IntToStr(BList.Count)+' protocols?' ,mtConfirmation,
       [mbYes,mbNo],0)=mrNo then EXIT;
    s1:='';
    for i:=0 to BList.Count - 1 do
      begin
        if i=0 then s1:=IntToStr(INTEGER(BList[i]))
               else s1:=s1+','+IntToStr(INTEGER(BList[i]));
      end;
    BList.Clear;
    s2:='Delete from ProtocolDate where Protocol_ID in ('+s1+')';
    QDelete.Close;QDelete.SQL.Clear;QDelete.SQL.Add(s2);QDelete.ExecSQL;
    s3:='Delete from Protocol where Protocol_ID in ('+s1+')';
    QDelete.Close;QDelete.SQL.Clear;QDelete.SQL.Add(s3);QDelete.ExecSQL;
    QProtocol.Close;
    QProtocol.Open;
    QData.Close;
    QData.Open;
   end               else
   begin
    ShowMessage('There are not the records chosen for a delete');
   end;

end;

procedure Tfm2320.Button4Click(Sender: TObject);
var i:integer;
    flag:boolean;
    x,y:single;
begin
  {flag:=false;
  for i:=0 to Printer.Printers.Count-1 do
  if Pos('HTTP://192.168',UpperCase(Printer.Printers.Strings[i]))<>0 then
  begin
    Printer.PrinterIndex:=i;
    flag:=true;
    break;
  end;
  if not flag then if not PrintDialog1.Execute  then exit;
  PrintDialog1.FromPage := 1;
  PrintDialog1.ToPage   := 1;
  PrintDialog1.MinPage  := 1;
  PrintDialog1.MaxPage  := 1;
  Printer.Orientation   :=poLandscape;
  x:=Printer.PageWidth/3508;
  y:=Printer.PageHeight/2480;
  Printer.BeginDoc;
  Printer.Canvas.Refresh;
  Printer.Canvas.Font.Size:=14;
  Printer.Canvas.TextOut(450,80,'Diagram according protocol');
  Printer.Canvas.Font.Size:=10;
  Printer.Canvas.TextOut(450,Round(100+60*y),'Date: '+DateToStr(QProtocolStartDate.value));
  Printer.Canvas.TextOut(Round(1100*x),Round(100+50*y),'Time: '+TimeToStr(QProtocolStartDate.value));
  Printer.Canvas.TextOut(450,Round(100+120*y),'Glidepath: '+IntToStr(TRUNC(QProtocolGlidepath.Value))+chr($B0)+IntToStr(TRUNC(FRAC(QProtocolGlidepath.Value)*60)) + chr($27));
  Printer.Canvas.TextOut(Round(1100*x),Round(100+100*y),'List of the TV cameras: '+QProtocolKUList.Value);
  Printer.Canvas.TextOut(450,Round(100+180*y),'Central operator: '+QProtocolOperator.Value);
  if not CheckBox1.Checked then Series1.ShowInLegend:=false else Series1.ShowInLegend:=true;
  if not CheckBox2.Checked then Series2.ShowInLegend:=false else Series2.ShowInLegend:=true;
  if not CheckBox3.Checked then Series3.ShowInLegend:=false else Series3.ShowInLegend:=true;
  if not CheckBox4.Checked then Series4.ShowInLegend:=false else Series4.ShowInLegend:=true;
  Chart1.Legend.Visible:=true;
  Chart1.PrintPartialCanvas(Printer.Canvas,   Rect(100,   Round(100+250*y),   Printer.PageWidth-50,   Printer.PageHeight-50));
  Chart1.Legend.Visible:=false;
  Printer.EndDoc;  }
end;

procedure Tfm2320.Button5Click(Sender: TObject);
var flag:boolean;
    i:integer;
    x,y:integer;
    a,b:double;
    NumOn,NumOff:cardinal;
    ys:integer;
    kk,kpp:integer;
begin
  if PR_ID=0 then  exit;
  flag:=false;
  for i:=0 to Printer.Printers.Count-1 do
  if (Pos('MICROSOFT XPS DOCUMENT WRITER',UpperCase(Printer.Printers.Strings[i]))<>0 ) and (Pos('VRD',UpperCase(Printer.Printers.Strings[i]))=0 ) then
  begin
    Printer.PrinterIndex:=i;
    flag:=true;
    break;
  end;
  if not flag then if not PrintDialog1.Execute  then exit;

  if not SI then
  begin
    a:=mile;
    b:=foot;
  end else
  begin
    a:=1;
    b:=1;
  end;

  NumON :=StrToIntDef(Edit1.Text,0);
  NumOFF:=StrToIntDef(Edit2.Text,0);

  kk:=1;
   if NumOFF-NumOn<=60 then kpp:=1 else  kpp:=Ceil((NumOFF-NumOn-60)/68)+1;
  QProtocol.Locate('Protocol_ID',Pr_ID,[LoPartialKey]);
  Printer.Orientation   :=poPortrait;
  Printer.BeginDoc;
  Printer.Canvas.Refresh;
  X:=Printer.PageWidth  div GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSX);
  Y:=Printer.PageHeight div GetDeviceCaps(Printer.Canvas.Handle,LOGPIXELSY);
  GroupBox1.Enabled:=false;
  Panel12.Enabled:=false;
  with Printer.Canvas do
  begin
    Font.Name:='Times New Roman';
    Font.Size:=13;
    TextOut(100*X,20*Y,'Date: '+DateToStr(QProtocolStartDate.value));
    TextOut(100*X,32*Y,'Time: '+TimeToStr(QProtocolStartDate.value));
    TextOut(100*X,44*Y,'Glidepath: '+IntToStr(TRUNC(QProtocolGlidepath.Value))+chr($B0)+IntToStr(TRUNC(FRAC(QProtocolGlidepath.Value)*60)) + chr($27) );
    TextOut(100*X,56*Y,'List of the TV cameras: '+QProtocolKUList.Value);
    TextOut(100*X,68*Y,'Central operator: '+QProtocolNameOp.Value);
    TextOut(100*X,80*Y,'Aircraft     N '+ QProtocolNumber.Value +'     '+QProtocolType.Value);
    Font.Size:=10;
    ys:=100;
    TextOut(60 *X,ys*Y,'N');
    TextOut(100*X,ys*Y,'Drl');
    TextOut(150*X,ys*Y,'Dnrl');
    TextOut(200*X,ys*Y,'Dntv');
    TextOut(250*X,ys*Y,'LRrl');
    TextOut(300*X,ys*Y,'LRtv');
    TextOut(350*X,ys*Y,'UDrl');
    TextOut(400*X,ys*Y,'UDtv');
    TextOut(450*X,ys*Y,'Time');
    TextOut(530*X,ys*Y,'Tracking');

    ys:=110;
    QData.DisableControls;
    QData.First;
    while (not QData.Eof) and (QDatanum.Value<=NumOFF) do
    begin
      if (QDatanum.Value>=NumOn) then
      begin
      TextOut(60 *X,ys*Y,FloatToStrF(QDatanum.Value,ffFixed,5,0));
      TextOut(100*X,ys*Y,FloatToStrF(QDataDrl.Value/a,ffFixed,8,3));
      TextOut(150*X,ys*Y,FloatToStrF(QDataDnrl.Value/a,ffFixed,8,3));
      TextOut(200*X,ys*Y,FloatToStrF(QDataDntv.Value/a,ffFixed,8,3));
      TextOut(250*X,ys*Y,FloatToStrF(QDataLRrl.Value/b,ffFixed,8,2));
      TextOut(300*X,ys*Y,FloatToStrF(QDataLRtv.Value/b,ffFixed,8,2));
      TextOut(350*X,ys*Y,FloatToStrF(QDataUDrl.Value/b,ffFixed,8,2));
      TextOut(400*X,ys*Y,FloatToStrF(QDataUDtv.Value/b,ffFixed,8,2));
      TextOut(450*X,ys*Y,FormatDateTime('hh:nn:ss.zz',QDataDTime.Value));
      TextOut(530*X,ys*Y,QDataTracking.Value);
      INC(ys,8);
      if ys>580 then
      begin
        TextOut(280*X,590*Y,'Page '+IntToStr(kk)+' of '+IntToStr(kpp));
        Label17.Caption:='Page '+IntToStr(kk)+' of '+IntToStr(kpp);
        Printer.NewPage;
        ys:=30;
        TextOut(60 *X,ys*Y,'N');
        TextOut(100*X,ys*Y,'Drl');
        TextOut(150*X,ys*Y,'Dnrl');
        TextOut(200*X,ys*Y,'Dntv');
        TextOut(250*X,ys*Y,'LRrl');
        TextOut(300*X,ys*Y,'LRtv');
        TextOut(350*X,ys*Y,'UDrl');
        TextOut(400*X,ys*Y,'UDtv');
        TextOut(450*X,ys*Y,'Time');
        TextOut(530*X,ys*Y,'Tracking');
        INC(kk);
        ys:=40;
      end;
      end;
      QData.Next;
    end;
    TextOut(280*X,600*Y,'Page '+IntToStr(kpp)+' of '+IntToStr(kpp));
    QData.EnableControls;
  end;
  Printer.EndDoc;
  Label17.Caption:='Ready';
  GroupBox1.Enabled:=true;
  Panel12.Enabled:=true;
end;

procedure Tfm2320.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var  xt,yt:double;
begin
  Series1.GetCursorValues(xt,yt);
  case ComboBox2.ItemIndex of
  0,-1,1: case ComboBox1.ItemIndex of
            0,-1: StaticText1.Caption:='Deviation ='+Series1.XValueToText(yt)+ ' m,  Distance='+Series1.YValueToText(xt)+'  m' ;
               1: StaticText1.Caption:='Deviation ='+Series1.XValueToText(yt)+ ' ft, Distance='+Series1.YValueToText(xt)+'  mi' ;
          end;
       2: case ComboBox1.ItemIndex of
            0,-1: StaticText1.Caption:='Deviation ='+Series1.XValueToText(yt)+ ' m,  N='+Series1.YValueToText(Round(xt))+'  ,Time=' +FormatDateTime('hh:mm:ss.zzz',MD[Round(xt)-1].tdt);
               1: StaticText1.Caption:='Deviation ='+Series1.XValueToText(yt)+ ' ft, N='+Series1.YValueToText(Round(xt))+'  ,Time=' +FormatDateTime('hh:mm:ss.zzz',MD[Round(xt)-1].tdt);
          end;
  end;
end;

procedure Tfm2320.CheckBox1Click(Sender: TObject);
begin
  ComboBox2Change(self);
end;

procedure Tfm2320.CheckBox5Click(Sender: TObject);
begin
  ComboBox2Change(self);
end;

procedure Tfm2320.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0: begin
       Label5.Caption :='m';
       Label8.Caption :='m';
       Label11.Caption:='m';
       Label12.Caption:='m';
       Label14.Caption:='m';
       Label16.Caption:='m';
       fl_Chang:=true;
       Edit6.Text:=IntToStr(ROUND(SI_START_DISTANCE));
       Edit7.Text:=IntToStr(ROUND(SI_STOP_DISTANCE));
       fl_Chang:=false;
     end;
  1: begin
       Label5.Caption :='ft';
       Label8.Caption :='ft';
       Label11.Caption:='mi';
       Label12.Caption:='mi';
       Label14.Caption:='ft';
       Label16.Caption:='ft';
       fl_Chang:=true;
       Edit6.Text:=FloatToStrF(EN_START_DISTANCE,ffFixed,5,3);
       Edit7.Text:=FloatToStrF(EN_STOP_DISTANCE ,ffFixed,5,3);
       fl_Chang:=false;
     end;
  end;
  Button1.Click;
 // ComboBox2Change(self);
end;

procedure Tfm2320.ComboBox2Change(Sender: TObject);
begin
  case ComboBox2.ItemIndex of
    0,-1:
         begin
           CheckBox3.Checked:=false;
           CheckBox4.Checked:=false;
           GroupBox6.Enabled:=false;
           GroupBox5.Enabled:=true;
           if (not CheckBox1.Checked) and(not CheckBox2.Checked) then
           begin
             CheckBox1.Checked:=true;
             CheckBox2.Checked:=true;
           end;
           PaintSeriesRACS;
         end;
       1:
         begin
           CheckBox1.Checked:=false;
           CheckBox2.Checked:=false;
           GroupBox5.Enabled:=false;
           GroupBox6.Enabled:=true;
           if (not CheckBox3.Checked) and(not CheckBox4.Checked) then
           begin
             CheckBox3.Checked:=true;
             CheckBox4.Checked:=true;
           end;
           PaintSeriesTV;
         end;
       2:
         begin
           GroupBox5.Enabled:=true;
           GroupBox6.Enabled:=true;
           PaintSeries;
         end;
  end;
end;

procedure Tfm2320.DBProtocolCellClick(Column: TColumn);
var value:Word;
var i:integer;
    min,max:single;
begin
if CompareText(Column.Field.FieldName,'check')=0 then
begin
  value:=Column.Field.DataSet.FieldByName('Protocol_ID').AsInteger;
  PR_ID:=value;
  if BList.Count > 0 then
    if BList.IndexOf(Pointer(value))>=0
      then BList.Delete(BList.IndexOf(Pointer(value)))
        else BList.Add(Pointer(value))
          else BList.Add(Pointer(value));
  QData.Close;
  QData.ParamByName('Protocol_ID').Value:=Column.Field.DataSet.FieldByName('Protocol_ID').AsInteger;
  QData.Open;
  Edit2.Text:=QDataNumMAX.AsString;

  if Panel1.Width>0 then
  begin
  SetLength(MD,QDataNumMax.AsInteger);
  Count:=QDataNumMax.AsInteger;
  i:=0;
  min:=999999;
  max:=0;
  QData.First;
  while not  QData.Eof do
  begin
    MD[i].tD  :=QDataDntv.Value;
    MD[i].tLR :=QDataLRtv.Value;
    MD[i].tUD :=QDataUDtv.Value;
    MD[i].pD  :=QDataDnRl.Value;
    MD[i].pLR :=QDataLRRl.Value;
    MD[i].pUD :=QDataUDRl.Value;
    MD[i].tdt :=QDataDTime.Value;
    if MD[i].tD<min then min:=MD[i].tD;
    if MD[i].tD>max then max:=MD[i].tD;
    Inc(i);
    QData.Next;
  end;

  begin
    SI_START_DISTANCE:=min;
    EN_START_DISTANCE:=min/mile;
    fl_Chang:=true;
    if ComboBox1.ItemIndex=1 then
    begin
      Edit6.Text:=FloatToStrF(EN_START_DISTANCE,ffFixed,10,3);
      START_DISTANCE:=EN_START_DISTANCE;
    end else
    begin
      Edit6.Text:=FloatToStrF(SI_START_DISTANCE,ffFixed,10,3);
      START_DISTANCE:=SI_START_DISTANCE;
    end;
    MIN_DISTANCE:=SI_START_DISTANCE;
  end;
  begin
    SI_STOP_DISTANCE:=max;
    EN_STOP_DISTANCE:=max/mile;
    if ComboBox1.ItemIndex=1 then
    begin
      Edit7.Text:=FloatToStrF(EN_STOP_DISTANCE,ffFixed,10,3);
      STOP_DISTANCE:=EN_STOP_DISTANCE;
    end else
    begin
      Edit7.Text:=FloatToStrF(SI_STOP_DISTANCE,ffFixed,10,3);
      STOP_DISTANCE:=SI_STOP_DISTANCE;
    end;
    MAX_DISTANCE:=SI_STOP_DISTANCE;
    fl_Chang:=false;
  end;
 if Button1.Visible then Button1.Click;
 end;
  end;
   Column.Grid.Refresh;
end;



procedure Tfm2320.DBProtocolDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var CheckIt: Boolean;
    Value,Style: Integer;
begin
  Value:=TDBGrid(Sender).DataSource.DataSet.FieldByName('Protocol_ID').AsInteger;
  CheckIt:=(BList.IndexOf(Pointer(Value))>=0);
  if CheckIt then
    begin
      TDBGrid(Sender).Canvas.Font.Color:=RGB($00,$AA,$00);
      TDBGrid(Sender).Canvas.Brush.Color:= RGB($CC,$CC,$FF);
      TDBGrid(Sender).DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
  if CompareText(Column.FieldName,'check')=0 then
    begin
     	if CheckIt then Style:=DFCS_CHECKED
                 else Style:=DFCS_BUTTONCHECK;
      DrawFrameControl(TDBGrid(Sender).Canvas.Handle,Rect,DFC_BUTTON,Style);
    end;
end;


procedure Tfm2320.Edit3Change(Sender: TObject);
begin
  CountsInSample:=StrToInt(Edit3.Text);
  Button1.Click;
 // if Panel7.Visible then  PaintSeries;
end;

procedure Tfm2320.Edit6Change(Sender: TObject);
var i:Word;
    s,s2:String;
begin
  if fl_Chang then  exit;
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then EXIT;
  s2:=s;
  if StrToFloatDef(S,-1)=-1 then
    begin
      ShowMessage('Ошибочный символ --> "'+S2[Length(s2)]+'"');
      (Sender as TEdit).Text:=COPY(S2,1,Length(s2)-1);
      EXIT;
    end;
  (Sender as TEdit).Text:=S;
  (Sender as TEdit).SelStart:=Length(s);
   case ComboBox1.ItemIndex of
   0,-1:
        begin

          SI_START_DISTANCE:=StrToFLoat(Edit6.Text);
          START_DISTANCE:=SI_START_DISTANCE;
          EN_START_DISTANCE:=SI_START_DISTANCE/mile;
        end;
      1:
        begin
          EN_START_DISTANCE:=StrToFloat(Edit6.Text);
          START_DISTANCE:=EN_START_DISTANCE;
          SI_START_DISTANCE:=EN_START_DISTANCE*mile;
        end;
   end;
   Button1.Click;
end;

procedure Tfm2320.Edit7Change(Sender: TObject);
var i:Word;
    s,s2:String;
begin
  if fl_Chang then exit;
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then EXIT;
  s2:=s;
  if StrToFloatDef(S,-1)=-1 then
    begin
      ShowMessage('Ошибочный символ --> "'+S2[Length(s2)]+'"');
      (Sender as TEdit).Text:=COPY(S2,1,Length(s2)-1);
      EXIT;
    end;
  (Sender as TEdit).Text:=S;
  (Sender as TEdit).SelStart:=Length(s);
  case ComboBox1.ItemIndex of
   0,-1:
        begin
          SI_STOP_DISTANCE:=StrToFLoat(Edit7.Text);
          STOP_DISTANCE:=SI_STOP_DISTANCE;
          EN_STOP_DISTANCE:=SI_STOP_DISTANCE/mile;
        end;
      1:
        begin
          EN_STOP_DISTANCE:=StrToFloat(Edit7.Text);
          STOP_DISTANCE:=EN_STOP_DISTANCE;
          SI_STOP_DISTANCE:=EN_STOP_DISTANCE*mile;
        end;
   end;
  Button1.Click;
end;

procedure Tfm2320.FormActivate(Sender: TObject);
begin
  Button2.SetFocus;
end;

procedure Tfm2320.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  BList.Free;
end;

procedure Tfm2320.FormCreate(Sender: TObject);
begin
  BList:=TList.Create;
  CountsInSample:=5;
  if vCHART then
  begin
    Panel1.Width:=141;
    Panel3.Align:=alClient;
    Width:=Width+Panel1.Width;
    Left:=Left-Panel1.Width div 2;
  end else
  begin
    Panel6.Height:=0;
    Width:=Width-Panel1.Width;
    Left:=Left+ Panel1.Width div 2;
    Panel1.Width:=0;
    Splitter1.Enabled:=false;
  end;
  if not SI then
  with DBGrid1 do
  begin
    Columns[1].Title.Caption:='Drl[mi]';
    Columns[2].Title.Caption:='Dnrl[mi]';
    Columns[3].Title.Caption:='Dntv[mi]';
    Columns[4].Title.Caption:='LRrl[ft]';
    Columns[5].Title.Caption:='LRtv[ft]';
    Columns[6].Title.Caption:='UDrl[ft]';
    Columns[7].Title.Caption:='UDtv[ft]';
    Chart1.LeftAxis.Title.Caption:='Deviation, ft' ;
    Chart1.BottomAxis.Title.Caption:='Distance, mi';
    ComboBox1.ItemIndex:=1;
    ComboBox1Change(self);
  end;
end;

procedure Tfm2320.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Chart1.Visible then  exit;
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    //Panel6.Height:=500;
    //Splitter1.Enabled:=true;
    Panel1.Width:=141;
    Panel3.Align:=alClient;
    Width:=Width+Panel1.Width;
    Left:=Left-Panel1.Width div 2;
   // Chart1.Visible:=true;
    //Panel7.Visible:=true;
   // ComboBox2Change(self);
  end
  else ss:='';
end;

procedure Tfm2320.QProtocolAfterScroll(DataSet: TDataSet);
var i:integer;
    min,max:single;
begin
exit;
  QData.Close;
  QData.ParamByName('Protocol_ID').Value:=QProtocolProtocol_ID.Value;
  QData.Open;
  Edit2.Text:=QDataNumMAX.AsString;
  SetLength(MD,QDataNumMax.AsInteger);
  Count:=QDataNumMax.AsInteger;
  QData.First;
  i:=0;
  min:=999999;
  max:=0;
  while not  QData.Eof do
  begin
    MD[i].tD  :=QDataDntv.Value;
    MD[i].tLR :=QDataLRtv.Value;
    MD[i].tUD :=QDataUDtv.Value;
    MD[i].pD  :=QDataDnRl.Value;
    MD[i].pLR :=QDataLRRl.Value;
    MD[i].pUD :=QDataUDRl.Value;
    MD[i].tdt :=QDataDTime.Value;
    if MD[i].tD<min then min:=MD[i].tD;
    if MD[i].tD>max then max:=MD[i].tD;
    Inc(i);
    QData.Next;
  end;
  begin
    SI_START_DISTANCE:=min;
    EN_START_DISTANCE:=min/mile;
    fl_Chang:=true;
    if ComboBox1.ItemIndex=1 then
    begin
      Edit6.Text:=FloatToStrF(EN_START_DISTANCE,ffFixed,10,3);
      START_DISTANCE:=EN_START_DISTANCE;
    end else
    begin
      Edit6.Text:=FloatToStrF(SI_START_DISTANCE,ffFixed,10,3);
      START_DISTANCE:=SI_START_DISTANCE;
    end;
    MIN_DISTANCE:=SI_START_DISTANCE;
  end;
  begin
    SI_STOP_DISTANCE:=max;
    EN_STOP_DISTANCE:=max/mile;
    if ComboBox1.ItemIndex=1 then
    begin
      Edit7.Text:=FloatToStrF(EN_STOP_DISTANCE,ffFixed,10,3);
      STOP_DISTANCE:=EN_STOP_DISTANCE;
    end else
    begin
      Edit7.Text:=FloatToStrF(SI_STOP_DISTANCE,ffFixed,10,3);
      STOP_DISTANCE:=SI_STOP_DISTANCE;
    end;
    MAX_DISTANCE:=SI_STOP_DISTANCE;
    fl_Chang:=false;
  end;
  Button1.Click;
end;

procedure Tfm2320.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(THELP,HELP);
  HELP.HELP_ID:=0;
  HELP.ShowModal;
end;

end.
