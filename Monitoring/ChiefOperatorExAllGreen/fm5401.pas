unit fm5401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,Client_EM5401,Global,Container_EM5401;

type
  Tf5401 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    e1: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    Panel15: TPanel;
    Panel16: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel17: TPanel;
    RichEdit1: TRichEdit;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_5401;
    procedure SetValues(first:boolean);
    procedure SetNoValues;
    procedure TableVisible(Vis:boolean);
  private
    LastDataExh:boolean;
  public
    { Public declarations }
  end;

var
  f5401: Tf5401;

implementation

{$R *.dfm}

procedure Tf5401.ServMsd(var Msg: TMessage);
var str:string;
begin
  Timer1.Enabled:=false;
  str:=FormatDateTime('hh:nn:ssss.zzzz:',Now);
  case Msg.WParam of
    INTEGER(UnknownCommand):      str:=str+#09+'UnknownCommand'+#09;
    INTEGER(StateOfInternalLine): str:=str+#09+'State of internal line'+#09;
    INTEGER(Identification):      str:=str+#09+'Identification'+#09;
  end;
  case Msg.LParam of
    INTEGER(Success)      : str:=str+'Success';
    INTEGER(NoReply)      : str:=str+'No answer';
    INTEGER(NoSend)       : str:=str+'Send error';
    INTEGER(ErrorCheckSum): str:=str+'Error of CheckSum';
    INTEGER(NotOpened)    : str:=str+'Socket not open';
    INTEGER(NotIdent)     : str:=str+'Command not identify';
    INTEGER(Processing)   : str:=str+'In progress';
  end;
  if EM5401.DataExh then SetValues(false)
                    else SetNoValues;
  RichEdit1.Lines.Add(str);
  Timer1.Enabled:=true;
end;

procedure Tf5401.FormActivate(Sender: TObject);
begin
  with i1.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i1.ClientRect);
  end;
  with i3.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(i3.ClientRect);
  end;
  Panel4.SetFocus;
  LastDataExh:=false;
  if cEM5401<>nil then
     cEM5401.FormHandle:=f5401.Handle;
  if EM5401<>nil then
  if EM5401.DataExh then SetValues(true)
                    else SetNoValues
                    else SetNoValues;
end;

procedure Tf5401.SetValues(first: Boolean);
begin
  e1.Text  :='  YES';
  e1.Color :=_Green;
  if not LastDataExh then TableVisible(true);
  if First then
  begin
    e2.Text:='  '+IntToStr(EM5401.DeviceTypeCode);
    e3.Text:='  '+IntToStr(EM5401.HardwareVersion);
    e4.Text:='  '+IntToStr(EM5401.SoftwareVersion);
    e5.Text:='  '+IntToStr(EM5401.SerialNumber);
    e6.Text:='  '+DateToStr(EM5401.DeviceMDate);
  end;
end;

procedure Tf5401.SetNoValues;
begin
  e1.Text  :='  NO';
  e1.Color :=_Red;
  if LastDataExh then TableVisible(false);
end;

procedure Tf5401.TableVisible(Vis: Boolean);
var i:integer;
begin
  LastDataExh:=vis;
  for i:=2 to 6 do
  if f5401.FindComponent('e'+IntToStr(i))<>nil then
  begin
    TEdit(f5401.FindComponent('e'+IntToStr(i))).Enabled:=vis;
    if not vis then
    TEdit(f5401.FindComponent('e'+IntToStr(i))).Text:='';
  end;
end;

procedure Tf5401.Timer1Timer(Sender: TObject);
begin
  if EM5401.DataExh then SetValues(false)
                    else SetNoValues;
end;

procedure Tf5401.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if cEM5401<>nil then
     cEM5401.FormHandle:=0;
end;

end.
