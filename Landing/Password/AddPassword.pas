unit AddPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Main, ComCtrls, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    StatusBar: TStatusBar;
    Edit3: TEdit;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses UnitDM;
{$R *.dfm}

procedure TForm2.Edit1Change(Sender: TObject);
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

procedure TForm2.Edit1Click(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
    Flag:boolean;
    i:integer;
begin
  if Key=13 then
  begin
    s:=Edit1.Text;
    Flag:=true;
    for i:=0 to Form1.ListView2.Items.Count-1 do
       if s=Form1.ListView2.Items.Item[i].SubItems[0]
       then Flag:=false;
    if s=PR then Flag:=false;
    if (Length(s)>5) and Flag  then
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

procedure TForm2.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=13 then
  begin
    if Edit1.Text=Edit2.Text then
    begin
      Label2.Visible:=true;
      Edit3.Visible:=true;
      Edit2.ReadOnly:=true;
      edit3.SetFocus;
    end else
    begin
      Edit2.Text:='';
      StatusBar.SimpleText:='Incorrectly.Enter the password repeatedly.';
    end;
  end;
end;

procedure TForm2.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var s:string;
      i:integer;
      Pass_ID:integer;
begin
Pass_ID:=1;
if Key=13 then
  begin
// создание уникального Pass_ID по UseList
   for i:=1 to UseList.Count-1 do
    begin
      if StrToInt(UseList.Strings[Pass_ID])<>Pass_ID then
      begin
        break;
      end else
      begin
        inc(Pass_ID);
      end;
    end;
    if Edit3.Text='' then  Edit3.Text:='No Name';
      s:='Insert Password (Pass_ID, Pass, NameOP, DateCreate, QuantityUse) Values('''
                           +IntToStr(Pass_ID)+''', '''+
                           Edit1.Text+''', '''+
                           Edit3.Text+''', '''+
                           FormatDateTime('dd.mm.yy hh.nn.ssss',Now)+''', '''+
                           IntToStr(0)+''')';
      dm.Password.Close;
      dm.Password.SQL.Clear;
      dm.Password.SQL.Add(s);
      dm.Password.ExecSQL;
      Form1.EnterTable;
      Form2.Close;
  end;
end;


procedure TForm2.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (Key=13) and (Edit4.Text=Admin)  then
begin
  Edit4.ReadOnly:=true;
  Label5.Visible:=true;
  Edit5.Visible :=true;
  Edit5.SetFocus;
end;
end;

procedure TForm2.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
    Flag:boolean;
    i:integer;
begin
if Key=13 then
  begin
    s:=Edit5.Text;
    Flag:=true;
    for i:=0 to Form1.ListView2.Items.Count-1 do
       if s=Form1.ListView2.Items.Item[i].SubItems[0]
       then Flag:=false;
    if s='777' then Flag:=false;
    if (Length(s)>5) and Flag  then
    begin
      Edit5.ReadOnly:=true;
      Edit6.Visible:=true;
      Label6.Visible:=true;
      Edit6.SetFocus;
    end else
    begin
      Edit5.Text:='';
      StatusBar.SimpleText:='The inadmissible password.';
    end;
  end;
end;

procedure TForm2.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var s:string;
begin
if Key=13 then
  begin
    if Edit5.Text=Edit6.Text then
    begin
      Admin:=Edit5.Text;
      s:='Update Password Set Pass='''+Edit5.Text+
         ''' ,NameOP=''Admin'', DateCreate='''+FormatDateTime('dd.mm.yy hh.nn.ssss',Now)+
         ''', DateLastUse='''+FormatDateTime('dd.mm.yy hh.nn.ssss',Now) +''' Where Pass_ID=0';
      dm.EnterPassword.Close;
      dm.EnterPassword.SQL.Clear;
      dm.EnterPassword.SQL.Add(s);
      dm.EnterPassword.ExecSQL;
      StatusBar.SimpleText:='Successfully.';
      Form1.EnterTable;
      Form2.Close;
    end else
    begin
      Edit2.Text:='';
      StatusBar.SimpleText:='Incorrectly.Enter the password repeatedly.';
    end;
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var i:integer;
begin
  if Panel1.Visible then  Edit4.SetFocus else Edit1.SetFocus;
  Edit4.ReadOnly:=false;
  Edit5.ReadOnly:=false;
  Edit1.ReadOnly:=false;
  Edit2.ReadOnly:=false;
  Edit2.Visible:=false;
  Edit3.Visible:=false;
  Edit5.Visible:=false;
  Edit6.Visible:=false;
  for i:=1 to 6 do
     if Form2.FindComponent('Edit'+IntToStr(i))<>nil then
        TEdit(Form2.FindComponent('Edit'+IntToStr(i))).Text:='';
  Label2.Visible:=false;
  Label4.Visible:=false;
  Label5.Visible:=false;
  label6.Visible:=false;
end;

end.
