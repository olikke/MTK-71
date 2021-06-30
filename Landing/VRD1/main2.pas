unit main;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DSPack, DSUtil,DirectShow9,StdCtrls, ExtCtrls, Menus;

type
  TnMain = class(TForm)
    VideoWindow1: TVideoWindow;
    FilterGraph1: TFilterGraph;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    CaptureFilter: TFilter;
    Options1: TMenuItem;
    VideoCaptureFilter1: TMenuItem;
    procedure VideoCaptureFilter1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure SelectDevice(sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    nMain: TnMain;
    hr:HResult;
    CapEnum:TSysDevEnum;
    CaptureFilter:IBaseFilter;

implementation

{$R *.dfm}

procedure TnMain.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TnMain.FormActivate(Sender: TObject);
var i:integer;
    It:TMenuItem;
begin
 CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
 for i := 0 to CapEnum.CountFilters - 1 do
 begin
    It:=TMenuItem.Create(N1);
    It.Tag:=i;
    It.OnClick:=SelectDevice;
    It.Caption:=(CapEnum.Filters[i].FriendlyName+' '+IntToStr(i+1));
    N1.Add(It);
 end;
 It:=TMenuItem.Create(N1);
 It.Tag:=50;
 It.Caption:='EXIT';
 It.OnClick:=Exit1Click;
 N1.Add(It);
 for i := 0 to CapEnum.CountFilters - 1 do
 begin
    if (Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0) then
    begin
      FilterGraph1.ClearGraph;
      FilterGraph1.Active := false;
      CaptureFilter.BaseFilter.Moniker := CapEnum.GetMoniker(i);
      FilterGraph1.Active := true;
      with FilterGraph1 as ICaptureGraphBuilder2 do
      hr:=RenderStream(nil, nil, CaptureFilter as IBaseFilter,nil,VideoWindow1 as IBaseFilter);
      if Failed(hr) then  ShowMEssage('Fatal error');
      FilterGraph1.Play;
      exit;
    end;
 end;
end;

procedure TnMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CapEnum<>nil then CapEnum.Free;
end;

procedure TnMain.SelectDevice(sender: TObject);
begin
  FilterGraph1.ClearGraph;
  FilterGraph1.Active := false;
  if CapEnum=nil then CapEnum := TSysDevEnum.Create(CLSID_VideoInputDeviceCategory);
  CaptureFilter.BaseFilter.Moniker := CapEnum.GetMoniker(TMenuItem(sender).tag);
  FilterGraph1.Active := true;
  with FilterGraph1 as ICaptureGraphBuilder2 do
  hr:=RenderStream(nil, nil, CaptureFilter as IBaseFilter,nil,VideoWindow1 as IBaseFilter);
  if Failed(hr) then  ShowMEssage('gfgf');
  FilterGraph1.Play;
end;

procedure TnMain.VideoCaptureFilter1Click(Sender: TObject);
begin
  IFilter(CaptureFilter).NotifyFilter(foRefresh);
  ShowFilterPropertyPage(Self.Handle, CaptureFilter as IBaseFilter);
end;

end.
