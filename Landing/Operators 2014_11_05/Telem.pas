unit Telem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,Global, ExtCtrls, StdCtrls;

type
  TTelemetric = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit9: TEdit;
    pp: TPanel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit30: TEdit;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    i1: TImage;
    i2: TImage;
    i3: TImage;
    i4: TImage;
    i5: TImage;
    i6: TImage;
    i7: TImage;
    i8: TImage;
    i9: TImage;
    i10: TImage;
    i11: TImage;
    i12: TImage;
    i13: TImage;
    i14: TImage;
    i15: TImage;
    i16: TImage;
    i17: TImage;
    i18: TImage;
    i19: TImage;
    i20: TImage;
    e0: TEdit;
    e1: TEdit;
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
    e20: TEdit;
    d0: TEdit;
    d1: TEdit;
    d2: TEdit;
    d3: TEdit;
    d4: TEdit;
    d5: TEdit;
    d6: TEdit;
    d7: TEdit;
    d8: TEdit;
    d9: TEdit;
    d10: TEdit;
    d11: TEdit;
    d12: TEdit;
    d13: TEdit;
    d14: TEdit;
    d15: TEdit;
    d16: TEdit;
    d17: TEdit;
    d18: TEdit;
    d19: TEdit;
    d20: TEdit;
    f0: TEdit;
    f1: TEdit;
    f2: TEdit;
    f3: TEdit;
    f4: TEdit;
    f5: TEdit;
    f6: TEdit;
    f7: TEdit;
    f8: TEdit;
    f9: TEdit;
    f10: TEdit;
    f11: TEdit;
    f12: TEdit;
    f13: TEdit;
    f14: TEdit;
    f15: TEdit;
    f16: TEdit;
    f17: TEdit;
    f18: TEdit;
    f19: TEdit;
    t0: TEdit;
    t1: TEdit;
    t2: TEdit;
    t3: TEdit;
    t4: TEdit;
    t5: TEdit;
    t6: TEdit;
    t7: TEdit;
    t8: TEdit;
    t9: TEdit;
    t10: TEdit;
    t11: TEdit;
    t12: TEdit;
    t13: TEdit;
    t14: TEdit;
    t15: TEdit;
    t16: TEdit;
    t17: TEdit;
    t18: TEdit;
    t19: TEdit;
    w0: TEdit;
    w1: TEdit;
    w2: TEdit;
    w3: TEdit;
    w4: TEdit;
    w5: TEdit;
    w6: TEdit;
    w7: TEdit;
    w8: TEdit;
    w9: TEdit;
    w10: TEdit;
    w11: TEdit;
    w12: TEdit;
    w13: TEdit;
    w14: TEdit;
    w15: TEdit;
    w16: TEdit;
    w17: TEdit;
    w18: TEdit;
    w19: TEdit;
    k0: TEdit;
    k1: TEdit;
    k2: TEdit;
    k3: TEdit;
    k4: TEdit;
    k5: TEdit;
    k6: TEdit;
    k7: TEdit;
    k8: TEdit;
    k9: TEdit;
    k10: TEdit;
    k11: TEdit;
    k12: TEdit;
    k13: TEdit;
    k14: TEdit;
    k15: TEdit;
    k16: TEdit;
    k17: TEdit;
    k18: TEdit;
    k19: TEdit;
    Edit31: TEdit;
    Edit36: TEdit;
    Edit61: TEdit;
    Edit62: TEdit;
    Edit63: TEdit;
    Edit64: TEdit;
    Edit65: TEdit;
    Edit66: TEdit;
    f20: TEdit;
    t20: TEdit;
    w20: TEdit;
    k20: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    Edit73: TEdit;
    Edit74: TEdit;
    Edit75: TEdit;
    Edit76: TEdit;
    Edit77: TEdit;
    Edit78: TEdit;
    Panel67: TPanel;
    p1: TImage;
    Panel68: TPanel;
    p4: TImage;
    Panel69: TPanel;
    p3: TImage;
    Panel70: TPanel;
    p5: TImage;
    Panel71: TPanel;
    p6: TImage;
    Panel72: TPanel;
    p66: TImage;
    Panel73: TPanel;
    p7: TImage;
    Panel74: TPanel;
    p8: TImage;
    Panel75: TPanel;
    p9: TImage;
    Panel76: TPanel;
    p10: TImage;
    Panel77: TPanel;
    p11: TImage;
    Panel78: TPanel;
    p12: TImage;
    Panel79: TPanel;
    p13: TImage;
    Panel80: TPanel;
    p14: TImage;
    Panel81: TPanel;
    p15: TImage;
    Panel82: TPanel;
    p16: TImage;
    Panel83: TPanel;
    p17: TImage;
    Panel84: TPanel;
    p18: TImage;
    Panel66: TPanel;
    p2: TImage;
    esw1: TEdit;
    esw2: TEdit;
    esw3: TEdit;
    esw4: TEdit;
    esw6: TEdit;
    esw5: TEdit;
    esw7: TEdit;
    dsw1: TEdit;
    dsw2: TEdit;
    dsw3: TEdit;
    dsw4: TEdit;
    dsw6: TEdit;
    dsw7: TEdit;
    dsw5: TEdit;
    fsw1: TEdit;
    fsw2: TEdit;
    fsw3: TEdit;
    fsw4: TEdit;
    fsw6: TEdit;
    fsw7: TEdit;
    fsw5: TEdit;
    tsw1: TEdit;
    tsw2: TEdit;
    tsw3: TEdit;
    tsw4: TEdit;
    tsw6: TEdit;
    tsw7: TEdit;
    tsw5: TEdit;
    wsw1: TEdit;
    wsw2: TEdit;
    wsw3: TEdit;
    wsw4: TEdit;
    wsw6: TEdit;
    wsw7: TEdit;
    wsw5: TEdit;
    ksw1: TEdit;
    ksw2: TEdit;
    ksw3: TEdit;
    ksw4: TEdit;
    ksw6: TEdit;
    ksw7: TEdit;
    ksw5: TEdit;
    Edit1: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Panel2: TPanel;
    li8: TImage;
    Panel3: TPanel;
    li10: TImage;
    Panel4: TPanel;
    li15: TImage;
    Panel5: TPanel;
    li16: TImage;
    Panel6: TPanel;
    li17: TImage;
    Edit28: TEdit;
    Edit29: TEdit;
    ea1: TEdit;
    ea2: TEdit;
    ea3: TEdit;
    ea4: TEdit;
    ea5: TEdit;
    ea6: TEdit;
    ea7: TEdit;
    da1: TEdit;
    da2: TEdit;
    da3: TEdit;
    da4: TEdit;
    da5: TEdit;
    da6: TEdit;
    da7: TEdit;
    fa1: TEdit;
    fa2: TEdit;
    fa3: TEdit;
    fa4: TEdit;
    fa5: TEdit;
    fa6: TEdit;
    fa7: TEdit;
    ta1: TEdit;
    ta2: TEdit;
    ta3: TEdit;
    ta4: TEdit;
    ta5: TEdit;
    ta6: TEdit;
    ta7: TEdit;
    wa1: TEdit;
    wa2: TEdit;
    wa3: TEdit;
    wa4: TEdit;
    wa5: TEdit;
    wa6: TEdit;
    wa7: TEdit;
    ka1: TEdit;
    ka2: TEdit;
    ka3: TEdit;
    ka4: TEdit;
    ka5: TEdit;
    ka6: TEdit;
    ka7: TEdit;
    Panel7: TPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ServMsg(var Msg: TMessage); message WM_NOTIFY_MSG;
    procedure SetValues;
    procedure FillMe;
  private
    Ladoga_1,Ladoga_2:TLadoga;
    Device_ID1,Device_ID2:Cardinal;
  public
    { Public declarations }
  end;

var
  Telemetric: TTelemetric;
  mMediumLadoga:TMedLadoga;

const SW1:array [0..3] of string =
     (('Main (observation rat.)'),
      ('Main (inertial rat.)'),
      ('Preparation'),
      ('Stand-by (information by watch navigation means)'));

const SW:array [0..1] of string =
     (('Information is valid'),
      ('Information is invalid'));

const SW6:array [0..2] of string =
     (('Inertial course'),
      ('Manually set course'),
      ('By ship gyrocompass'));

implementation

{$R *.dfm}

procedure TTelemetric.FillMe;
var c:string;
    i,j:integer;
    Edit:TEdit;
    EditSample:TEdit;
begin
  for j:=1 to 6 do
    for i:=1 to 7 do
    begin
      case j of
        1: c:='esw';
        2: c:='dsw';
        3: c:='fsw';
        4: c:='tsw';
        5: c:='wsw';
        6: c:='ksw';
      end;
      Edit:=Telemetric.FindComponent(c+IntToStr(i)) as TEdit;
      if Edit=nil then continue;
      Edit.Font.Height:=-14;
      Edit.Text:='    SW'+IntToStr(i);
      if (j=2) or (j=5) then Edit.Color:=clMedGray
                        else Edit.Color:=clLIme;
    end;
  e0.Color:=clLime;
  e0.Text :='YES';
  e1.Text :='65.23';
  e2.Text :='38.79';
  e3.Text :='-4.12';
  e4.Text :='3.98';
  e5.Text :='5.69';
  e6.Text :='136.13';
  e7.Text :='0.02';
  e8.Text :='0.63';
  e9.Text :='-0.01';
  e10.Text:='0.14';
  e11.Text:='-0.01';
  e12.Text:='-4.11';
  e13.Text:='4.02';
  e14.Text:='0.00';
  e15.Text:='-1.27';
  e16.Text:='1.29';
  e17.Text:='0.03';
  e18.Text:='0.64';
  e19.Text:='17:54:20';
  e20.Text:='21.07.2013';
  for j in [3,4,6] do
    for i:=0 to 20 do
    begin
      case j of
        1: c:='e';
        2: c:='d';
        3: c:='f';
        4: c:='t';
        5: c:='w';
        6: c:='k';
      end;
      Edit:=Telemetric.FindComponent(c+IntToStr(i)) as TEdit;
      if Edit=nil then continue;
      EditSample:=Telemetric.FindComponent('e'+IntToStr(i)) as TEdit;
      if EditSample=nil then continue;
      Edit.Text:=EditSample.Text;
      Edit.Color:=EditSample.Color;
    end;
  for j in [2,5] do
    for i:=0 to 20 do
    begin
      case j of
        1: c:='e';
        2: c:='d';
        3: c:='f';
        4: c:='t';
        5: c:='w';
        6: c:='k';
      end;
      Edit:=Telemetric.FindComponent(c+IntToStr(i)) as TEdit;
      if Edit=nil then continue;
      Edit.Text:='';
      Edit.Color:=clMedGray;
    end;
end;

procedure TTelemetric.ServMsg(var Msg: TMessage);
begin
  //if Msg.WParam=Device_ID1 then Ladoga_1:=aLadoga[66] else
 // if Msg.WParam=Device_ID2 then Ladoga_2:=aLadoga[67] else
  exit;
  SetValues;
end;

procedure TTelemetric.FormActivate(Sender: TObject);
var Style: TFontStyles;
    Color: TColor;
  procedure SetGrayOfAverageValue(Numb:byte);
  var str:char;
      i:integer;
  begin
   case Numb of
      1: str:='e';
      2: str:='d';
      3: str:='f';
      4: str:='t';
      5: str:='w';
      6: str:='k';
    end;
    for i:=1 to 7 do
    if Telemetric.FindComponent(str+'a'+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+'a'+IntToStr(i))).Color:=Color_S;
  end;
  procedure SetGrayValue(Numb:byte);
  var str:char;
      i:integer;
  begin
   case Numb of
      1: str:='e';
      2: str:='d';
      3: str:='f';
      4: str:='t';
      5: str:='w';
      6: str:='k';
    end;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Color:=Color_S;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Caption:='   no use';
    for i:=1 to 20 do
    if Telemetric.FindComponent(str+IntToSTr(i))<>nil then
    begin
    TPanel(Telemetric.FindComponent(str+IntToStr(i))).Caption:='';
    TPanel(Telemetric.FindComponent(str+IntToStr(i))).Color:=Color_S;
    end;
    for i:=1 to 7 do
    if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Color:=Color_S;
    for i:=1 to 7 do
    if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Hint:='';
  end;
begin
  Style:=[fsBold];
  Color:=clWhite;
  i1.Align:=alClient;
  p1.Align:=alClient;
  with i1.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i1.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-15;
    Font.Name:='Symbol';
    TextOut(4,-2,'j');
    p1.Picture.Assign(i1.Picture);
  end;
  i2.Align:=alClient;
  p2.Align:=alClient;
  with i2.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i2.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-15;
    Font.Name:='Symbol';
    TextOut(4,-2,'l');
    p2.Picture.Assign(i2.Picture);
  end;
  i3.Align:=alClient;
  p3.Align:=alClient;
  with i3.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i3.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,1,'V');
    Font.Height:=-8;
    TextOut(13,6,'N');
    p3.Picture.Assign(i3.Picture);
  end;
  i4.Align:=alClient;
  p4.Align:=alClient;
  with i4.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i4.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,1,'V');
    Font.Height:=-8;
    TextOut(13,6,'E');
    p4.Picture.Assign(i4.Picture);
  end;
  i5.Align:=alClient;
  p5.Align:=alClient;
  with i5.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i5.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,1,'V');
    Font.Height:=-8;
    TextOut(13,6,'L');
    p5.Picture.Assign(i5.Picture);
  end;
  i6.Align:=alClient;
  p6.Align:=alClient;
  p66.Align:=alClient;
  with i6.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i6.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,1,'K');
    p6.Picture.Assign(i6.Picture);
    p66.Picture.Assign(i6.Picture);
  end;
  i7.Align:=alClient;
  p7.Align:=alClient;
  with i7.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i7.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,2,'K');
    Font.Style:=[fsBold];
    TextOut(7,-11,'.');
    p7.Picture.Assign(i7.Picture);
  end;
  i8.Align:=alClient;
  p8.Align:=alClient;
  li8.Align:=alClient;
  with i8.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i8.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-13;
    Font.Name:='Symbol';
    TextOut(4,1,'Y');
    p8.Picture.Assign(i8.Picture);
    li8.Picture.Assign(i8.Picture);
  end;
  i9.Align:=alClient;
  p9.Align:=alClient;
  with i9.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i9.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-13;
    Font.Name:='Symbol';
    TextOut(4,1,'Y');
    Font.Style:=[fsBold];
    Font.Name:='Arial';
    TextOut(8,-11,'.');
    p9.Picture.Assign(i9.Picture);
  end;
  i10.Align:=alClient;
  p10.Align:=alClient;
  li10.Align:=alClient;
  with i10.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i10.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-15;
    Font.Name:='Symbol';
    TextOut(5,0,'q');
    p10.Picture.Assign(i10.Picture);
    li10.Picture.Assign(i10.Picture);
  end;
  i11.Align:=alClient;
  p11.Align:=alClient;
  with i11.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i11.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-15;
    Font.Name:='Symbol';
    TextOut(5,0,'q');
    Font.Style:=[fsBold];
    Font.Height:=-11;
    Font.Name:='Arial';
    TextOut(9,-9,'.');
    p11.Picture.Assign(i11.Picture);
  end;
  i12.Align:=alClient;
  p12.Align:=alClient;
  with i12.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i12.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,2,'V');
    Font.Height:=-8;
    TextOut(6,-3,'~');
    TextOut(13,6,'N');
    p12.Picture.Assign(i12.Picture);
  end;
  i13.Align:=alClient;
  p13.Align:=alClient;
  with i13.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i13.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,2,'V');
    Font.Height:=-8;
    TextOut(6,-3,'~');
    TextOut(13,6,'E');
    p13.Picture.Assign(i13.Picture);
  end;
  i14.Align:=alClient;
  p14.Align:=alClient;
  with i14.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i14.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-13;
    TextOut(4,2,'V');
    Font.Height:=-8;
    TextOut(6,-3,'~');
    TextOut(13,6,'Z');
    p14.Picture.Assign(i14.Picture);
  end;
  i15.Align:=alClient;
  p15.Align:=alClient;
  li15.Align:=alClient;
  with i15.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i15.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-11;
    TextOut(4,4,'S');
    Font.Height:=-8;
    TextOut(6,-3,'~');
    TextOut(13,8,'N');
    p15.Picture.Assign(i15.Picture);
    li15.Picture.Assign(i15.Picture);
  end;
  i16.Align:=alClient;
  p16.Align:=alClient;
  li16.Align:=alClient;
  with i16.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i16.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-11;
    TextOut(4,4,'S');
    Font.Height:=-8;
    TextOut(6,-3,'~');
    TextOut(13,8,'E');
    p16.Picture.Assign(i16.Picture);
    li16.Picture.Assign(i16.Picture);
  end;
  i17.Align:=alClient;
  p17.Align:=alClient;
  li17.Align:=alClient;
  with i17.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i17.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-11;
    TextOut(4,4,'S');
    Font.Height:=-8;
    TextOut(13,8,'V');
    TextOut(6,-3,'~');
    li17.Picture.Assign(i17.Picture);
    p17.Picture.Assign(i17.Picture);
  end;
  i18.Align:=alClient;
  p18.Align:=alClient;
  with i18.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i18.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Height:=-15;
    Font.Name:='Symbol';
    TextOut(4,-2,'r');
    p18.Picture.Assign(i18.Picture);
  end;
  i19.Align:=alClient;
  with i19.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i19.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-12;
    TextOut(4,1,'T');
  end;
  i20.Align:=alClient;
  with i20.Canvas do
  begin
    Brush.Color:=Color;
    FillRect(i20.ClientRect);
    Font.Color:=clBlack;
    Font.Style:=Style;
    Font.Name:='Arial';
    Font.Height:=-12;
    TextOut(4,1,'DT');
  end;
  Panel1.SetFocus;
  cs_Ladoga.Enter;
  try
    Ladoga_1:=Ladoga[1];
    Ladoga_2:=Ladoga[2];
  finally
    cs_Ladoga.Leave;
  end;
  SetGrayValue(2);
  SetGrayValue(5);
  SetGrayOfAverageValue(2);
  SetGrayOfAverageValue(3);
  SetGrayOfaverageValue(5);
  SetGrayOfAverageValue(6);
  SetValues;
end;

procedure TTelemetric.SetValues;
  procedure SetValue(LAD:TLad;Numb:byte);
  var str:char;
      TempArray: array [1..20] of string;
      i,k:integer;
      m:Word;
      Color:TColor;
      n:string;
  begin
    case Numb of
      1: str:='e';
      2: str:='d';
      3: str:='f';
      4: str:='t';
      5: str:='w';
      6: str:='k';
    end;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Color:=Color_G;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Caption:='YES';
    TempArray[1] :=FloatToStrF(LAD.laFi,ffFixed,6,2);
    TempArray[2] :=FloatToStrF(LAD.laLmb,ffFixed,6,2);
    TempArray[3] :=FloatToStrF(LAD.lagVn,ffFixed,6,2);
    TempArray[4] :=FloatToStrF(LAD.lagVe,ffFixed,6,2);
    TempArray[5] :=FloatToStrF(LAD.laVl,ffFixed,6,2);
    TempArray[6] :=FloatToStrF(LAD.laK,ffFixed,6,2);
    TempArray[7] :=FloatToStrF(LAD.laVK,ffFixed,6,2);
    TempArray[8] :=FloatToStrF(LAD.laPsi,ffFixed,6,2);
    TempArray[9] :=FloatToStrF(LAD.laVPsi,ffFixed,6,2);
    TempArray[10]:=FloatToStrF(LAD.laTeta,ffFixed,6,2);
    TempArray[11]:=FloatToStrF(LAD.laVTeta,ffFixed,6,2);
    TempArray[12]:=FloatToStrF(LAD.laVn,ffFixed,6,2);
    TempArray[13]:=FLoatToStrF(LAD.laVe,ffFixed,6,2);
    TempArray[14]:=FloatToStrF(LAD.laVz,ffFixed,6,2);
    TempArray[15]:=FloatToStrF(LAD.laSn,ffFixed,6,2);
    TempArray[16]:=FloatToStrF(LAD.laSe,ffFixed,6,2);
    TempArray[17]:=FloatToStrF(LAD.laSz,ffFixed,6,2);
    TempArray[18]:=FloatToStrF(LAD.laRo,ffFixed,6,2);
    TempArray[19]:=TimeToStr(LAD.laDTL);
    TempArray[20]:=DateToStr(LAD.laDTL);
    for i:=1 to 20 do
    if Telemetric.FindComponent(str+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+IntToStr(i))).Caption:=TempArray[i];
    m:=LAD.laCC;
    //Sw1
    i:=(m and $C000) shr 14;
    if i in [0..3] then
    if Telemetric.FindComponent(str+'SW1')<>nil then
    TPanel(Telemetric.FindComponent(str+'SW1')).Hint:=SW1[i];
    if i<=1 then  Color:=Color_G else Color:=Color_R;
    if Telemetric.FindComponent(str+'SW1')<>nil then
    TPanel(Telemetric.FindComponent(str+'SW1')).Color:=Color;
    //Sw2,Sw3,Sw4,Sw5,Sw7
    for i in [2..5,7] do
    begin
      case i of
        2: k:=(m and $3000) shr 12;
        3: k:=(m and $C00) shr 10;
        4: k:=(m and $300) shr 8;
        5: k:=(m and $C0) shr 6;
        7: k:=(m and $C) shr 2;
      end;
      if k = 0 then begin n:=SW[0]; Color:=Color_G; end else
      if k = 3 then begin n:=SW[1]; Color:=Color_R; end else
                    begin n:='Unknown'; Color:=Color_R; end;
      if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
      TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Hint:=n;
      if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
      TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Color:=Color;
    end;
    //Sw6
    i:=(m and $30) shr 4;
    if i in [0..2] then
    if Telemetric.FindComponent(str+'SW6')<>nil then
    TPanel(Telemetric.FindComponent(str+'SW6')).Hint:=SW6[i];
    if Telemetric.FindComponent(str+'SW6')<>nil then
    TPanel(Telemetric.FindComponent(str+'SW6')).Color:=Color_G;
  end;
  procedure SetNoValue(Numb:byte);
  var str:char;
      i:integer;
  begin
    case Numb of
      1: str:='e';
      2: str:='d';
      3: str:='f';
      4: str:='t';
      5: str:='w';
      6: str:='k';
    end;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Color:=Color_R;
    if Telemetric.FindComponent(str+'0')<>nil then
    TPanel(Telemetric.FindComponent(str+'0')).Caption:='NO';
    for i:=1 to 20 do
    if Telemetric.FindComponent(str+IntToSTr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+IntToStr(i))).Caption:='  0';
    for i:=1 to 7 do
    if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Color:=clBtnFace;
    for i:=1 to 7 do
    if Telemetric.FindComponent(str+'SW'+IntToStr(i))<>nil then
    TPanel(Telemetric.FindComponent(str+'SW'+IntToStr(i))).Hint:='No data';
  end;
  procedure SetMediumValue(Numb:byte);
  var str:string;
  begin
    case Numb of
      1: str:='ea';
      2: str:='da';
      3: str:='fa';
      4: str:='ta';
      5: str:='wa';
      6: str:='ka';
    end;
    if Telemetric.FindComponent(str+'1')<>nil then TEdit(Telemetric.FindComponent(str+'1')).Text:=FloatToStrF(mMediumLadoga.Psi ,ffFixed,6,2);
    if Telemetric.FindComponent(str+'2')<>nil then TEdit(Telemetric.FindComponent(str+'2')).Text:=FloatToStrF(mMediumLadoga.Teta,ffFixed,6,2);
    if Telemetric.FindComponent(str+'3')<>nil then Tedit(Telemetric.FindComponent(str+'3')).Text:=FloatToStrF(mMediumLadoga.Sx  ,ffFixed,6,2);
    if Telemetric.FindComponent(str+'4')<>nil then TEdit(Telemetric.FindComponent(str+'4')).Text:=FloatToStrF(mMediumLadoga.Sy  ,ffFixed,6,2);
    if Telemetric.FindComponent(str+'5')<>nil then TEdit(Telemetric.FindComponent(str+'5')).Text:=FloatToStrF(mMediumLadoga.Sz  ,ffFixed,6,2);
    if Telemetric.FindComponent(str+'6')<>nil then
      if mMediumLadoga.Validity then
      begin
        TPanel(Telemetric.FindComponent(str+'6')).Caption:='Yes';
        TPanel(Telemetric.FindComponent(str+'6')).Color:=Color_G;
        TPanel(Telemetric.FindComponent(str+'7')).Caption:=mMediumLadoga.LeaveTime;
      end else
      begin
        TPanel(Telemetric.FindComponent(str+'6')).Caption:='No';
        TPanel(Telemetric.FindComponent(str+'6')).Color:=Color_R;
        TPanel(Telemetric.FindComponent(str+'7')).Caption:=mMediumLadoga.LeaveTime;
      end;
  end;

begin
  if Ladoga_1.Central.laDataExh=1 then SetValue(Ladoga_1.Central,1)
                                  else SetNoValue(1);
  {if Ladoga_1.Fore.laDataExh=1    then SetValue(Ladoga_1.Fore,2)
                                  else SetNoValue(2); }
  if Ladoga_1.Aft.laDataExh=1     then SetValue(Ladoga_1.Aft,3)
                                  else SetNoValue(3);
  if Ladoga_2.Central.laDataExh=1 then SetValue(Ladoga_2.Central,4)
                                  else SetNoValue(4);
  {if Ladoga_2.Fore.laDataExh=1    then SetValue(Ladoga_2.Fore,5)
                                  else SetNoValue(5);}
  if Ladoga_2.Aft.laDataExh=1     then SetValue(Ladoga_2.Aft,6)
                                  else SetNoValue(6);
  cs_MedLadoga.Enter;
  try
     mMediumLadoga:=MediumLadoga;
  finally
     cs_MedLadoga.Leave;
  end;
  SetMediumValue(1);
  SetMediumValue(4);
end;

procedure TTelemetric.Timer1Timer(Sender: TObject);
begin
  cs_Ladoga.Enter;
  try
    Ladoga_1:=Ladoga[1];
    Ladoga_2:=Ladoga[2];
  finally
    cs_Ladoga.Leave;
  end;
  SetValues;
end;

end.
