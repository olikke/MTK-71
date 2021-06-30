unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,DB, DBTables, ComCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Edit3: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    ListView2: TListView;
    procedure FormDestroy(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EnterTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Admin: String;
  WorkPass:String;
  UseList:TStringList;//список используемых Pass_ID для определения уникального номера
  PR:String;
implementation
uses UnitDM,AddPassword;

{$R *.dfm}


procedure TForm1.Button1Click(Sender: TObject);
var s:string;
begin
  if ListView2.Selected.SubItems[1]='Admin' then
  begin
    StatusBar.SimpleText:='Error';
    exit;
  end;
  if Application.MessageBox('Are you sure want to delete password ?','Warning',MB_YESNO)=IDYES then
  begin
      s:='Delete From Password Where Pass_ID='+ListView2.Selected.Caption;
      dm.EnterPassword.Close;
      dm.EnterPassword.SQL.Clear;
      dm.EnterPassword.SQL.Add(s);
      dm.EnterPassword.ExecSQL;
      StatusBar.SimpleText:='Successfully.';
      EnterTable;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Form2.Panel1.Visible:=false;
  Form2.Caption:='Create New Pasword';
  Form2.ShowModal;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Form2.Panel1.Visible:=true;
  Form2.Caption:='Change Administrator Pasword';
  Form2.ShowModal;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var S:String;
begin
  S:=Trim(Edit1.Text);
  StatusBar.SimpleText:='';
  if length(S)>10 then
  begin
    Edit1.Text:='';
    StatusBar.SimpleText:='Error. The length of the password does not exceed 10 symbols.';
  end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var  s:string;
begin
  if Key=13 then
  begin
    s:=(Sender as TEdit).Text;
    if (s<>'777') and (Length(s)>5)  then
    begin
      Edit1.ReadOnly:=true;
      Edit2.Visible:=true;
      Label4.Visible:=true;
      Edit2.SetFocus;
    end else
    begin
      Edit1.Text:='';
      StatusBar.SimpleText:='The inadmissible password.';
    end;
  end;

end;

procedure TForm1.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
begin
  if Key=13 then
  begin
    if Edit1.Text=Edit2.Text then
    begin
      Admin:=Edit1.Text;
      s:='Update Password Set Pass='+Edit1.Text+
         ' ,NameOP="Admin", DateCreate="'+FormatDateTime('dd.mm.yy hh.nn.ssss',Now)+
         '", DateLastUse="'+FormatDateTime('dd.mm.yy hh.nn.ssss',Now) +'" Where Pass_ID=1';
      dm.EnterPassword.Close;
      dm.EnterPassword.SQL.Clear;
      dm.EnterPassword.SQL.Add(s);
      dm.EnterPassword.ExecSQL;
      StatusBar.SimpleText:='Successfully.';
      Form1.Width:=663;
      Form1.Height:=400;
      Panel2.Visible:=true;
      Form1.Caption:='passwords control system';
      EnterTable;
    end else
    begin
      Edit2.Text:='';
      StatusBar.SimpleText:='Incorrectly.Enter the password repeatedly.';
    end;
  end;
end;


procedure TForm1.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var s:string;
begin
  if Key=13 then
  begin
    if (Edit3.Text=Admin) or (Edit3.Text=PR) then
    begin
      EnterTable;
      StatusBar.SimpleText:='Successfully.';
      Form1.Width:=663;
      Form1.Height:=400;
      Panel2.Visible:=true;
      Form1.Caption:='Passwords control system';
    end else
    begin
      Edit3.Text:='';
      StatusBar.SimpleText:='Error Password';
    end;
    if Edit3.Text=Admin then
    begin
      s:='Update Password Set DateLastUse='''+FormatDateTime('dd.mm.yy hh.nn.ssss',Now) +''' Where Pass_ID=0';
      dm.EnterPassword.Close;
      dm.EnterPassword.SQL.Clear;
      dm.EnterPassword.SQL.Add(s);
      dm.EnterPassword.ExecSQL;
    end;
  end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  if Panel1.Visible=true then Edit3.SetFocus else Edit1.SetFocus;
  Form1.Width:=350;
  Form1.Height:=190;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  try
    dm.Password.ParamByName('Pass_ID').Value:=0;
    dm.Password.Open;
    Admin:=dm.PasswordPass.AsString;
    dm.Password.Close;
    PR:=DM.MTK.Params.Strings[1];
    Delete(PR,1,9);
    if (Admin='777') or (Admin='') then
    begin
      StatusBar.SimpleText:='Create Administrator Password Immediately.';
      Form1.Caption:='Create Administrator Password'
    end
    else begin
      Panel1.Visible:=true;
      Form1.Caption:='Enter Administrator Password ';
      StatusBar.SimpleText:='Enter Administrator Password';
    end;
  except
  end;
  UseList:=TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  UseList.Destroy;
end;

procedure TForm1.ListView2Click(Sender: TObject);
begin
  Button3.Enabled:=true;
  Button1.Enabled:=true;
end;


procedure TForm1.EnterTable;
var s:string;
    Max,i:integer;
begin
        ListView2.Items.BeginUpdate;
    UseList.Clear;
    ListView2.Items.Clear;
    s:='Select Isnull(MAX(Pass_ID),0) as max from Password';
    dm.EnterPassword.Close;
    dm.EnterPassword.SQL.Clear;
    dm.EnterPassword.SQL.Add(s);
    dm.EnterPassword.Open;
    Max:=dm.EnterPassword.FieldByName('MAX').Value;
    dm.EnterPassword.Close;
    dm.MTK.Connected:=true;

    for i:=0 to Max do
    begin
      if i=777 then continue;      
      dm.ReadPassword.Close;
      dm.ReadPassword.ParamByName('Pass_ID').Value:=i;
      dm.ReadPassword.Open;
      if dm.ReadPasswordPass.AsString<>'' then
      with ListView2.Items.Add do
      begin
        Caption:=IntToStr(i);
        Subitems.Add(dm.ReadPasswordPass.AsString);
        Subitems.Add(dm.ReadPasswordNameOP.AsString);
        Subitems.Add(dm.ReadPasswordDateCreate.AsString);
        Subitems.Add(dm.ReadPasswordDateLastUse.AsString);
        Subitems.Add(IntToStr(dm.ReadPasswordQuantityUse.Value));
        UseList.Add(IntToStr(i));
      end;
    end;
    dm.MTK.Connected:=false;
    S:=ListView2.Items.Item[0].SubItems[0];
    for i:=0 to Length(S) do
        S[i]:='*';
    ListView2.Items.Item[0].SubItems[0]:=s;
    ListView2.Items.EndUpdate;
end;



end.
