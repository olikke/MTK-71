unit PropertyPages;

interface

uses
  SysUtils,Windows, DirectShow9, BaseClass, ActiveX, DSUtil, Messages, StdCtrls, Classes,
  Controls, Spin, ExtCtrls, ComCtrls,Dialogs,FastDib,Graphics,IniFiles;

type
  TProp = class(TFormPropertyPage)
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    Panel3: TPanel;
    Label7: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    CheckBox2: TCheckBox;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function OnConnect(Unknown: IUnknown): HRESULT; override;
    function OnDisconnect: HRESULT; override;
    function OnApplyChanges: HRESULT; override;
  end;
const
    CLSID_MyPropertyPage : TGUID = '{55EBC1A1-7F23-478E-93E4-6F190B57A4E1}';


var
  Prop: TProp;

implementation
uses main;

{$R *.dfm}

function TProp.OnConnect(Unknown: IInterface): HRESULT;
begin
  result := NOERROR;
end;

function TProp.OnDisconnect: HRESULT;
begin
  result := NOERROR;
end;

procedure TProp.Button1Click(Sender: TObject);
var i:integer;
begin
  i:=StrToIntDef(Edit1.Text,-1);
  if (i>0) and (i+XWidth<main.Width-1) then  XStart:=i
  else Edit1.Text:=IntToStr(XStart);
  i:=StrToIntDef(Edit2.Text,-1);
  if (i>0) and (i+YHeight<abs(main.Height)-1) then  YStart:=i
  else Edit2.Text:=IntToStr(YStart);
end;

procedure TProp.Button2Click(Sender: TObject);
begin
  FontDialog1.Font:=mFont;
  if not FontDialog1.Execute then exit;
  cs_Crit.Enter;
  mFont:=FontDialog1.Font;
  FastText.Free;
  FastText:=TFastDib.Create;
  FastText.LoadFromFile('C:\WINDOWS\system32\ClockInFilter.bmp');
  FastText.SetFont(mFont.Name,mFont.Size);
  FastText.SetTextColor(mFont.Color);
  FastText.SetTransparent(true);
  FastText.SetBkColor(clBlack);
  FontColor:=IntToColor(mFont.Color);
  cs_Crit.Leave;
end;


procedure TProp.Button3Click(Sender: TObject);
begin
  //ÇÀÏÈÑÜ ÔÀÉËÀ ÈÍÈÖÈÀËÈÇÀÖÈÈ
  FilterINI := TIniFile.Create('C:\WINDOWS\system32\ClockInFilter.ini');
  FilterINI.WriteInteger('Marker position','XStart',XStart);
  FilterINI.WriteInteger('Marker position','YStart',YStart);
  FilterINI.WriteInteger('Marker size',    'Width', XWidth);
  FilterINI.WriteInteger('Marker size',    'Height',YHeight);
  FilterINI.WriteString ('Font       ',    'Name  ',mFont.Name);
  FilterINI.WriteInteger('Font       ',    'Height',mFont.Height);
  FilterINI.WriteInteger('Font       ',    'Color', mFont.Color);
  if fl_Back then FilterINI.WriteString ('Background ',    'Visible','true')
  else FilterINI.WriteString ('Background ',    'Visible','false');
  FilterINI.WriteString('Background ',    'Color',IntToStr(ColorToInt(Background)));
  FilterINI.Free;
end;

procedure TProp.Button4Click(Sender: TObject);
var i:integer;
begin
  i:=StrToIntDef(Edit5.Text,-1);
  if (i>0) and (i<main.MaxWidth) then  XWidth:=i
  else Edit5.Text:=IntToStr(XWidth);
  i:=StrToIntDef(Edit6.Text,-1);
  if (i>0) and (i<main.MaxHeight) then  YHeight:=i
  else Edit6.Text:=IntToStr(YHeight);
end;

procedure TProp.Button5Click(Sender: TObject);
begin
  if not ColorDialog1.Execute then exit;
  cs_Crit.Enter;
  Background:=IntToColor(ColorDialog1.Color);
  cs_Crit.Leave;
end;

procedure TProp.CheckBox2Click(Sender: TObject);
begin
  cs_Crit.Enter;
  if CheckBox2.Checked  then
  begin
    Panel4.Visible:=true;
    fl_Back:=true;
  end else
  begin
    Panel4.Visible:=false;
    fl_Back:=false;
  end;
  cs_Crit.Leave;
end;

function TProp.OnApplyChanges: HRESULT;
begin
  result := NOERROR;
end;

procedure TProp.FormCreate(Sender: TObject);
begin
  Edit1.Text:=IntToStr(XStart);
  Edit2.Text:=IntToStr(YStart);
  Edit5.Text:=IntToStr(XWidth);
  Edit6.Text:=IntToStr(YHeight);
end;

initialization

  TBCClassFactory.CreatePropertyPage(TProp,CLSID_MyPropertyPage);

end.
