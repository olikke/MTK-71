unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DSPack, Grids, DBGrids, ExtCtrls,Global,GR32,
  DB, DBTables,Math,DSUtil,DirectShow9,ActiveX, XComDrv;

type
  TForm1 = class(TForm)
    GroupBox16: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    GroupBox6: TGroupBox;
    GroupBox12: TGroupBox;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    GroupBox11: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label16: TLabel;
    RichEdit1: TRichEdit;
    GroupBox24: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel9: TPanel;
    Image2: TImage;
    GroupBox2: TGroupBox;
    SpeedButton4: TSpeedButton;
    Label3: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit8: TEdit;
    GroupBox1: TGroupBox;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    SpeedButton5: TSpeedButton;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Label18: TLabel;
    Edit131: TEdit;
    Edit132: TEdit;
    Edit133: TEdit;
    Edit134: TEdit;
    Edit135: TEdit;
    Edit136: TEdit;
    DBGrid1: TDBGrid;
    Edit130: TEdit;
    Edit4: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
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
    QSetKU: TQuery;
    FilterGraph1: TFilterGraph;
    CaptAndGuide: TTimer;
    Timer1: TTimer;
    QSetLak: TQuery;
    Panel1: TPanel;
    VideoWindow1: TVideoWindow;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
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
    GroupBox4: TGroupBox;
    ComboBox1: TComboBox;
    Command_2220Comment_Eng: TStringField;
    Command_7401Comment_Eng: TStringField;
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
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VideoWindow1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VideoWindow1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CaptAndGuideTimer(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure QLASetupAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure SetFromChannel(KU,ARM:DWord);
    procedure Command2220(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
    procedure Command7401(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
    procedure ChangePort;
  private
    id2,id3,id4,id5,id6,id7,idDown,idUp,idLeft,idRight,idEsc:integer;
    procedure vStartCapture;
    procedure Algorithm002;
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
       GraphBuilder:   IGraphBuilder;
       SoundRender:    IBaseFilter         =nil;
       RefClock:IReferenceClock;
       CaptureGraphBuilder2: ICaptureGraphBuilder2;
       TVButton:array [1..2] of TRadioButton;
       TVName  :array [1..2] of string;
  procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
  procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
  procedure BaseCalc(N1,N2:byte);

const       CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';

implementation

{$R *.dfm}

//определение линии базы
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
  hr := CoCreateInstance(CLSID_SystemClock, nil, CLSCTX_INPROC, IID_IReferenceClock, RefClock);
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  CheckDSError((SoundRender as IMediaFilter).GetSyncSource(RefClock));
  CheckDSError((FilterGraph1 as IMediaFilter).SetSyncSource(RefClock));
  FilterGraph1.Tag:=0;
  FilterGraph1.Play;
end;

procedure TForm1.CaptAndGuideTimer(Sender: TObject);
var i,j,uWhite:Integer;
    Color:TColor32;
var d:Integer;
    frq,t1,t2,dt : INT64;
begin //Автосопровождение
  if AutoSopr=0 then  exit;
  if AutoSopr=1 then
  begin
    if vix<16 then vix:=16;      if vix>704 then vix:=704;
    if viy<16 then viy:=16;      if viy>562 then viy:=562;
    with bmRect do begin Left:=viX-bmdiv;Top:=viY-bmdiv;Right:=viX+bmdiv;Bottom:=viY+bmdiv;end;
    bm.Draw(Rect(0,0,sizebm-1,sizebm-1),bmRect,VideoWindow1.Canvas.Handle);
    Image2.Canvas.CopyRect(Image2.ClientRect,VideoWindow1.Canvas,bmRect);
    MaxVI:=0; MinVI:=255; FillChar(ArrClByte,SizeOf(ArrClByte),0);
    for i:=1 to sizebm do
      for j:=1 to sizebm do
        begin
          Color:=bm.PixelS[i-1,j-1];
          uWhite:=(Color AND $0000FF00) SHR 8;
          ArrClByte[i,j] := uWhite;
          if MinVI > uWhite then MinVI := uWhite;
          if MaxVI < uWhite then MaxVI := uWhite;
        end;
    Algorithm002;
    Label1.Caption:='X= '+IntToStr(viX ); //
    Label2.Caption:='Y= '+IntToStr(viY);
    if CountRes < CountSum then
      begin
        INC(Countres);
        SumX:=SumX+viX;
        SumY:=SumY+viY;
      end            else if (CountRes=CountSum)AND(NumCol<111) then
                          
      begin
        SumX:=ROUND(SumX/CountSum);
        SumY:=ROUND(SumY/CountSum);

        NumCol := 111;
      end;

  end else
  begin
    with bmRect do begin Left:=viX-bmdiv;Top:=viY-bmdiv;Right:=viX+bmdiv;Bottom:=viY+bmdiv;end;
    bm.Draw(Rect(0,0,sizebm-1,sizebm-1),bmRect,VideoWindow1.Canvas.Handle);
    Image2.Canvas.CopyRect(Image2.ClientRect,VideoWindow1.Canvas,bmRect);
    with Image2.Canvas do
    begin
      Pen.Color:=clLime;
      Pen.Width:=1;
      MoveTo(0,Image2.Width div 2 +1);
      LineTo(Image2.Width,Image2.Width div 2 +1);
      MoveTo(Image2.Width div 2 +1,0);
      LineTo(Image2.Width div 2 +1,Image2.Width);
    end;
  end;
 //Рисование на экране
  d := bmdiv+2;
  with VMRBitmap, Canvas do
    if AutoSopr=1 then  DrawTo((viX-d)/videowindow1.Width,
                               (viY-d)/videowindow1.Height,
                               (viX+d)/videowindow1.Width,
                               (viY+d)/videowindow1.Height,1)
    else                DrawTo(0,0,0,0,0);
end;

procedure TForm1.Algorithm002;
var i,j,l,x,y,mx,my,sx,sy,Rx,Ry,uWhite,kx,mbl : integer;
    dx,ddx,x1,x2,x3,x4,x5,xc1,xc2,xc3,xc4,xc5:Integer;
    dy,ddy,y1,y2,y3,y4,y5,yc1,yc2,yc3,yc4,yc5:Integer;
    sDelta,mDelta,mBlack,mWhite,ybl : Single;
begin //Фара
  x:=0; y:=0; sDelta:=0; mDelta:=0;
  mx:=sizebm-Rbl-2;
  my:=sizebm-Rbl-2;
  //Расчет отклонения в сопровождении
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
  if sDelta > 23 then     //Уровень шума = 21
    begin
      aDX := bmdiv - x;
      aDY := bmdiv - y;
    end
    else
    begin
      aDX := 0; aDY := 0;
    end;
  viX:=viX - aDX;
  viY:=viY - aDY;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
begin
  Edit130.Text:=Column.Field.DataSet.FieldByName('mname').AsString;
  LASetup.Close;
  LASetup.ParamByName('nnname').AsString:=EDit130.Text;
  LASetup.Open;
  Edit131.Text:=FloatToStrF(XE.Value,ffFixed,8,4);
  Edit132.Text:=FloatToStrF(YE.Value,ffFixed,8,4);
  Edit4.Text  :=FloatToStrF(ZE.Value,ffFixed,8,4);
  Edit133.Text:=FloatToStrF(XF.Value,ffFixed,8,4);
  Edit134.Text:=FloatToStrF(YF.Value,ffFixed,8,4);
  Edit9.Text  :=FloatToStrF(ZF.Value,ffFixed,8,4);
  Edit135.Text:=FloatToStrF(XG.Value,ffFixed,8,4);
  Edit136.Text:=FloatToStrF(YG.Value,ffFixed,8,4);
  Edit10.Text :=FloatToStrF(ZG.Value,ffFixed,8,4);
end;

procedure TForm1.FormActivate(Sender: TObject);
var i:integer;
    A1,B1,C1:double;  // уравнение линии посадки вида A1*x+B1*y+C1=0
    A2,B2,C2:double;  //уравнение линии базы
    cv,c:integer;
begin
  idEsc := GlobalAddAtom('HkEsc'); RegisterHotKey(Handle,idEsc ,0,VK_ESCAPE);
  MTK.Connected:=true;
  QLASetup.Active:=True;
  KUSetup.Close;
  KUSetup.Open;
  i:=0;
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
      koor[c].Xi   :=KUSetupXi.Value*rad;
      koor[c].Om   :=KUSetupOm.Value*rad;
    end;
    KUSetup.Next;
    end;
  KUSetup.Close;

  //Матрицы направляющих косинусов  для всех камер
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

  First:=9;
  Second:=7;

  if koor[9].Y>koor[7].Y then BaseCalc(9,7)
  else  BaseCalc(7,9);

  MiniKoff[1]:=-1;
  MiniKoff[2]:=1;
  MiniKoff[3]:=1;

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
 //основные настройки Comm2220, потом меняется только DeviceName
  with Comm2220 do
  begin
    //номер COM порта для выбранной камеры
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
  //аналогично для 2404
  with Comm2404 do
  begin
    //номер COM порта для выбранной камеры
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
  //список команд
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
  TVButton[1]:=RadioButton6;
  TVButton[2]:=RadioButton3;
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
  HOST_TP:=0;
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  BRes := GetComputerName(@buffer, Size);
  CompName := trim(uppercase(StrPas(buffer)));
  if (UpperCase(CompName)='OLIKKE') or( UpperCase(CompName)='WSP') then HOST_TP:=1;
  if UpperCase(CompName)='WSL' then HOST_TP:=2;
  if UpperCase(CompName)='WSR' then HOST_TP:=3;
  viX:=0;
  viY:=0;
  bmdiv :=sizebm SHR 1;
  bmddiv:=sizebm SHR 2;
  bm:=TBitMap32.Create;
  bm.SetSize(sizebm,sizebm);
  VMRBitmap := TVMRBitmap.Create(VideoWindow1);
  with VMRBitmap,Canvas do
  begin
    LoadEmptyBitmap(sizebm,sizebm,pf24bit, clSilver);
    Source := VMRBitmap.Canvas.ClipRect;
    Options := VMRBitmap.Options + [vmrbSrcColorKey];
    ColorKey := clSilver;
    Brush.Color := clSilver;
    Pen.Width := 2;
    Pen.Color := clGreen;
    MoveTo(0,0);  LineTo(10,0);  MoveTo(sizebm-11,0);  LineTo(sizebm-1,0);
    MoveTo(0,sizebm-1); LineTo(10,sizebm-1); MoveTo(sizebm-11,sizebm-1); LineTo(sizebm-1,sizebm-1);
    MoveTo(0,0);  LineTo(0,10);  MoveTo(0,sizebm-1);  LineTo(0,sizebm-11);
    MoveTo(sizebm-1,0); LineTo(sizebm-1,10); MoveTo(sizebm-1,sizebm-1); LineTo(sizebm-1,sizebm-11);
  end;
  Device_OUT := 0;
  Rwh := 1;
  Rbl := 5;
  //Построение фильтра для сопровождения
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
  SpeedButton8.Caption:='Anticlockwise'+#10#13;
  SpeedButton9.Caption:='Stop'+#10#13;
  SpeedButton10.Caption:='Clockwise'+#10#13;
  SpeedButton1.Caption:='Upwards'+#10#13;
  SpeedButton2.Caption:='Stop'+#10#13;
  SpeedButton7.Caption:='Downward'+#10#13;
end;

procedure TForm1.QLASetupAfterScroll(DataSet: TDataSet);
begin
  Edit130.Text:=QLASetupmName.Value;
  Edit131.Text:=FloatToStrF(QLASetupXE.Value,ffFixed,8,4);
  Edit132.Text:=FloatToStrF(QLASetupYE.Value,ffFixed,8,4);
  Edit133.Text:=FloatToStrF(QLASetupXF.Value,ffFixed,8,4);
  Edit134.Text:=FloatToStrF(QLASetupYF.Value,ffFixed,8,4);
  Edit135.Text:=FloatToStrF(QLASetupXG.Value,ffFixed,8,4);
  Edit136.Text:=FloatToStrF(QLASetupYG.Value,ffFixed,8,4);
  Edit4.Text  :=FloatToStrF(QLASetupZE.Value,ffFixed,8,4);
  Edit9.Text  :=FloatToStrF(QLASetupZF.Value,ffFixed,8,4);
  Edit10.Text :=FloatToStrF(QLASetupZG.Value,ffFixed,8,4);
end;

procedure TForm1.RadioButton6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var bIN : byte;
    i,j : Word;
    Device_ID:word;
begin
  SpeedButton7.Enabled:=false;
  SpeedButton8.Enabled:=false;
  SpeedButton9.Enabled:=false;
  SpeedButton10.Enabled:=false;
  SpeedButton1.Enabled:=false;
  SpeedButton2.Enabled:=false;
  Device_OUT := (Sender as TRadioButton).Tag;
  //остальные настройки неизменны
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
  if not FilterGraph1.Active then
  vStartCapture;
end;

procedure TForm1.SetFromChannel(KU,ARM:DWord);
  var Command:TMass;
   c,in7401,Out7401:word;
begin
   //включить камеру
   command[0]:=HI(ComDevi[KU].cAdress);
   command[1]:=LO(ComDevi[KU].cAdress);
   command[2]:=Command_TM2220[1].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,1);
   //отправить команду 7401
   //выбрать коммутатор
   case ARM of
   1: c:=30;
   2: c:=31;
   3: c:=30;
   end;
   //номер вход коммутатора
   case KU of
   7:  in7401:=2;
   8:  in7401:=0;
   9:  in7401:=1;
   10: in7401:=3;
   end;
   //номер выхода коммутатора
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
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0: begin
         TVButton[1]:=RadioButton6;
         TVName  [1]:='TVD1';
         TVButton[2]:=RadioButton3;
         TVName  [2]:='TVD4';
         GroupBox2.Caption:='1. Point of tracking by TVD1';
         GroupBox1.Caption:='2. Point of tracking by TVD4';
         First:=9;
         Second:=7;
         if koor[9].Y>koor[7].Y then BaseCalc(9,7)
           else  BaseCalc(7,9);
         MiniKoff[1]:=-1;
         MiniKoff[2]:=1;
         MiniKoff[3]:=1;
       end;
    1: begin
         TVButton[1]:=RadioButton4;
         TVName  [1]:='TVD2';
         TVButton[2]:=RadioButton6;
         TVName  [2]:='TVD1';
         GroupBox2.Caption:='1. Point of tracking by TVD2';
         GroupBox1.Caption:='2. Point of tracking by TVD1';
         First:=7;
         Second:=8;
         if koor[8].Y>koor[7].Y then BaseCalc(8,7)
           else  BaseCalc(7,8);
         MiniKoff[1]:=1;
         MiniKoff[2]:=-1;
         MiniKoff[3]:=-1;
       end;
    2:  begin
         TVButton[1]:=RadioButton5;
         TVName  [1]:='TVD3';
         TVButton[2]:=RadioButton6;
         TVName  [2]:='TVD1';
         GroupBox2.Caption:='1. Point of tracking by TVD3';
         GroupBox1.Caption:='2. Point of tracking by TVD1';
         First:=7;
         Second:=10;
         if koor[10].Y>koor[7].Y then BaseCalc(10,7)
           else  BaseCalc(7,10);
         MiniKoff[1]:=1;
         MiniKoff[2]:=-1;
         MiniKoff[3]:=-1;
       end;
    3: begin
         TVButton[1]:=RadioButton4;
         TVName  [1]:='TVD2';
         TVButton[2]:=RadioButton3;
         TVName  [2]:='TVD4';
         GroupBox2.Caption:='1. Point of tracking by TVD2';
         GroupBox1.Caption:='2. Point of tracking by TVD4';
         First:=9;
         Second:=8;
         if koor[9].Y>koor[8].Y then BaseCalc(9,8)
           else  BaseCalc(8,9);
         MiniKoff[1]:=-1;
         MiniKoff[2]:=1;
         MiniKoff[3]:=1;
       end;
    4:  begin
         TVButton[1]:=RadioButton5;
         TVName  [1]:='TVD3';
         TVButton[2]:=RadioButton3;
         TVName  [2]:='TVD4';
         GroupBox2.Caption:='1. Point of tracking by TVD3';
         GroupBox1.Caption:='2. Point of tracking by TVD4';
         First:=9;
         Second:=10;
         if koor[9].Y>koor[10].Y then BaseCalc(9,10)
           else  BaseCalc(10,9);
         MiniKoff[1]:=-1;
         MiniKoff[2]:=1;
         MiniKoff[3]:=1;
       end;
  end;
  Edit1.Text:='0';
  Edit2.Text:='0';
  Edit5.Text:='0';
  Edit8.Text:='0';
end;

procedure TForm1.Command2220(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
var Result:Cardinal;
    LRC     :byte;
    i:integer;
    k,l:double;
    ReceiveCommand:TMass;
begin
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
  Result:=Comm2220.SendData(Command,SendCount);
   if Result=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'. Error command: '+Command_TM2220[CommandNumber].cComment);
     exit;
   end;
   Result:=Comm2220.ReadData(ReceiveCommand,ReceiveCount);
   if Result=0 then
   begin
     RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2220.DeviceName+'. No answer');
     exit;
   end else
   begin
    { //проверка контрольной суммы
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
   if ReceiveCount=21 then
   begin

   end;
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
  //если кол-во неудачных попыток = 4 - переход на другой порт
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
     //проверка контрольной суммы
     LRC:=0;
     for i := 0 to ReceiveCount-2 do LRC:=LRC+ReceiveCommand[i];
     if LRC<>ReceiveCommand[ReceiveCount-1] then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'.Error of checksum.');
       exit;
     end;
     //проверка числа принятых байт
     if (Result<>ReceiveCount) or (ReceiveCommand[1]+2<>Result) then
     begin
       RichEdit1.Lines.Add(FormatDateTime('hh:nn:ss:zzz  ',now)+'Error '+Comm2404.DeviceName+'.Unknown answer format.');
       exit;
     end;
     //проверка выполнения
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

procedure TForm1.SpeedButton11Click(Sender: TObject);
var
  La_ID:Word;
  s:String;
begin   //Добавить в БД новый ЛА
  if MessageDlg('You really want to remove aircraft record?'+#10#13+'Action is irreversible!',mtWarning,[mbYes,mbNo],0)=mrNo then Exit;
  La_ID:=QLASetupLa_ID.Value;
  s:='DELETE FROM LASetup WHERE La_ID='+IntTostr(La_ID);
  QSetKU.Close;QSetKU.SQL.Clear;QSetKU.SQL.Add(s);QSetKU.ExecSQL;
  QLASetup.Close;
  QLASetup.Open;
  Edit130.Text:=QLASetupmName.Value;
  Edit131.Text:=FloatToStrF(QLASetupXE.Value,ffFixed,6,3);
  Edit132.Text:=FloatToStrF(QLASetupYE.Value,ffFixed,6,3);
  Edit133.Text:=FloatToStrF(QLASetupXF.Value,ffFixed,6,3);
  Edit134.Text:=FloatToStrF(QLASetupYF.Value,ffFixed,6,3);
  Edit135.Text:=FloatToStrF(QLASetupXG.Value,ffFixed,6,3);
  Edit136.Text:=FloatToStrF(QLASetupYG.Value,ffFixed,6,3);
  Edit2.Text  :=FloatToStrF(QLASetupZE.Value,ffFixed,6,3);
  Edit3.Text  :=FloatToStrF(QLASetupZF.Value,ffFixed,6,3);
  Edit4.Text  :=FloatToStrF(QLASetupZG.Value,ffFixed,6,3);
end;

procedure TForm1.SpeedButton15Click(Sender: TObject);
var La_ID:Word;
    XE,YE,XF,YF,XG,YG,ZG,Ze,ZF:Single;
begin //Сохранение параметров LAK
  if MessageDlg('Save parameters for aircraft record "'+TRIM(Edit130.Text)+'"',mtConfirmation,[mbYes,mbNo],0)=mrNo then Exit;
  Screen.Cursor:=crHourGlass;
  if TRIM(Edit131.Text)='' then XE:=0 else XE:=StrTofloat(TRIM(Edit131.Text));
  if TRIM(Edit132.Text)='' then YE:=0 else YE:=StrTofloat(TRIM(Edit132.Text));
  if TRIM(Edit133.Text)='' then XF:=0 else XF:=StrTofloat(TRIM(Edit133.Text));
  if TRIM(Edit134.Text)='' then YF:=0 else YF:=StrTofloat(TRIM(Edit134.Text));
  if TRIM(Edit135.Text)='' then XG:=0 else XG:=StrTofloat(TRIM(Edit135.Text));
  if TRIM(Edit136.Text)='' then YG:=0 else YG:=StrTofloat(TRIM(Edit136.Text));
  if TRIM(Edit4.Text)  ='' then ZE:=0 else ZE:=StrTofloat(TRIM(Edit4.Text));
  if TRIM(Edit9.Text)  ='' then ZF:=0 else ZF:=StrTofloat(TRIM(Edit9.Text));
  if TRIM(Edit10.Text)  ='' then ZG:=0 else ZG:=StrTofloat(TRIM(Edit10.Text));
  La_ID:=QLASetupLa_ID.value;
  QLASetup.Close;
  with QSetLAK do 
  begin
      ParamByName('mName').Value:=TRIM(Edit130.Text);
      ParamByName('XE').Value:=XE;
      ParamByName('YE').Value:=YE;
      ParamByName('XF').Value:=XF;
      ParamByName('YF').Value:=YF;
      ParamByName('XG').Value:=XG;
      ParamByName('YG').Value:=YG;
      ParamByName('ZE').Value:=ZE;
      ParamByName('ZF').Value:=ZF;
      ParamByName('ZG').Value:=ZG;
      ParamByName('La_ID').Value:=La_ID;
      ExecSQL;
    end;
  QLASetup.Open;
  QLASetup.Locate('La_ID',La_ID,[LoPartialKey]);
  Screen.Cursor:=crDefault;
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

procedure TForm1.SpeedButton2Click(Sender: TObject);
var Command:tMass;
begin
   command[0]:=HI(ComDevi[Device_OUT].cAdress);
   command[1]:=LO(ComDevi[Device_OUT].cAdress);
   command[2]:=Command_TM2220[6].cCommand;
   command[3]:=$ff-(command[0]+command[1]+command[2])+1;
   Command2220(Command,4,5,6);
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  if not TVButton[2].Checked then
  begin
    Application.MessageBox(PAnsiChar('Open the image '+TVName[2]+'by clicking the appropriate button of the '+#10#13+
                              '"Selection of TV device" panel. '),'HELP',MB_ok);
    exit;
  end;
  Edit1.Text:=IntToStr(vix);
  Edit2.Text:=IntToStr(viy);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if not TVButton[1].Checked then
  begin
    Application.MessageBox(PAnsiChar('Open the image '+TVName[1]+'by clicking the appropriate button of the '+#10#13+
                              '"Selection of TV device" panel. '),'HELP',MB_ok);
    exit;
  end;
  Edit5.Text:=IntToStr(vix);
  Edit8.Text:=IntToStr(viy);
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var Xtv1,Ytv1,Xtv2,Ytv2:double;
    XL,YL,X1,Z1,Y1,
    XR,YR,X2,Z2,Y2,
    Z1X2X1Z2,
    NB,ZB,YB,XB,Z,Y,X : Double;
begin
  Xtv1:=StrToFloat(Edit1.Text);
  Ytv1:=StrToFloat(Edit2.Text);
  Xtv2:=StrToFloat(Edit5.Text);
  Ytv2:=StrToFloat(Edit8.Text);
  if (Xtv1<>0)AND(Ytv1<>0)AND(Xtv2<>0)AND(Ytv2<>0)then
  begin
      //  расчёт точки сопровождения по первой камере
      XL := koor[First].RxKx*(Xtv1-Koor[First].X0);
      YL := koor[First].RyKy*(Koor[First].Y0-Ytv1);
      X1 := Matrix[First,1,1]*XL+Matrix[First,1,2]*YL-Matrix[First,1,3]*Koor[First].focus;
      Y1 := Matrix[First,2,1]*XL+Matrix[First,2,2]*YL-Matrix[First,2,3]*Koor[First].focus;
      Z1 := Matrix[First,3,1]*XL+Matrix[First,3,2]*YL-Matrix[First,3,3]*Koor[First].focus;
      //  расчёт точки сопровождения по второй камере
      XR := koor[Second].RxKx*(Xtv2-Koor[Second].X0);
      YR := koor[Second].RyKy*(Koor[Second].Y0-Ytv2);
      X2 := Matrix[Second,1,1]*XR+Matrix[Second,1,2]*YR-Matrix[Second,1,3]*Koor[Second].focus;
      Y2 := Matrix[Second,2,1]*XR+Matrix[Second,2,2]*YR-Matrix[Second,2,3]*Koor[Second].focus;
      Z2 := Matrix[Second,3,1]*XR+Matrix[Second,3,2]*YR-Matrix[Second,3,3]*Koor[Second].focus;
      Z1X2X1Z2:=Z1*X2-X1*Z2;
      if Z1X2X1Z2<>0 then NB:=(X2*base*sin(Alfa_Base*rad)-Z2*base*(cos(Alfa_Base*rad)))/Z1X2X1Z2 else NB:=0;
      ZB:=NB*Z1;
      YB:=NB*Y1;
      XB:=NB*X1;
      //Координаты по ТВ системе
      Z:=MiniKoff[1]*YB;
      Y:=MiniKoff[2]*XB;
      X:=MiniKoff[3]*ZB;
      //Поворот по углу места
      POVOROT(0,-Koor[First].Um,0,x,y,z);
      //Перенос в РТП
      PERENOS(Koor[First].X,Koor[First].Y,Koor[First].Z,X,Y,Z);








    {  //Расчет точки сопровождения левого оператора
      XL := Rxl/Kxl*(XtvL - Wxl);
      YL := Ryl/Kyl*(Wyl - YtvL);
      X1 := L[1,1]*XL+L[1,2]*YL-L[1,3]*fl;
      Y1 := L[2,1]*XL+L[2,2]*YL-L[2,3]*fl;
      Z1 := L[3,1]*XL+L[3,2]*YL-L[3,3]*fl;
      //Расчет точки сопровождения правого оператора
      XR := Rxr/Kxr*(XtvR - Wxr);
      YR := Ryr/Kyr*(Wyr - YtvR);
      X2 := R[1,1]*XR+R[1,2]*YR-R[1,3]*fr;
      Y2 := R[2,1]*XR+R[2,2]*YR-R[2,3]*fr;
      Z2 := R[3,1]*XR+R[3,2]*YR-R[3,3]*fr;
      Z1X2X1Z2:=Z1*X2-X1*Z2;
      if Z1X2X1Z2<>0 then NB:=(X2*base*sin(Alfa_Base*rad)-Z2*base*cos(Alfa_Base*rad))/Z1X2X1Z2 else NB:=0;
      ZB:=NB*Z1;
      YB:=NB*Y1;
      XB:=NB*X1;
      //Координаты по ТВ системе
      Z:=-YB;
      Y:=XB;
      X:=ZB;
      //Поворот по углу места
      POVOROT(0,-Uml,0,x,y,z);
      //Перенос в РТП
      PERENOS(Koor[First,1],Koor[First,2],Koor[First,3],X,Y,Z);  }
      //Конечный результат
      Edit3.Text:=FloatToStrF(X,ffFixed,7,3);
      Edit6.Text:=FloatToStrF(Y,ffFixed,7,3);
      Edit7.Text:=FloatToStrF(Z,ffFixed,7,3);
     end;
end;

procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
begin //Перенос координат
  xk:=xk+x;
  yk:=yk+y;
  zk:=zk+z;
end;

procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
var
  a,b,c,d,g,f,e,u,h,xk1,yk1,zk1:double;
begin
  all:=all*rad;  //Поворот вокруг OZ  в корабельной системе координат
  btt:=btt*rad;	//Поворот вокруг OY  в корабельной системе координат
  gmm:=gmm*rad;	//Поворот вокруг OX  в корабельной системе координат
  xk1:=xk;
  yk1:=yk;
  zk1:=zk;
  //функция менее прозрачна, но существенно меньше Sin-Cos * кол-во её вызова из DataCalc
  //экономия порядка 1/3 времени для DataCalc
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
  //обычно поворачиваем последовательно вокруг каждой оси, но на всякий случай...
  a:=Cos(all)*Cos(btt);
  b:=Sin(all)*Cos(btt);
  c:=-Sin(btt);
  d:=-Sin(all)*Cos(gmm)+Cos(all)*Sin(btt)*Sin(gmm);
  g:=Sin(all)*Sin(gmm)+Cos(all)*Sin(btt)*Cos(gmm);
  f:=Cos(btt)*Sin(gmm);
  e:=Cos(all)*Cos(gmm)+Sin(all)*Sin(btt)*Sin(gmm);
  u:=Cos(btt)*Cos(gmm);
  h:=-Cos(all)*Sin(gmm)+Sin(all)*Sin(btt)*Cos(gmm);
 {ПОВОРОТ КОНСТРУКЦИИ}
  xk:=(xk1*a+yk1*d+zk1*g);
  yk:=xk1*b+yk1*e+zk1*h;
  zk:=(xk1*c+yk1*f+zk1*u);
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var s:String;
begin   //Добавить в БД новый ЛА
  if MessageDlg('Save new type of aircraft?',mtConfirmation,[mbYes,mbNo],0)=mrNo then Exit;
  s:='DECLARE @IDMax int Select @IDMax=ISNULL(MAX(La_ID),0)+1 from LASetup'+
     ' INSERT  LASetup(La_ID,mName) values (@IDMax,'''+TRIM(Edit130.Text)+''')';
  QSetKU.Close;
  QSetKU.SQL.Clear;
  QSetKU.SQL.Add(s);
  QSetKU.ExecSQL;
  QLASetup.Close;
  QLASetup.Open;
  Edit131.Text:='0';
  Edit132.Text:='0';
  Edit4.Text  :='0';
  Edit133.Text:='0';
  Edit134.Text:='0';
  Edit9.Text  :='0';
  Edit135.Text:='0';
  Edit136.Text:='0';
  Edit10.Text :='0';
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
  VideoWindow1.Visible:=true;
end;

procedure TForm1.VideoWindow1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if GetKeyState(VK_LCONTROL) = 1 then keybd_event(VK_LCONTROL,0,KEYEVENTF_KEYUP,0);
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

procedure TForm1.VideoWindow1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if AutoSopr<>2 then EXIT;
  viX:=X;
  viY:=Y;
  Label1.Caption:='X= '+IntToStr(viX);  
  Label2.Caption:='Y= '+IntToStr(viY);
end;

end.
