unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Data,Math,RezCom,LunCom,SyncObjs;

const rad=180.0/pi;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Button2: TButton;
    Button3: TButton;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Button4: TButton;
    Button5: TButton;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    Edit8: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Edit35: TEdit;
    Label35: TLabel;
    Edit42: TEdit;
    Label36: TLabel;
    Edit43: TEdit;
    Label37: TLabel;
    Edit47: TEdit;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label27: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label46: TLabel;
    Panel3: TPanel;
    Label30: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label40: TLabel;
    ComboBox5: TComboBox;
    Label47: TLabel;
    ComboBox6: TComboBox;
    Label48: TLabel;
    Edit7: TEdit;
    Edit25: TEdit;
    Edit48: TEdit;
    Label49: TLabel;
    Edit55: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Edit49: TEdit;
    CheckBox1: TCheckBox;
    procedure Edit44Change(Sender: TObject);
    procedure Edit45Change(Sender: TObject);
    procedure Edit46Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure ComboBox6DblClick(Sender: TObject);
    procedure ComboBox5DblClick(Sender: TObject);
    procedure ComboBox2DblClick(Sender: TObject);
    procedure ComboBox1DblClick(Sender: TObject);
    procedure ServMsr(var Msg: TMessage); message WM_NOTIFY_MSR;
    procedure ServMsl(var Msg: TMessage); message WM_NOTIFY_MSL;
    procedure LUpdate;
    procedure RUpdate;
  private
    { Private declarations }
  public
    procedure MyUpdate;
  end;

var
  Form1: TForm1;

implementation
USES ComPort;

var  hRezCom:TRezCom;
     hLunCom:TLunCom;
     RPort1,RPort2:integer;
     LPort1,LPort2:integer;
{$R *.dfm}

procedure TForm1.MyUpdate;
begin
  LUpdate;
  RUpdate;
end;

procedure TForm1.LUpdate;
var LUF:TLunUpdateForm;
    i:integer;
    LunWord:DWord;
    Lun:Word;
begin
cs_LunUpdate.Enter;
  try
    LUF.LunAnsw:=LunUpdateForm.LunAnsw;
    LUF.LunSend:=LunUpdateForm.LunSend;
    for i:=0 to 15 do LUF.LByte[i]:=LunUpdateForm.LByte[i];
  finally
    cs_LunUpdate.Leave;
  end;
  with LUF do
  begin
    Label46.Caption:=IntToStr(LunAnsw);
    Label39.Caption:=IntToStr(LunSend);
    Edit17.Text:=IntToBin(LByte[1],3);
    Edit18.Text:=IntToBin(LByte[0],3);
    LunWord:=LByte[3] SHL 8 +LByte[2];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit19.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit19.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    LunWord:=LByte[5] SHL 8 +LByte[4];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit20.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit20.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    LunWord:=LByte[7] SHL 8 +LByte[6];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit21.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit21.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    LunWord:=LByte[9] SHL 8 +LByte[8];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit55.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit55.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    LunWord:=LByte[11] SHL 8 +LByte[10];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit23.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit23.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    LunWord:=LByte[13] SHL 8 +LByte[12];
    if LunWord>=32768 then
    begin
      Lun:=AddCode(LunWord);
      Edit24.Text:='-'+FloatToStrF(Lun*Rcl,ffFixed,12,2)
    end  else
      Edit24.Text:=FloatToStrF(LunWord*Rcl,ffFixed,12,2);
    Edit27.Text:=IntToBin2(LByte[0],8);
    Edit26.Text:=IntToBin2(LByte[1],8);
    Edit36.Text:=IntToBin2(LByte[2],8);
    Edit28.Text:=IntToBin2(LByte[3],8);
    Edit37.Text:=IntToBin2(LByte[4],8);
    Edit29.Text:=IntToBin2(LByte[5],8);
    Edit38.Text:=IntToBin2(LByte[6],8);
    Edit30.Text:=IntToBin2(LByte[7],8);
    Edit39.Text:=IntToBin2(LByte[8],8);
    Edit31.Text:=IntToBin2(LByte[9],8);
    Edit40.Text:=IntToBin2(LByte[10],8);
    Edit32.Text:=IntToBin2(LByte[11],8);
    Edit41.Text:=IntToBin2(LByte[12],8);
    Edit33.Text:=IntToBin2(LByte[13],8);
    Edit34.Text:=IntToBin2(LByte[14],8);
    Edit49.Text:=(IntTo16(@LByte,15));
  end;
end;

procedure TForm1.ServMsl(var Msg: TMessage);
begin
  LUpdate;
end;

procedure TForm1.RUpdate;
var RUF:TRezUpdateForm;
    i:integer;
    ResWord:Word;
begin
cs_RezUpdate.Enter;
  try
    RUF.fDistanse:=RezUpdateForm.fDistanse;
    RUF.fAltitude:=RezUpdateForm.fAltitude;
    RUF.fCourse:=RezUpdateForm.fCourse;
    RUF.fvv:=RezUpdateForm.fvv;
    RUF.fvg:=RezUpdateForm.fvg;
    RUF.RezAnsw:=RezUpdateForm.RezAnsw;
    RUF.RezSend:=RezUpdateForm.RezSend;
    for i:=0 to 8 do
      RUF.RWord[i]:=RezUpdateForm.RWord[i];
  finally cs_RezUpdate.Leave;  end;
  with RUF do
  begin
    Label42.Caption:=IntToStr(RezSend);
    Label45.Caption:=IntToStr(RezAnsw);
    Edit2.Text:='777';
    Edit3.Text:=FloatToStrF(fDistanse,ffFixed,4,2);
    Edit4.Text:=FloatToStrF(fCourse,ffFixed,4,2);
    Edit5.Text:=FloatToStrF(fAltitude,ffFixed,4,2);
    Edit6.Text:=FloatToStrF(fvg,ffFixed,4,2);
    Edit7.Text:=FloatToStrF(fvv,ffFixed,4,2);
    Edit25.Text:=FloatToStrF(StrToInt(Edit43.Text),ffFixed,4,2);
    Edit3.Text:=FloatToStrF(RWord[2]*Rcd,ffFixed,12,2);
    Edit4.Text:=FloatToStrF(RWord[3]*Rck,ffFixed,12,2);
    //обратное преобразование дополнительного двоичного кода
    if ResAWord[4]>=32768 then
    begin
      ResWord:=AddCode(RWord[4]);
      Edit5.Text:='-'+FloatToStrF(ResWord*Rcm,ffFixed,12,2)
    end  else
      Edit5.Text:=FloatToStrF(RWord[4]*Rcm,ffFixed,12,2);
    if ResAWord[5]>=32768 then
    begin
      ResWord:=AddCode(RWord[5]);
      Edit6.Text:='-'+FloatToStrF(ResWord*Rcsi,ffFixed,12,2)
    end  else
      Edit6.Text:=FloatToStrF(RWord[5]*Rcsi,ffFixed,12,2);
    if ResAWord[6]>=32768 then
    begin
      ResWord:=AddCode(RWord[6]);
      Edit7.Text:='-'+FloatToStrF(ResWord*Rcv,ffFixed,12,2)
    end  else
      Edit7.Text:=FloatToStrF(RWord[6]*Rcv,ffFixed,12,2);
    Edit25.Text:=FloatToStrF(RWord[7]*Rcgl,ffFixed,12,2);
    Edit9.Text :=IntToBin(RWord[0],16);
    Edit10.Text:=IntToBin(RWord[1],16);
    Edit11.Text:=IntToBin(RWord[2],16);
    Edit12.Text:=IntToBin(RWord[3],16);
    Edit13.Text:=IntToBin(RWord[4],16);
    Edit14.Text:=IntToBin(RWord[5],16);
    Edit15.Text:=IntToBin(RWord[6],16);
    Edit16.Text:=IntToBin(RWord[8],16);
    Edit48.Text:=IntToBin(RWord[7],16);
    Edit8.Text:= IntTo16 (@RWord,18);
  end;
end;

procedure TForm1.ServMsr(var Msg: TMessage);
begin
  RUpdate;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormActivate(Sender: TObject);
var F : TextFile;
begin
  cs_RezUpdate:=TCriticalSection.Create;
  cs_LunUpdate:=TCriticalSection.Create;
  Rcd:=1.0;
  Rck:=180.0/32768.0;
  Rcm:=Rck;
  Rcgl:=Rck;
  Rcsi:=0.01;
  Rcv:=0.01;
  Rcl:=360.0/32768.0;
  ComboBox1.ItemIndex:=41;
  ComboBox2.ItemIndex:=42;
  ComboBox5.ItemIndex:=43;
  ComboBox6.ItemIndex:=44;
  ComboBox1DblClick(Self);
  ComboBox2DblClick(Self);
  ComboBox5DblClick(Self);
  ComboBox6DblClick(Self);
  Button2Click(Self);
  Button4Click(Self);
  Button2.Enabled:=False;
  Button4.Enabled:=False;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button3.Click;
  Button5.Click;
  cs_RezUpdate.Free;
  cs_LunUpdate.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  hRezCom:=TRezCom.Create(True);
  hRezCom.Priority:=tpLowest;
  hRezCom.FreeOnTerminate:=true;
  hRezCom.Port1:=RPort1;
  hRezCom.Port2:=RPort2;
  Edit35.Enabled:=True;
  Edit43.Enabled:=True;
  Edit47.Enabled:=True;
  Edit42.Enabled:=True;
  if TRIM(Edit35.Text)='' then Edit35.Text:='1500';
  hRezCom.Ds:=StrToFloat(TRIM(Edit35.Text));
  hRezCom.Fi:=StrToFloat(TRIM(Edit42.Text));    // угол наклона линии посадки (6,35)
  hRezCom.Tet:=StrToFloat(TRIM(Edit43.Text));   // угол глиссады
  hREzCom.v:=StrToFloat(TRIM(Edit47.Text))*10.0/36.0; // скорость
  hRezCom.Resume;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  hRezCom.Terminate;
  sleep(100);
  Button2.Enabled:=True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  hLunCom:=TLunCom.Create(True);
  hLunCom.Priority:=tpLowest;
  hLunCom.FreeOnTerminate:=true;
  hLunCom.Port1:=LPort1;
  hLunCom.Port2:=LPort2;
  hLunCom.fError:=CheckBox1.Checked;
  hLunCom.Resume;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  hLunCom.Terminate;
  sleep(100);
  Button4.Enabled:=True;
end;

procedure TForm1.Edit1Change(Sender: TObject);
var i:Word;
    s,s2:String;
begin
f:=StrToInt(EDit46.Text);
  {s:=(Sender as TEdit).Text;
  if TRIM(s)='' then EXIT;
  s2:=s;
  for i:=1 to Length(s) do
  if ((ORD(S[i])<48)OR(ORD(S[i])>57))AND(S[i]<>DecimalSeparator) AND
      (S[i]<>'-')  then S[i]:=DecimalSeparator;
  if StrToFloatDef(S,10)=10 then
    begin
      ShowMessage('Ошибочный символ --> "'+S2[Length(s2)]+'"');
      (Sender as TEdit).Text:=COPY(S2,1,Length(s2)-1);
      EXIT;
    end;
  (Sender as TEdit).Text:=S;
  (Sender as TEdit).SelStart:=Length(s); }
end;

procedure TForm1.Edit44Change(Sender: TObject);
begin
c:=StrToInt(EDit46.Text);
end;

procedure TForm1.Edit45Change(Sender: TObject);
begin
b:=StrToInt(EDit46.Text);
end;

procedure TForm1.Edit46Change(Sender: TObject);
begin
  a:=StrToInt(EDit46.Text);
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  RPort1:=ComboBox1.ItemIndex;
  if (ComboBox2.ItemIndex<>0)AND(ComboBox2.ItemIndex<>ComboBox1.ItemIndex)
    then Button2.Enabled:=True;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  RPort2:=ComboBox2.ItemIndex;
  if (ComboBox1.ItemIndex<>0)AND(ComboBox2.ItemIndex<>ComboBox1.ItemIndex)
    then Button2.Enabled:=True;
end;

procedure TForm1.ComboBox5Change(Sender: TObject);
begin
  LPort1:=ComboBox5.ItemIndex;
  if (ComboBox6.ItemIndex<>0)AND(ComboBox6.ItemIndex<>ComboBox5.ItemIndex)
    then Button4.Enabled:=True;
end;

procedure TForm1.ComboBox6Change(Sender: TObject);
begin
  LPort2:=ComboBox6.ItemIndex;
  if (ComboBox5.ItemIndex<>0)AND(ComboBox5.ItemIndex<>ComboBox6.ItemIndex)
    then Button4.Enabled:=True;
end;

procedure TForm1.ComboBox6DblClick(Sender: TObject);
begin
  ComboBox6Change(Self);
end;

procedure TForm1.ComboBox5DblClick(Sender: TObject);
begin
  ComboBox5Change(Self);
end;

procedure TForm1.ComboBox2DblClick(Sender: TObject);
begin
  ComboBox2Change(Self);
end;

procedure TForm1.ComboBox1DblClick(Sender: TObject);
begin
  ComboBox1Change(Self);
end;

end.
