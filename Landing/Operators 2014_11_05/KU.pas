unit KU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls,Global,UnitDM;

type
  Tfm_KU = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    i2: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel10: TPanel;
    Panel11: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel12: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel13: TPanel;
    Panel14: TPanel;
    i5: TImage;
    Label5: TLabel;
    Panel15: TPanel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Panel16: TPanel;
    Panel17: TPanel;
    i6: TImage;
    Label6: TLabel;
    Panel18: TPanel;
    Button9: TButton;
    Button10: TButton;
    Panel19: TPanel;
    Panel20: TPanel;
    i7: TImage;
    Label7: TLabel;
    Panel21: TPanel;
    Label10: TLabel;
    bYCG: TSpeedButton;
    Label11: TLabel;
    bYCE: TSpeedButton;
    eYCG: TEdit;
    udYCG: TUpDown;
    eYCE: TEdit;
    udYCE: TUpDown;
    Panel22: TPanel;
    Panel23: TPanel;
    i8: TImage;
    Label8: TLabel;
    Panel24: TPanel;
    Label12: TLabel;
    bCCG: TSpeedButton;
    Label13: TLabel;
    bCCE: TSpeedButton;
    eCCG: TEdit;
    udCCG: TUpDown;
    eCCE: TEdit;
    udCCE: TUpDown;
    Panel28: TPanel;
    Button15: TButton;
    Button11: TButton;
    Button12: TButton;
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
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit18: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    e7: TEdit;
    e8: TEdit;
    e9: TEdit;
    e10: TEdit;
    e11: TEdit;
    e12: TEdit;
    e13: TEdit;
    e14: TEdit;
    e15: TEdit;
    e16: TEdit;
    e17: TEdit;
    e18: TEdit;
    e19: TEdit;
    Panel25: TPanel;
    Panel26: TPanel;
    i9: TImage;
    Label9: TLabel;
    Panel27: TPanel;
    RichEdit1: TRichEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure bCCEClick(Sender: TObject);
    procedure bCCGClick(Sender: TObject);
    procedure bYCEClick(Sender: TObject);
    procedure bYCGClick(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure AddCommand(NumbCom:integer);
    procedure AddCommand2(NumbCom,Value:integer);
    procedure Reload;
    procedure SetValues;
    procedure SetNoValues;
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MSD;
  private
    CMess:cardinal;
    ss:String;
    fl_Change:boolean;
    fl_Update:boolean;
  public
    DEVICE_ID:cardinal;
    TVMode   :byte;
  end;

var
  fm_KU: Tfm_KU;
  mKU:TKU;
const
     Tno :Single = 10000;

implementation

{$R *.dfm}

procedure Tfm_KU.ServMsd(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[Device_ID].Enter; try mKU:=TKU((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  case Msg.LParam of
     1..33:
          RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: '+Command_TM2220[Msg.LParam].cComment);
     222: RichEdit1.Lines.Add(TimeToStr(Now)+' '+mKU.Error);
  end;
  SetValues;
end;

procedure Tfm_KU.SetNoValues;
  var i:integer;
begin
  E1.Text:='NO';
  E1.Color:=Color_R;
  for i := 2 to 20 do
    if fm_KU.FindComponent('e'+IntToStr(i))<>nil then
    begin
      TEdit(fm_KU.FindComponent('e'+IntToStr(i))).Brush.Color:=clBtnFace;
      TEdit(fm_KU.FindComponent('e'+IntToStr(i))).Text:='NO DATA';
    end;
  Panel7.Enabled:=true;
  Panel10.Enabled:=true;
  Panel13.Enabled:=true;
  Panel16.Enabled:=true;
  Panel19.Enabled:=true;
  Panel22.Enabled:=true;
  RichEdit1.Clear;
end;

procedure Tfm_KU.SetValues;
  procedure SmartEditColor(Edit:TEdit;Color:TColor);
  begin
    if Edit.Color<>Color then Edit.Color:=Color;
  end;
var fl:word;
    pUsY:integer;
begin
  if mKU.DataExh=0 then begin SetNoValues; exit; end;
  Panel7.Enabled:=true;
  Panel10.Enabled:=true;
  Panel13.Enabled:=true;
  Panel16.Enabled:=true;
  Panel19.Enabled:=true;
  Panel22.Enabled:=true;
  E1.Text:='Yes';
  SmartEditColor(e1,Color_G);
  //Признак включения ТВ-камеры.
  with mKU  do
  begin
    if TVK then
    begin
      E2.Text:='ON';
      SmartEditColor(e2,Color_G);
    end else
    begin
      E2.Text:='OFF';
      SmartEditColor(e2,Color_S);
    end;
  //Напряжение питания видеокамеры
  E3.Text:=FloatToStrF(Upit,ffFixed,6,1);
  fl:=1;
  if KUConst.fl_U1 then if (Upit<=Kuconst.Umin1) or (Upit>=KUconst.Umax1) then fl:=3;
  if KUConst.fl_U2 then if (Upit<=Kuconst.Umin2) or (Upit>=KUconst.Umax2) then fl:=0;
  case fl of
    0 : SmartEditColor(e3,Color_R);
    1 : SmartEditColor(e3,Color_G);
    2 : SmartEditColor(e3,Color_S);
    3 : SmartEditColor(e3,Color_Y);
  end;
  //Температура внутри видеокамеры
  E4.Text:=FloatToStrF(Temp,ffFixed,6,1);
  fl:=1;
  if KUConst.fl_T1 then if (Temp<=Kuconst.Tmin1) or (Temp>=KUconst.Tmax1) then fl:=3;
  if KUConst.fl_T2 then if (Temp<=Kuconst.Tmin2) or (Temp>=KUconst.Tmax2) then fl:=0;
  case fl of
    0 : SmartEditColor(e4,Color_R);
    1 : SmartEditColor(e4,Color_G);
    2 : SmartEditColor(e4,Color_S);
    3 : SmartEditColor(e4,Color_Y);
  end;
  //Признак достоверности температуры.
  if TeIn then begin E5.Text:='YES';   SmartEditColor(e5,Color_G);end
          else begin E5.Text:='NO';    SmartEditColor(e5,Color_R);end;
  //Уровень влажности внутри видеокамеры
  E6.Text:=FloatToStrF(Vlag,ffFixed,6,1);
  fl:=1;
  if KUConst.fl_H1 then if Vlag>KUConst.H1 then fl:=3;
  if KUConst.fl_H2 then if Vlag>KUConst.H2 then fl:=0;
  case fl of
    0 : SmartEditColor(e6,Color_R);
    1 : SmartEditColor(e6,Color_G);
    2 : SmartEditColor(e6,Color_S);
    3 : SmartEditColor(e6,Color_Y);
  end;
 //Признак включения вентилятора
   if VeOn then
   begin
     E7.Text:='ON';
     SmartEditColor(e7,Color_G);
   end else
   begin
     E7.Text:='OFF';
     SmartEditColor(e7,Color_S);
   end;
   //Скорость вращения вентилятора
   if VeOn then
   begin
     E8.Text:=FloatToStrF(Vent,ffFixed,6,0);
     if KUConst.fl_N then if Vent>KUConst.Nmax then fl:=1 else fl:=3;
     case fl of
       0 : SmartEditColor(e8,Color_R);
       1 : SmartEditColor(e8,Color_G);
       2 : SmartEditColor(e8,Color_S);
       3 : SmartEditColor(e8,Color_Y);
     end;
   end else
   begin
     Edit8.Text:='NO USE';
     SmartEditColor(e8,Color_S);
   end;
   //Режим работы вентилятора
   if VeAu then
   begin
     E9.Text:='AUTO';
     SmartEditColor(e9,Color_G);
   end else
   begin
     E9.Text:='MANUAL';
     SmartEditColor(e9,Color_S);
   end;
  //Признак включения обогревателя
  if PwOn then begin E10.Text:='ON';    SmartEditColor(e10,Color_G);end
          else begin E10.Text:='OFF';   SmartEditColor(e10,Color_S);end;
  //Признак исправности обогрева. 1 - исправен
  if PwIn then begin E11.Text:='YES';   SmartEditColor(e11,Color_G);end
          else begin
  if PwOn then begin E11.Text:='NO';SmartEditColor(e11,Color_S);end
          else begin E11.Text:='NO USE';SmartEditColor(e11,Color_S);end; end;
  //Режим работы обогревателя
  if PwAu then
  begin
    E12.Text:='AUTO';
    SmartEditColor(e12,Color_G);
  end else
  begin
    E12.Text:='MANUAL';
    SmartEditColor(e12,Color_S);
  end;
 //Признак наличия синхросигнала. 1 - ССП в видеосигнале есть
 if SSP  then begin E13.Text:='YES';   SmartEditColor(e13,Color_G);end
         else begin E13.Text:='NO';    SmartEditColor(e13,Color_R);end;
 //Признак включения светодиода. 1 - включен
  if Svd  then
  begin
    E15.Text:='ON';
    SmartEditColor(e15,Color_G);
  end else
  begin
    E15.Text:='OFF';
    SmartEditColor(e15,Color_S);
  end;
  //Коэффициент усиления в корректоре "Y"
  E16.Text:=IntToStr(UsY);
  //Наклон АЧХ в корректоре "Y"
  E17.Text:=IntToStr(AhxY);
  end;

end;

procedure Tfm_KU.Reload;
begin
  fl_Update:=true;
  DM.KUSetup.Open;
  cs_ArrDevice[Device_ID].Enter;
  while not DM.KUSetup.Eof do
  begin
    if DM.KUSetupDevice_ID.Value<>Device_ID then
       DM.KUSetup.Next else
    with TKU(ArrDevice[DEVICE_ID]) do
    begin
      TKU(ArrDevice[DEVICE_ID]).bUsY :=DM.KUSetupUsY.Value;
      TKU(ArrDevice[DEVICE_ID]).bAhxY:=DM.KUSetupAhxY.Value;
      TKU(ArrDevice[DEVICE_ID]).bUsC :=DM.KUSetupUsC.Value;
      TKU(ArrDevice[DEVICE_ID]).bAhxC:=DM.KUSetupAhxC.Value;
      break;
    end;
  end;
  cs_ArrDevice[Device_ID].Leave;
  DM.KUSetup.Close;
  AddCommand2(19,TKU(ArrDevice[Device_ID]).bUsY);
  AddCommand2(20,TKU(ArrDevice[Device_ID]).bAhxY);
end;

procedure Tfm_KU.AddCommand2(NumbCom: Integer; Value: Integer);
var command:TMass;
    s:String;
    pms:^Tmass;
begin
     //сама комманда
     command[1]:=HI(ComDev[DEVICE_ID].cAdress);
     command[2]:=LO(ComDev[DEVICE_ID].cAdress);
     command[3]:=Command_TM2220[NumbCom].cCommand;
     command[4]:=Value;
     command[5]:=$ff-(command[1]+command[2]+command[3]+command[4])+1;
     //структура для записи в TList
     New(pms);
     pms^[1]:=Device_ID;                   //Device_ID
     pms^[2]:=ComDev[DEVICE_ID].cCom_ID;   //Com_ID;
     pms^[3]:=5;                   //размер комманды
     pms^[4]:=NumbCom;                   //номер команды
     pms^[5]:=0;
     pms^[6]:=0;
     pms^[7]:=command[1];
     pms^[8]:=command[2];
     pms^[9]:=command[3];
     pms^[10]:=command[4];
     pms^[11]:=command[5];
     //поставить в очередь на выполнение
     cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

procedure Tfm_KU.bCCEClick(Sender: TObject);
begin
  AddCommand2(22,StrToInt(eCCE.Text));
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm_KU.bCCGClick(Sender: TObject);
begin
  AddCommand2(21,StrToInt(eCCG.Text));
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm_KU.AddCommand(NumbCom: Integer);
var command:TMass;
pms:^Tmass;
begin
     //сама комманда
     command[1]:=HI(ComDev[DEVICE_ID].cAdress);
     command[2]:=LO(ComDev[DEVICE_ID].cAdress);
     command[3]:=Command_TM2220[NumbCom].cCommand;
     command[4]:=$ff-(command[1]+command[2]+command[3])+1;
     //структура для записи в TList
     New(pms);
     pms^[1]:=Device_ID;                   //Device_ID
     pms^[2]:=ComDev[DEVICE_ID].cCom_ID;   //Com_ID;
     pms^[3]:=4;                   //размер комманды
     pms^[4]:=NumbCom;                   //номер команды
     pms^[5]:=0;
     pms^[6]:=0;
     pms^[7]:=command[1];
     pms^[8]:=command[2];
     pms^[9]:=command[3];
     pms^[10]:=command[4];
     //поставить в очередь на выполнение
     cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

procedure Tfm_KU.Button10Click(Sender: TObject);
begin
  AddCommand(4);
end;

procedure Tfm_KU.Button11Click(Sender: TObject);
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin RELOAD; fl_Change:=false;
   end else exit;
end;

procedure Tfm_KU.Button12Click(Sender: TObject);
begin
  fl_Update:=true;
  if fl_Change then
  if Application.MessageBox('Values of the parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    //восстановление данных из базы данных
    Reload;
    fl_Change:=false;
  end;
  if not fl_Change then
  begin
    Panel19.Top:=305+1000;
    Panel22.Top:=380+1000;
    Panel28.Top:=455+1000;
    ss:='';
    BorderIcons:=[biSystemMenu];
  end;
end;

procedure Tfm_KU.Button15Click(Sender: TObject);
var s:string;
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'#13#10'Action it is irreversible.You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin
     //запись установленных параметров в базу данных
     bYCG.Click;
     bYCE.Click;
     bCCG.Click;
     bCCE.Click;
     s:='UPDATE KUSetup SET UsY='+eYCG.Text+', AhxY='+eYCE.Text+' WHERE Device_ID='+IntToStr(DEVICE_ID);
     DM.QDin.SQL.Clear;
     DM.QDin.SQL.Add(s);
     DM.QDin.ExecSQL;
     DM.QDin.Close;
     cs_ArrDevice[Device_ID].Enter;
       TKU(ArrDevice[Device_ID]).bUsY :=StrToInt(eYCG.Text);
       TKU(ArrDevice[Device_ID]).bAhxY:=StrToInt(eYCE.Text);
     cs_ArrDevice[Device_ID].Leave;
     fl_Change:=false;
   end else exit;
end;

procedure Tfm_KU.Button1Click(Sender: TObject);
begin
  AddCommand(1);
end;

procedure Tfm_KU.Button2Click(Sender: TObject);
begin
  AddCommand(2);
end;

procedure Tfm_KU.Button3Click(Sender: TObject);
begin
  AddCommand(15);
end;

procedure Tfm_KU.Button4Click(Sender: TObject);
begin
  AddCommand(16);
end;

procedure Tfm_KU.Button5Click(Sender: TObject);
begin
  AddCommand(17);
end;

procedure Tfm_KU.Button6Click(Sender: TObject);
begin
  AddCommand(12);
end;

procedure Tfm_KU.Button7Click(Sender: TObject);
begin
  AddCommand(13);
end;

procedure Tfm_KU.Button8Click(Sender: TObject);
begin
  AddCommand(14);
end;

procedure Tfm_KU.Button9Click(Sender: TObject);
begin
  AddCommand(3);
end;

procedure Tfm_KU.bYCEClick(Sender: TObject);
begin
  AddCommand2(20,StrToInt(eYCE.Text));
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm_KU.bYCGClick(Sender: TObject);
begin
  AddCommand2(19,StrToInt(eYCG.Text));
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm_KU.FormActivate(Sender: TObject);
var i:integer;
begin
  fl_Update:=true;
  fl_Change:=false;
  CMess:=0;
  eYCG.Text:=IntToStr(koor[DEVICE_ID].UsY);
  eYCE.Text:=IntToStr(koor[DEVICE_ID].AhxY);
  eCCG.Text:='0'; eCCE.Text:='0';
  //Т.к. камеры у меня только ч.б
  E18.Text:='NO USE'; E18.Color:=Color_S;
  E19.Text:='NO USE'; E19.Color:=Color_S;
  E14.Text:='NO USE';
  E14.Color:=Color_S;
  cs_ArrDevice[Device_ID].Enter; try mKU:=TKU((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  udYCG.Position:=mKU.bUsY;
  udYCE.Position:=mKU.bAhxY;
  Panel19.Top:=305+1000;
  Panel22.Top:=380+1000;
  Panel28.Top:=455+1000;
  for i:=1 to 9 do
  begin
    if fm_KU.FindComponent('i'+IntToStr(i))= nil then continue;
    with TImage(fm_KU.FindComponent('i'+IntToStr(i))).Canvas do
    begin
      if (i<7) or (i=9) then Brush.Color:=clMedGray
                        else Brush.Color:=clBlack;
      FillRect(TImage(fm_KU.FindComponent('i'+IntToStr(i))).ClientRect)
    end;
  end;
  Panel4.SetFocus;
  SetValues;
end;

procedure Tfm_KU.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    Panel19.Top:=305;
    Panel22.Top:=380;
    Panel28.Top:=455;
  end
   else ss:='';
end;

end.
