unit main;

{$IFDEF VER150}
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CAST OFF}
{$ENDIF}

interface
uses BaseClass, ActiveX, DirectShow9, Windows,FastDib,SysUtils,Classes,FastFx,PropertyPages,Graphics,SyncObjs,IniFiles;

const
  CLSID_MyClass : TGUID = '{7D7606FC-DF86-41E8-9067-CB6304C0AD1B}';

  MyPinTypes : TRegPinTypes =
    (clsMajorType: @MEDIATYPE_NULL;
     clsMinorType: @MEDIASUBTYPE_NULL);

  MyPins : array[0..1] of TRegFilterPins =
    ((strName: 'In'; bRendered: FALSE; bOutput: FALSE; bZero: FALSE; bMany: FALSE; oFilter: nil; strConnectsToPin: nil; nMediaTypes: 1; lpMediaType: @MyPinTypes),
     (strName: 'Out'; bRendered: FALSE; bOutput: TRUE; bZero: FALSE; bMany: FALSE; oFilter: nil; strConnectsToPin: nil; nMediaTypes: 1; lpMediaType: @MyPinTypes));

type
  TMyClass = class(TBCTransInPlaceFilter,ISpecifyPropertyPages)
    function Transform(Sample: IMediaSample): HRESULT; override;
    function CheckInputType(mtin: PAMMediaType): HRESULT; override;
    procedure Graphic(Src,Image:TFastDIB;xx,yy,sx,sy:integer);
    public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
    function  GetPages(out pages: TCAGUID): HResult; stdcall;
  end;



var
    Width,Height,BitCount:integer;
    Fast,FastText:TFastDib;
    XStart:integer=100;
    YStart:integer=100;
    XWidth:integer=100;
    YHeight:integer=25;
    MaxWidth:integer=150;
    MaxHeight:integer=45;
    mFont:TFont;
    cs_Crit:TCriticalSection;
    FontColor:TFColor=(b:$00;g:$FF;r:$00);
    Background:TFColor=(b:$00;g:$00;r:$00);
    fl_Back:boolean=false;
    FilterINI:TIniFile;

implementation

procedure TMyClass.AfterConstruction;
var sr: TSearchRec;
    PS:TFileStream;
begin
  cs_Crit:=TCriticalSection.Create;
  mFont:=TFont.Create;
  Fast:=TFastDib.Create;
  FastText:=TFastDib.Create;
  FastText.LoadFromFile('C:\WINDOWS\system32\ClockInFilter.bmp');
  MaxWidth:=FastText.Width;
  MaxHeight:=FastText.Height;
  if FindFirst('C:\WINDOWS\system32\ClockInFilter.ini', faAnyFile, sr) = 0 then
  begin
    //читаем файл инициализации
    FilterINI := TIniFile.Create('C:\WINDOWS\system32\ClockInFilter.ini');
    XStart:=FilterINI.ReadInteger('Marker position','XStart',100);
    YStart:=FilterINI.ReadInteger('Marker position','YStart',100);
    XWidth:=FilterINI.ReadInteger('Marker size',    'Width', 100);
    YHeight:=FilterINI.ReadInteger('Marker size',    'Height',25);
    mFont.Name:=FilterINI.ReadString ('Font','Name','Arial');
    mFont.Height:=FilterINI.ReadInteger('Font','Height',18);
    mFont.Color:=FilterINI.ReadInteger('Font','Color',$00FF00);
    if FilterINI.ReadString ('Background ','Visible','true')='true' then fl_Back:=true else fl_Back:=false;
    Background:=IntToColor(StrToInt(FilterINI.ReadString('Background ','Color','FFFFFF')));
    FilterINI.Free;
  end else
  begin
    mFont.Name:='arial';
    mFont.Size:=18;
    mFont.Color:=$00FF00;
  end;
  FastText.SetFont(mFont.Name,mFont.Size);
  FastText.SetTextColor(mFont.Color);
  FastText.SetTransparent(true);
  FastText.SetBkColor(clBlack);
end;

procedure TMyClass.BeforeDestruction;
var sr: TSearchRec;
    PS:TFileStream;
begin
  Fast.Free;
  FastText.Free;
  cs_Crit.Free;
end;

function TMyClass.CheckInputType(mtin: PAMMediaType): HRESULT;
var pvi:PvideoInfoHeader;
begin
  pvi:=mtin.pbFormat;
  Width:=pvi.bmiHeader.biWidth;
  Height:=pvi.bmiHeader.biHeight;
  BitCount:=pvi.bmiHeader.biBitCount;
  if BitCount=32 then
  result := S_OK  else
  result := VFW_E_TYPE_NOT_ACCEPTED;
end;

function TMyClass.Transform(Sample: IMediaSample): HRESULT;
var SP:PByte;
begin
  cs_Crit.Enter;
  FLock.Lock;
  Sample.GetPointer(SP);
  Fast.SetInterface(SP,Width,Height,BitCount,8,8,8);
  FastText.Clear(BackGround);
  FastText.TextOut(0,(abs(YHeight)-abs(mFont.size)) div 2,FormatDateTime('hh:nn:ss.zzz',Time));
  Graphic(Fast,FastText,XStart,YStart,XStart+XWidth,YStart+YHeight);
  Result := S_OK;
  FLock.UnLock;
  cs_Crit.Leave;
end;

procedure TMyClass.Graphic(Src: TFastDIB; Image: TFastDIB; xx:integer; yy:integer; sx:integer; sy:integer);
var
  x,y: Integer;
  pT   :TFColor;
begin
  if Height<0 then
  if not fl_Back then
  for y:=Image.AbsHeight-1 downto 0 do
    for x:=0 to Image.Width-1 do
    begin
      pT:=Image.GetPixel(Image.AbsHeight-y-1,x);
      if (pT.r<>BackGround.r) or (pT.g<>BackGround.g) or (pT.b<>BackGround.b) then
      Src.SetPixel(yy+y,xx+x,FontColor);
    end
  else
  for y:=YHeight-1 downto 0 do
    for x:=0 to XWidth-1 do
    begin
      pT:=Image.GetPixel(Image.AbsHeight-y-1,x);
      Src.SetPixel(yy+y,xx+x,pT);
    end;
  if Height>0 then
  if not fl_Back then
  for y:=0 to Image.AbsHeight-1 do
    for x:=0 to Image.Width-1 do
    begin
      pT:=Image.GetPixel(Image.AbsHeight-y-1,x);
      if (pT.r<>BackGround.r) or (pT.g<>BackGround.g) or (pT.b<>BackGround.b) then
      Src.SetPixel(Height-yy-y,xx+x,FontColor);
    end
  else
  for y:=0 to YHeight-1 do
    for x:=0 to XWidth-1 do
    begin
      pT:=Image.GetPixel(Image.AbsHeight-y-1,x);
      Src.SetPixel(Height-yy-y,xx+x,pT);
    end;

end;

function TMyClass.GetPages(out pages: TCAGUID): HResult;
begin
    Pages.cElems := 1;
    Pages.pElems := CoTaskMemAlloc(sizeof(TGUID));
    if (Pages.pElems = nil) then
      begin
        result := E_OUTOFMEMORY;
        exit;
      end;
   Pages.pElems^[0] := CLSID_MyPropertyPage;
   result := NOERROR;
end;

initialization
  TBCClassFactory.CreateFilter(TMyClass, 'ClockInFilter', CLSID_MyClass,
    CLSID_LegacyAmFilterCategory, MERIT_DO_NOT_USE, 2, @MyPins);
end.
