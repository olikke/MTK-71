unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSPack, ExtCtrls, XPMan, MyPanel, XiPanel, StdCtrls, Buttons, Grids,
  XiButton,Container_TM2322,Global,SyncObjs,DsUtil,DirectShow9,ActiveX,FastDIB,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,idGlobal,idSocketHandle;

type TVRDState = (IAmRecord,IAmPlay,IAmFree);

type
  TfMain = class(TForm)
    Panel1: TPanel;
    XPManifest1: TXPManifest;
    i1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    WSCPanel: TPanel;
    Panel3: TPanel;
    i2: TImage;
    Label5: TLabel;
    Panel4: TPanel;
    Label6: TLabel;
    Edit1: TEdit;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Edit4: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    i5: TImage;
    Label3: TLabel;
    Panel10: TPanel;
    StringGrid2: TStringGrid;
    Panel11: TPanel;
    Panel12: TPanel;
    i6: TImage;
    Label4: TLabel;
    Panel13: TPanel;
    StringGrid1: TStringGrid;
    FilterGraph1: TFilterGraph;
    Panel17: TPanel;
    VideoWindow1: TVideoWindow;
    SampleGrabber: TSampleGrabber;
    UDPServer1: TIdUDPServer;
    UDPServer2: TIdUDPServer;
    Shape1: TShape;
    Label9: TLabel;
    Shape2: TShape;
    XiButton1: TXiButton;
    XiButton2: TXiButton;
    OpenDialog1: TOpenDialog;
    procedure FilterGraph1GraphComplete(sender: TObject; Result: HRESULT;
      Renderer: IBaseFilter);
    procedure XiButton2Click(Sender: TObject);
    procedure UDPServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure XiButton1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure FormCreate(Sender: TObject);
    procedure VideoWindow1DblClick(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MAIN;
    procedure SetValues;
    procedure StartFilterGraph;
    procedure RecordFilterGraph;
    function  PlayFilterGraph(FilePlay:string):boolean;
  private
    First    :boolean;
    Second   :boolean;
    //IamRecord:boolean;
    VRDState  :TVRDState;
    fHDDCount:byte;
  public
    { Public declarations }
  end;

const
  CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
  CLSID_Decklink_SDI_Video   : TGUID = '{CE3FF814-04C1-4827-9F18-426203E9B1B3}';
  CLSID_Decklink_SDI_Audio   : TGUID = '{1BCC3EF4-724F-4A45-B61D-8D4BBF32C5BF}';
  CLSID_External_SDI_Video   : TGUID = '{16A2E3A5-0C3E-4484-9E78-3ABF2FBE3ACE}';
  CLSID_External_SDI_Audio   : TGUID = '{8D09D460-D361-40BD-A2D0-7E094B4D56FA}';
  CLSID_ClockInFilter        : TGUID = '{7D7606FC-DF86-41E8-9067-CB6304C0AD1B}';
  CLSID_FfdshowVideoEncoder  : TGUID = '{4DB2B5D9-4556-4340-B189-AD20110D953F}';
  CLSID_ColorSpaceConverter  : TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';
  CLSID_VideoDecoder         : TGUID = '{04FE9017-F873-410E-871E-AB91661A4EF7}';
var
  fMain: TfMain;
  refClock:iReferenceClock;
  CaptureVideo :IBaseFilter   = nil;
  CaptureAudio :IBaseFilter   = nil;
  VideoFilter  :IBaseFilter   = nil;
  RenderVideo  :IBaseFilter   = nil;
  RenderAudio  :IBaseFilter   = nil;
  SoundRender  :IBaseFilter   = nil;
  ISampleGrabb :ISampleGrabber= nil;
  ClockInFilter:IBaseFilter   = nil;
  SmartTee     :IBaseFilter   = nil;
  SmartTee2    :IBaseFilter   = nil;
  VideoEncoder :IBaseFilter   = nil;
  CSC          :IBaseFilter   = nil;
  VideoDecoder :IBaseFilter   = nil;
  VideoEncoder2:IBaseFilter   = nil;
  SourceFile   :IBaseFilter   = nil;
  MediaType    :_AMMediaType;
  pvi          :PvideoInfoHeader;
  FastIn       :TFastDib;
  dir          :string;
  FileName     :WideString;
  Multiplexer  :IBaseFilter;
  Writer       :IFileSinkFilter;
  BWidth, BHeight,MBitCount:integer;
  fl_Video     :boolean = false;
  DickSize     :TLargeInteger;

implementation

{$R *.dfm}

procedure TfMain.SetValues;
var i:integer;
var FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    FileSize:TLargeInteger;
    str     :string;
    comm    :int64;
begin
  if First then
  begin
    First                 :=false;
    fHDDCount             :=TM2408.HDDCount;
    StringGrid1.RowCount  :=fHDDCount+1;
    StringGrid1.Height    :=StringGrid1.DefaultRowHeight*StringGrid1.RowCount+10;
    Panel11.Height        :=StringGrid1.Height+3+Panel12.Height;
    Panel5.Height         :=Panel11.Top+Panel11.Height+40;
    StringGrid2.Cells[0,1]:=TM2408.IP1;
    StringGrid2.Cells[0,2]:=TM2408.IP2;
    StringGrid2.Cells[0,3]:=TM2408.IP3;
    StringGrid2.Cells[0,4]:=TM2408.IP4;
    exit;
  end;
  if Second then
  begin
    Second:=false;
    if not TM2408.Exh1 and not TM2408.Exh2 then
    Application.MessageBox('The network does not work'+#10#13+'Manual mode of device adjustment switch on','NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK) else
    begin
      if TM2408.Exh1 then UDPServer1.Active:=true
      else begin
        str:='The network card with IP "'+TM2408.IP1+'" does not work';
        Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      end;
      if TM2408.Exh2 then UDPServer2.Active:=true
      else begin
        str:='The network card with IP "'+TM2408.IP2+'" does not work';
        Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      end;
    end;
  end;
  for i:=1 to 4 do
  StringGrid2.Cells[1,i]:=TM2408.Text(i);
  for i:=1 to FHDDCount do
  begin
    StringGrid1.Cells[0,i]:=TM2408.HDDChar(i)+':\';
    StringGrid1.Cells[1,i]:=TM2408.HDDTotal(i);
    StringGrid1.Cells[2,i]:=TM2408.HDDFree(i);
    StringGrid1.Cells[3,i]:=TM2408.HDDUse(i);
  end;
  if fl_Video then
  begin
    Shape2.Brush.Color:=clLime;
  end else
  begin
    Shape2.Brush.Color:=clRed;
  end;
  Shape1.Brush.Color:=TM2408.Color;
  if  VRDState=IAmRecord then
  begin
    GetDiskFreeSpaceEx(PChar('D:/'),
                       FreeBytesAvailableToCaller,
                       Totalsize,
                      @FreeSize);
    if DickSize=0 then begin DickSize:=FreeSize; FileSize:=0; end
                  else FileSize:=DickSize-FreeSize;
    Edit4.Text:='  SIZE : '+FloatToStrF(FileSize/1024/1024,ffFixed,12,2)+' Mb.';
  end;
  case INTEGER(VRDState) of
    INTEGER(IAmRecord): Comm:=FileSize;
    INTEGER(IAmPlay):   Comm:=-2;
    INTEGER(IAmFree):   Comm:=-1;
  end;
  if UDPServer1.Active then
  try UDPServer1.SendBuffer(IP23221,UDPServer1.DefaultPort,ToBytes(comm));
  except end;
  if UDPServer2.Active then
  try UDPServer2.SendBuffer(IP23222,UDPServer2.DefaultPort,ToBytes(comm));
  except end;
  INC(WSCPacket.Numb);
  WSCPacket.VideoExh  :=fl_Video;
  WSCPacket.LAN1      :=TM2408.Exh1;
  WSCPacket.LAN2      :=TM2408.Exh2;
  WSCPacket.LAN3      :=TM2408.Exh3;
  WSCPacket.LAN4      :=TM2408.Exh4;
  WSCPacket.HDDCount  :=fHDDCount;
  for i:=0 to fHDDCount-1 do
  begin
    if i>9 then continue;
    WSCPacket.HDD[i].Name :=TM2408.HDDChar(i);
    WSCPacket.HDD[i].Total:=TM2408.HDDT(i);
    WSCPacket.HDD[i].Free :=TM2408.HDDF(i);
  end;
  SetLength(str,SizeOf(WSCPacket));
  Move(WSCPacket,str[1],SizeOF(WSCPacket));
  if UDPServer1.Active then
  try UDPServer1.Send(IP23221,UDPServer1.DefaultPort,str);
  except end;
  if UDPServer2.Active then
  try UDPServer2.Send(IP23222,UDPServer2.DefaultPort,str);
  except end;
end;

procedure TfMain.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TfMain.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
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
  end;end;

procedure TfMain.UDPServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var CountOfCommand:byte;
    str:string;
begin
  CountOfCommand:=Length(AData);
  if CountOfCommand=1 then
  case AData[0] of
    0: if VRDState=IAmRecord then XiButton1Click(self);
    1: if VRDState=IAmFree then XiButton1Click(self);
  end else
  begin
    SetLength(str,CountOfCommand);
    Move(AData[0],str[1],CountOfCommand);
    Edit1.Text:=str;
  end;
end;

procedure TfMain.VideoWindow1DblClick(Sender: TObject);
begin
VideoWindow1.FullScreen:=not VideoWindow1.FullScreen;
end;

procedure TfMain.XiButton1Click(Sender: TObject);
var fl_FOLDER:boolean;
begin
  //создание активной директории заранее
  dir := 'D:\'+FormatDateTime('dd_mm_yy',now);
  if not DirectoryExists(dir) then fl_Folder:=CreateDir(dir) else fl_Folder:=true;
  if not fl_FOLDER then
  begin
    Application.MessageBox('Not possible create folder for record','System Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  if Edit1.Text='' then Edit1.Text:='  Unknown';
  FileName:=(dir+'\'+TRIM(Edit1.Text)+'_'+FormatDateTime('hhnnss',now)+'.avi');
  Edit2.Text:='  '+FileName;
  DickSize:=0;
  if VRDState=IAmFree then RecordFilterGraph else
  if VRDState=IAmRecord then StartFilterGraph;
end;

procedure TfMain.XiButton2Click(Sender: TObject);
begin
  if XiButton2.Tag=0 then
  begin
    if not OpenDialog1.Execute then exit;
    if not PlayFilterGraph(openDialog1.FileName) then StartFilterGraph else
    begin
      XiButton1.Enabled:=false;
      XiButton2.Caption:='STOP';
      XiButton2.Tag    :=1;
    end;
  end else
  begin
    XiButton2.Tag:=0;
    XiButton1.Enabled:=true;
    XiButton2.Caption:='PLAY';
    StartFilterGraph;
  end;
end;

function TfMain.PlayFilterGraph(FilePlay:string):boolean;
var i:integer;
    hr:HResult;
    PinList:TPinList;
begin
  result:=false;
  VRDState:=IAmPlay;
  FilterGraph1.Stop;
  if Assigned(CaptureVideo) then begin
    PinList:= TPinList.Create(CaptureVideo);
    for i := 0 to PinList.Count - 1 do
      PinList[i].Disconnect;
    end;
  CaptureVideo:=nil;
  PinList.Free;
  if Assigned(CaptureAudio) then begin
    PinList:= TPinList.Create(CaptureAudio);
    for i := 0 to PinList.Count - 1 do
      PinList[i].Disconnect;
    end;
  CaptureAudio:=nil;
  PinList.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active:=true;
  hr := CoCreateInstance(CLSID_External_SDI_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, RenderVideo);
  if FAILED(hr) then begin
     Application.MessageBox('Error load Render video','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(RenderVideo, 'Render Video');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect Render Video','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_External_SDI_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, RenderAudio);
  if FAILED(hr) then begin
     Application.MessageBox('Error load Render audio','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(RenderAudio, 'Render Audio');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect Render Audio','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
    hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee, 'SmartTee');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoEncoder, 'VideoEncoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoEncoder2, 'VideoEncoder2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddSourceFilter(StringToOleStr(FilePLay), '', SourceFile);
  if FAILED(hr) then begin
    Application.MessageBox('Error load Source Filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  with FilterGraph1 as ICaptureGraphBuilder2 do
  begin
    hr:=RenderStream(nil, nil, SourceFile as IBaseFilter,nil,SmartTee as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil,SmartTee as IBaseFilter, VideoEncoder as IBaseFilter,SampleGrabber as iBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil,SampleGrabber as iBaseFilter,nil,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $3','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil,SmartTee as IBaseFilter, VideoEncoder2 as IBaseFilter,RenderVideo as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $4','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee2, 'SmartTee2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  with FilterGraph1 as ICaptureGraphBuilder2 do
  begin
    hr:=RenderStream(nil, nil, SourceFile as IBaseFilter,SmartTee2 as iBaseFilter,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SmartTee2 as iBaseFilter,nil,RenderAudio as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $6','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  FilterGraph1.Play;
  result:=true;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  FastIn:=TFastDib.Create;
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  if Assigned(FilterGraph1) then
  begin
    FilterGRaph1.Stop;
    FilterGraph1.Active:=False;
    FilterGraph1.Free;
  end;
  FastIn.Destroy;
  TM2408.Terminate;
  StopEvent2408.SetEvent;
  TM2408.WaitFor;
  TM2408:=nil;
  StopEvent2408.Free;
  if UDPServer1.Active then UDPServer1.Active:=false;
  if UDPServer2.Active then UDPServer2.Active:=false;
end;

procedure TfMain.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var BLackCount:integer; //кол-во абсолютно чёрных пикселей
    Scaling:integer;
    n,m,c,d:integer;
    pc: TFColor;
    RGBGrey:byte;
    AllCount:integer;
begin
  BlackCount:=0;
  Scaling:=4;
  c:=0;  d:=0;
  AllCount:=0;
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  for n:=1 to (BWidth div Scaling)-1 do
    begin
      c:=0;
      for m := 1 to (BHeight div Scaling)-1 do
      begin
        if (n>=576 div scaling) or (m>=768 div scaling) then continue;
        pc:=FastIn.GetPixel(n*Scaling,m*Scaling);
        RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
        if RGBGrey=0 then Inc(BlackCount);
        inc(c);
        inc(AllCount);
      end;
      inc(d);
    end;
  if BlackCount=AllCount then  fl_Video:=false else fl_Video:=true;
  TM2408.Video:=fl_Video;
end;

procedure TfMain.ServMsd(var Msg: TMessage);
begin
  case Msg.WParam of
    0:  SetValues;
  end;
end;

procedure TfMain.FilterGraph1GraphComplete(sender: TObject; Result: HRESULT;
  Renderer: IBaseFilter);
begin
  XiButton2Click(self);
end;

procedure TfMain.FormActivate(Sender: TObject);
var i:integer;
    im:TImage;
begin
  with i2.Canvas do
  begin
    Brush.Color:=clBlack;
    FillRect(i1.ClientRect);
  end;
  for i:=2 to 6 do
  begin
    im:=fMain.FindComponent('i'+IntToStr(i)) as TImage;
    if im=nil then continue;
    with im.Canvas do
    begin
      Brush.Color:=clMedGray;
      FillRect(im.ClientRect);
    end;
  end;
  StringGrid1.ColWidths[0]:=35;
  StringGrid1.ColWidths[1]:=60;
  StringGrid1.ColWidths[2]:=60;
  StringGrid1.ColWidths[3]:=60;
  StringGrid1.Cells[0,0]:='HDD';
  StringGrid1.Cells[1,0]:='Total[GB]';
  StringGrid1.Cells[2,0]:='Free [GB]';
  StringGrid1.Cells[3,0]:='Use [%]';
  StringGrid2.Cells[0,0]:=' IP-address';
  StringGrid2.Cells[1,0]:=' State';
  First    :=true;
  Second   :=true;
  StopEvent2408:=TEvent.Create(nil,false,false,'StopEvent2408');
  TM2408 :=TTM2322.Create(StopEvent2408,
                          IP24081,
                          IP24082,
                          IP24083,
                          IP24084);
  TM2408.FormHandle:=fMain.Handle;
  WSCPacket.Numb:=0;
  VideoWindow1.FullScreen:=true;
  StartFilterGraph;
end;

procedure TfMain.RecordFilterGraph;
var hr:HResult;
    PinList:TPinList;
    i:integer;
begin
  FilterGraph1.Stop;
  VRDState:=IAmRecord;
  XiButton1.Caption:='STOP RECORD';
  if Assigned(RenderVideo) then begin
    PinList:= TPinList.Create(RenderVideo);
    for i := 0 to PinList.Count - 1 do
      PinList[i].Disconnect;
    end;
  RenderVideo:=nil;
  PinList.Free;
  if Assigned(RenderAudio) then begin
    PinList:= TPinList.Create(RenderAudio);
    for i := 0 to PinList.Count - 1 do
      PinList[i].Disconnect;
    end;
  RenderAudio:=nil;
  PinList.Free;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  FilterGraph1.Active := true;
  CaptureVideo:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureVideo);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureVideo, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect "DeckLink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  CaptureAudio:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureAudio);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureAudio, 'DeckLink AudioCapture');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_ClockInFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, ClockInFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load ClockInFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(ClockInFilter, 'ClockInFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect ClockInFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee, 'SmartTee');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee2, 'SmartTee2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowVideoEncoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoEncoder, 'VideoEncoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(CSC, 'CSC');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=SetOutputFileName(MEDIASUBTYPE_Avi, PWideChar(FileName), multiplexer, Writer);


    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureVideo as IBaseFilter,VideoFilter as IBaseFilter,SmartTee as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SmartTee as IBaseFilter,nil,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,CSC as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $3','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;

    hr:=RenderStream(nil, nil, SmartTee as IBaseFilter,ClockInFilter as IBaseFilter,VideoEncoder as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $4','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, VideoEncoder as IBaseFilter,nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;


    hr:=RenderStream(nil, @MEDIATYPE_Audio, CaptureAudio as IBaseFilter,nil,SmartTee2 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $6','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee2 as IBaseFilter, nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $7','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
   hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee2 as IBaseFilter, nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $8','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  FilterGraph1.Play;
  if UDPServer1.Active then
  try UDPServer1.SendBuffer(IP23221,UDPServer1.DefaultPort,ToBytes(1));
  except end;
  if UDPServer2.Active then
  try UDPServer2.SendBuffer(IP23222,UDPServer2.DefaultPort,ToBytes(1));
  except end;
end;

procedure TfMain.StartFilterGraph;
var
  hr     :HResult;
  PinList:TPinList;
  i      :integer;
begin
//HKEY_CURRENT_USER\Software\GNU\ffdshow_raw\default
  FilterGraph1.Stop;
  VRDState:=IAmFree;
  XiButton1.Caption:='START RECORD';
  FilterGraph1.ClearGraph;
  RenderAudio:=nil;
  RenderVideo:=nil;
  FilterGraph1.Active:=false;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := true;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureVideo);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureVideo, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect "DeckLink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureAudio);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureAudio, 'DeckLink AudioCapture');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureVideo as IBaseFilter,VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,nil,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, CaptureAudio as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  Edit2.Text:='';
  Edit4.Text:='';
  FilterGraph1.Play;
  if UDPServer1.Active then
  try UDPServer1.SendBuffer(IP23221,UDPServer1.DefaultPort,ToBytes(0));
  except end;
  if UDPServer2.Active then
  try UDPServer2.SendBuffer(IP23222,UDPServer2.DefaultPort,ToBytes(0));
  except end;
end;

end.
