unit fmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, XiPanel,ActiveX,BDRecord, ComCtrls, 
  StdCtrls, XiButton, XPMan, Grids;

type
  TForm1 = class(TForm)
    Main: TXiPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    XiPanel18: TXiPanel;
    Edit91: TEdit;
    Edit92: TEdit;
    Edit93: TEdit;
    Edit94: TEdit;
    Edit95: TEdit;
    Edit96: TEdit;
    Edit97: TEdit;
    Edit98: TEdit;
    XiPanel19: TXiPanel;
    Edit99: TEdit;
    Edit100: TEdit;
    Edit101: TEdit;
    Edit102: TEdit;
    Edit103: TEdit;
    Edit104: TEdit;
    Edit105: TEdit;
    Edit106: TEdit;
    XiPanel20: TXiPanel;
    ku1: TComboBox;
    ku2: TComboBox;
    ku3: TComboBox;
    ku4: TComboBox;
    ku5: TComboBox;
    ku6: TComboBox;
    ku7: TComboBox;
    ku8: TComboBox;
    XiPanel21: TXiPanel;
    kn1: TEdit;
    kn2: TEdit;
    kn3: TEdit;
    kn4: TEdit;
    kn5: TEdit;
    kn6: TEdit;
    kn7: TEdit;
    kn8: TEdit;
    XiPanel22: TXiPanel;
    kp1: TEdit;
    kp2: TEdit;
    kp3: TEdit;
    kp4: TEdit;
    kp5: TEdit;
    kp6: TEdit;
    kp7: TEdit;
    kp8: TEdit;
    XiPanel23: TXiPanel;
    XiPanel24: TXiPanel;
    XiPanel25: TXiPanel;
    XiPanel26: TXiPanel;
    ka1: TEdit;
    ka2: TEdit;
    ka3: TEdit;
    ka4: TEdit;
    ka5: TEdit;
    ka6: TEdit;
    ka7: TEdit;
    ka8: TEdit;
    XiPanel5: TXiPanel;
    XiPanel2: TXiPanel;
    XiPanel6: TXiPanel;
    XiPanel4: TXiPanel;
    XiPanel3: TXiPanel;
    XiPanel7: TXiPanel;
    Edit7: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit1: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    pu1: TComboBox;
    pu2: TComboBox;
    pu3: TComboBox;
    pu4: TComboBox;
    pu5: TComboBox;
    pu6: TComboBox;
    pu7: TComboBox;
    pu8: TComboBox;
    pu9: TComboBox;
    pu10: TComboBox;
    pu11: TComboBox;
    pu12: TComboBox;
    pu13: TComboBox;
    pu14: TComboBox;
    pu15: TComboBox;
    pu16: TComboBox;
    ps1: TEdit;
    pf1: TEdit;
    ps2: TEdit;
    pf2: TEdit;
    ps3: TEdit;
    pf3: TEdit;
    ps4: TEdit;
    pf4: TEdit;
    ps5: TEdit;
    pf5: TEdit;
    ps6: TEdit;
    pf6: TEdit;
    ps7: TEdit;
    pf7: TEdit;
    ps8: TEdit;
    pf8: TEdit;
    ps9: TEdit;
    pf9: TEdit;
    ps10: TEdit;
    pf10: TEdit;
    ps11: TEdit;
    pf11: TEdit;
    ps12: TEdit;
    pf12: TEdit;
    ps13: TEdit;
    pf13: TEdit;
    ps14: TEdit;
    pf14: TEdit;
    ps15: TEdit;
    pf15: TEdit;
    ps16: TEdit;
    pf16: TEdit;
    kb1: TEdit;
    kb2: TEdit;
    kb3: TEdit;
    kb4: TEdit;
    kb5: TEdit;
    kb6: TEdit;
    kb7: TEdit;
    kb8: TEdit;
    kc1: TEdit;
    kc2: TEdit;
    kc3: TEdit;
    kc4: TEdit;
    kc5: TEdit;
    kc6: TEdit;
    kc7: TEdit;
    kc8: TEdit;
    kd1: TEdit;
    kd2: TEdit;
    kd3: TEdit;
    kd4: TEdit;
    kd5: TEdit;
    kd6: TEdit;
    kd7: TEdit;
    kd8: TEdit;
    XiPanel1: TXiPanel;
    pp1: TEdit;
    pp2: TEdit;
    pp3: TEdit;
    pp4: TEdit;
    pp5: TEdit;
    pp6: TEdit;
    pp7: TEdit;
    pp8: TEdit;
    pp9: TEdit;
    pp10: TEdit;
    pp11: TEdit;
    pp12: TEdit;
    pp13: TEdit;
    pp14: TEdit;
    pp15: TEdit;
    pp16: TEdit;
    XiPanel8: TXiPanel;
    ke1: TEdit;
    ke2: TEdit;
    ke3: TEdit;
    ke4: TEdit;
    ke5: TEdit;
    ke6: TEdit;
    ke7: TEdit;
    ke8: TEdit;
    XiButton1: TXiButton;
    XiButton2: TXiButton;
    XiPanel9: TXiPanel;
    Edit4: TEdit;
    Edit10: TEdit;
    Edit13: TEdit;
    Edit16: TEdit;
    XiPanel10: TXiPanel;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    XiPanel11: TXiPanel;
    XiPanel12: TXiPanel;
    XiPanel13: TXiPanel;
    XiPanel14: TXiPanel;
    XiPanel15: TXiPanel;
    XiPanel16: TXiPanel;
    XiPanel17: TXiPanel;
    XiPanel27: TXiPanel;
    ea1: TEdit;
    ea2: TEdit;
    ea3: TEdit;
    ea4: TEdit;
    eb1: TEdit;
    eb2: TEdit;
    eb3: TEdit;
    eb4: TEdit;
    ec1: TEdit;
    ec2: TEdit;
    ec3: TEdit;
    ec4: TEdit;
    ed1: TEdit;
    ed2: TEdit;
    ed3: TEdit;
    ed4: TEdit;
    ee1: TEdit;
    ee2: TEdit;
    ee3: TEdit;
    ee4: TEdit;
    ef1: TEdit;
    ef2: TEdit;
    ef3: TEdit;
    ef4: TEdit;
    eg1: TEdit;
    eg2: TEdit;
    eg3: TEdit;
    eg4: TEdit;
    eh1: TEdit;
    eh2: TEdit;
    eh3: TEdit;
    eh4: TEdit;
    Write2437: TXiButton;
    Read2437: TXiButton;
    XiPanel28: TXiPanel;
    XiPanel29: TXiPanel;
    XiPanel30: TXiPanel;
    XiPanel31: TXiPanel;
    XiPanel32: TXiPanel;
    XiPanel34: TXiPanel;
    XiPanel36: TXiPanel;
    XiPanel37: TXiPanel;
    XiPanel38: TXiPanel;
    XiPanel39: TXiPanel;
    XiPanel40: TXiPanel;
    XiPanel41: TXiPanel;
    XiPanel42: TXiPanel;
    XiPanel43: TXiPanel;
    kf1: TEdit;
    kf2: TEdit;
    kf3: TEdit;
    kf4: TEdit;
    kf5: TEdit;
    kf6: TEdit;
    kf7: TEdit;
    kf8: TEdit;
    kf9: TEdit;
    kf10: TEdit;
    ReadParam: TXiButton;
    WriteParam: TXiButton;
    TabSheet2: TTabSheet;
    XiPanel49: TXiPanel;
    XiPanel50: TXiPanel;
    XiPanel51: TXiPanel;
    Edit57: TEdit;
    Edit58: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    Edit67: TEdit;
    Edit68: TEdit;
    Edit69: TEdit;
    Edit70: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Edit79: TEdit;
    Edit80: TEdit;
    Edit81: TEdit;
    Edit82: TEdit;
    Edit83: TEdit;
    Edit84: TEdit;
    Edit85: TEdit;
    Edit86: TEdit;
    Edit87: TEdit;
    Edit88: TEdit;
    Edit89: TEdit;
    Edit90: TEdit;
    ru16: TComboBox;
    ru15: TComboBox;
    Edit107: TEdit;
    Edit108: TEdit;
    ru14: TComboBox;
    ru13: TComboBox;
    Edit109: TEdit;
    Edit110: TEdit;
    ru12: TComboBox;
    ru11: TComboBox;
    Edit111: TEdit;
    Edit112: TEdit;
    ru10: TComboBox;
    ru9: TComboBox;
    Edit113: TEdit;
    Edit114: TEdit;
    ru8: TComboBox;
    ru7: TComboBox;
    Edit115: TEdit;
    Edit116: TEdit;
    ru6: TComboBox;
    ru5: TComboBox;
    Edit117: TEdit;
    Edit118: TEdit;
    ru4: TComboBox;
    ru3: TComboBox;
    Edit119: TEdit;
    Edit120: TEdit;
    ru2: TComboBox;
    ru1: TComboBox;
    rs1: TEdit;
    rf1: TEdit;
    rs2: TEdit;
    rf2: TEdit;
    rs3: TEdit;
    rf3: TEdit;
    rs4: TEdit;
    rf4: TEdit;
    rs5: TEdit;
    rf5: TEdit;
    rs6: TEdit;
    rf6: TEdit;
    rs7: TEdit;
    rf7: TEdit;
    rs8: TEdit;
    rf8: TEdit;
    rs9: TEdit;
    rf9: TEdit;
    rs10: TEdit;
    rf10: TEdit;
    rs11: TEdit;
    rf11: TEdit;
    rs12: TEdit;
    rf12: TEdit;
    rs13: TEdit;
    rf13: TEdit;
    rs14: TEdit;
    rf14: TEdit;
    rs15: TEdit;
    rf15: TEdit;
    rs16: TEdit;
    rf16: TEdit;
    rp16: TEdit;
    rp15: TEdit;
    rp14: TEdit;
    rp13: TEdit;
    rp12: TEdit;
    rp11: TEdit;
    rp10: TEdit;
    rp9: TEdit;
    rp8: TEdit;
    rp7: TEdit;
    rp6: TEdit;
    rp5: TEdit;
    rp4: TEdit;
    rp2: TEdit;
    rp3: TEdit;
    rp1: TEdit;
    XiButton3: TXiButton;
    XiButton4: TXiButton;
    XiButton5: TXiButton;
    XiButton6: TXiButton;
    XiPanel33: TXiPanel;
    XiPanel35: TXiPanel;
    XiPanel44: TXiPanel;
    XiPanel45: TXiPanel;
    XiPanel46: TXiPanel;
    XiPanel47: TXiPanel;
    XiPanel48: TXiPanel;
    XiPanel52: TXiPanel;
    XiPanel53: TXiPanel;
    XiPanel54: TXiPanel;
    XiPanel57: TXiPanel;
    XiPanel58: TXiPanel;
    XPManifest1: TXPManifest;
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure kf7Change(Sender: TObject);
    procedure kf3Change(Sender: TObject);
    procedure kf1Change(Sender: TObject);
    procedure WriteParamClick(Sender: TObject);
    procedure ReadParamClick(Sender: TObject);
    procedure Read2437Click(Sender: TObject);
    procedure Write2437Click(Sender: TObject);
    procedure ReadKUClick(Sender: TObject);
    procedure kb1Change(Sender: TObject);
    procedure ka1Change(Sender: TObject);
    procedure WriteKUClick(Sender: TObject);
    procedure ReadPostClick(Sender: TObject);
    procedure WritePostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.WriteKUClick(Sender: TObject);
var F: file of TKUr;
    i: integer;
begin
  for i:=1 to 8 do
  begin
    if Form1.FindComponent('ku'+IntToStr(i))<>nil then
    if TComboBox(Form1.FindComponent('ku'+IntToStr(i))).ItemIndex=1 then fKU[i].Use:=true
                                                                    else fKU[i].Use:=false
                                                                    else fKU[i].Use:=false;
    if Form1.FindComponent('kn'+IntToStr(i))<>nil then
      fKU[i].Name:=TRIM(TEdit(Form1.FindComponent('kn'+IntToStr(i))).Text);
    if Form1.FindComponent('kp'+IntToStr(i))<>nil then
      fKU[i].PName:=TRIM(TEdit(Form1.FindComponent('kp'+IntToStr(i))).Text);
    if Form1.FindComponent('ka'+IntToStr(i))<>nil then
      fKU[i].YCG:=StrToIntDef(TEdit(Form1.FindComponent('ka'+IntToStr(i))).Text,0);
    if Form1.FindComponent('kb'+IntToStr(i))<>nil then
      fKU[i].YCE:=StrToIntDef(TEdit(Form1.FindComponent('kb'+IntToStr(i))).Text,0);
    if Form1.FindComponent('kc'+IntToStr(i))<>nil then
      fKU[i].CCG:=StrToIntDef(TEdit(Form1.FindComponent('kc'+IntToStr(i))).Text,0);
    if Form1.FindComponent('kd'+IntToStr(i))<>nil then
      fKU[i].CCE:=StrToIntDef(TEdit(Form1.FindComponent('kd'+IntToStr(i))).Text,0);
    if Form1.FindComponent('ke'+IntToStr(i))<>nil then
      fKU[i].Position:=TRIM(TEdit(Form1.FindComponent('ke'+IntToStr(i))).Text);
  end;
  AssignFile(F, ExtractFilePath(ParamStr(0))+'KU.mtk');
  Rewrite(F);
  try
    for i:= 1 to 8 do Write (F, fKU[i]);
  finally
    CloseFile(F);
  end;
end;

procedure TForm1.WriteParamClick(Sender: TObject);
var F:file of TKUParam;
begin
   fKUParam.Umin :=StrToFloatDef(kf1.Text ,0);
   fKUParam.Umax :=StrToFloatDef(kf2.Text ,0);
   fKUParam.Tmin1:=StrToIntDef  (kf3.Text ,0);
   fKUParam.Tmin2:=StrToIntDef  (kf4.Text ,0);
   fKUParam.Tmax1:=StrToIntDef  (kf5.Text ,0);
   fKUParam.Tmax2:=StrToIntDef  (kf6.Text ,0);
   fKUParam.Nmin :=StrToIntDef  (kf7.Text ,0);
   fKUParam.Nmax :=StrToIntDef  (kf8.Text ,0);
   fKUParam.H1   :=StrToIntDef  (kf9.Text ,0);
   fKUParam.H2   :=StrToIntDef  (kf10.Text,0);
   AssignFile(F,ExtractFilePath(ParamStr(0))+'KUParam.mtk');
   Rewrite(F);
   try
     Write(F,fKUParam);
   finally
     CloseFile(F);
   end;
end;

procedure TForm1.WritePostClick(Sender: TObject);
var F: file of T7210;
    i: integer;
    f7210:array [0..13] of T7210;
    NameofFile:string;
    h:char;
begin
  case (Sender as TXiButton).Tag of
    1: begin NameOfFile:='Post1.mtk';  h:='p'; end;
    2: begin NameOfFile:='Post2.mtk';  h:='r'; end;
    else exit;
  end;
  for i:=0 to 13 do
  begin
    if Form1.FindComponent(h+'u'+IntToStr(i+1))<>nil then
    if TComboBox(Form1.FindComponent(h+'u'+IntToStr(i+1))).ItemIndex=1 then f7210[i].Use:=true
                                                                      else f7210[i].Use:=false
                                                                      else f7210[i].Use:=false;
    if Form1.FindComponent(h+'s'+IntToStr(i+1))<>nil then
    f7210[i].SName:=TRIM(TEdit(Form1.FindComponent(h+'s'+IntToStr(i+1))).Text);
    if Form1.FindComponent(h+'f'+IntToStr(i+1))<>nil then
    f7210[i].Name :=TRIM(TEdit(Form1.FindComponent(h+'f'+IntToStr(i+1))).Text);
    if Form1.FindComponent(h+'p'+IntToStr(i+1))<>nil then
    f7210[i].Position:=TRIM(TEdit(Form1.FindComponent(h+'p'+IntToStr(i+1))).Text);
  end;
  AssignFile(F, ExtractFilePath(ParamStr(0))+NameOfFile);
  Rewrite(F);
  try
    for i:= 0 to 13 do Write (F, f7210[i]);
  finally
    CloseFile(F);
  end;
end;

procedure TForm1.Write2437Click(Sender: TObject);
const NameArray: array [1..8] of char = (('a'),('b'),('c'),('d'),('e'),('f'),('g'),('h'));
var F: file of TEM2437;
    i,j: integer;
begin
  for i:=1 to 4 do
    for j:=1 to 4 do
    begin
      if Form1.FindComponent('e'+NameArray[j*2-1]+IntToStr(i))<>nil then
      fEM2437[i].Correction[j].GainFactor:=StrToIntDef(TEdit(Form1.FindComponent('e'+NameArray[j*2-1]+IntToStr(i))).Text,0);
      if Form1.FindComponent('e'+NameArray[j*2]+IntToStr(i))<>nil then
      fEM2437[i].Correction[j].Equalization:=StrToIntDef(TEdit(Form1.FindComponent('e'+NameArray[j*2]+IntToStr(i))).Text,0);
    end;
  AssignFile(F, ExtractFilePath(ParamStr(0))+'EM2437.mtk');
  Rewrite(F);
  try
    for i:= 1 to 4 do Write (F, fEM2437[i]);
  finally
    CloseFile(F);
  end;
end;

procedure TForm1.ka1Change(Sender: TObject);
var s:string;
    i:integer;
begin
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then exit;
  i:=StrToIntDef(s,-1);
  if i=-1 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<0) or (i>200) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
end;

procedure TForm1.kb1Change(Sender: TObject);
var s:string;
    i:integer;
begin
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then exit;
  i:=StrToIntDef(s,-1);
  if i=-1 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<0) or (i>100) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
end;

procedure TForm1.kf1Change(Sender: TObject);
var s:string;
    i:single;
begin
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then exit;
  i:=StrToFloatDef(s,-1);
  if i=-1 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<0) or (i>24) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;

end;

procedure TForm1.kf3Change(Sender: TObject);
var s:string;
    i:integer;
begin
  s:=(Sender as TEdit).Text;
  if s='-' then exit;
  if TRIM(s)='' then exit;
  i:=StrToIntDef(s,-101);
  if i=-101 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<-100) or (i>100) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
end;

procedure TForm1.kf7Change(Sender: TObject);
var s:string;
    i:integer;
begin
  s:=(Sender as TEdit).Text;
  if TRIM(s)='' then exit;
  i:=StrToIntDef(s,-1);
  if i=-1 then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
  if (i<0) or (i>10000) then
  begin
    (Sender as TEdit).Text:='';
    exit;
  end;
end;

procedure TForm1.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  ShowMEssage('Write there');
end;

procedure TForm1.Read2437Click(Sender: TObject);
const NameArray: array [1..8] of char = (('a'),('b'),('c'),('d'),('e'),('f'),('g'),('h'));
var F: file of TEM2437;
    i,j: integer;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0))+'EM2437.mtk');
  Reset(F);
  try
    for i:= 1 to 4 do Read (F, fEM2437[i]);
  finally
    CloseFile(F);
  end;
  for i:=1 to 4 do
    for j:=1 to 4 do
    begin
      if Form1.FindComponent('e'+NameArray[j*2-1]+IntToStr(i))<>nil then
        TEdit(Form1.FindComponent('e'+NameArray[j*2-1]+IntToStr(i))).Text:=IntToStr(fEM2437[i].Correction[j].GainFactor);
      if Form1.FindComponent('e'+NameArray[j*2]+IntToStr(i))<>nil then
        TEdit(Form1.FindComponent('e'+NameArray[j*2]+IntToStr(i))).Text:=IntToStr(fEM2437[i].Correction[j].Equalization);
    end;
end;

procedure TForm1.ReadKUClick(Sender: TObject);
var F: file of TKUr;
    i: integer;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0))+'KU.mtk');
  Reset(F);
  try
    for i:= 1 to 8 do
    Read (F, fKU[i]);
  finally
    CloseFile(F);
  end;
  for i:=1 to 8 do
  begin
    if Form1.FindComponent('ku'+IntToStr(i))<>nil then
    if fKU[i].Use then
    begin
      TComboBox(Form1.FindComponent('ku'+IntToStr(i))).ItemIndex:=1;
      TComboBox(Form1.FindComponent('ku'+IntToStr(i))).Text:='   true';
    end;
    if Form1.FindComponent('kn'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('kn'+IntToStr(i))).Text:=fKU[i].Name;
    if Form1.FindComponent('kp'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('kp'+IntToStr(i))).Text:=fKU[i].PName;
    if Form1.FindComponent('ka'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('ka'+IntToStr(i))).Text:=IntToStr(fKU[i].YCG);
    if Form1.FindComponent('kb'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('kb'+IntToStr(i))).Text:=IntToStr(fKU[i].YCE);
    if Form1.FindComponent('kc'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('kc'+IntToStr(i))).Text:=IntToStr(fKU[i].CCG);
    if Form1.FindComponent('kd'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('kd'+IntToStr(i))).Text:=IntToStr(fKU[i].CCE);
    if Form1.FindComponent('ke'+IntToStr(i))<>nil then
      TEdit(Form1.FindComponent('ke'+IntToStr(i))).Text:=fKU[i].Position;
  end;
end;

procedure TForm1.ReadParamClick(Sender: TObject);
var F:file of TKUParam;
begin
  AssignFile(F,ExtractFilePath(ParamStr(0))+'KUParam.mtk');
  Reset(F);
  try
    Read(F,fKUParam);
  finally
    CloseFile(F);
  end;
  kf1.Text :=FloatToStrF(fKUParam.Umin,ffFixed,6,2);
  kf2.Text :=FloatToStrF(fKUParam.Umax,ffFixed,6,2);
  kf3.Text :=IntToStr(fKUParam.Tmin1);
  kf4.Text :=IntToStr(fKUParam.Tmin2);
  kf5.Text :=IntToStr(fKUParam.Tmax1);
  kf6.Text :=IntToStr(fKUParam.Tmax2);
  kf7.Text :=IntToStr(fKUParam.Nmin);
  kf8.Text :=IntToStr(fKUParam.Nmax);
  kf9.Text :=IntToStr(fKUParam.H1);
  kf10.Text:=IntToStr(fKUParam.H2);
end;

procedure TForm1.ReadPostClick(Sender: TObject);
var F: file of T7210;
    i: integer;
    NameOfFile:string;
    Nk:char;
begin
  case (Sender as TXiButton).Tag of
    1: begin NameOfFile:=ExtractFilePath(ParamStr(0))+'Post1.mtk';   nk:='p'; end;
    2: begin NameOfFile:=ExtractFilePath(ParamStr(0))+'Post2.mtk';   nk:='r'; end
    else exit;
  end;
  AssignFile(F, NameOfFile);
  Reset(F);
  try
    for i:= 0 to 13 do
    Read (F, f72101[i]);
  finally
    CloseFile(F);
  end;
  for i:=0 to 12 do
  begin
    if Form1.FindComponent(nk+'u'+IntToStr(i+1))<>nil then
    if f72101[i].Use then
    begin
      TComboBox(Form1.FindComponent(nk+'u'+IntToStr(i+1))).ItemIndex:=1;
      TComboBox(Form1.FindComponent(nk+'u'+IntToStr(i+1))).Text:='   true';
    end;
    if Form1.FindComponent(nk+'s'+IntToStr(i+1))<>nil then
      TEdit(Form1.FindComponent(nk+'s'+IntToStr(i+1))).Text:=' '+f72101[i].SName;
    if Form1.FindComponent(nk+'f'+IntToStr(i+1))<>nil then
      TEdit(Form1.FindComponent(nk+'f'+IntToStr(i+1))).Text:=' '+f72101[i].Name;
    if Form1.FindComponent(nk+'p'+IntToStr(i+1))<>nil then
      TEdit(Form1.FindComponent(nk+'p'+IntToStr(i+1))).Text:=' '+f72101[i].Position;
  end;
end;

end.
