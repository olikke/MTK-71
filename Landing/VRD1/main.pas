unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSPack, DSUtil,ActiveX,DirectShow9,StdCtrls, ExtCtrls, Menus,FastDib,FastDraw,IdIPAddrMon,
  IdBaseComponent, IdComponent, IdScheduler, IdSchedulerOfThread,
  IdSchedulerOfThreadDefault, IdAntiFreezeBase, IdAntiFreeze, IdCustomTCPServer,
  IdTCPServer,Ping, WSL,Grids, SyncObjs,Global, DB, DBTables,IdSocketHandle,IdUDPServer,idGlobal,
  IdUDPBase,registry;

type
  TnMain = class(TForm)
    FilterGraph1: TFilterGraph;
    IPAddrMon: TIdIPAddrMon;
    SampleGrabber:TSampleGrabber;
    HostList: TQuery;
    HostListIP1: TStringField;
    HostListIP2: TStringField;
    HostListMask1: TStringField;
    HostListMask2: TStringField;
    MTK: TDatabase;
    UDPCommandServer: TIdUDPServer;
    Timer1: TTimer;
    Panel1: TPanel;
    GroupBox3: TGroupBox;
    Shape2: TShape;
    Label6: TLabel;
    Shape3: TShape;
    GroupBox4: TGroupBox;
    sLAN1: TShape;
    sLAN2: TShape;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox5: TGroupBox;
    StringGrid1: TStringGrid;
    VideoWindow1: TVideoWindow;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Button1: TButton;
    LASetup: TQuery;
    LASetupLA_ID: TSmallintField;
    LASetupmName: TStringField;
    LASetupXE: TFloatField;
    LASetupYE: TFloatField;
    LASetupZE: TFloatField;
    LASetupXF: TFloatField;
    LASetupYF: TFloatField;
    LASetupZF: TFloatField;
    LASetupXG: TFloatField;
    LASetupYG: TFloatField;
    LASetupZG: TFloatField;
    Timer2: TTimer;
    procedure Timer2Timer(Sender: TObject);
    procedure VideoWindow1DblClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UDPCommandServerUDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure Bbt(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function  iSetVideoFormat(FramesPerSecond,FrameWidth,FrameHeight,viGde: Integer):Integer;
    procedure RecordFilterGraph;
    procedure StartFilterGraph;
  private
    { Private declarations }
  public
    procedure VRDState;
  end;

var
    nMain: TnMain;
    hr:HResult;
    CapEnum:TSysDevEnum;
    
    RefClock:IReferenceClock;
    CaptureGraphBuilder2: ICaptureGraphBuilder2;
    GraphBuilder:   IGraphBuilder;
    AudioFilter:    IBaseFilter         =nil;
    VideoFilter:    IBaseFilter         =nil;
    VideoEncoder:   IBaseFilter         =nil;
    SoundRender:    IBaseFilter         =nil;
    SmartTee2  :    IBaseFilter         =nil;
    SmartTee3  :    IBaseFilter         =nil;
    CaptureFilter:  IBaseFilter         =nil;
    ISampleGrabb:   ISampleGrabber      =nil;
    CSC:            IBaseFilter         =nil;
    ClockF:         IBaseFilter         =nil;
    Multiplexer:IBaseFilter;
    Writer:IFileSinkFilter;
    MediaType:_AMMediaType;
    pvi:PvideoInfoHeader;
    BWidth, BHeight,MBitCount:integer;
    FastIn:TFastDib;
    fl_Video:boolean; //детектор видео внутренний и для отправки центральному оператору
    hPing:TPing;
    hWS1,hWS2:TWSL;
    EventWS1,EventWS2:TEvent;
    fl_LAN1:boolean=true; //флаги активных сетей
    fl_LAN2:boolean=true;
    HDD_miss:boolean=true;
    NumBort:cardinal;
    dir:string;
    FileName:WideString;
    DickSize:TLargeInteger;
    fl_FOLDER:boolean=false;

const
  CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
  CLSID_ColorSpaceConverter:TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';
  CLSID_FfdshowVideoEncoder:TGUID = '{4DB2B5D9-4556-4340-B189-AD20110D953F}';
  CLSID_ClockInFilter:TGUID = '{7D7606FC-DF86-41E8-9067-CB6304C0AD1B}';

implementation

{$R *.dfm}

procedure TnMain.VideoWindow1DblClick(Sender: TObject);
begin
  VideoWindow1.FullScreen:=not VideoWindow1.FullScreen;
end;

procedure TNMain.VRDState;
var count:integer;
    FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    LAN_1,LAN_2,LAN_3,LAN_4:boolean;
    Mcolor:TColor;
begin
  LAN_1:=hPing.LAN_1;
  LAN_2:=hPing.LAN_2;
  // обновление информации о состоянии жёстких дисков
  for count:= 1 to HDDCount do
  begin
     GetDiskFreeSpaceEx(PChar(HDDEnum[Count].HDD_NAME+':\'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
      HDDEnum[Count].TotalSpace:=TotalSize/1024/1024;//в метрах
      HDDEnum[Count].FreeSpace:=FreeSize/1024/1024;
      if TotalSize<>0 then
       StringGrid1.Cells[1,count]:=FloatToStrF((TotalSize-FreeSize)/TotalSize*100,ffFixed,6,2);
  end;
  //обновление информации о состоянии своей сети
  begin
    LanEnum[1].State:=LAN_1;
    LanEnum[2].State:=LAN_2;
  end;
   //проверка связи
  if not LAN_1 then sLAN1.Brush.Color:=Color_R else sLAN1.Brush.Color:=Color_G;
  if not LAN_2 then sLAN2.Brush.Color:=Color_R else sLAN2.Brush.Color:=Color_G;
  if fl_Synchro then
  begin
    fl_Synchro := false;
    if LAN_1 then WinExec(PChar('net time \\'+IP_SrvWSC1+' /set /yes'),SW_HIDE) else
    if LAN_2 then WinExec(PChar('net time \\'+IP_SrvWSC2+' /set /yes'),SW_HIDE);
  end;
  begin
    vSMS.HOST:=5;
    vSMS.HDDCount:=HDDCount;
    vSMS.HDDEnum:=HDDEnum;
    vSMS.LanCount:=LanCount;
    vSMS.LanEnum:=LanEnum;
    vSMS.Video:=fl_Video;
    if Button1.Caption='Start Record' then
    begin
      vSMS.fl_VRD:=0;
      vSMS.Size:=0
    end else
    begin
      vSMS.fl_VRD:=1;
      vSMS.Size:=fSize;
    end;
    hWS1.cSMS:=vSMS;
    hWS2.cSMS:=vSMS;
    if (LAN_1) then begin EventWS1.SetEvent; fl_LAN1:=true; end
    else  if (LAN_2) then begin EventWS2.SetEvent;fl_LAN2:=true; end;
    if fl_Video=true then Shape3.Brush.Color:=Color_G else Shape3.Brush.Color:=Color_R;
    //анализ состояния
    begin
      MColor:=Color_G;
      if (not LAN_1) or (not LAN_2) then mColor:=Color_Y;

      if (not fl_Video) or
        ((not LAN_1) and (not LAN_2)) or
        (not HDD_miss) then mColor:=Color_R;


      Shape2.Brush.Color:=MColor;
    end;


    fl_Video:=false;
   //в случае обрыва соответствующего клиента обязательно надо перегрузить
    begin
      if fl_LAN1 and (not LAN_1)  then
      begin
        if Assigned(hWS1) then begin hWS1.Terminate; hWS1:=nil;end;
        hWS1:=TWSL.Create(true);
        hWS1.Priority:=tpLowest;
        hWS1.FreeOnTerminate:=true;
        hWS1.IP_Srv:=IP_SrvWSC1;
        hWS1.Port:=9000;
        hWS1.WS:='VRD1';
        hWS1.Resume;
        fl_LAN1:=false;
      end;
      if fl_LAN2 and (not LAN_2) then
      begin
        if Assigned(hWS2) then begin hWS2.Terminate; hWS2:=nil;end;
        hWS2:=TWSL.Create(true);
        hWS2.Priority:=tpLowest;
        hWS2.FreeOnTerminate:=true;
        hWS2.IP_Srv:=IP_SrvWSC2;
        hWS2.Port:=9000;
        hWS2.WS:='VRD2';
        hWS2.Resume;
        fl_LAN2:=false;
      end;
    end;
  end;
end;

procedure TnMain.RecordFilterGraph;
var i:integer;
    hr:HResult;
    FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    str:String;
begin
  FilterGraph1.Stop;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  if TRIM(Edit3.Text)='' then  Edit3.Text:='  NoBort';
  if (Aircraft>=0) and (Aircraft<Length(LaSet)) then Str:=LASet[Aircraft].Name else Str:='UnknownType';
  FileName:=(dir+'\'+TRIM(Edit3.Text)+'_'+FormatDateTime('hhnnss',now)+'_'+str+'.avi');
  CapEnum:=TSysDevEnum.Create;
  FilterGraph1.Active := true;
  CapEnum.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if(CapEnum.CountFilters > 0) then
    for i:=0  to  CapEnum.CountFilters-1 do
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0)) and ((Pos('2', UpperCase(CapEnum.Filters[i].FriendlyName)) = 0)) then
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
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0))  and ((Pos('2', UpperCase(CapEnum.Filters[i].FriendlyName)) = 0))then
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
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CSC, 'CSC');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  hr := CoCreateInstance(CLSID_FfdshowVideoEncoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoEncoder, 'VideoEncoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_SmartTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(SmartTee2, 'SmartTee2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_SmartTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee3);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(SmartTee3, 'SmartTee3');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_ClockInFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, ClockF);
  if FAILED(hr) then begin
     Application.MessageBox('Error load ClockF','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(ClockF, 'ClockF');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect ClockF','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as ICaptureGraphBuilder2 do
  begin
    hr:=SetOutputFileName(MEDIASUBTYPE_Avi, PWideChar(FileName), multiplexer, Writer);
    hr:=RenderStream(nil, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,SmartTee2 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SmartTee2 as IBaseFilter,ClockF as IBaseFilter,VideoEncoder as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
     hr:=RenderStream(nil, nil, VideoEncoder as IBaseFilter, nil, multiplexer);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SmartTee2 as IBaseFilter,nil,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $3','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,CSC as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $4','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SmartTee3 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee3 as IBaseFilter, nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $6','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
   hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee3 as IBaseFilter, nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $7','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  try UDPCOmmandServer.SendBuffer(IP_BroadCast,UDPCommandServer.DefaultPort,ToBytes(1));
  except end;
  CheckDSError((SoundRender as IMediaFilter).GetSyncSource(RefClock));
  CheckDSError((FilterGraph1 as IMediaFilter).SetSyncSource(RefClock));
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  Button1.Caption:='Stop Record';
  FilterGraph1.Play;
  StaticText1.Caption:=ExtractFileName(FileName);
  GetDiskFreeSpaceEx(PChar('D:/'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
  DickSize:=FreeSize;
  Timer1.Enabled:=true;
end;


procedure TnMain.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var BLackCount:integer; //кол-во абсолютно чёрных пикселей
    Scaling:integer;
    n,m,c,d:integer;
    pc: TFColor;
    RGBGrey:byte;
    AllCount:integer;
begin
  BlackCount:=0;
  Scaling:=2;
  c:=0;  d:=0;
  AllCount:=0;
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  for n:=1 to (BWidth div Scaling)-1 do
    begin
      c:=0;
      for m := 1 to (BHeight div Scaling)-1 do
      begin
        if (n>=288) or (m>=384) then continue;
        pc:=FastIn.GetPixel(n*Scaling,m*Scaling);
        RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
        if RGBGrey=0 then Inc(BlackCount);
        inc(c);
        inc(AllCount);
      end;
      inc(d);
    end;
  if BlackCount=AllCount then  fl_Video:=false else fl_Video:=true;
end;

procedure TnMain.StartFilterGraph;
var i:integer;
    hr:HResult;
begin
  Timer1.Enabled:=false;
  FilterGraph1.Stop;
  Button1.Caption:='Start Record';
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  CapEnum:=TSysDevEnum.Create;
  FilterGraph1.Active := true;
  CapEnum.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if(CapEnum.CountFilters > 0) then
    for i:=0  to  CapEnum.CountFilters-1 do
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0))  and ((Pos('2', UpperCase(CapEnum.Filters[i].FriendlyName)) = 0)) then
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
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0))  and ((Pos('2', UpperCase(CapEnum.Filters[i].FriendlyName)) = 0))then
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
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
  //  iSetVideoFormat(25,720,576,0);
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,nil,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  CheckDSError((SoundRender as IMediaFilter).GetSyncSource(RefClock));
  CheckDSError((FilterGraph1 as IMediaFilter).SetSyncSource(RefClock));
  try UDPCOmmandServer.SendBuffer(IP_BroadCast,UDPCommandServer.DefaultPort,ToBytes(0));
  except end;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  StaticText1.Caption:='';
  StaticText2.Caption:='';
  FilterGraph1.Play;
end;

procedure TnMain.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var s:string;
    TotalSpace,FreeSpace:single;
begin
  with StringGrid1.Canvas do
  begin
    s:=StringGrid1.Cells[ACol,ARow];
    if ARow<>0 then TotalSpace:=HDDEnum[ARow].TotalSpace;
    if ARow<>0 then FreeSpace:=HDDEnum[ARow].FreeSpace;
    if TotalSpace<>0 then
    begin
      if (TotalSpace-FreeSpace)/TotalSpace<=0.95 then begin Brush.Color:=COLOR_Y; HDD_miss:=true;  end;
      if (TotalSpace-FreeSpace)/TotalSpace<=0.90  then begin Brush.Color:=COLOR_G; HDD_miss:=true;  end;
      if (TotalSpace-FreeSpace)/TotalSpace>=0.95 then begin Brush.Color:=COLOR_R; HDD_miss:=false; end;
    end;
    if (ACol=0) then Brush.Color:=Color_W;
    if (ARow=0) then Brush.Color:=clBtnFace;
    FillRect(Rect);
    Pen.Color:=clBlack;
    Font.Color:=clBlack;
    Font.Style:=[fsBold];
    TextOut(Rect.Left+2,Rect.Top+2,s);
  end;
end;


procedure TnMain.Timer1Timer(Sender: TObject);
var FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    FileSize:TLargeInteger;
begin
    if Button1.Caption='Start Record' then StaticText2.Caption:='';
    if Button1.Caption='Stop Record' then
    begin
    GetDiskFreeSpaceEx(PChar('D:/'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
    FileSize:=DickSize-FreeSize;
    fSize:=FileSize;
    StaticText2.Caption:='Size :'+FloattostrF(FileSize/1024/1024,ffFixed,12,2)+' Mb.';
    end;
end;

procedure TnMain.Timer2Timer(Sender: TObject);
begin
  fl_Synchro:=true;
end;

procedure TnMain.UDPCommandServerUDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
begin
  if (ABinding.PeerIP<>IP_SrvWSC1) and (ABinding.PeerIP<>IP_SrvWSC2) then exit;
  if Length(AData)>4 then exit;
  NumBort := AData[3] SHL 8 + AData[2];
  Aircraft:=AData[1];
  if Aircraft=255 then  Aircraft:=-1;  
  Edit3.Text:='  '+IntToStr(NumBort);
  case (AData[0] and $01) of
  0: if Button1.Caption='Start Record' then Button1.Click;
  1: if Button1.Caption='Stop Record' then Button1.Click;
  end;
  if fl_Synchro then
  begin
    WinExec(PChar('net time \\'+ABinding.PeerIP+' /set /yes'),SW_HIDE);
    fl_Synchro:=false;
  end;
end;

procedure TnMain.Bbt(Sender: TObject);
begin
  //создание активной директории заранее
  dir := 'D:\'+FormatDateTime('dd_mm_yy',now);
  if not DirectoryExists(dir) then fl_Folder:=CreateDir(dir) else fl_Folder:=true;
  if not fl_FOLDER then
  begin
    Application.MessageBox('Not possible create folder for record','System Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  if Button1.Caption='Start Record' then RecordFilterGraph
  else StartFilterGraph;
end;

procedure TnMain.FormActivate(Sender: TObject);
var
    Reg:TRegistry;
    Key:String;
    bol:Boolean;
begin
  try UDPCommandServer.Active:=true;
  except  end;
  //создание активной директории заранее
  bol:=true;
  dir := 'D:\'+FormatDateTime('dd_mm_yy',now);
  if not DirectoryExists(dir) then bol:=CreateDir(dir);
  if not Bol then
    Application.MessageBox('Not possible create folder for record','System Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
  fl_Folder:=BOL;
  //накстройи ffdshow
  Reg:=TRegistry.Create;
     try
       Reg.RootKey := HKEY_CURRENT_USER;
       Key := 'Software\GNU\ffdshow_enc';
       if Reg.OpenKey(Key, True) then
       begin
         Reg.WriteInteger('CodecId',400);        //XViD
         Reg.WriteInteger('Fourcc',1145656920);  //XVid
         Reg.WriteInteger('Mode',0);             //Average bitrate
         Reg.WriteInteger('Bitrate1000',10000);  //Bitrate
         Reg.WriteInteger('Gray',0);             //No Gray
         Reg.WriteInteger('Interlacing',0);      //No Interlace
         Reg.WriteInteger('Max_key_interval',27);//Max I Frame (default)
         Reg.WriteInteger('Min_key_interval',1); //Min I Frame (default)
         Reg.CloseKey;
       end;
     finally
     Reg.Free;
     end;
  WinExec(PChar('net time \\'+IP_SrvWSC1+' /set /yes'),SW_HIDE);
  VideoWindow1.FullScreen:=true;
  StartFilterGraph;
end;

procedure TnMain.FormCreate(Sender: TObject);
var
  C:char;
  FreeBytesAvailableToCaller:TLargeInteger;
  TotalSize:TLargeInteger;
  FreeSize:TLargeInteger;
  i,k:integer;
  IP: array [1..2] of String;
  str:string;
  TotalSpace,FreeSpace:single;
begin
  Height:=Screen.Monitors[0].Height;
  Width:=Screen.Monitors[0].Width;
  Top:=0;
  Left:=0;
  HostList.ParamByName('Device_ID').Value:=1;
  try HostList.Open;
    IP_SrvWSC1:=HostListIP1.Value;
    IP_SrvWSC2:=HostListIP2.Value;
    HostList.Close;
  except
    IP_SrvWSC1:= '192.168.1.1';
    IP_SrvWSC2:= '192.168.1.129'
  end;
  HostList.ParamByName('Device_ID').Value:=16;
  try HostList.Open;
    IP_SrvVRD1:=HostListIP1.Value;
    IP_SrvVRD2:=HostListIP2.Value;
    HostList.Close;
  except
    IP_SrvVRD1:= '192.168.1.7';
    IP_SrvVRD2:= '192.168.1.135';
  end;
  Shape3.Brush.Color:=Color_R;
  FastIn:=TFastDib.Create;
  HDDCount:=0;
  // получение списка активного оборудования
  for c in ['A' .. 'Z'] do
    if GetDriveType(PChar(c+':\'))=DRIVE_FIXED then
    begin
      inc(HDDCount);
      GetDiskFreeSpaceEx(PChar(c+':\'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
      HDDEnum[HDDCount].HDD_NAME:=c;
      HDDEnum[HDDCount].TotalSpace:=TotalSize/1024/1024;//в метрах
      HDDEnum[HDDCount].FreeSpace:=FreeSize/1024/1024;
    end;
  StringGrid1.RowCount:=HDDCount+1;
  StringGrid1.Height:=(StringGrid1.DefaultRowHeight+2)*(HDDCount+1);
  StringGrid1.Cells[0,0]:=' HDD';
  StringGrid1.Cells[1,0]:=' USE [%]';
  for i:=1 to HDDCount do
  begin
    StringGrid1.Cells[0,i]:=' '+HDDEnum[i].HDD_NAME+':\';
    TotalSpace:=HDDEnum[i].TotalSpace;
    FreeSpace:=HDDEnum[i].FreeSpace;
    if TotalSpace<>0 then
       StringGrid1.Cells[1,i]:=FloatToStrF((TotalSpace-FreeSpace)/TotalSpace*100,ffFixed,6,2);
  end;
  // проверка активного сетевого оборудования на соответствие базе
  IP[1]:='';
  IP[2]:='';
  IPAddrMon.Active:=true;
  IPAddrMon.Busy:=true;
  for i:=0 to IPAddrMon.IPAddresses.Count-1 do
    IP[i+1]:=TRIM(IPAddrMon.IPAddresses.Strings[i]);
  LANCount:=IPAddrMon.IPAddresses.Count;
  IPAddrMon.Active:=false;
  IPAddrMon.Busy:=false;
  if LANCount<2 then
  begin
    if (IP[1]=IP_SrvVRD1) and (IP[2]='') then
    str:='Available network card.'#13#10'The network card with IP "'+(IP_SrvVRD2)+ '" is switched - off or does not work.' ;
    if (IP[1]=IP_SrvVRD2) and (IP[2]='') then
    str:='Available network card.'#13#10'The network card with IP "'+(IP_SrvVRD1)+ '" is switched - off or does not work.';
    if (IP[1]='') or (IP[2]='') then
    str:='Available local network.'#13#10'The active network cards not found.';
  //  Application.MessageBox(PAnsiChar(Str),'Socket Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
  end;
  if ((IP[1]<>IP_SrvVRD1) and (IP[1]<>IP_SrvVRD2) and (IP[1]<>'')) or
     ((IP[2]<>IP_SrvVRD1) and (IP[2]<>IP_SrvVRD2) and (IP[2]<>'')) then
      Application.MessageBox('Invalid network configuration.'#13#10'The possible reason of a mistake: one or more network cards have unknown IP.','Socket Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
  LANCount:=2;
  LanEnum[1].LanIP:=IP_SrvVRD1;
  LanEnum[1].State:=true;
  LanEnum[2].LanIP:=IP_SrvVRD2;
  LanEnum[2].State:=true;
  EventWS1:=TEvent.Create(nil,false,false,'');
  EventWS2:=TEvent.Create(nil,false,false,'');
  hWS1:=TWSL.Create(true);
    hWS1.Priority:=tpLowest;
    hWS1.FreeOnTerminate:=true;
    hWS1.IP_Srv:=IP_SrvWSC1;
    hWS1.Port:=9000;
    hWS1.WS:='VRD1';
    hWS1.Resume;
    hWS2:=TWSL.Create(true);
    hWS2.Priority:=tpLowest;
    hWS2.FreeOnTerminate:=true;
    hWS2.IP_Srv:=IP_SrvWSC2;
    hWS2.Port:=9000;
    hWS2.WS:='VRD2';
    hWS2.Resume;

  hPing:=TPing.Create(True);
  hPing.Priority:=tpLowest;
  hPing.FreeOnTerminate:=True;
  hPing.IP_1:=IP_SrvVRD1;
  hPing.IP_2:=IP_SrvVRD2;
  hPing.IP_3:=IP_SrvWSC1;
  hPing.IP_4:=IP_SrvWSC2;
  hPing.Resume;
  WinExec(PChar('net time \\'+IP_SrvWSC1+' /set /yes'),SW_HIDE);
  //получить список ЛА
   LASetup.Open;
   i:=0;
   while not LASetup.Eof do
   begin
     Inc(i);
     LASetup.Next;
   end;
   SetLength(LASet,i);
   LASetup.First;
   k:=0;
   while (not LASetup.Eof) and (k<i) do
   begin
     LASet[k].LA_ID :=LASetupLA_ID.Value;
     LASet[k].Name  :=LASetupmName.Value;
     LASet[k].XE    :=LASetupXE.Value;
     LASet[k].YE    :=LASetupYE.Value;
     LASet[k].ZE    :=LASetupZE.Value;
     LASet[k].XG    :=LASetupXG.Value;
     LASet[k].YG    :=LASetupYG.Value;
     LASet[k].ZG    :=LASetupZG.Value;
     LASet[k].XF    :=LASetupXF.Value;
     LASet[k].YF    :=LASetupYF.Value;
     LASet[k].ZF    :=LASetupZF.Value;
     Inc(k);
     LASetup.Next;
  end;
  LASetup.Close;
  Aircraft:=-1;
  
end;

procedure TnMain.FormDestroy(Sender: TObject);
begin
  EventWS1.Free;
  EventWS2.Free;
  if Assigned(FilterGraph1) then
  begin
    FilterGRaph1.Stop;
    FilterGraph1.Active:=False;
    FilterGraph1.Free;
  end;
  FastIn.Destroy;
end;

function TnMain.iSetVideoFormat(FramesPerSecond,FrameWidth,FrameHeight,viGde: Integer):Integer;
var
  iamStrConf: IAMStreamConfig;
  pmt: PAMMediaType;
  hr: HRESULT;
begin
  iamStrConf := nil;
  pmt := nil;
  hr:=1;
  try
    if(viGde = 0) then
      hr := (FilterGraph1 as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, CaptureFilter as IBaseFilter, IID_IAMStreamConfig, iamStrConf)
    else
      if(viGde = 1) then
        hr := (FilterGraph1 as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Video, CaptureFilter as IBaseFilter, IID_IAMStreamConfig, iamStrConf);

    if (hr <> s_ok) then
    begin
      Result:=1; Exit;
    end;
    if (not Assigned(iamStrConf)) then
    begin
      iamStrConf:=nil;
      Result:=1;
      Exit;
    end;
    iamStrConf.GetFormat(pmt);
    if not Assigned(pmt) then
    begin
      iamStrConf:=nil;
      Result:=1;
      Exit;
    end;
    if pmt.cbFormat <> sizeOf(TVideoInfoHeader) then
    begin
      iamStrConf := nil;
      Result:=1;
      DeleteMediaType(pmt);
      Exit;
    end;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biWidth := FrameWidth;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biHeight := FrameHeight;
    PVideoInfoHeader(pmt^.pbFormat)^.bmiHeader.biBitCount:= 16;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.AvgTimePerFrame := 10000000 div framesPerSecond;
    with PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader do
      pmt^.lSampleSize := ((biWidth + 3) and (not (3))) * biHeight * biBitCount shr 3;
            PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biSizeImage := pmt^.lSampleSize;
    hr := iamStrConf.SetFormat(pmt^);
    if(hr <> s_ok) then
    begin
      Result:=1;
      iamStrConf := nil;
      if Assigned(pmt) then DeleteMediaType(pmt);
      Exit;
    end;
    Result := 0;
  except on E : Exception do
    begin
      Result:=1;
    end;
  end;
  iamStrConf := nil;
  if Assigned(pmt) then DeleteMediaType(pmt);
end;

end.
