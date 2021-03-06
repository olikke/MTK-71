unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DSPack, Grids, DBGrids, ExtCtrls,Global,GR32,
  DB, DBTables,Math,DSUtil,DirectShow9,ActiveX, XComDrv, XPMan,FastDIB,FastDraw,Calibration;

type
  TForm1 = class(TForm)
    MTK: TDatabase;
    QLASetup: TQuery;
    QLASetupLa_ID: TSmallintField;
    QLASetupmName: TStringField;
    QLASetupXE: TFloatField;
    QLASetupYE: TFloatField;
    QLASetupXF: TFloatField;
    QLASetupYF: TFloatField;
    QLASetupXG: TFloatField;
    QLASetupYG: TFloatField;
    QLASetupZG: TFloatField;
    QLASetupZE: TFloatField;
    QLASetupZF: TFloatField;
    DLASetup2: TDataSource;
    LASetup: TQuery;
    SmallintField1: TSmallintField;
    XE: TFloatField;
    YE: TFloatField;
    XF: TFloatField;
    YF: TFloatField;
    XG: TFloatField;
    YG: TFloatField;
    ZG: TFloatField;
    ZE: TFloatField;
    ZF: TFloatField;
    FilterGraph1: TFilterGraph;
    Timer1: TTimer;
    KUSetup: TQuery;
    KUSetupDevice_ID: TIntegerField;
    KUSetupX: TFloatField;
    KUSetupY: TFloatField;
    KUSetupZ: TFloatField;
    KUSetupAz: TFloatField;
    KUSetupUm: TFloatField;
    KUSetupUsY: TSmallintField;
    KUSetupAhxY: TSmallintField;
    KUSetupUsC: TSmallintField;
    KUSetupAhxC: TSmallintField;
    KUSetupFocus: TFloatField;
    KUSetupRx: TFloatField;
    KUSetupKx: TFloatField;
    KUSetupRy: TFloatField;
    KUSetupKy: TFloatField;
    KUSetupX0: TFloatField;
    KUSetupY0: TFloatField;
    KUSetupAlf: TFloatField;
    KUSetupXi: TFloatField;
    KUSetupOm: TFloatField;
    ComPort: TQuery;
    ComPortComPort: TIntegerField;
    ComPortBaudRate: TIntegerField;
    ComPortByteSize: TIntegerField;
    ComPortEnableDTR: TBooleanField;
    ComPortEnableRTS: TBooleanField;
    ComPortParity: TIntegerField;
    ComPortStopBits: TIntegerField;
    ComPortTimeOut: TIntegerField;
    ComDev: TQuery;
    ComDevDevice_ID: TIntegerField;
    ComDevComPort: TIntegerField;
    ComDevAdress: TIntegerField;
    ComDevDeviceName: TStringField;
    Command_2220: TQuery;
    Command_2220Command_ID: TIntegerField;
    Command_2220Command: TIntegerField;
    Command_7401: TQuery;
    Command_7401Command_ID: TIntegerField;
    Command_7401Command: TIntegerField;
    Command_7401Command_Count: TIntegerField;
    Command_7401Answer_Count: TIntegerField;
    Comm2220: TXComm;
    Comm2404: TXComm;
    Command_2220Comment_Eng: TStringField;
    Command_7401Comment_Eng: TStringField;
    XPManifest1: TXPManifest;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    VideoPanel: TPanel;
    TabSheet4: TTabSheet;
    Video: TPanel;
    RichEdit1: TRichEdit;
    Tuning: TPanel;
    Label27: TLabel;
    Panel1: TPanel;
    QEditLAK: TQuery;
    QDeleteLAK: TQuery;
    QnewLAK: TQuery;
    Inclination: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Rolling: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label26: TLabel;
    SelectTVD: TPanel;
    Label36: TLabel;
    RadioButton6: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton3: TRadioButton;
    TVDmode: TPanel;
    tvMode1: TSpeedButton;
    tvMode2: TSpeedButton;
    tvMode3: TSpeedButton;
    Shape14: TShape;
    Shape15: TShape;
    Shape1: TShape;
    Label265: TLabel;
    PointCoor: TPanel;
    xLAK: TLabel;
    yLAK: TLabel;
    Image2: TImage;
    Label13: TLabel;
    Panel3: TPanel;
    Panel10: TPanel;
    closeEditLAK: TSpeedButton;
    openEditLAK: TSpeedButton;
    editLAK: TSpeedButton;
    deleteLAK: TSpeedButton;
    Label14: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label29: TLabel;
    Lak_LX: TEdit;
    Lak_SX: TEdit;
    Lak_EY: TEdit;
    Lak_LY: TEdit;
    Lak_SY: TEdit;
    Lak_EZ: TEdit;
    Lak_LZ: TEdit;
    Lak_SZ: TEdit;
    Lak_EX: TEdit;
    LAK_available: TComboBox;
    Panel14: TPanel;
    newLAK: TSpeedButton;
    Label30: TLabel;
    newLAKname: TEdit;
    Panel4: TPanel;
    TVD_Parameters: TPanel;
    kuFocus: TEdit;
    kuRx: TEdit;
    kuRy: TEdit;
    kuKx: TEdit;
    kuKy: TEdit;
    Label37: TLabel;
    Label1: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    SpeedButton18: TSpeedButton;
    editTVD: TPanel;
    RP_placement: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label16: TLabel;
    LEDD: TEdit;
    LEDL: TEdit;
    LEDH: TEdit;
    RP_coordinates: TPanel;
    SpeedButton13: TSpeedButton;
    Label15: TLabel;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    Label2: TLabel;
    Label42: TLabel;
    RPX1: TEdit;
    RPX2: TEdit;
    RPX3: TEdit;
    RPX4: TEdit;
    RPY1: TEdit;
    RPY2: TEdit;
    RPY3: TEdit;
    RPY4: TEdit;
    newTVDparameters: TPanel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    newFocus: TEdit;
    newRx: TEdit;
    newRy: TEdit;
    newKx: TEdit;
    newKy: TEdit;
    OpenDialog1: TOpenDialog;
    SampleGrabber: TSampleGrabber;
    SpeedButton21: TSpeedButton;
    SpeedButton20: TSpeedButton;
    EditKU: TQuery;
    Panel2: TPanel;
    Panel5: TPanel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    aRPX1: TEdit;
    aRPX2: TEdit;
    aRPX3: TEdit;
    Panel6: TPanel;
    Label50: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    aRPY1: TEdit;
    aRPZ1: TEdit;
    aRPY2: TEdit;
    aRPZ2: TEdit;
    aRPY3: TEdit;
    aRPZ3: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    bRPX3: TEdit;
    bRPX2: TEdit;
    bRPX1: TEdit;
    Label58: TLabel;
    Label61: TLabel;
    bRPY1: TEdit;
    bRPY2: TEdit;
    bRPY3: TEdit;
    Label62: TLabel;
    Label63: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label70: TLabel;
    ComboBox1: TComboBox;
    Panel9: TPanel;
    Label64: TLabel;
    vRP2: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    vRP2x: TEdit;
    vRP1x: TEdit;
    vRP1y: TEdit;
    vRP2y: TEdit;
    vRP1: TLabel;
    Panel11: TPanel;
    Label65: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label73: TLabel;
    rRPx: TEdit;
    mRPx: TEdit;
    eRPx: TEdit;
    rRPy: TEdit;
    mRPy: TEdit;
    eRPy: TEdit;
    Label74: TLabel;
    rRPz: TEdit;
    mRPz: TEdit;
    eRPz: TEdit;
    SpeedButton11: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure Lak_EXEnter(Sender: TObject);
    procedure vRP1xChange(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure LEDHChange(Sender: TObject);
    procedure LEDLChange(Sender: TObject);
    procedure LEDDChange(Sender: TObject);
    procedure VideoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VideoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure kuFocusExit(Sender: TObject);
    procedure kuFocusEnter(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure tvMode1Click(Sender: TObject);
    procedure deleteLAKClick(Sender: TObject);
    procedure editLAKClick(Sender: TObject);
    procedure Lak_EXKeyPress(Sender: TObject; var Key: Char);
    procedure openEditLAKClick(Sender: TObject);
    procedure closeEditLAKClick(Sender: TObject);
    procedure LAK_availableChange(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure RadioButton6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure newLAKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure SetFromChannel(KU,ARM:DWord);
    function Command2220(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer):boolean;
    procedure Command7401(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
    procedure ChangePort;
    procedure LoadLAK(name: string);
    procedure LoadTVMode(Numb:integer);
    procedure SerUpdate(var Msg:TMessage);message WM_NOTIFY_UPDATE;
    procedure CalibUpdate(var Msg:tMessage); message WM_CALIB_READY;
    procedure CalibrationLoad;
    procedure CalibrationNew;
    procedure LoadKUParam;
    procedure CalcAdjustement;
    procedure NewVerification;
    procedure ChangeVerification;
    procedure editTVDShow(start: boolean);
  private
    id2,id3,id4,id5,id6,id7,idDown,idUp,idLeft,idRight,idEsc:integer;
    procedure vStartCapture;
    procedure Algorithm002;
    function DeviceOutError():boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
var
       CapEnum:        TSysDevEnum         =nil;
       CaptureFilter:  IbaseFilter         =nil;
       AudioFilter:    IbaseFilter         =nil;
       VideoFilter:    IBaseFilter         =nil;
       ISampleGrabb:   ISampleGrabber      =nil;
       GraphBuilder:   IGraphBuilder;
       SoundRender:    IBaseFilter         =nil;
       SourceFile:     IBaseFilter         =nil;
       VideoDecoder:   IBaseFilter         =nil;
       VideoWindow:    IBaseFilter         =nil;
       CSC:            IBaseFilter         =nil;
       MediaType:_AMMediaType;
       RefClock:IReferenceClock;
       CaptureGraphBuilder2: ICaptureGraphBuilder2;
       RPEdit: array [1..2] of TEdit;
       pvi:PvideoInfoHeader;
       BWidth, BHeight,MBitCount:integer;
       FastIn:TFastDib;
       FastOut32,FastOut48,FastOut64,FastOut24,FastOut16:TFastDib;
       Calib: array [7..10] of TCalibration;
       CalibNumber: integer=0;
       Verification: array [7..10] of TPoint;
  procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
  procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
  procedure BaseCalc(N1,N2:byte);

const       CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
const       CLSID_VideoDecoder:TGUID = '{04FE9017-F873-410E-871E-AB91661A4EF7}';
const       CLSID_VR:TGUID= '{B87BEB7B-8D29-423F-AE4D-6582C10175AC}';//{70E102B0-5556-11CE-97C0-00AA0055595A}';
const       CLSID_ColorSpaceConverter:TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';

implementation

{$R *.dfm}

procedure TForm1.SerUpdate(var Msg: TMessage);
begin
  Image2.Canvas.Lock;
  case Msg.WParam of
  16:  FastOut16.Stretch(Image2.Canvas.Handle,0,0,Image2.Width,Image2.Height);
  24:  FastOut24.Stretch(Image2.Canvas.Handle,0,0,Image2.Width,Image2.Height);
  32:  FastOut32.Stretch(Image2.Canvas.Handle,0,0,Image2.Width,Image2.Height);
  48:  FastOut48.Stretch(Image2.Canvas.Handle,0,0,Image2.Width,Image2.Height);
  64:  FastOut64.Stretch(Image2.Canvas.Handle,0,0,Image2.Width,Image2.Height);
  end;
  Image2.Canvas.Unlock;
  Image2.Refresh;
end;

//??????????? ????? ????
procedure BaseCalc(N1,N2:byte);
begin
  if (koor[N2].Y-koor[N1].Y)<>0 then
  Alfa_Base:=(arctan((koor[N2].X-koor[N1].X)/(koor[N2].Y-koor[N1].Y))/rad)+Azl
  else Alfa_Base:=90*rad+Azl;
  base:=SQRT(SQR(koor[N1].X-koor[N2].X)+SQR(koor[N1].Y-koor[N2].Y));
end;

procedure TForm1.ChangePort;
var s,s1,s2:string;
begin
  s:=Comm2404.DeviceName;
  s1:='COM'+IntToStr(ComList[ComDevi[23].cCom_ID].cCom);
  s2:='COM'+IntToStr(ComList[ComDevi[24].cCom_ID].cCom);
  if s=s1 then s:=s2 else s:=s1;
  if Comm2404.Opened then Comm2404.CloseDevice;
  Comm2404.DeviceName:=s;
  if Comm2404.Opened=false then
  begin
    try Comm2404.OpenDevice
    except
      begin
        RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Not possible open COM-port '+Comm2404.DeviceName);
        exit;
      end;
    end;
    RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+Comm2404.DeviceName +  ' successfully open');
  end;
  Comm2404.Tag:=0;
end;

procedure TForm1.WMHotkey(var msg: TWMHotkey);
var i,k : Word;
    Lst : TStringList;
    vv:TPoint;
begin
  if Msg.HotKey=idEsc then
  begin
    AutoSopr:=0;
    if DeviceOutError then exit;
    CalibrationNew;
    NewVerification;
    exit;
  end;
  if Msg.HotKey=idUp then
  begin
    vv:=Mouse.CursorPos;
    Dec(vv.Y,1);
    Mouse.CursorPos:=vv;
  end;
  if Msg.HotKey=idDown then
  begin
    vv:=Mouse.CursorPos;
    Inc(vv.Y,1);
    Mouse.CursorPos:=vv;
  end;
  if Msg.HotKey=idLeft then
  begin
    vv:=Mouse.CursorPos;
    Dec(vv.X,1);
    Mouse.CursorPos:=vv;
  end;
  if Msg.HotKey=idRight then
  begin
    vv:=Mouse.CursorPos;
    Inc(vv.X,1);
    Mouse.CursorPos:=vv;
  end;
  if Msg.HotKey=id2 then
  begin
    if SpeedButton8.Enabled then SpeedButton8.Click;
  end;
  if Msg.HotKey=id3 then
  begin
    if SpeedButton9.Enabled then SpeedButton9.Click;
  end;
  if Msg.HotKey=id4 then
  begin
    if SpeedButton10.Enabled then SpeedButton10.Click;
  end;
  if Msg.HotKey=id5 then
  begin
    if SpeedButton1.Enabled then SpeedButton1.Click;
  end;
  if Msg.HotKey=id6 then
  begin
    if SpeedButton2.Enabled then SpeedButton2.Click;
  end;
  if Msg.HotKey=id7 then
  begin
    if SpeedButton7.Enabled then SpeedButton7.Click;
  end;
end;

procedure TForm1.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var
  a,b,c,d,e,f,g,h,m,n:Integer;
  pc: TFColor;
  RGBGrey:byte;
begin
  if AutoSopr=0 then  exit;
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  if viy>BHeight-div_2-1  then viy:=BHeight-div_2;
  if vix>BWidth-div_2-1   then vix:=BWidth-div_2;
  if viy<=div_2+1  then viy:=div_2+1;
  if vix<=div_2+1  then vix:=div_2+1;
  FillChar(ArrClByte,SizeOf(ArrClByte),0);
  d:=0;
  for n:=(viy-div_2 ) to (viy+div_2-1) do
  begin
    c:=0;
    for m := (vix-div_2) to (vix+div_2 -1) do
    begin
       pc:=FastIn.GetPixel(BHeight-n,m);
       RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
       ArrClByte[c,d] := RGBGrey;
       if (n=viy) or (m=vix) then  pc:=tfLime;
       case sizebm of
        16:  FastOut16.SetPixel(15-d,c,pc);
        24:  FastOut24.SetPixel(23-d,c,pc);
        32:  FastOut32.SetPixel(31-d,c,pc);
        48:  FastOut48.SetPixel(47-d,c,pc);
        64:  FastOut64.SetPixel(63-d,c,pc);
        end;
       inc(c);
    end;
    inc(d);
  end;
  PostMessage(Form1.Handle,WM_NOTIFY_UPDATE,sizebm,sizebm);
  if AutoSopr=1 then
  begin
    if ViX<=BWidth-div_2-1   then a:=ViX+div_2   else  a:=BWidth-1;
    if ViX<=BWidth-div_5-1   then b:=ViX+div_5   else  b:=BWidth-1;
    if ViY<=BHeight-div_2-1  then c:=ViY+div_2   else  c:=BHeight-1;
    if ViY<=BHeight-div_5-1  then d:=ViY+div_5   else  d:=BHeight-1;

    if ViX>=div_2   then e:=ViX-div_2   else  e:=0;
    if ViX>=div_5   then f:=ViX-div_5   else  f:=0;
    if ViY>=div_2   then g:=ViY-div_2   else  g:=0;
    if ViY>=div_5   then h:=ViY-div_5   else  h:=0;
    if g<0 then g:=0;
    if h<0 then h:=0;
    if e<0 then e:=0;
    if f<0 then f:=0;

    Line(FastIn,e,g,e,h,tfLime);
    Line(FastIn,e,g,f,g,tfLime);
    Line(FastIn,a,g,a,h,tfLime);
    Line(FastIn,a,g,b,g,tfLime);
    Line(FastIn,a,d,a,c,tfLime);
    Line(FastIn,a,c,b,c,tfLime);
    Line(FastIn,e,c,e,d,tfLime);
    Line(FastIn,e,c,f,c,tfLime);
  end;
  if AutoSopr=2 then
  begin
    if ViY>=div_2   then  a:=ViY-div_2   else   a:=0;
    if ViX>=div_2   then  b:=ViX-div_2   else   b:=0;
    if ViY>=div_5   then  c:=ViY-div_5   else   c:=0;
    if ViX>=div_5   then  d:=ViX-div_5   else   d:=0;

    if ViY<=BHeight-div_5-1  then  e:=ViY+div_5  else   e:=BHeight-1;
    if ViY<=BHeight-div_2-1  then  f:=ViY+div_2  else   f:=BHeight-1;
    if ViX<=BWidth-div_5-1   then  g:=ViX+div_5  else   g:=BWidth-1;
    if ViX<=BWidth-div_2-1   then  h:=ViX+div_2  else   h:=BWidth-1;

    Line(FastIn, ViX, a,   ViX, c,   tfLime);
    Line(FastIn, ViX, e,   ViX, f,   tfLime);
    Line(FastIn, b,   Viy, d,   ViY, tfLime);
    Line(FastIn, g,   Viy, h,   ViY, tfLime);
  end;
  if AutoSopr=1 then
  begin
    Algorithm002;
    xLAK.Caption:='  X= '+IntToStr(viX );
    yLAK.Caption:='  Y= '+IntToStr(viY);
  end;
end;

procedure TForm1.Algorithm002;
var i,j,l,x,y,mx,my,sx,sy,Rx,Ry,uWhite,kx,mbl : integer;
    dx,ddx,x1,x2,x3,x4,x5,xc1,xc2,xc3,xc4,xc5:Integer;
    dy,ddy,y1,y2,y3,y4,y5,yc1,yc2,yc3,yc4,yc5:Integer;
    sDelta,mDelta,mBlack,mWhite,ybl : Single;
begin //????
  x:=0; y:=0; sDelta:=0; mDelta:=0;
  mx:=sizebm-Rbl-2;
  my:=sizebm-Rbl-2;
  //?????? ?????????? ? ?????????????
  sx:=Rbl+2;// mx:=47;
  sy:=Rbl+2;// my:=47;
  mBlack:=0;
  mWhite:=0;
  for i:=sx to mx do
    begin
      for j:=sy to my do
        begin
          for l:=0 to kwh-1 do mWhite:=mWhite+ArrClByte[i+msWhX[l],j+msWhY[l]];
          mWhite:=mWhite/kwh;
          for l:=0 to kbl-1 do mBlack:=mBlack+ArrClByte[i+msBlX[l],j+msBlY[l]];
          mBlack:=mBlack/kbl;
          mDelta:=mWhite-mBlack;
          mBlack:=0;
          mWhite:=0;

          if mDelta > sDelta then
            begin
              x:=i;
              y:=j;
              sDelta := mDelta;
            end;
        end;
    end;
  if sDelta > 23 then     //??????? ???? = 21
    begin
      aDX := div_2 - x;
      aDY := div_2 - y;
    end
    else
    begin
      aDX := 0; aDY := 0;
    end;
  viX:=viX - aDX;
  viY:=viY - aDY;
end;

procedure TForm1.LoadLAK(name: string);
var
  number: integer;
begin
  QLASetup.Close;
  QLASetup.Open;
  LAK_available.Items.Clear;
  number:=0;
  while not QLASetup.Eof do
  begin
    LAK_available.Items.Add(QLaSetupmName.Value);
    if (QLaSetupmName.Value=name) then number:=LAK_available.Items.Count-1;
    QLASetup.Next;
  end;
  LAK_available.ItemIndex:=number;
  LAK_availableChange(self);
end;

procedure TForm1.LoadKUParam;
var c: integer;
begin
  KUSetup.Close;
  KUSetup.Open;
  While not KUSetup.Eof do
  begin
    c:=KUSetupDevice_ID.Value;
    if c in [7..10] then
    begin
      koor[c].X    :=KUSetupX.Value;
      koor[c].Y    :=KUSetupY.Value;
      koor[c].Z    :=KUSetupZ.Value;
      koor[c].Az   :=KUSetupAz.Value;
      koor[c].Um   :=KUSetupUm.Value;
      koor[c].UsY  :=KUSetupUsY.Value;
      koor[c].AhxY :=KUSetupAhxY.Value;
      koor[c].UsC  :=KUSetupUsC.Value;
      koor[c].AhxC :=KUSetupAhxC.Value;
      koor[c].Focus:=KUSetupFocus.Value;
      koor[c].Rx   :=KUSetupRx.Value;
      koor[c].Ry   :=KUSetupRy.Value;
      koor[c].Kx   :=KUSetupKx.Value;
      koor[c].Ky   :=KUSetupKy.Value;
      if koor[c].Kx<>0 then koor[c].RxKx:=koor[c].Rx/koor[c].Kx
         else koor[c].RxKx:=0;
      if koor[c].Ky<>0 then koor[c].RyKy:=koor[c].Ry/koor[c].Ky
         else koor[c].RyKy:=0;
      koor[c].X0   :=KUSetupX0.Value;
      koor[c].Y0   :=KUSetupY0.Value;
      koor[c].Alf  :=KUSetupAlf.Value*rad;
      koor[c].Alf_degree:=KUSetupAlf.Value;
      koor[c].Xi   :=KUSetupXi.Value*rad;
      koor[c].Om   :=KUSetupOm.Value*rad;
    end;
    KUSetup.Next;
    end;
  KUSetup.Close;
  if DeviceOutError then exit;
  kuFocus.Text:=FloatToStrF(koor[Device_OUT].Focus,ffFixed,INT,FRACT);
  kuRx.Text:=FloatToStrF(koor[Device_OUT].Rx,ffFixed,INT,FRACT);
  kuRy.Text:=FloatToStrF(koor[Device_OUT].Ry,ffFixed,INT,FRACT);
  kuKx.Text:=FloatToStrF(koor[Device_OUT].Kx,ffFixed,INT,FRACT);
  kuKy.Text:=FloatToStrF(koor[Device_OUT].Ky,ffFixed,INT,FRACT);
  CalcAdjustement;
end;

procedure TForm1.FormActivate(Sender: TObject);
var i:integer;
    A1,B1,C1:double;  // ????????? ????? ??????? ???? A1*x+B1*y+C1=0
    A2,B2,C2:double;  //????????? ????? ????
    cv,c:integer;
begin
  idEsc := GlobalAddAtom('HkEsc');
  RegisterHotKey(Handle,idEsc ,0,VK_ESCAPE);
  MTK.Connected:=true;
  QLASetup.Active:=True;
  LoadLAK('');

  //rtp - checking point?
  i:=0;
  rp[i].X:=0.; rp[i].Y:=0.; rp[i].Z:=0;  Inc(i);
  KUSetup.Close;
  KUSetup.Open;
  While not KUSetup.Eof do
  begin
    c:=KUSetupDevice_ID.Value;
    if c in [48..50] then
    begin
      RP[i].X    :=KUSetupX.Value;
      RP[i].Y    :=KUSetupY.Value;
      RP[i].Z    :=KUSetupZ.Value;
      INc(i);
    end;
    KUSetup.Next;
    end;
  KUSetup.Close;

  LoadKUParam;

  for i:=1 to 3 do
    if Form1.FindComponent('aRPX'+IntToStr(i))<>nil then
      (Form1.FindComponent('aRPX'+IntToStr(i)) as TEdit).Text:=FloatToStrF(RP[i].X,ffFixed,INT,FRACT);

 for i:=1 to 3 do
    if Form1.FindComponent('aRPY'+IntToStr(i))<>nil then
      (Form1.FindComponent('aRPY'+IntToStr(i)) as TEdit).Text:=FloatToStrF(RP[i].Y,ffFixed,INT,FRACT);

 for i:=1 to 3 do
    if Form1.FindComponent('aRPZ'+IntToStr(i))<>nil then
      (Form1.FindComponent('aRPZ'+IntToStr(i)) as TEdit).Text:=FloatToStrF(RP[i].Z,ffFixed,INT,FRACT);


 rRPx.Text:=FloatToStrF(RP[1].X,ffFixed,INT,FRACT);
 rRPy.Text:=FloatToStrF(RP[1].Y,ffFixed,INT,FRACT);
 rRPz.Text:=FloatToStrF(RP[1].Z,ffFixed,INT,FRACT);

  //??????? ???????????? ?????????  ??? ???? ?????
  for i in [7..10] do
  begin
    Matrix[i,1,1]:= cos(koor[i].Alf)*cos(koor[i].Xi);
    Matrix[i,1,2]:=-cos(koor[i].Alf)*sin(koor[i].Xi);
    Matrix[i,1,3]:= sin(koor[i].Alf);
    Matrix[i,2,1]:= sin(koor[i].Om)*sin(koor[i].Alf)*cos(koor[i].Xi)+cos(koor[i].Om)*sin(koor[i].Xi);
    Matrix[i,2,2]:=-sin(koor[i].Om)*sin(koor[i].Alf)*sin(koor[i].Xi)+cos(koor[i].Om)*cos(koor[i].Xi);
    Matrix[i,2,3]:=-sin(koor[i].Om)*cos(koor[i].Alf);
    Matrix[i,3,1]:=-cos(koor[i].Om)*sin(koor[i].Alf)*cos(koor[i].Xi)+sin(koor[i].Om)*sin(koor[i].Xi);
    Matrix[i,3,2]:= cos(koor[i].Om)*sin(koor[i].Alf)*sin(koor[i].Xi)+sin(koor[i].Om)*cos(koor[i].Xi);
    Matrix[i,3,3]:= cos(koor[i].Om)*cos(koor[i].Alf);
  end;

  id2 := GlobalAddAtom('Hk2'); RegisterHotKey(Handle,id2 ,0,vk_F2);
  id3 := GlobalAddAtom('Hk3'); RegisterHotKey(Handle,id3 ,0,vk_F3);
  id4 := GlobalAddAtom('Hk4'); RegisterHotKey(Handle,id4 ,0,vk_F4);
  id5 := GlobalAddAtom('Hk5'); RegisterHotKey(Handle,id5 ,0,vk_F5);
  id6 := GlobalAddAtom('Hk6'); RegisterHotKey(Handle,id6 ,0,vk_F6);
  id7 := GlobalAddAtom('Hk7'); RegisterHotKey(Handle,id7 ,0,vk_F7);
  idUp  :=GlobalAddAtom('HK8'); RegisterHotKey(Handle,idUp,0,vk_Up);
  idDown:=GlobalAddAtom('HK9'); RegisterHotKey(Handle,idDown,0,vk_Down);
  idLeft:=GlobalAddAtom('HK10'); RegisterHotKey(Handle,idLeft,0,vk_Left);
  idRight:=GlobalAddAtom('HK11'); RegisterHotKey(Handle,idRight,0,vk_Right);

  ComPort.Open;
  While not ComPort.Eof do
  begin
    c:=ComPortComPort.Value;
    ComList[c].cCom:=ComPortComPort.Value;
    cv:=ComPortBaudRate.Value;
    case cv of
      110:    ComList[c].cBaudRate:=br110;
      300:    ComList[c].cBaudRate:=br300;
      600:    ComList[c].cBaudRate:=br600;
      1200:   ComList[c].cBaudRate:=br1200;
      2400:   ComList[c].cBaudRate:=br2400;
      4800:   ComList[c].cBaudRate:=br4800;
      9600:   ComList[c].cBaudRate:=br9600;
      14400:  ComList[c].cBaudRate:=br14400;
      19200:  ComList[c].cBaudRate:=br19200;
      38400:  ComList[c].cBaudRate:=br38400;
      56000:  ComList[c].cBaudRate:=br56000;
      57600:  ComList[c].cBaudRate:=br57600;
      115200: ComList[c].cBaudRate:=br115200;
    end;
    ComList[c].cBaudValue:=cv;
    cv:=ComPortByteSize.Value;
    case cv of
      5: ComList[c].cByteSize:=db5;
      6: ComList[c].cByteSize:=db6;
      7: ComList[c].cByteSize:=db7;
      8: ComList[c].cByteSize:=db8;
    end;
    ComList[c].cEnableDTR:=ComPortEnableDTR.Value;
    ComList[c].cEnableRTS:=ComPortEnableRTS.Value;
    cv:=ComPortParity.Value;
    case cv of
       0: ComList[c].cParity:=paNONE;
       1: ComList[c].cParity:=paODD;
       2: ComList[c].cParity:=paEVEN;
       3: ComList[c].cParity:=paMARK;
       4: ComList[c].cParity:=paSPACE;
    end;
    cv:=ComPortStopBits.Value;
    case cv of
       1: ComList[c].cStopBits:=sb1;
      15: ComList[c].cStopBits:=sb1p5;
       2: ComList[c].cStopBits:=sb2;
    end;
    ComList[c].cTimeOut:=ComPortTimeOut.Value;
    ComPort.Next;
    if c>ComCount then break;
  end;
  ComDev.Open;
  while not ComDev.Eof do
  begin
    c:=ComDevDevice_ID.Value;
    ComDevi[c].cDEV_ID:=c;
    ComDevi[c].cCom_ID:=ComDevComPort.Value;
    ComDevi[c].cAdress:=ComDevAdress.Value;
    ComDevi[c].cDev_Name:=ComDevDeviceName.Value;
    ComDev.Next;
  end;
  ComDev.Close;
 //???????? ????????? Comm2220, ????? ???????? ?????? DeviceName
  with Comm2220 do
  begin
    //????? COM ????? ??? ????????? ??????
    c:=(ComDevi[9].cCom_ID);
    BaudRate:=ComList[c].cBaudRate;
    BaudValue:=ComList[c].cBaudValue;
    Buffers.InputSize:=128;
    Buffers.OutputSize:=128;
    Buffers.InputTimeout:=ComList[c].cTimeOut;
    Buffers.OutputTimeout:=0;
    DataControl.DataBits:=ComList[c].cByteSize;
    DataControl.Parity:=ComList[c].cParity;
    DataControl.StopBits:=ComList[c].cStopBits;
    DeviceName:='COM'+IntToStr(ComList[c].cCom);
    TimeOuts.ReadInterval:=1;
    TimeOuts.ReadMultiplier:=1;
    TimeOuts.ReadConstant:=1;
    TimeOuts.WriteMultiplier:=1;
    TimeOuts.WriteConstant:=1;
  end;
  //?????????? ??? 2404
  with Comm2404 do
  begin
    //????? COM ????? ??? ????????? ??????
    c:=(ComDevi[23].cCom_ID);
    BaudRate:=ComList[c].cBaudRate;
    BaudValue:=ComList[c].cBaudValue;
    Buffers.InputSize:=128;
    Buffers.OutputSize:=128;
    Buffers.InputTimeout:=ComList[c].cTimeOut;
    Buffers.OutputTimeout:=0;
    DataControl.DataBits:=ComList[c].cByteSize;
    DataControl.Parity:=ComList[c].cParity;
    DataControl.StopBits:=ComList[c].cStopBits;
    DeviceName:='COM'+IntToStr(ComList[c].cCom);
    TimeOuts.ReadInterval:=1;
    TimeOuts.ReadMultiplier:=0;
    TimeOuts.ReadConstant:=1;
    TimeOuts.WriteMultiplier:=0;
    TimeOuts.WriteConstant:=1;
  end;
  //?????? ??????
  Command_2220.Open;
  while not Command_2220.Eof do
  begin
    c:=Command_2220Command_ID.Value;
    if not(c in [1..33]) then exit;
    Command_TM2220[c].cCOM_ID  :=Command_2220Command_ID.Value;
    Command_TM2220[c].cCommand :=Command_2220Command.Value;
    Command_TM2220[c].cComment :=Command_2220Comment_Eng.Value;
    Command_2220.Next;
  end;
  Command_2220.Close;
  Command_7401.Open;
  while not Command_7401.Eof do
  begin
    c:=Command_7401Command_ID.Value;
    if not(c in [1..10]) then break;
    Command_EM7401[c].cCOM_ID  :=Command_7401Command_ID.Value;
    Command_EM7401[c].cCommand :=Command_7401Command.Value;
    Command_EM7401[c].cComment :=Command_7401Comment_Eng.Value;
    Command_EM7401[c].cComandCount:=Command_7401Command_Count.Value;
    Command_EM7401[c].cAnswerCount:=Command_7401Answer_Count.Value;
    Command_7401.Next;
  end;
  Command_7401.Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UnRegisterHotkey( Handle, idEsc );
  UnRegisterHotKey(Handle, id2);
  UnRegisterHotKey(Handle, id3);
  UnRegisterHotKey(Handle, id4);
  UnRegisterHotKey(Handle, id5);
  UnRegisterHotKey(Handle, id6);
  UnRegisterHotKey(Handle, id7);
  UnRegisterHotKey(Handle, idUp);
  UnRegisterHotKey(Handle, idDown);
  UnRegisterHotKey(Handle, idLeft);
  UnRegisterHotKey(Handle, idRight);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  MTK.Connected:=false;
  if Comm2220.Opened then Comm2220.CloseDevice;
  if Comm2404.Opened then Comm2404.CloseDevice;
  if Assigned(FilterGraph1) then
  begin
    FilterGraph1.Active:=False;
    FilterGraph1.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,j:Word;
  buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  CompName:String;
  Size: Cardinal;
  BRes : boolean;
begin
  //olikkeGo
  timer1.Enabled:=false;
    SpeedButton7.Enabled:=true;
   SpeedButton8.Enabled:=true;
   SpeedButton9.Enabled:=true;
   SpeedButton10.Enabled:=true;
   SpeedButton1.Enabled:=true;
   SpeedButton2.Enabled:=true;
   tvMode1.Enabled:=true;
   tvMode2.Enabled:=true;
   tvMode3.Enabled:=true;   
  //olikkeEnd
  PageControl1.ActivePageIndex:=0;
  RPEdit[1]:=nil;
  RPEdit[2]:=nil;
  for i:=7 to 10 do
    Calib[i]:=TCalibration.Create(Form1.Handle,WM_CALIB_READY,i);
  Image2.Canvas.Brush.Color:=clBlack;
  Image2.Canvas.FillRect(Image2.ClientRect);
  HOST_TP:=0;
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  BRes := GetComputerName(@buffer, Size);
  CompName := trim(uppercase(StrPas(buffer)));
  if (UpperCase(CompName)='OLIKKE') or( UpperCase(CompName)='WSP') then HOST_TP:=1;
  if UpperCase(CompName)='WSL' then HOST_TP:=2;
  if UpperCase(CompName)='WSR' then HOST_TP:=3;
  viX:=0;
  viY:=0;
  Device_OUT := 0;
  Rwh := 1;
  Rbl := 5;
  //?????????? ??????? ??? ?????????????
  FillChar(msWhX,SizeOf(msWhX),0);
  FillChar(msWhY,SizeOf(msWhX),0);
  FillChar(msBlX,SizeOf(msBlX),0);
  FillChar(msBlY,SizeOf(msBlY),0);
  kbl:=0;
  for I := 0 to 2*Rbl do
    for j := 0 to 2*Rbl do
      if
      ((SQRT(SQR(i-Rbl)+SQR(j-Rbl))>Rbl)AND(SQRT(SQR(i-Rbl)+SQR(j-Rbl))<Rbl+1))OR
         ((i=Rbl)AND(j=0))OR((i=Rbl)AND(j=2*Rbl))OR
         ((j=Rbl)AND(i=0))OR((j=Rbl)AND(i=2*Rbl))
         then
        begin
          msBlX[kbl]:=i-Rbl;
          msBlY[kbl]:=j-Rbl;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh do
    for j := 0 to 2*Rwh do
      if SQRT(SQR(i-Rwh)+SQR(j-Rwh))<1.25*Rwh then
        begin
          msWhX[kwh]:=i-Rwh;
          msWhY[kwh]:=j-Rwh;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;

  FastIn:=TFastDib.Create;
  FastOut16:=TFastDib.Create;
  FastOut16.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\16_16.bmp');
  FastOut24:=TFastDib.Create;
  FastOut24.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\24_24.bmp');
  FastOut32:=TFastDib.Create;
  FastOut32.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\32_32.bmp');
  FastOut48:=TFastDib.Create;
  FastOut48.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\48_48.bmp');
  FastOut64:=TFastDib.Create;
  FastOut64.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\64_64.bmp');

end;

procedure TForm1.kuFocusEnter(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=false;
end;

procedure TForm1.kuFocusExit(Sender: TObject);
begin
  (Sender as TEdit).Enabled:=true;
end;

procedure TForm1.CalibrationLoad;
  var i:integer;
begin
  LEDD.Text:=FloatToStrF(Calib[Device_OUT].D,ffFixed,INT,FRACT);
  LEDL.Text:=FloatToStrF(Calib[Device_OUT].L,ffFixed,INT,FRACT);
  LEDH.Text:=FloatToStrF(Calib[Device_OUT].H,ffFixed,INT,FRACT);
  for i:= 1 to 4 do
      if Form1.FindComponent('RPX'+IntToStr(i))<>nil then
        (Form1.FindComponent('RPX'+IntToStr(i)) as TEdit).Text:=Calib[Device_OUT].getPRX(i);
  for i:= 1 to 4 do
      if Form1.FindComponent('RPY'+IntToStr(i))<>nil then
        (Form1.FindComponent('RPY'+IntToStr(i)) as TEdit).Text:=Calib[Device_OUT].getPRY(i);
  newFocus.Text:=Calib[Device_OUT].getFocus;
  newRx.Text:=Calib[Device_OUT].getRx;
  newRy.Text:=Calib[Device_OUT].getRy;
  newKx.Text:=Calib[Device_OUT].getKx;
  newKy.Text:=calib[device_OUT].getKy;
end;

procedure TForm1.CalibrationNew;
begin
    if (CalibNumber<1) or (CalibNumber>4) then exit;
    if Form1.FindComponent('RPX'+IntToStr(CalibNumber))<>nil then
        (Form1.FindComponent('RPX'+IntToStr(CalibNumber)) as TEdit).Text:=IntToStr(viX);
    if Form1.FindComponent('RPY'+IntToStr(CalibNumber))<>nil then
        (Form1.FindComponent('RPY'+IntToStr(CalibNumber)) as TEdit).Text:=IntToStr(viY);
    Calib[Device_OUT].setPRX(CalibNUmber,viX);
    Calib[Device_OUT].setPRY(CalibNUmber,viY);
end;

procedure TForm1.CalibUpdate(var Msg: tMessage);
begin
  if DeviceOutError then  exit;
  newFocus.Text:=Calib[Device_Out].getFocus;
  newRx.Text:=Calib[Device_Out].getRx;
  if Calib[Device_Out].focusOK then newFocus.Font.Color:=clBlack else newFocus.Font.Color:=clRed;
  if Calib[Device_Out].RxOK then newRx.Font.Color:=clBlack else newRx.Font.Color:=clRed;
  SpeedButton20.Enabled:=Calib[Device_Out].OK;
end;

procedure TForm1.RadioButton6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SpeedButton7.Enabled:=false;
  SpeedButton8.Enabled:=false;
  SpeedButton9.Enabled:=false;
  SpeedButton10.Enabled:=false;
  SpeedButton1.Enabled:=false;
  SpeedButton2.Enabled:=false;
  tvMode1.Enabled:=false;
  tvMode2.Enabled:=false;
  tvMode3.Enabled:=false;
  kuFocus.Text:='';
  kuRx.Text:='';
  kuRy.Text:='';
  kuKx.Text:='';
  kuKy.Text:='';
  Device_OUT := (Sender as TRadioButton).Tag;
  if DeviceOutError then exit;
  if editTVD.Visible then CalibrationLoad;
  kuFocus.Text:=FloatToStrF(koor[Device_OUT].Focus,ffFixed,INT,FRACT);
  kuRx.Text:=FloatToStrF(koor[Device_OUT].Rx,ffFixed,INT,FRACT);
  kuRy.Text:=FloatToStrF(koor[Device_OUT].Ry,ffFixed,INT,FRACT);
  kuKx.Text:=FloatToStrF(koor[Device_OUT].Kx,ffFixed,INT,FRACT);
  kuKy.Text:=FloatToStrF(koor[Device_OUT].Ky,ffFixed,INT,FRACT);
  SpeedButton18.Enabled:=true;
  CalcAdjustement;
  ChangeVerification;
  //olikke
  exit;

  //????????? ????????? ?????????
  if Comm2220.Opened then Comm2220.CloseDevice;
  Comm2220.DeviceName:='COM'+IntToStr(ComList[ComDevi[Device_OUT].cCom_ID].cCom);
  if Comm2220.Opened=false then
  begin
    try Comm2220.OpenDevice
    except
      begin
        RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Not possible open Com-port '+Comm2220.DeviceName);
        exit;
      end;
    end;
    RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+Comm2220.DeviceName +  ' successfully open');
  end;
  SetFromChannel(Device_OUT,HOST_TP);
  if not FilterGraph1.Active then vStartCapture;
end;

procedure TForm1.SetFromChannel(KU,ARM:DWord);
  var Command:TMass;
   c,in7401,Out7401:word;
begin
   //???????? ??????
   command[0]:=HI(ComDevi[KU].cAdress);
   command[1]:=LO(ComDevi[KU].cAdress);
   command[2]:=Command_TM2220[1].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,1);
   //????????? ??????? 7401
   //??????? ??????????
   case ARM of
   1: c:=30;
   2: c:=31;
   3: c:=30;
   end;
   //????? ???? ???????????
   case KU of
   7:  in7401:=2;
   8:  in7401:=0;
   9:  in7401:=1;
   10: in7401:=3;
   end;
   //????? ?????? ???????????
   case ARM of
   1:  out7401:=2;
   2:  out7401:=2;
   3:  out7401:=4;
   end;
   command[0]:=ComDevi[c].cAdress;
   command[1]:=Command_EM7401[8].cComandCount-2;
   command[2]:=Command_EM7401[8].cCommand;
   command[3]:=out7401 shl 4 + in7401;
   command[4]:=command[0]+command[1]+command[2]+command[3];
   Command7401(Command,5,5,8);
   command[0]:=ComDevi[c].cAdress;
   command[1]:=Command_EM7401[8].cComandCount-2;
   command[2]:=Command_EM7401[8].cCommand;
   command[3]:=(out7401+1) shl 4 + 7;
   command[4]:=command[0]+command[1]+command[2]+command[3];
   Command7401(Command,5,5,8);
   SpeedButton7.Enabled:=true;
   SpeedButton8.Enabled:=true;
   SpeedButton9.Enabled:=true;
   SpeedButton10.Enabled:=true;
   SpeedButton1.Enabled:=true;
   SpeedButton2.Enabled:=true;
   tvMode1.Enabled:=true;
   tvMode2.Enabled:=true;
   tvMode3.Enabled:=true;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var one,two: integer;
begin
  case ComboBox1.ItemIndex of
    0: begin one:=7; two:=9; end;
    1: begin one:=7; two:=8; end;
    2: begin one:=7; two:=10;end;
    3: begin one:=8; two:=9; end;
    4: begin one:=9; two:=10;end;
  end;
  vRP1.Tag:=one;
  vRP1.Caption:='  '+TVDName[one];
  vRP2.Tag:=two;
  vRP2.Caption:='  '+TVDName[two];
  if koor[one].Y>koor[two].Y then
  begin
    First:=one;
    Second:=two;
  end else
  begin
    First:=two;
    Second:=one;
  end;
  BaseCalc(First,Second);
  ChangeVerification;
end;

procedure TForm1.ChangeVerification;
begin
  vRP1x.Text:=FloatToStrF(Verification[vRP1.Tag].X,ffFixed,INT,FRACT);
  vRP1y.Text:=FloatToStrF(Verification[vRP1.Tag].Y,ffFixed,INT,FRACT);
  vRP2x.Text:=FloatToStrF(Verification[vRP2.Tag].X,ffFixed,INT,FRACT);
  vRP2y.Text:=FloatToStrF(Verification[vRP2.Tag].Y,ffFixed,INT,FRACT);
end;



procedure TForm1.LAK_availableChange(Sender: TObject);
begin
  LASetup.Close;
  LASetup.ParamByName('nnname').AsString:=LAK_available.Text;
  LASetup.Open;
  LAK_EX.Text:=FloatToStrF(XE.Value,ffFixed,INT,FRACT);
  Lak_EY.Text:=FloatToStrF(YE.Value,ffFixed,INT,FRACT);
  Lak_EZ.Text  :=FloatToStrF(ZE.Value,ffFixed,INT,FRACT);
  Lak_LX.Text:=FloatToStrF(XF.Value,ffFixed,INT,FRACT);
  Lak_LY.Text:=FloatToStrF(YF.Value,ffFixed,INT,FRACT);
  Lak_LZ.Text  :=FloatToStrF(ZF.Value,ffFixed,INT,FRACT);
  Lak_SX.Text:=FloatToStrF(XG.Value,ffFixed,INT,FRACT);
  Lak_SY.Text:=FloatToStrF(YG.Value,ffFixed,INT,FRACT);
  Lak_SZ.Text :=FloatToStrF(ZG.Value,ffFixed,INT,FRACT);
end;

procedure TForm1.Lak_EXEnter(Sender: TObject);
begin
  if not (Sender as TEdit).ReadOnly then
  (Sender as TEdit).Enabled:=false;  
end;

procedure TForm1.Lak_EXKeyPress(Sender: TObject; var Key: Char);
const Separator: set of Char=['/', '.', ',','.','>',',','<'];
var i:integer;
begin
  if (Sender as TEdit).ReadOnly then
  if (key in Separator) then
    if pos(DecimalSeparator,(Sender as TEdit).Text)<>0 then Key:=#0 else Key:=DecimalSeparator;
  (Sender as TEdit).ReadOnly:= not (Key in ['0'..'9',DecimalSeparator,#8,'-']);
end;

procedure TForm1.LEDDChange(Sender: TObject);
begin
  if DeviceOutError then  exit;
  Calib[Device_OUT].D:=StrToFloatDef(LEDD.Text,0);
end;

procedure TForm1.LEDHChange(Sender: TObject);
begin
  if DeviceOutError then  exit;
  Calib[Device_OUT].H:=StrToFloatDef(LEDH.Text,0);
end;

procedure TForm1.LEDLChange(Sender: TObject);
begin
  if DeviceOutError then  exit;
  Calib[Device_OUT].L:=StrToFloatDef(LEDL.Text,0);
end;

function TForm1.Command2220(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer): boolean;
var Res:Cardinal;
    LRC     :byte;
    i:integer;
    k,l:double;
    ReceiveCommand:TMass;
begin
  result:=false;
  if Comm2220.Opened=false then
  begin
    try Comm2220.OpenDevice
    except
      RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Not possible open Com-port '+Comm2220.DeviceName);
      exit;
    end;
    end;
 // Comm2220.PurgeIn;
  Comm2220.Tag:=Comm2220.Tag+1;
  Res:=Comm2220.SendData(Command,SendCount);
   if Res=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'. Error command: '+Command_TM2220[CommandNumber].cComment);
     exit;
   end;
   Res:=Comm2220.ReadData(ReceiveCommand,ReceiveCount);
   if Res=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'. No answer');
     exit;
   end else
   begin
    { //???????? ??????????? ?????
     LRC:=0;
     for i := 0 to ReceiveCount-2 do LRC:=LRC+ReceiveCommand[i];
     LRC:=$FF-LRC+1;
     if LRC<>ReceiveCommand[ReceiveCount-1] then
     begin
       RichEdit1.Lines.Add('Error '+Comm2220.DeviceName+'.Error of check sum');
       exit;
     end;   }
     if (ReceiveCommand[2]=Command[2]+80) then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'.Error code'+inttohex(ReceiveCommand[3],2));
       exit;
     end;
     if (ReceiveCommand[2]<>Command[2]) then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'.Unknown error type.');
       exit;
     end else
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Successfully: '+Command_TM2220[CommandNumber].cComment);
     end;
   end;
   Comm2220.Tag:=0;
   result:=true;
end;

procedure TForm1.Command7401(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
var Result:Cardinal;
    LRC     :byte;
    i:integer;
    ReceiveCommand:TMass;
begin
  if Comm2404.Opened=false then
  begin
    try Comm2404.OpenDevice
    except
      RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Not possible open Com-port '+Comm2404.DeviceName);
      ChangePort;
      if Comm2404.Opened=false then
      begin
        try Comm2404.OpenDevice
        except
          RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Not possible open Com-port '+Comm2404.DeviceName);
          exit;
    end;
  end;
    end;
  end;
//  Comm2404.PurgeIn;
//  Comm2404.PurgeOut;
  //???? ???-?? ????????? ??????? = 4 - ??????? ?? ?????? ????
  if Comm2404.Tag>=4 then ChangePort;
  Comm2404.Tag:=Comm2404.Tag+1;
  Result:=Comm2404.SendData(Command,SendCount);
   if Result=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'. Error command: '+Command_EM7401[CommandNumber].cComment);
     exit;
   end;
   Result:=Comm2404.ReadData(ReceiveCommand,ReceiveCount);
   if Result=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'. No answer.');
     exit;
   end else
   begin
     //???????? ??????????? ?????
     LRC:=0;
     for i := 0 to ReceiveCount-2 do LRC:=LRC+ReceiveCommand[i];
     if LRC<>ReceiveCommand[ReceiveCount-1] then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'.Error of checksum.');
       exit;
     end;
     //???????? ????? ???????? ????
     if (Result<>ReceiveCount) or (ReceiveCommand[1]+2<>Result) then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'.Unknown answer format.');
       exit;
     end;
     //???????? ??????????
     if (Command[0]<>ReceiveCommand[0]) or (Command[1]<>ReceiveCommand[1]) or (Command[2]<>ReceiveCommand[2]) then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'.Unknown command.');
       exit;
     end;
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Successfully: '+Command_EM7401[CommandNumber].cComment);
     Comm2404.Tag:=0;
   end;
end;

procedure TForm1.SpeedButton10Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[10].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,10);
end;

procedure TForm1.SpeedButton17Click(Sender: TObject);
var i: integer;
  edit: TEdit;
begin
  CalibNumber:=(Sender as TSpeedButton).Tag;
  for i:=1 to 4 do
  begin
    edit:=(Form1.FindComponent('RPX'+IntToStr(i)) as TEdit);
    if edit=nil then continue;
    if i=CalibNumber then
    begin
        edit.Color:=clSkyBlue;
        RPEdit[1]:=edit;
    end else
        edit.Color:=$00FFFBF0;
  end;
  for i:=1 to 4 do
  begin
    edit:=Form1.FindComponent('RPY'+IntToStr(i))as TEdit;
    if edit=nil then continue;
    if i=CalibNumber then
    begin
        edit.Color:=clSkyBlue;
        RPEdit[2]:=edit;
    end else
        edit.Color:=$00FFFBF0;
  end;
end;

procedure TForm1.SpeedButton18Click(Sender: TObject);
begin
  editTVDShow(true);
  CalibrationLoad;
end;

procedure TForm1.deleteLAKClick(Sender: TObject);
begin
  if MessageDlg('You really want to remove aircraft record?'+#10#13+'Action is irreversible!',mtWarning,[mbYes,mbNo],0)=mrNo then Exit;
  Screen.Cursor:=crHourGlass;
  with QDeleteLAK do
  begin
      ParamByName('mName').Value:=TRIM(LAK_Available.Text);
      ExecSQL;
    end;
  Screen.Cursor:=crDefault;
  LoadLAK('');
end;

procedure TForm1.openEditLAKClick(Sender: TObject);
begin
  LAK_EX.ReadOnly:=true;
  Lak_EY.ReadOnly:=true;
  Lak_EZ.ReadOnly:=true;
  Lak_LX.ReadOnly:=true;
  Lak_LY.ReadOnly:=true;
  Lak_LZ.ReadOnly:=true;
  Lak_SX.ReadOnly:=true;
  Lak_SY.ReadOnly:=true;
  Lak_SZ.ReadOnly:=true;
  panel10.SetFocus;
  openEditLAK.Visible:=false;
  closeEditLAK.Visible:=true;
  editLAK.Enabled:=true;
end;

procedure TForm1.closeEditLAKClick(Sender: TObject);
begin
  LAK_availableChange(self);
  Lak_EZ.ReadOnly:=false;
  Lak_LZ.ReadOnly:=false;
  Lak_SZ.ReadOnly:=false;
  LAK_EX.ReadOnly:=false;
  Lak_EY.ReadOnly:=false;
  Lak_LX.ReadOnly:=false;
  Lak_LY.ReadOnly:=false;
  Lak_SX.ReadOnly:=false;
  Lak_SY.ReadOnly:=false;
  panel10.SetFocus;
  openEditLAK.Visible:=true;
  closeeditLAK.Visible:=false;
  editLAK.Enabled:=false;
end;

procedure TForm1.editLAKClick(Sender: TObject);
var La_ID:Word;
    XE,YE,XF,YF,XG,YG,ZG,Ze,ZF:Single;
begin //?????????? ?????????? LAK
  if MessageDlg('Save parameters for aircraft record "'+TRIM(LAK_Available.Text)+'"',mtConfirmation,[mbYes,mbNo],0)=mrNo then Exit;
  Screen.Cursor:=crHourGlass;
  if TRIM(LAK_EX.Text)='' then XE:=0 else XE:=StrTofloat(TRIM(LAK_EX.Text));
  if TRIM(Lak_EY.Text)='' then YE:=0 else YE:=StrTofloat(TRIM(Lak_EY.Text));
  if TRIM(Lak_LX.Text)='' then XF:=0 else XF:=StrTofloat(TRIM(Lak_LX.Text));
  if TRIM(Lak_LY.Text)='' then YF:=0 else YF:=StrTofloat(TRIM(Lak_LY.Text));
  if TRIM(Lak_SX.Text)='' then XG:=0 else XG:=StrTofloat(TRIM(Lak_SX.Text));
  if TRIM(Lak_SY.Text)='' then YG:=0 else YG:=StrTofloat(TRIM(Lak_SY.Text));
  if TRIM(Lak_EZ.Text)  ='' then ZE:=0 else ZE:=StrTofloat(TRIM(Lak_EZ.Text));
  if TRIM(Lak_LZ.Text)  ='' then ZF:=0 else ZF:=StrTofloat(TRIM(Lak_LZ.Text));
  if TRIM(Lak_SZ.Text)  ='' then ZG:=0 else ZG:=StrTofloat(TRIM(Lak_SZ.Text));
  with QEditLAK do
  begin
      ParamByName('mName').Value:=TRIM(LAK_Available.Text);
      ParamByName('XE').Value:=XE;
      ParamByName('YE').Value:=YE;
      ParamByName('XF').Value:=XF;
      ParamByName('YF').Value:=YF;
      ParamByName('XG').Value:=XG;
      ParamByName('YG').Value:=YG;
      ParamByName('ZE').Value:=ZE;
      ParamByName('ZF').Value:=ZF;
      ParamByName('ZG').Value:=ZG;
      ExecSQL;
    end;
  Screen.Cursor:=crDefault;
end;

procedure TForm1.editTVDShow(start: boolean);
begin
  editTVD.Top:=0;
  editTVD.Visible:=start;
  TabSheet2.TabVisible:=not start;
  TabSheet3.TabVisible:=not start;
  TabSheet4.TabVisible:=not start;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[5].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,5);
end;

procedure TForm1.SpeedButton20Click(Sender: TObject);
var s:string;
begin
  if DeviceOutError then exit;
  with EditKU do
  begin
      ParamByName('Device_ID').Value:=Device_OUT;
      ParamByName('Focus').Value:=Calib[Device_OUT].Focus;
      ParamByName('Rx').Value:=Calib[Device_OUT].Rx;
      ExecSQL;
    end;
    LoadKUParam;
    editTVDShow(false);
end;

procedure TForm1.SpeedButton21Click(Sender: TObject);
begin
  editTVDShow(false);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[6].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,6);
end;

procedure TForm1.CalcAdjustement;
var i,j:integer;
    x,y,z: double;
    vy,vx:double;
    xStr,yStr:string;
begin
  for i :=7 to 10 do
  for j :=1 to 3 do
  begin
    x:=rp[j].X-koor[i].X;
    y:=rp[j].Y-koor[i].Y;
    z:=rp[j].Z-koor[i].Z;
    POVOROT(0,Koor[i].Um,0,x,y,z);
    POVOROT(-Koor[i].Alf_Degree,0,0,x,y,z);
    vy:=z*koor[i].Focus/x;
    vx:=y*koor[i].Focus/x;
    RPforKU[i].x[j]:=Round(Koor[i].X0-vx*Koor[i].Kx/Koor[i].Rx);
    RPforKU[i].y[j]:=Round(Koor[i].Y0-vy*Koor[i].Ky/Koor[i].Ry);
  end;
  if DeviceOutError then exit;
  for i:=1 to 3 do
  begin
    if  (RPforKU[Device_OUT].x[i]>=0) and (RPforKU[Device_OUT].x[i]<=Koor[Device_OUT].Kx)
    and (RPforKU[Device_OUT].y[i]>=0) and (RPforKU[Device_OUT].y[i]<=Koor[Device_OUT].Ky) then
    begin
      xStr:=IntToStr(RPforKU[Device_OUT].x[i]);
      yStr:=IntToStr(RPforKU[Device_OUT].y[i]);
    end else 
    begin
      xStr:='  -';
      yStr:='  -';
    end;
    if Form1.FindComponent('bRPX'+IntToStr(i))<>nil then
      (Form1.FindComponent('bRPX'+IntToStr(i)) as TEdit).Text:=xStr;    
    if Form1.FindComponent('bRPY'+IntToStr(i))<>nil then
      (Form1.FindComponent('bRPY'+IntToStr(i)) as TEdit).Text:=yStr;
  end;
end;

procedure TForm1.vRP1xChange(Sender: TObject);
var Xtv1,Ytv1,Xtv2,Ytv2:double;
    XL,YL,X1,Z1,Y1,
    XR,YR,X2,Z2,Y2,
    Z1X2X1Z2,
    NB,Z,Y,X : Double;
begin
  Xtv1:=StrToFloatDef(vRP1x.Text,0);
  Ytv1:=StrToFloatDef(vRP1y.Text,0);
  Xtv2:=StrToFloatDef(vRP2x.Text,0);
  Ytv2:=StrToFloatDef(vRP2y.Text,0);
  X:=0; Y:=0; Z:=0;
  if (Xtv1<>0)AND(Ytv1<>0)AND(Xtv2<>0)AND(Ytv2<>0)then
  begin
      //  ?????? ????? ????????????? ?? ?????? ??????
      XL := koor[First].RxKx*(Xtv1-Koor[First].X0);
      YL := koor[First].RyKy*(Koor[First].Y0-Ytv1);
      X1 := Matrix[First,1,1]*XL+Matrix[First,1,2]*YL-Matrix[First,1,3]*Koor[First].focus;
      Y1 := Matrix[First,2,1]*XL+Matrix[First,2,2]*YL-Matrix[First,2,3]*Koor[First].focus;
      Z1 := Matrix[First,3,1]*XL+Matrix[First,3,2]*YL-Matrix[First,3,3]*Koor[First].focus;
      //  ?????? ????? ????????????? ?? ?????? ??????
      XR := koor[Second].RxKx*(Xtv2-Koor[Second].X0);
      YR := koor[Second].RyKy*(Koor[Second].Y0-Ytv2);
      X2 := Matrix[Second,1,1]*XR+Matrix[Second,1,2]*YR-Matrix[Second,1,3]*Koor[Second].focus;
      Y2 := Matrix[Second,2,1]*XR+Matrix[Second,2,2]*YR-Matrix[Second,2,3]*Koor[Second].focus;
      Z2 := Matrix[Second,3,1]*XR+Matrix[Second,3,2]*YR-Matrix[Second,3,3]*Koor[Second].focus;
      Z1X2X1Z2:=Z1*X2-X1*Z2;
      if Z1X2X1Z2<>0 then NB:=(X2*base*sin(Alfa_Base*rad)-Z2*base*(cos(Alfa_Base*rad)))/Z1X2X1Z2 else NB:=0;
      X:=-NB*Z1;
      Z:=NB*Y1;
      Y:=-NB*X1;
      //??????? ?? ???? ?????
      POVOROT(0,-Koor[First].Um,0,x,y,z);
      //??????? ? ???
      PERENOS(Koor[First].X,Koor[First].Y,Koor[First].Z,X,Y,Z);
 end;
 MRPx.Text:=FloatToStrF(X,ffFixed,INT,FRACT);
 MRPy.Text:=FloatToStrF(Y,ffFixed,INT,FRACT);
 MRPz.Text:=FloatToStrF(Z,ffFixed,INT,FRACT);
 ERPx.Text:=FloatToStrF(RP[1].X-X,ffFixed,INT,FRACT);
 ERPy.Text:=FloatToStrF(RP[1].Y-Y,ffFixed,INT,FRACT);
 ERPz.Text:=FloatToStrF(RP[1].Z-Z,ffFixed,INT,FRACT);

end;

procedure TForm1.vStartCapture;
var i:integer;
    hr:HResult;
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  CapEnum:=TSysDevEnum.Create;
  CaptureFilter:=nil;
  FilterGraph1.Active := true;
  CapEnum.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if(CapEnum.CountFilters > 0) then
    for i:=0  to  CapEnum.CountFilters-1 do
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0)) then
      begin
        CaptureFilter := CapEnum.GetBaseFilter(i);
        break;
      end;
  CapEnum.Free;
  if not Assigned(CaptureFilter) then
  begin
    Application.MessageBox('Video board "DeckLink Intensity Pro" not detected.','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureFilter, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect DeckLink Video Capture.','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  AudioFilter:=nil;
  CapEnum:=TSysDevEnum.Create;
  CapEnum.SelectGUIDCategory(CLSID_AudioInputDeviceCategory);
  if(CapEnum.CountFilters > 0) then
    for i:=0  to  CapEnum.CountFilters-1 do
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0)) then
      begin
        AudioFilter := CapEnum.GetBaseFilter(i);
        break;
      end;
  CapEnum.Free;
  if not Assigned(AudioFilter) then
  begin
    Application.MessageBox('Audio board "DeckLink Intensity Pro" not detected.','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(AudioFilter, 'DeckLink AudioCapture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect DeckLink AudioCapture.','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoWindow, 'VideoRender');
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CSC, 'CSC');
  hr := CoCreateInstance(CLSID_SystemClock, nil, CLSCTX_INPROC, IID_IReferenceClock, RefClock);
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,CSC as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph 1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  CSC as IBaseFilter ,SampleGrabber as IBaseFilter, VideoWindow as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph 2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph 3','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  CheckDSError((SoundRender as IMediaFilter).GetSyncSource(RefClock));
  CheckDSError((FilterGraph1 as IMediaFilter).SetSyncSource(RefClock));
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow as IVideoWindow do
  begin
    put_Owner(Video.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(0,0,720,576);
    put_Visible(true);
    put_MessageDrain(Video.Handle);
  end;
  FilterGraph1.Play;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var
  hr:Hresult;
begin
  if not OpenDialog1.Execute then  exit;
  FilterGraph1.Stop;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := true;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr:=(FilterGraph1 as IGraphBuilder).AddSourceFilter(StringToOleStr(OpenDialog1.FileName), '', SourceFile);
  if FAILED(hr) then begin
    Application.MessageBox('Error load SourceFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoDecoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(VideoDecoder, 'VideoDecoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoWindow, 'VideoRender');
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CSC, 'CSC');
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  SourceFile as IBaseFilter ,VideoFilter as IBaseFilter,CSC as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  CSC as IBaseFilter ,SampleGrabber as IBaseFilter, VideoWindow as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow as IVideoWindow do
  begin
    put_Owner(Video.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(0,0,720,576);
    put_Visible(true);
    put_MessageDrain(Video.Handle);
  end;
  FilterGraph1.Play;

end;

procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
begin //??????? ?????????
  xk:=xk+x;
  yk:=yk+y;
  zk:=zk+z;
end;

procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
var
  a,b,c,d,g,f,e,u,h,xk1,yk1,zk1:double;
begin
  all:=all*rad;  //??????? ?????? OZ  ? ??????????? ??????? ?????????
  btt:=btt*rad;	//??????? ?????? OY  ? ??????????? ??????? ?????????
  gmm:=gmm*rad;	//??????? ?????? OX  ? ??????????? ??????? ?????????
  xk1:=xk;
  yk1:=yk;
  zk1:=zk;
  //??????? ????? ?????????, ?? ??????????? ?????? Sin-Cos * ???-?? ?? ?????? ?? DataCalc
  //???????? ??????? 1/3 ??????? ??? DataCalc
  if (all<>0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1*Cos(all)-yk1*Sin(all);
    yk:=xk1*Sin(all)+yk1*Cos(all);
    zk:=zk1;
    EXIT;
  end;
  if (all=0) and (btt<>0) and (gmm=0) then
  begin
    xk:=xk1*Cos(btt)+zk1*Sin(btt);
    yk:=yk1;
    zk:=-xk1*Sin(btt)+zk1*Cos(btt);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm<>0) then
  begin
    xk:=xk1;
    yk:=yk1*Cos(gmm)-zk1*Sin(gmm);
    zk:=yk1*Sin(gmm)+zk1*Cos(gmm);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1;
    yk:=yk1;
    zk:=zk1;
    EXIT;
  end;
  //?????? ???????????? ??????????????? ?????? ?????? ???, ?? ?? ?????? ??????...
  a:=Cos(all)*Cos(btt);
  b:=Sin(all)*Cos(btt);
  c:=-Sin(btt);
  d:=-Sin(all)*Cos(gmm)+Cos(all)*Sin(btt)*Sin(gmm);
  g:=Sin(all)*Sin(gmm)+Cos(all)*Sin(btt)*Cos(gmm);
  f:=Cos(btt)*Sin(gmm);
  e:=Cos(all)*Cos(gmm)+Sin(all)*Sin(btt)*Sin(gmm);
  u:=Cos(btt)*Cos(gmm);
  h:=-Cos(all)*Sin(gmm)+Sin(all)*Sin(btt)*Cos(gmm);
 {??????? ???????????}
  xk:=(xk1*a+yk1*d+zk1*g);
  yk:=xk1*b+yk1*e+zk1*h;
  zk:=(xk1*c+yk1*f+zk1*u);
end;

function TForm1.DeviceOutError():boolean;
begin
  result:=(Device_Out<7) or (Device_Out>10);
end;

procedure TForm1.newLAKClick(Sender: TObject);
begin   //???????? ? ?? ????? ??
  if MessageDlg('Save new type of aircraft?',mtConfirmation,[mbYes,mbNo],0)=mrNo then Exit;
  QNewLAK.SQL.Clear;
  QNewLAK.SQL.Add('DECLARE @IDMax int Select @IDMax=ISNULL(MAX(La_ID),0)+1 from LASetup'+
     ' INSERT  LASetup(La_ID,mName) values (@IDMax,'''+TRIM(NewLAKname.Text)+''')');
  QNewLAK.ExecSQL;
  loadLAK(NewLAKname.Text);
  NewLAKname.Text:='';
  Application.MessageBox('Enter parameters of new aircraft and save them.','Attention!',MB_DEFBUTTON2+MB_ICONWARNING+MB_OK);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[7].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,7);end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[9].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,9);
end;

procedure TForm1.SpeedButton9Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[11].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,11);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=false;
  vStartCapture;
end;

procedure TForm1.tvMode1Click(Sender: TObject);
begin
  LoadTVMode((Sender as TSpeedButton).Tag);
end;

procedure TForm1.LoadTVMode(Numb: integer);
var Command:TMass;
    i:integer;
begin
   Shape1.Brush.Color:=clSilver;
   Shape14.Brush.Color:=clSilver;
   Shape15.Brush.Color:=clSilver;
   RichEdit1.Lines.Add('Load TVD mode start');
   for i:=1 to 4 do
   begin
     Command[0]:=HI(ComDevi[Device_OUT].cAdress);
     Command[1]:=LO(ComDevi[Device_OUT].cAdress);
     Command[2] := $17;
     Command[3] := Command_TM2220[Numb+i-1].cCommand;
     Command[4] := $ff-(command[0]+command[1]+command[2]+command[3])+1;
     if not Command2220(Command,5,5,0) then exit else
     case i of
       1:RichEdit1.Lines.Add('Time-out of binding area and background extending mode setup');
       2:RichEdit1.Lines.Add('Time-out of electronic shutter mode setup');
       3:RichEdit1.Lines.Add('Time-out of video signal processing mode setup');
       4:RichEdit1.Lines.Add('Time-out of iris control mode setup');
       end;
   end;
   RichEdit1.Lines.Add('Load TVD mode complete successfully');
   case Numb of
    22: Shape1.Brush.Color:=clLime;
    26: Shape14.Brush.Color:=clLime;
    30: Shape15.Brush.Color:=clLime;
   end;
end;

procedure TForm1.NewVerification;
begin
    Verification[Device_Out].X:=viX;
    Verification[Device_Out].Y:=viY;
    if vRP1.Tag=Device_Out then
      begin
        vRP1x.Text:=IntToStr(viX);
        vRP1y.Text:=IntToStr(viY);
      end;
    if vRP2.Tag=Device_Out then
      begin
        vRP2x.Text:=IntToStr(viX);
        vRP2y.Text:=IntToStr(viY);
      end;
end;

procedure TForm1.VideoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  viX:=X;
  viY:=Y;
  if Button = mbLeft then
    begin
      AutoSopr:=1;
      CountRes:=0;
      SumX:=0;
      SumY:=0;
    end else
    begin
      AutoSopr:=2;
      vsX:=X;
      vsY:=Y;
    end;
end;

procedure TForm1.VideoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FilterGraph1.Active=false then  exit;
  if AutoSopr<>2 then exit;
  viX:=X;
  viY:=Y;
  xLAK.Caption:='  X= '+IntToStr(viX);
  yLAK.Caption:='  Y= '+IntToStr(viY);
end;

end.
