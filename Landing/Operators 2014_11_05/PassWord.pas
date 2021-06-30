unit PASSWORD;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons,UnitDM,Dialogs,Global;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    OKBtn: TButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation
uses Main;

{$R *.dfm}

procedure TPasswordDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    flag:boolean;
    PID,QU:integer;
    s:string;
begin
  if HOST_TP=1 then
  begin
    Operator_ID:=Password.Text;
    flag:=false;
    DM.Pass.Open;
    while not DM.Pass.Eof do
    begin
      if (Operator_ID=DM.PassPass.Value) then
      begin
         PID:=DM.PassPass_ID.Value;
         QU:=DM.PassQuantityUse.Value;
         Inc(QU);
         s:='Update Password Set DateLastUse='''+FormatDateTime('dd.mm.yy hh.nn.ssss',Now) +''',QuantityUse='''+IntToStr(QU)+''' Where Pass_ID='''+IntToStr(PID)+'''';
         dm.EnterPassword.Close;
         dm.EnterPassword.SQL.Clear;
         dm.EnterPassword.SQL.Add(s);
         dm.EnterPassword.ExecSQL;
         flag:=true;
      end;
      DM.Pass.Next;
    end;
  end;
  if not flag then Application.MessageBox('Password inccorect. Application will be closed.','System error',MB_DEFBUTTON2+MB_ICONERROR);
  if flag then CanClose:=true else  Application.Terminate; 
  DM.Pass.Close;
end;


end.

