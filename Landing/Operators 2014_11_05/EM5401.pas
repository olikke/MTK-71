unit EM5401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, Buttons, ExtCtrls,GLobal;

type
  Tfm5401 = class(TForm)
    Panel6: TPanel;
    Panel8: TPanel;
    i1: TImage;
    Label5: TLabel;
    Panel11: TPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    e1: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    i2: TImage;
    Label3: TLabel;
    Panel7: TPanel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit15: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit25: TEdit;
    Panel10: TPanel;
    shape1: TShape;
    Panel9: TPanel;
    shape2: TShape;
    Panel13: TPanel;
    shape4: TShape;
    Panel14: TPanel;
    shape5: TShape;
    Panel15: TPanel;
    shape6: TShape;
    Panel16: TPanel;
    shape7: TShape;
    Panel22: TPanel;
    Panel23: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel24: TPanel;
    RichEdit1: TRichEdit;
    Edit14: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    e7: TEdit;
    e8: TEdit;
    e9: TEdit;
    e10: TEdit;
    Panel1: TPanel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Button1: TButton;
    Button12: TButton;
    Button13: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RichEdit1DblClick(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure SetNoValues;
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MSD;
    procedure RestoreBase;
    procedure Reload;
  private
    ss:String;
    Fl_Change:boolean;
    mEM5401:TEM5401;
    fl_Update:boolean;
    fl_Add:boolean;
  public
    DEVICE_ID:cardinal;
  end;

var
  fm5401: Tfm5401;

implementation

uses UnitDM;

{$R *.dfm}

procedure Tfm5401.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    Panel1.Visible:=true;
    BorderIcons:=[];
  end else
    ss:='';
end;

procedure Tfm5401.RestoreBase;
begin
  DM.EM5401Param.ParamByName('Device_ID').Value:=DEVICE_ID;
  DM.EM5401Param.Open;
  cs_ArrDevice[Device_ID].Enter;
  with TEM5401(ArrDevice[DEVICE_ID]) do
  begin
    UPT1:=DM.EM5401ParamFTP1.Value;
    UPT2:=DM.EM5401ParamFTP2.Value;
  end;
  cs_ArrDevice[Device_ID].Leave;
  DM.EM5401Param.Close;
end;

procedure Tfm5401.RichEdit1DblClick(Sender: TObject);
begin
  fl_Add:=not fl_Add;
end;

procedure Tfm5401.ServMsd(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[DEVICE_ID].Enter; try mEM5401:=TEM5401((ArrDevice[DEVICE_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  case Msg.LParam of
    1..10:
       begin
         RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: '+Command_EM5401[Msg.LParam].cComment);
       end;
    200:
       begin
         RichEdit1.Font.Color:=clRed;
         RichEdit1.Lines.Add(TimeToStr(Now)+' '+'ATTENTION! DETECTED DEVICE CHANGE.');
         RichEdit1.Font.Color:=clBlack;
       end;
    201:
        begin
          RichEdit1.Lines.Add(TimeToStr(Now)+' No Answer');
        end;
    202:
        begin
          RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: Status of device');
        end;
  end;
  SetValues;
end;

procedure Tfm5401.BitBtn1Click(Sender: TObject);
var pms:^Tmass;
begin
  fl_Update:=true;
  if Edit1.Text='' then exit;
  //добавление в ExternalCom - аналогично CommandList,
  //но для 2404 RabCom добавлояется по результатам анализа TQuestion.TM2404Analiz
  New(pms);
  pms^[1]:=DEVICE_ID;
  pms^[2]:=0;
  pms^[3]:=Command_EM5401[9].cComandCount+1;
  pms^[4]:=9;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[DEVICE_ID].cAdress;
  pms^[8]:=Command_EM5401[9].cComandCount-2+1;
  pms^[9]:=Command_EM5401[9].cCommand;
  pms^[10]:=StrToInt(Edit1.Text);
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  fl_Change:=true;
end;

procedure Tfm5401.BitBtn2Click(Sender: TObject);
var pms:^Tmass;
begin
  fl_Update:=true;
  if Edit2.Text='' then exit;
  New(pms);
  pms^[1]:=DEVICE_ID;
  pms^[2]:=0;
  pms^[3]:=Command_EM5401[10].cComandCount+1;
  pms^[4]:=10;
  pms^[5]:=1;
  pms^[6]:=0;
  pms^[7]:=ComDev[DEVICE_ID].cAdress;
  pms^[8]:=Command_EM5401[10].cComandCount-2+1;
  pms^[9]:=Command_EM5401[10].cCommand;
  pms^[10]:=StrToInt(Edit2.Text);
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  fl_Change:=true;
end;

procedure Tfm5401.Button12Click(Sender: TObject);
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin Reload; fl_Change:=false;
   end else exit;
end;

procedure Tfm5401.Button13Click(Sender: TObject);
begin
  fl_Update:=true;
  if fl_Change then
  if Application.MessageBox('Values of the parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    //восстановление данных из базы данных
    reload;
    fl_Change:=false;
  end;
  if not fl_Change then
  begin
    Panel1.Visible:=false;
    ss:='';
    BorderIcons:=[biSystemMenu];
    SetValues;
  end;
end;

procedure Tfm5401.Button1Click(Sender: TObject);
var s:String;
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'#13#10'Action it is irreversible.You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin
     //запись установленных параметров в базу данных
     BitBtn1.Click;
     BitBtn2.Click;
     s:='UPDATE EM5401Param SET FTP1='+Edit1.Text+', FTP2='+Edit2.Text+' WHERE Device_ID='+IntToStr(DEVICE_ID);
     DM.QDin.SQL.Clear;
     DM.QDin.SQL.Add(s);
     DM.QDin.ExecSQL;
     DM.QDin.Close;
     fl_Change:=false;
   end else exit;
end;

procedure Tfm5401.Reload;
begin
  fl_Update:=true;
  RestoreBase;
  if TM2404State.DoIt[Device_ID] and $20 <>$20 then
  TM2404State.DoIt[DEVICE_ID]:=TM2404State.DoIt[DEVICE_ID]+$20;
end;

procedure Tfm5401.Edit1Change(Sender: TObject);
var s:String;
    i:integer;
begin
  (Sender as TEdit).Color:=clGradientInactiveCaption;
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then exit;
  i:=StrToIntDef(s,-1);
  if i=-1 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<0) or (i>255) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  (Sender as TEdit).Color:=clWindow;
  fl_Update:=false;
end;

procedure Tfm5401.Edit1Click(Sender: TObject);
begin
  (Sender as TEdit).Text:='';
  fl_Update:=false;
end;

procedure Tfm5401.Edit1Exit(Sender: TObject);
begin
  if (Sender as TEdit).Text='' then  (Sender as TEdit).Text:='128';
  fl_Update:=true;
end;

procedure Tfm5401.FormActivate(Sender: TObject);
var i:integer;
begin
  fl_Add:=true;
  Fl_Change:=false;
  fl_Update:=true;
  cs_ArrDevice[Device_ID].Enter; try mEM5401:=TEM5401((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  SetValues;
  fl_NP:=true;
  TypeNP:=Device_ID;
  for i:=1 to 3 do
  if fm5401.FindComponent('i'+IntToStr(i))<>nil then
  with TImage(fm5401.FindComponent('i'+IntToStr(i))).Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(TImage(fm5401.FindComponent('i'+IntToStr(i))).ClientRect);
   end;
end;

procedure Tfm5401.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fl_NP:=false;
  TypeNP:=0;
end;

procedure Tfm5401.SetNoValues;
var ST:byte;
    mColor:TColor;
begin
  mColor:=Color_R;
  Shape1.Brush.Color:=mColor;
  Shape2.Brush.Color:=mColor;
  Shape4.Brush.Color:=mColor;
  Shape5.Brush.Color:=mColor;
  Shape6.Brush.Color:=mColor;
  Shape7.Brush.Color:=mColor;
  e1.Text:=' NO';
  e1.Color:=Color_R;
  e2.Text :='';
  e3.Text :='';
  e4.Text :='';
  e5.Text :='';
  e6.Text :='';
  e7.Text :='';
  e7.Color:=clWhite;
  e8.Text :='';
  e9.Text :='';
  e9.Color:=clWhite;
  e10.Text:='';
end;

procedure Tfm5401.SetValues;
var ST:byte;
    mColor:TColor;
begin
  if mEm5401.DataExh=0 then begin SetNoValues; exit end;
  e1.Text:=' YES';
  e1.Color:=Color_G;
  ST:=mEM5401.IfBSync;
  if ST and $80 = $80 then mColor:=Color_G else mColor:=Color_W;
  Shape1.Brush.Color:=mColor;
  if ST and $20 = $20 then mColor:=Color_G else mColor:=Color_R;
  Shape2.Brush.Color:=mColor;
  if ST and $08 = $08 then mColor:=Color_G else mColor:=Color_R;
  Shape4.Brush.Color:=mColor;
  if ST and $04 = $04 then mColor:=Color_G else mColor:=Color_R;
  Shape5.Brush.Color:=mColor;
  if ST and $02 = $02 then mColor:=Color_G else mColor:=Color_R;
  Shape6.Brush.Color:=mColor;
  if ST and $01 = $01 then mColor:=Color_G else mColor:=Color_R;
  Shape7.Brush.Color:=mColor;
  with mEM5401 do
  begin
    e2.Text:= '  '+IntToStr(TypeU);
    e3.Text:='  '+IntToStr(VersU);
    e4.Text:='  '+IntToStr(VersP);
    e5.Text:='  '+IntToStr(SerNum);
    if UDate<>0 then e6.Text:='  '+DateToStr(UDate)
                else e6.Text:='  No DATE';
    e7.Text:='  '+FloatToStrF(UPS1*0.2,ffFixed,4,1);
    e8.Text:='  '+FloatToStrF(UPT1*0.2,ffFixed,4,1);
    if fl_Update then UpDown1.Position:=UPT1;
    e9.Text:='  '+FloatToStrF(UPS2*0.2,ffFixed,4,1);
    e10.Text:='  '+FloatToStrF(UPT2*0.2,ffFixed,4,1);
    if fl_Update then UpDown2.Position:=UPT2;
    ST:=ifBus;
    if ST and $08 = $08 then e7.Color:=Color_R
                        else e7.Color:=Color_G;
    if ST and $04 = $04 then e9.Color:=Color_R
                        else e9.Color:=Color_G;
  end;
end;

procedure Tfm5401.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
  Button1.SetFocus;
  fl_Update:=false;
end;

end.
