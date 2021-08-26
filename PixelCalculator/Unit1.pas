unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XiButton, ExtCtrls, XiPanel, XPMan, jpeg, IniFiles;

type
  TForm1 = class(TForm)
    XiPanel1: TXiPanel;
    XPManifest1: TXPManifest;
    XiPanel3: TXiPanel;
    Edit5: TEdit;
    KY1: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit15: TEdit;
    f1: TEdit;
    f2: TEdit;
    f3: TEdit;
    f4: TEdit;
    Rx1: TEdit;
    Rx2: TEdit;
    Rx3: TEdit;
    Rx4: TEdit;
    Ry1: TEdit;
    Ry2: TEdit;
    Ry3: TEdit;
    Ry4: TEdit;
    Al1: TEdit;
    Al2: TEdit;
    Al3: TEdit;
    Al4: TEdit;
    XiPanel5: TXiPanel;
    Edit40: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    x1: TEdit;
    Edit41: TEdit;
    Um1: TEdit;
    Um2: TEdit;
    Um3: TEdit;
    Um4: TEdit;
    y1: TEdit;
    z1: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Edit70: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit54: TEdit;
    Edit55: TEdit;
    Edit56: TEdit;
    x2: TEdit;
    y2: TEdit;
    z2: TEdit;
    x3: TEdit;
    y3: TEdit;
    z3: TEdit;
    x4: TEdit;
    y4: TEdit;
    z4: TEdit;
    xt: TEdit;
    yt: TEdit;
    zt: TEdit;
    Edit59: TEdit;
    Edit60: TEdit;
    Edit61: TEdit;
    X01: TEdit;
    Y01: TEdit;
    X02: TEdit;
    Y02: TEdit;
    X03: TEdit;
    Y03: TEdit;
    X04: TEdit;
    Y04: TEdit;
    Edit71: TEdit;
    Edit72: TEdit;
    XiButton2: TXiButton;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Image3: TImage;
    XiButton3: TXiButton;
    procedure f1Change(Sender: TObject);
    procedure XiButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure XiButton2Click(Sender: TObject);
    procedure XiButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const grad = 180/pi;
  Kx:integer = 720;
  Ky:integer = 576;
var
  DecimalSep :char;

implementation

{$R *.dfm}

procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
var
  a,b,c,d,g,f,e,u,h,xk1,yk1,zk1:double;
begin
  all:=all/grad;  //Поворот вокруг OZ  в корабельной системе координат
  btt:=btt/grad;	//Поворот вокруг OY  в корабельной системе координат
  gmm:=gmm/grad;	//Поворот вокруг OX  в корабельной системе координат
  xk1:=xk;
  yk1:=yk;
  zk1:=zk;
  //функция менее прозрачна, но существенно меньше Sin-Cos * кол-во её вызова из DataCalc
  //экономия порядка 1/3 времени для DataCalc
  if (all<>0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1*Cos(all)-yk1*Sin(all);
    yk:=xk1*Sin(all)+yk1*Cos(all);
    zk:=zk1;
    EXIT;
  end;
  if (all=0) and (btt<>0) and (gmm=0) then
  begin
    xk:=xk1*Cos(btt)+zk1*Sin(btt);
    yk:=yk1;
    zk:=-xk1*Sin(btt)+zk1*Cos(btt);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm<>0) then
  begin
    xk:=xk1;
    yk:=yk1*Cos(gmm)-zk1*Sin(gmm);
    zk:=yk1*Sin(gmm)+zk1*Cos(gmm);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1;
    yk:=yk1;
    zk:=zk1;
    EXIT;
  end;
  //никогда не задействуется, только для пояснения...
  a:=Cos(all)*Cos(btt);
  b:=Sin(all)*Cos(btt);
  c:=-Sin(btt);
  d:=-Sin(all)*Cos(gmm)+Cos(all)*Sin(btt)*Sin(gmm);
  g:=Sin(all)*Sin(gmm)+Cos(all)*Sin(btt)*Cos(gmm);
  f:=Cos(btt)*Sin(gmm);
  e:=Cos(all)*Cos(gmm)+Sin(all)*Sin(btt)*Sin(gmm);
  u:=Cos(btt)*Cos(gmm);
  h:=-Cos(all)*Sin(gmm)+Sin(all)*Sin(btt)*Cos(gmm);
 {ПОВОРОТ КОНСТРУКЦИИ}
  xk:=(xk1*a+yk1*d+zk1*g);
  yk:=xk1*b+yk1*e+zk1*h;
  zk:=(xk1*c+yk1*f+zk1*u);
end;

procedure TForm1.f1Change(Sender: TObject);
var i:Word;
    s,s2:String;
begin
s:=(Sender as TEdit).Text;
  if TRIM(s)='' then EXIT;
  s2:=s;
  for i:=1 to Length(s) do
  if ((ORD(S[i])<48)OR(ORD(S[i])>57))AND(S[i]<>DecimalSeparator) AND
      (S[i]<>'-')  then S[i]:=DecimalSeparator;
  if S<>'-' then
  if (StrToFloatDef(S,10)=10) and (S<>'10') then
    begin
      ShowMessage('Ошибочный символ --> "'+S2[Length(s2)]+'"');
      (Sender as TEdit).Text:=COPY(S2,1,Length(s2)-1);
      EXIT;
    end;
  (Sender as TEdit).Text:=S;
  (Sender as TEdit).SelStart:=Length(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
var INI:TiniFile;
begin
  DecimalSep:=DecimalSeparator;
  INI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) + '\Pixel.ini');

  f1.Text :=FloatToStrF(INI.ReadFloat('KY1','focus',23.7),ffFixed,7,4);
  Rx1.Text:=FloatToStrF(INI.ReadFloat('KY1','Rx',4.8697),ffFixed,7,4);
  Ry1.Text:=FloatToStrF(INI.ReadFloat('KY1','Ry',3.5285),ffFixed,7,4);
  Al1.Text:=FloatToStrF(INI.ReadFloat('KY1','Alf',3.1),ffFixed,7,4);
  Um1.Text:=FloatToStrF(INI.ReadFloat('KY1','Um',4),ffFixed,7,4);
  x1.Text :=FloatToStrF(INI.ReadFloat('KY1','x',0),ffFixed,7,4);
  y1.Text :=FloatToStrF(INI.ReadFloat('KY1','y',0),ffFixed,7,4);
  z1.Text :=FloatToStrF(INI.ReadFloat('KY1','z',0),ffFixed,7,4);

  f2.Text :=FloatToStrF(INI.ReadFloat('KY2','focus',23.7),ffFixed,7,4);
  Rx2.Text:=FloatToStrF(INI.ReadFloat('KY2','Rx',4.8697),ffFixed,7,4);
  Ry2.Text:=FloatToStrF(INI.ReadFloat('KY2','Ry',3.5285),ffFixed,7,4);
  Al2.Text:=FloatToStrF(INI.ReadFloat('KY2','Alf',0),ffFixed,7,4);
  Um2.Text:=FloatToStrF(INI.ReadFloat('KY2','Um',4),ffFixed,7,4);
  x2.Text :=FloatToStrF(INI.ReadFloat('KY2','x',0),ffFixed,7,3);
  y2.Text :=FloatToStrF(INI.ReadFloat('KY2','y',0),ffFixed,7,3);
  z2.Text :=FloatToStrF(INI.ReadFloat('KY2','z',0),ffFixed,7,3);

  f3.Text :=FloatToStrF(INI.ReadFloat('KY3','focus',23.7),ffFixed,7,4);
  Rx3.Text:=FloatToStrF(INI.ReadFloat('KY3','Rx',4.8697),ffFixed,7,4);
  Ry3.Text:=FloatToStrF(INI.ReadFloat('KY3','Ry',3.5285),ffFixed,7,4);
  Al3.Text:=FloatToStrF(INI.ReadFloat('KY3','Alf',0),ffFixed,7,4);
  Um3.Text:=FloatToStrF(INI.ReadFloat('KY3','Um',4),ffFixed,7,4);
  x3.Text :=FloatToStrF(INI.ReadFloat('KY3','x',0),ffFixed,7,3);
  y3.Text :=FloatToStrF(INI.ReadFloat('KY3','y',0),ffFixed,7,3);
  z3.Text :=FloatToStrF(INI.ReadFloat('KY3','z',0),ffFixed,7,3);

  f4.Text :=FloatToStrF(INI.ReadFloat('KY4','focus',23.7),ffFixed,7,4);
  Rx4.Text:=FloatToStrF(INI.ReadFloat('KY4','Rx',4.8697),ffFixed,7,4);
  Ry4.Text:=FloatToStrF(INI.ReadFloat('KY4','Ry',3.5285),ffFixed,7,4);
  Al4.Text:=FloatToStrF(INI.ReadFloat('KY4','Alf',-3.1),ffFixed,7,4);
  Um4.Text:=FloatToStrF(INI.ReadFloat('KY4','Um',4),ffFixed,7,4);
  x4.Text :=FloatToStrF(INI.ReadFloat('KY4','x',0),ffFixed,7,3);
  y4.Text :=FloatToStrF(INI.ReadFloat('KY4','y',0),ffFixed,7,3);
  z4.Text :=FloatToStrF(INI.ReadFloat('KY4','z',0),ffFixed,7,3);

  xt.Text :=FloatToStrF(INI.ReadFloat('RT','x',0),ffFixed,7,3);
  yt.Text :=FloatToStrF(INI.ReadFloat('RT','y',0),ffFixed,7,3);
  zt.Text :=FloatToStrF(INI.ReadFloat('RT','z',0),ffFixed,7,3);

  INI.Free;
end;

procedure TForm1.XiButton1Click(Sender: TObject);
var x7,y7,z7:double;
    x9,y9,z9:double;
    vy,Yp,vx,Xp:double;
begin
  x9:= 62.452+  50.42;
  y9:= 15.993;
  z9:=-0.509 +1.484;
  x7:= x9;
  y7:=-16.002;
  z7:=-0.485 +1.484;
  POVOROT(0,4,0,x7,y7,z7);
  POVOROT(0,4,0,x9,y9,z9);
  POVOROT(3.1,0,0,x7,y7,z7);
  POVOROT(-3.1,0,0,x9,y9,z9);
  vy:=(Z7*23.7/X7);
  Yp:=(576/2-vy*576/3.5285);
//  Edit1.Text:=FloatToStrF(Yp,ffFixed,6,2);
  vx:=(Y7*23.7/X7);
  Xp:=(720/2-vx*720/4.8697);
//  Edit2.Text:=FloatToStrF(Xp,ffFixed,6,2);

  vy:=(Z9*23.7/X9);
  Yp:=(576/2-vy*576/3.5285);
//  Edit3.Text:=FloatToStrF(Yp,ffFixed,6,2);
  vx:=(Y9*23.7/X9);
  Xp:=(720/2-vx*720/4.8697);
//  Edit4.Text:=FloatToStrF(Xp,ffFixed,6,2);

end;

procedure TForm1.XiButton2Click(Sender: TObject);
var _x1,_y1,_z1:double;
    _x2,_y2,_z2:double;
    _x3,_y3,_z3:double;
    _x4,_y4,_z4:double;
    _xt,_yt,_zt:double;
    _Um1,_Um2,_Um3,_Um4:double;
    _Al1,_Al2,_Al3,_Al4:double;
    _f1,_f2,_f3,_f4:double;
    _Rx1,_Rx2,_Rx3,_Rx4:double;
    _Ry1,_Ry2,_Ry3,_Ry4:double;
    vy,Yp,vx,Xp:double;
begin
  _f1 :=StrToFloat(f1.Text);
  _f2 :=StrToFloat(f2.Text);
  _f3 :=StrToFloat(f3.Text);
  _f4 :=StrToFloat(f4.Text);
  _Rx1:=StrToFloat(Rx1.Text);
  _Rx2:=StrToFloat(Rx2.Text);
  _Rx3:=StrToFloat(Rx3.Text);
  _Rx4:=StrToFloat(Rx4.Text);
  _Ry1:=StrToFloat(Ry1.Text);
  _Ry2:=StrToFloat(Ry2.Text);
  _Ry3:=StrToFloat(Ry3.Text);
  _Ry4:=StrToFloat(Ry4.Text);
  _Al1:=StrToFloat(Al1.Text);
  _Al2:=StrToFloat(Al2.Text);
  _Al3:=StrToFloat(Al3.Text);
  _Al4:=StrToFloat(Al4.Text);
  _Um1:=StrToFloat(Um1.Text);
  _Um2:=StrToFloat(Um2.Text);
  _Um3:=StrToFloat(Um3.Text);
  _Um4:=StrToFloat(Um4.Text);
  _x1 :=StrToFloat(x1.Text);
  _x2 :=StrToFloat(x2.Text);
  _x3 :=StrToFloat(x3.Text);
  _x4 :=StrToFloat(x4.Text);
  _xt :=StrToFloat(xt.Text);
  _y1 :=StrToFloat(y1.Text);
  _y2 :=StrToFloat(y2.Text);
  _y3 :=StrToFloat(y3.Text);
  _y4 :=StrToFloat(y4.Text);
  _yt :=StrToFloat(yt.Text);
  _z1 :=StrToFloat(z1.Text);
  _z2 :=StrToFloat(z2.Text);
  _z3 :=StrToFloat(z3.Text);
  _z4 :=StrToFloat(z4.Text);
  _zt :=StrToFloat(zt.Text);

  _x1 :=_xt-_x1;
  _y1 :=_yt-_y1;
  _z1 :=_zt-_z1;

  _x2 :=_xt-_x2;
  _y2 :=_yt-_y2;
  _z2 :=_zt-_z2;

  _x3 :=_xt-_x3;
  _y3 :=_yt-_y3;
  _z3 :=_zt-_z3;

  _x4 :=_xt-_x4;
  _y4 :=_yt-_y4;
  _z4 :=_zt-_z4;

  POVOROT(0,_um1,0,_x1,_y1,_z1);
  POVOROT(0,_um2,0,_x2,_y2,_z2);
  POVOROT(0,_um3,0,_x3,_y3,_z3);
  POVOROT(0,_um4,0,_x4,_y4,_z4);

  POVOROT(_al1,0,0,_x1,_y1,_z1);
  POVOROT(_al2,0,0,_x2,_y2,_z2);
  POVOROT(_al3,0,0,_x3,_y3,_z3);
  POVOROT(_al4,0,0,_x4,_y4,_z4);

  vy:=(_Z1*_f1/_x1);
  Yp:=(Ky/2-vy*Ky/_Ry1);
  Y01.Text:=FloatToStrF(Yp,ffFixed,7,4);
  vx:=(_y1*_f1/_x1);
  Xp:=(Kx/2-vx*Kx/_Rx1);
  X01.Text:=FloatToStrF(Xp,ffFixed,7,4);

  vy:=(_Z2*_f2/_x2);
  Yp:=(Ky/2-vy*Ky/_Ry2);
  Y02.Text:=FloatToStrF(Yp,ffFixed,7,4);
  vx:=(_y2*_f2/_x2);
  Xp:=(Kx/2-vx*Kx/_Rx2);
  X02.Text:=FloatToStrF(Xp,ffFixed,7,4);

  vy:=(_Z3*_f3/_x3);
  Yp:=(Ky/2-vy*Ky/_Ry3);
  Y03.Text:=FloatToStrF(Yp,ffFixed,7,4);
  vx:=(_y3*_f3/_x3);
  Xp:=(Kx/2-vx*Kx/_Rx3);
  X03.Text:=FloatToStrF(Xp,ffFixed,7,4);

  vy:=(_Z4*_f4/_x4);
  Yp:=(Ky/2-vy*Ky/_Ry4);
  Y04.Text:=FloatToStrF(Yp,ffFixed,7,4);
  vx:=(_y4*_f4/_x4);
  Xp:=(Kx/2-vx*Kx/_Rx4);
  X04.Text:=FloatToStrF(Xp,ffFixed,7,4);
end;

procedure TForm1.XiButton3Click(Sender: TObject);
var INI:TiniFile;
begin
  INI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) + '\Pixel.ini');
  INI.WriteFloat  ('KY1','focus',StrToFloat(f1.Text));
  INI.WriteFloat  ('KY1','Rx',   StrToFloat(Rx1.Text));
  INI.WriteFloat  ('KY1','Ry',   StrToFloat(Ry1.Text));
  INI.WriteFloat  ('KY1','Alf',  StrToFloat(Al1.Text));
  INI.WriteFloat  ('KY1','Um',   StrToFloat(Um1.Text));
  INI.WriteFloat  ('KY1','x',    StrToFloat(x1.Text));
  INI.WriteFloat  ('KY1','y',    StrToFloat(y1.Text));
  INI.WriteFloat  ('KY1','z',    StrToFloat(z1.Text));

  INI.WriteFloat  ('KY2','focus',StrToFloat(f2.Text));
  INI.WriteFloat  ('KY2','Rx',   StrToFloat(Rx2.Text));
  INI.WriteFloat  ('KY2','Ry',   StrToFloat(Ry2.Text));
  INI.WriteFloat  ('KY2','Alf',  StrToFloat(Al2.Text));
  INI.WriteFloat  ('KY2','Um',   StrToFloat(Um2.Text));
  INI.WriteFloat  ('KY2','x',    StrToFloat(x2.Text));
  INI.WriteFloat  ('KY2','y',    StrToFloat(y2.Text));
  INI.WriteFloat  ('KY2','z',    StrToFloat(z2.Text));

  INI.WriteFloat  ('KY3','focus',StrToFloat(f3.Text));
  INI.WriteFloat  ('KY3','Rx',   StrToFloat(Rx3.Text));
  INI.WriteFloat  ('KY3','Ry',   StrToFloat(Ry3.Text));
  INI.WriteFloat  ('KY3','Alf',  StrToFloat(Al3.Text));
  INI.WriteFloat  ('KY3','Um',   StrToFloat(Um3.Text));
  INI.WriteFloat  ('KY3','x',    StrToFloat(x3.Text));
  INI.WriteFloat  ('KY3','y',    StrToFloat(y3.Text));
  INI.WriteFloat  ('KY3','z',    StrToFloat(z3.Text));

  INI.WriteFloat  ('KY4','focus',StrToFloat(f4.Text));
  INI.WriteFloat  ('KY4','Rx',   StrToFloat(Rx4.Text));
  INI.WriteFloat  ('KY4','Ry',   StrToFloat(Ry4.Text));
  INI.WriteFloat  ('KY4','Alf',  StrToFloat(Al4.Text));
  INI.WriteFloat  ('KY4','Um',   StrToFloat(Um4.Text));
  INI.WriteFloat  ('KY4','x',    StrToFloat(x4.Text));
  INI.WriteFloat  ('KY4','y',    StrToFloat(y4.Text));
  INI.WriteFloat  ('KY4','z',    StrToFloat(z4.Text));

  INI.WriteFloat  ('RT','x',    StrToFloat(xt.Text));
  INI.WriteFloat  ('RT','y',    StrToFloat(yt.Text));
  INI.WriteFloat  ('Rt','z',    StrToFloat(zt.Text));

  INI.Free;
end;

end.
