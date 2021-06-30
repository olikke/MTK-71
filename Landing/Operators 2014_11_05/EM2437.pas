unit EM2437;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, ExtCtrls,Global, XiButton;

type
  Tfm2437 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    i1: TImage;
    Label8: TLabel;
    Panel6: TPanel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    e1: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    m3: TEdit;
    m4: TEdit;
    m2: TEdit;
    m1: TEdit;
    m5: TEdit;
    m6: TEdit;
    m7: TEdit;
    m8: TEdit;
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
    d1: TEdit;
    d2: TEdit;
    d3: TEdit;
    d4: TEdit;
    d5: TEdit;
    d6: TEdit;
    d7: TEdit;
    d8: TEdit;
    k1: TEdit;
    k2: TEdit;
    k3: TEdit;
    k4: TEdit;
    k5: TEdit;
    k6: TEdit;
    k7: TEdit;
    k8: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    i2: TImage;
    Label9: TLabel;
    Panel9: TPanel;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Panel10: TPanel;
    out11: TShape;
    Panel11: TPanel;
    out21: TShape;
    Panel12: TPanel;
    out31: TShape;
    Panel13: TPanel;
    out41: TShape;
    Panel14: TPanel;
    out12: TShape;
    Panel15: TPanel;
    out22: TShape;
    Panel16: TPanel;
    out32: TShape;
    Panel17: TPanel;
    out42: TShape;
    Panel18: TPanel;
    Panel19: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel20: TPanel;
    XiButton5: TXiButton;
    XiButton6: TXiButton;
    XiButton7: TXiButton;
    p1: TPanel;
    t9: TEdit;
    t10: TEdit;
    u9: TUpDown;
    u10: TUpDown;
    b1: TXiButton;
    t11: TEdit;
    t12: TEdit;
    u11: TUpDown;
    u12: TUpDown;
    b2: TXiButton;
    p2: TPanel;
    t13: TEdit;
    t14: TEdit;
    u13: TUpDown;
    u14: TUpDown;
    b3: TXiButton;
    t15: TEdit;
    t16: TEdit;
    u15: TUpDown;
    u16: TUpDown;
    b4: TXiButton;
    XiButton1: TXiButton;
    XiButton2: TXiButton;
    Panel21: TPanel;
    t17: TEdit;
    t18: TEdit;
    u17: TUpDown;
    u18: TUpDown;
    XiButton3: TXiButton;
    t19: TEdit;
    t20: TEdit;
    u19: TUpDown;
    u20: TUpDown;
    XiButton4: TXiButton;
    XiButton8: TXiButton;
    XiButton9: TXiButton;
    Panel22: TPanel;
    Panel23: TPanel;
    i3: TImage;
    Label3: TLabel;
    Panel24: TPanel;
    RichEdit1: TRichEdit;
    procedure XiButton9Click(Sender: TObject);
    procedure XiButton4Click(Sender: TObject);
    procedure XiButton8Click(Sender: TObject);
    procedure XiButton3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure u9Click(Sender: TObject; Button: TUDBtnType);
    procedure b1Click(Sender: TObject);
    procedure XiButton7Click(Sender: TObject);
    procedure XiButton6Click(Sender: TObject);
    procedure XiButton5Click(Sender: TObject);
    procedure XiButton2Click(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit9Change(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure SetValues;
    procedure SetNoValues;
    procedure AddComm(Cm_ID:byte;AddC:byte;AddN:TCross);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MSD;
    procedure RestoreBase;
    procedure Reload;
    procedure FillMe;
  private
    ss:String;
    fl_Change:boolean;
    mEM2437:TEM2437;
    STT:array[0..23] of byte;
    fl_Update:boolean;
  public
    DEVICE_ID:Cardinal;
  end;

var
  fm2437: Tfm2437;

implementation

uses UnitDM;

{$R *.dfm}

procedure Tfm2437.Reload;
begin
  RestoreBase;
  if TM2404State.DoIt[Device_ID] and $20 <>$20 then
  TM2404State.DoIt[DEVICE_ID]:=TM2404State.DoIt[DEVICE_ID]+$20;
  fl_Update:=true;
end;

procedure Tfm2437.FillMe;
begin
  e1.Text:=' YES';
  e1.Color:=clLime;
  e2.Text:='03';
  e3.Text:='11';
  e4.Text:='01';
  e5.Text:='26';
  e6.Text:='25.04.2013';
  if (Device_ID<>28) and (Device_ID<>29) then
  begin
    e7.Text:=' ON';
    e7.Color:=clLime;
    e8.Text:=' ON';
    e8.Color:=clLime;
  end else
  begin
    e7.Text:=' NO USE';
    e7.Color:=clSilver;
    e8.Text:=' NO USE';
    e8.Color:=clSilver;
  end;
  e9.Text:='100';
  e10.Text:='128';
  e11.Text:='100';
  e12.Text:='128';
  e13.Text:='100';
  e14.Text:='128';
  e15.Text:='100';
  e16.Text:='128';
  k1.Text:='100';
  k2.Text:='100';
  k3.Text:='100';
  k4.Text:='100';
  k5.Text:='255';
  k6.Text:='255';
  k7.Text:='255';
  k8.Text:='255';
  k5.Color:=clLime;
  k6.Color:=clLime;
  k7.Color:=clLime;
  k8.Color:=clLime;
  if (Device_ID<>28) and (Device_ID<>29) then
  begin
    Out11.Brush.Color:=clLime;
    Out22.Brush.Color:=clLime;
    Out31.Brush.Color:=clLime;
    Out42.Brush.Color:=clLIme;
  end else Out12.Brush.Color:=clLime;
end;

procedure Tfm2437.RestoreBase;
begin
  DM.EM2437Param.ParamByName('Device_ID').Value:=DEVICE_ID;
  DM.EM2437Param.Open;
  cs_ArrDevice[Device_ID].Enter;
  with TEM2437(ArrDevice[DEVICE_ID]) do
  begin
    UPSS:=DM.EM2437ParamPSS.Value;
    Gain1:=DM.EM2437ParamGain1.Value;
    Gain2:=DM.EM2437ParamGain2.Value;
    Gain3:=DM.EM2437ParamGain3.Value;
    Gain4:=DM.EM2437ParamGain4.Value;
    Equal1:=DM.EM2437ParamEqual1.Value;
    Equal2:=DM.EM2437ParamEqual2.Value;
    Equal3:=DM.EM2437ParamEqual3.Value;
    Equal4:=DM.EM2437ParamEqual4.Value;
    UPT11:=DM.EM2437ParamPT11.Value;
    UPT12:=DM.EM2437ParamPT12.Value;
    UPT21:=DM.EM2437ParamPT21.Value;
    UPT22:=DM.EM2437ParamPT22.Value;
  end;
  cs_ArrDevice[Device_ID].Leave;
  DM.EM5401Param.Close;
end;

procedure Tfm2437.ServMsd(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[DEVICE_ID].Enter; try mEM2437:=TEM2437((ArrDevice[DEVICE_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  case Msg.LParam of
    1..20:
       begin
         RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: '+Command_EM2437[Msg.LParam].cComment);
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
  //FillMe;
end;

procedure Tfm2437.SetValues;
var ST:byte;
begin
  if mEM2437.DataExh=0 then begin SetNoValues; exit; end;
  with mEM2437 do
  begin
    e1.Text:=' YES'; e1.Color:=clLime;
    e2.Text:=' '+IntToStr(TypeU);
    e3.Text:=' '+IntToStr(VersU);
    e4.Text:=' '+IntToStr(VersP);
    e5.Text:=' '+IntToStr(SerNum);
    if UDate<>0 then e6.Text:='  '+DateToStr(UDate)
                else e6.Text:='  NO DATE';

    if (Device_ID=27) or (Device_ID=26) then
    begin
      if UPSS and $01 = $01 then
      begin
        e7.Text:=' ON ';
        e7.Color:=color_G;
      end else
      begin
        e7.Text:=' OFF ';
        e7.Color:=color_R;
      end;
      if UPSS and $02 = $02 then
      begin
        e8.Text:=' ON ';
        e8.Color:=color_G;
      end else
      begin
        e8.Text:=' OFF ';
        e8.Color:=color_R;
      end;
    end;
    if (Device_ID=28) or (Device_ID=29) then
    begin
      e7.Text:=' NO USE ';
      e7.Color:=clSilver;
      e8.Text:=' NO USE ';
      e8.Color:=clSilver;
    end;
    e9.Text:=' '+IntToStr(Gain1);
    if fl_Update then u9.Position:=Gain1;
    e10.Text:=' '+IntToStr(Equal1);
    if fl_Update then u10.Position:=Equal1;
    e11.Text:=' '+IntToStr(Gain2);
    if fl_Update then U11.Position:=Gain2;
    e12.Text:=' '+IntToStr(Equal2);
    if fl_Update then U12.Position:=Equal2;
    e13.Text:=' '+IntToStr(Gain3);
    if fl_Update then U13.Position:=Gain3;
    e14.Text:=' '+IntToStr(Equal3);
    if fl_Update then U14.Position:=Equal3;
    e15.Text:=' '+IntToStr(Gain4);
    if fl_Update then U15.Position:=Gain4;
    e16.Text:=' '+IntToStr(Equal4);
    if fl_Update then U16.Position:=Equal4;
    if (DEVICE_ID=26) or (DEVICE_ID=27) then
    begin
      k1.Text:=' '+FloatToStrF(UPT11*0.2,ffFixed,4,1);
      if fl_Update then U17.Position:=UPT11;
      k2.Text:=' '+FloatToStrF(UPT12*0.2,ffFixed,4,1);
      if fl_Update then U18.Position:=UPT12;
      k3.Text:=' '+FloatToStrF(UPT21*0.2,ffFixed,4,1);
      if fl_Update then U19.Position:=UPT21;
      k4.Text:=' '+FloatToStrF(UPT22*0.2,ffFixed,4,1);
      if fl_Update then U20.Position:=UPT22;
      k5.Text:=' '+FloatToStrF(UPS11*0.2,ffFixed,4,1);
      k6.Text:=' '+FloatToStrF(UPS12*0.2,ffFixed,4,1);
      k7.Text:=' '+FloatToStrF(UPS21*0.2,ffFixed,4,1);
      k8.Text:=' '+FloatToStrF(UPS22*0.2,ffFixed,4,1);
    end;
  St:=MabVS;
  end;
  case DEVICE_ID of
  26..27:
        begin
          if ST and $01 = $01 then  Out11.Brush.Color:=Color_G else Out11.Brush.Color:=Color_R;
          if ST and $08 = $08 then  Out22.Brush.Color:=Color_G else Out22.Brush.Color:=Color_R;
          if ST and $10 = $10 then  Out31.Brush.Color:=Color_G else Out31.Brush.Color:=Color_R;
          if ST and $80 = $80 then  Out42.Brush.Color:=Color_G else Out42.Brush.Color:=Color_R;
        end;
  28: begin
          if ST and $02 = $02 then  Out12.Brush.Color:=Color_G else Out12.Brush.Color:=Color_R;
      end;
   29: begin
          if ST and $20 = $20 then  Out32.Brush.Color:=Color_G else Out32.Brush.Color:=Color_R;
      end;
  end;
  ST:=mEM2437.Mabus;
  if ST and $01 = $01 then k8.Color:=Color_R
                      else k8.Color:=Color_G;
  if ST and $02 = $02 then k7.Color:=Color_R
                      else k7.Color:=Color_G;
  if ST and $04 = $04 then k6.Color:=Color_R
                      else k6.Color:=Color_G;
  if ST and $08 = $08 then k5.Color:=Color_R
                      else k5.Color:=Color_G;
  Repaint;
end;

procedure Tfm2437.SetNoValues;
var i:integer;
    Edit:TEdit;
begin
    e1.Text:=' NO';
    e1.Color:=Color_R;
    for i:=2 to 16 do
    begin
      Edit:=fm2437.FindComponent('e'+IntToStr(i)) as TEdit;
      if Edit=nil then continue;
      Edit.Text:='';
      Edit.Color:=clWhite;
    end;
    if (DEVICE_ID=26) or (DEVICE_ID=27) then
    for i:=1 to 8 do
    begin
      Edit:=fm2437.FindComponent('k'+IntToStr(i)) as TEdit;
      if edit=nil then continue;
      Edit.Text:='';
      Edit.Color:=clWhite;
    end;
  case DEVICE_ID of
  26..27:
        begin
          Out11.Brush.Color:=Color_R;
          Out22.Brush.Color:=Color_R;
          Out31.Brush.Color:=Color_R;
          Out42.Brush.Color:=Color_R;
        end;
  28: begin
          Out12.Brush.Color:=Color_R;
      end;
   29: begin
          Out32.Brush.Color:=Color_R;
      end;
  end;
end;




procedure Tfm2437.b1Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t9.Text);
  crr[2]:=StrToInt(t10.Text);
  AddComm(7,2,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.b2Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t11.Text);
  crr[2]:=StrToInt(t12.Text);
  AddComm(8,2,crr);
  fl_Change:=true;
  fl_Update:=true;
end;


procedure Tfm2437.b3Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t13.Text);
  crr[2]:=StrToInt(t14.Text);
  AddComm(9,2,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.b4Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t15.Text);
  crr[2]:=StrToInt(t16.Text);
  AddComm(10,2,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.Edit1Change(Sender: TObject);
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

procedure Tfm2437.Edit1Click(Sender: TObject);
begin
  (Sender as TEdit).Text:='';
  fl_Update:=false;
end;

procedure Tfm2437.Edit1Exit(Sender: TObject);
begin
  if (Sender as TEdit).Text='' then  (Sender as TEdit).Text:='128';
  fl_Update:=true;
end;

procedure Tfm2437.Edit2Exit(Sender: TObject);
begin
  if (Sender as TEdit).Text='' then  (Sender as TEdit).Text:='0';
  fl_Update:=true;
end;

procedure Tfm2437.Edit9Change(Sender: TObject);
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
  if fm2437.FindComponent('m'+(Sender as TEdit).Name)<>nil then TEdit(fm2437.FindComponent('m'+(Sender as TEdit).Name)).Text:=FloatToStrF(i*0.2,ffFixed,4,1);

end;

procedure Tfm2437.FormActivate(Sender: TObject);
var i:integer;
begin
 for i:=1 to 4 do
 if fm2437.FindComponent('i'+IntToStr(i))<>nil then
 with TImage(fm2437.FindComponent('i'+IntToStr(i))).Canvas do
 begin
   if i<>4 then Brush.Color:=clMedGray
           else Brush.Color:=clBlack;
   FillRect(TImage(fm2437.FindComponent('i'+IntToStr(i))).ClientRect);
 end;
 Panel2.SetFocus;
  FillChar(STT,SizeOf(STT),4);
  fl_Change:=false;
  fl_Update:=true;
  case DEVICE_ID of
  26,27:
    begin

      Out12.Brush.Color:=clBtnFace;
      Out12.Hint:='NO USE';
      Out21.Brush.Color:=clBtnFace;
      Out21.Hint:='NO USE';
      Out32.Brush.Color:=clBtnFace;
      Out32.Hint:='NO USE';
      Out41.Brush.Color:=clBtnFace;
      Out41.Hint:='NO USE';
    end;
  28,29:
    begin
      XiButton1.Enabled:=false;
      XiButton2.Enabled:=false;
      for i:=1 to 8 do
      if fm2437.FindComponent('d'+IntToStr(i))<>nil then
         TEdit(fm2437.FindComponent('d'+IntToStr(i))).Visible:=false;
      for i:=1 to 8 do
      if fm2437.FindComponent('k'+IntToStr(i))<>nil then
         TEdit(fm2437.FindComponent('k'+IntToStr(i))).Visible:=false;

      Out11.Brush.Color:=clBtnFace;
      Out11.Hint:='NO USE';
      if DEVICE_ID = 29 then
      begin
        Out12.Brush.Color:=clBtnFace;
        Out12.Hint:='NO USE';
      end;
      Out21.Brush.Color:=clBtnFace;
      Out21.Hint:='NO USE';
      if DEVICE_ID = 29 then
      begin
        Out22.Brush.Color:=clBtnFace;
        Out22.Hint:='NO USE';
        Out42.Brush.Color:=clBtnFace;
        Out42.Hint:='NO USE';
      end;
      Out31.Brush.Color:=clBtnFace;
      Out31.Hint:='NO USE';
      if DEVICE_ID = 28 then
      begin
        Out32.Brush.Color:=clBtnFace;
        Out32.Hint:='NO USE';
        Out22.Brush.Color:=clBtnFace;
        Out22.Hint:='NO USE';
      end;
      Out41.Brush.Color:=clBtnFace;
      Out41.Hint:='NO USE';
      if DEVICE_ID = 28 then
      begin
        Out42.Brush.Color:=clBtnFace;
        Out42.Hint:='NO USE';
      end;
      XiButton3.Visible:=false;
      XiButton4.Visible:=false;
      XiButton8.Visible:=false;
      XiButton9.Visible:=false;
      Panel21.Visible  :=false;
      Panel3.Height:=d2.Top+5;
      Panel22.Height:=Panel3.Height;
      Panel18.Height:=Panel3.Height+Panel3.Top-Panel18.Top;
      Height:=Panel6.Top+Panel6.Height+50;
    end;
  end;
  cs_ArrDevice[Device_ID].Enter;
  mEM2437:=TEM2437((ArrDevice[Device_ID]));
  cs_ArrDevice[Device_ID].Leave;
  SetValues;
  if (Device_ID=26) or (Device_ID=27) then
  begin
    fl_NP:=true;
    TypeNP:=Device_ID;
  end;
end;

procedure Tfm2437.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fl_NP:=true;
  TypeNP:=0;
end;

procedure Tfm2437.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    Panel18.Visible:=true;
    BorderIcons:=[];
  end else
  ss:='';
end;

procedure Tfm2437.AddComm(Cm_ID:byte;AddC:byte;AddN:TCross);
var LRC:byte;
    n  :integer;
    pms:^Tmass;
begin
  //добавление в ExternalCom - аналогично CommandList,
  //но для 2404 RabCom добавлояется по результатам анализа TQuestion.TM2404Analiz
  New(pms);
  pms^[1]:=DEVICE_ID;
  pms^[2]:=0;
  pms^[3]:=Command_EM2437[Cm_ID].cComandCount+AddC;
  pms^[4]:=Cm_ID;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[DEVICE_ID].cAdress;
  pms^[8]:=Command_EM2437[Cm_ID].cComandCount-2+AddC;
  pms^[9]:=Command_EM2437[Cm_ID].cCommand;
  LRC:=pms^[7]+pms^[8]+pms^[9];
  for n:=1 to AddC do
  begin
    pms^[9+n]:=AddN[n];
    LRC:=LRC+AddN[n];
  end;
  pms^[10+AddC]:=LRC;
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  fl_Change:=true;
end;

procedure Tfm2437.u9Click(Sender: TObject; Button: TUDBtnType);
begin
  fl_Update:=false;
end;

procedure Tfm2437.XiButton1Click(Sender: TObject);
var crr:TCross;
begin
  if mEM2437.UPSS and $01 = $01 then  crr[1]:=mEM2437.UPSS-$01
  else crr[1]:=mEM2437.UPSS+$01;
  AddComm(3,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.XiButton2Click(Sender: TObject);
var crr:TCross;
begin
  if mEM2437.UPSS and $02 = $02 then  crr[1]:=mEM2437.UPSS-$02
  else crr[1]:=mEM2437.UPSS+$02;
  AddComm(3,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.XiButton3Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t17.Text);
  AddComm(15,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.XiButton4Click(Sender: TObject);
var crr:TCross;
begin
  if (t19.Text='') then EXIT;
  crr[1]:=StrToInt(t19.Text);
  AddComm(17,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.XiButton5Click(Sender: TObject);
var i:integer;
    s:string;
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'#13#10'Action it is irreversible.You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin
     //запись установленных параметров в базу данных
     for i:=1 to 8 do
     if fm2437.FindComponent('BitBtn'+intToStr(i))<>nil then
        TBitBtn(fm2437.FindComponent('BitBtn'+IntToStr(i))).Click;
     case DEVICE_ID of
     26..27:
     s:='UPDATE EM2437Param SET PSS='+IntToStr(mEM2437.UPSS)+
                                ', Gain1='+t9.Text+
                                ', Gain2='+t11.Text+
                                ', Gain3='+t13.Text+
                                ', Gain4='+t15.Text+
                                ', Equal1='+t10.Text+
                                ', Equal2='+t12.Text+
                                ', Equal3='+t14.Text+
                                ', Equal4='+t16.Text+
                                ', PT11='+t17.Text+
                                ', PT12='+t18.Text+
                                ', PT21='+t19.Text+
                                ', PT22='+t20.Text+
                                ' WHERE Device_ID='+IntToStr(DEVICE_ID);
     28..29:
     s:='UPDATE EM2437Param SET PSS='+IntToStr(mEM2437.UPSS)+
                                ', Gain1='+t9.Text+
                                ', Gain2='+t11.Text+
                                ', Gain3='+t13.Text+
                                ', Gain4='+t15.Text+
                                ', Equal1='+t10.Text+
                                ', Equal2='+t12.Text+
                                ', Equal3='+t14.Text+
                                ', Equal4='+t16.Text+
                                ' WHERE Device_ID='+IntToStr(DEVICE_ID);
     end;
     DM.QDin.SQL.Clear;
     DM.QDin.SQL.Add(s);
     DM.QDin.ExecSQL;
     DM.QDin.Close;
     fl_Change:=false;
   end else exit;

end;

procedure Tfm2437.XiButton6Click(Sender: TObject);
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin  RELOAD; fl_Change:=false;
   end else exit;
end;

procedure Tfm2437.XiButton7Click(Sender: TObject);
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
    Panel18.Visible:=false;
    ss:='';
    BorderIcons:=[biSystemMenu];
  end;
end;

procedure Tfm2437.XiButton8Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t18.Text);
  AddComm(16,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

procedure Tfm2437.XiButton9Click(Sender: TObject);
var crr:TCross;
begin
  crr[1]:=StrToInt(t20.Text);
  AddComm(18,1,crr);
  fl_Change:=true;
  fl_Update:=true;
end;

end.
