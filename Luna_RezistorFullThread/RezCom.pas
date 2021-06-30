unit RezCom;

interface

uses
  Classes,ComPort,Data,SysUtils,Math,Messages,Windows;

type
  tRezCom = class(TThread)
  private
    RComPort1,RComPort2:TComPort;
    Count:integer;
    procedure RReadPacket(const p:Pointer;const Count:Integer;
                          const ErrCode:Cardinal;const NComPort:Word);
    procedure GetRezistorData;
  protected
    procedure Execute; override;
  public
    Port1,Port2:Word;
    Ds,Fi,Tet,V:double;
    Ts:single;
  end;

implementation

uses Unit1;

procedure tRezCom.RReadPacket(const p:Pointer;const Count:Integer;
                              const ErrCode:Cardinal;const NComPort:Word);
var i,j:Word;
    raw:word;
    pb:^word;
    ResAnswer:TAWord;
begin
  if p=nil then EXIT;
  if count<>18 then  EXIT;
  pb:=p;
  for i:=0 to 8 do
    begin
      raw:=pb^;
      ResAnswer[i]:=raw;
      INC(pb);
    end;
  if ResAnswer[8]=$FF-CheckSUM(@ResAnswer,0,16)+1 then
  if (ResAnswer[1]=ResAWord[1]) and
     (ResAnswer[2]=ResAWord[2]) and
     (ResAnswer[3]=ResAWord[3]) and
     (ResAnswer[4]=ResAWord[4]) then
     begin
       cs_RezUpdate.Enter;
       try RezUpdateForm.RezAnsw:=RezUpdateForm.RezAnsw+1;
       finally cs_RezUpdate.Leave; end;
     end;
end;

procedure tRezCom.GetRezistorData;
const rad=180.0/pi;
var D,vg,vv:single;
    X,Y,Z,XR,YR,ZR:single;
    i:integer;
    Distanse,Altitude,Course:single;// Дистанция до ЛА, угол места и угол курса ЛА
    br:byte;
begin
  if Count=0 then D:=Ds-v*0.001*Ts;  //это расстояние ЛА-Луна, нам надо симитировать расстояние ЛА-Резистор и углы пересчитать
  if (D <=60) then begin inc(Count);  D:=60  end;
  if Count=40 then
  begin
    Count:=0;
    Ts:=0;
  end;
  Tet:=(90-Tet)/rad;
  Fi:=(180-Fi)/rad;
  //Разложение вектора дальности до ЛА по осям X, Y, Z
  X:=D*Sin(Tet)*Cos(Fi);
  Y:=-D*Sin(Tet)*Sin(Fi);
  Z:=D*Cos(Tet);
  begin    //координаты резистора
    XR:=140.700 ;
    YR:=-2.450 ;
    ZR:=5.590 ;
  end;
  //Перенос в систему координат RT - камера, Луна или РТП
  X:=X+146.487-XR;
  Y:=Y+12.651-YR;
  Z:=Z+1-ZR;
  //Получение дистанции ЛА-X
  Distanse:=SQRT(X*X+Y*Y+Z*Z);
  Altitude:=90-arccos(Z/Distanse)*rad;
  Course:=180+arctan(Y/X)*rad;
  //скорости вертикальная и горизонтальная
  vv:=-v*cos(Tet);
  vg:=v*sin(Tet)*cos(Fi);
  cs_RezUpdate.Enter;
  try
    with RezUpdateForm do
    begin
      fDistanse:=Distanse;
      fCourse:=Course;
      fAltitude:=Altitude;
      fvg:=vg; fvv:=vv;
    end;
  finally
  cs_RezUpdate.Leave;
  end;
  Ts:=Ts+80;

  ResAWord[0]:=f shl 13+
               c shl 11+
               b shl 10+
               a shl 9+ //признак теста
               1;
  ResAWord[1]:=777;
  ResAWord[2]:=TRUNC(Distanse/Rcd);
  ResAWord[3]:=TRUNC(Course/Rck);
  ResAWord[4]:=TRUNC(Altitude/Rcm);
  ResAWord[5]:=TRUNC(vg/Rcsi);
  ResAWord[6]:=TRUNC(vv/Rcv);
  ResAWord[7]:=TRUNC(4/Rcgl);
  br:=0;
  for i:=0 to 7 do
     br:=br+(ResAWord[i] and $FF00) shr 8 + ResAWord[i] and $FF;
     br:=$FF-br+1;
  ResAWord[8]:=br shl 8;
  cs_RezUpdate.Enter;
  try
    with RezUpdateForm do
    for i:=0 to 8 do RWord[i]:=ResAWord[i];      
  finally
  cs_RezUpdate.Leave;
  end;
  try
    RComPort1.WriteBuffer(@ResAWord,18);
    cs_RezUpdate.Enter;
    try RezUpdateForm.RezSend:=RezUpdateForm.RezSend+1;
    finally cs_RezUpdate.Leave; end;
  except
    begin
      RComPort1.Close;
      RComPort1.Open;
    end;
  end;
  sleep(5);
  try
    RComPort2.WriteBuffer(@ResAWord,18);
    cs_RezUpdate.Enter;
    try RezUpdateForm.RezSend:=RezUpdateForm.RezSend+1;
    finally cs_RezUpdate.Leave; end;
  except
    begin
      RComPort2.Close;
      RComPort2.Open;
    end;
  end;
end;

procedure tRezCom.Execute;
var i:integer;
begin
  Ts:=0;  Count:=0;
  RezUpdateForm.RezSend:=0;
  RezUpdateForm.RezAnsw:=0;
  RComPort1:=TComPort.Create(nil);
  RComPort1.ComProp.BaudRate:=br115200;
  RComPort1.ComProp.ByteSize:=bs8;
  RComPort1.ComProp.EnableDTR:=False;
  RComPort1.ComProp.EnableRTS:=False;
  RComPort1.ComProp.Parity:=ptEVEN;
  RComPort1.ComProp.Stopbits:=sb2BITS;
  RComPort1.ComProp.WaitResult:=50;
  RComPort1.InBufSize:=1024;
  RComPort1.WaitFullBuffer:=FALSE;
  RComPort1.OnReadPacket:=RReadPacket;
  RComPort1.ComNumber:=Port1;
  if not RComPort1.Connected then RComPort1.Open;
  RComPort1.ReadActive:=True;
  Sleep(500);

  RComPort2:=TComPort.Create(nil);
  RComPort2.ComProp.BaudRate:=br115200;
  RComPort2.ComProp.ByteSize:=bs8;
  RComPort2.ComProp.EnableDTR:=False;
  RComPort2.ComProp.EnableRTS:=False;
  RComPort2.ComProp.Parity:=ptEVEN;
  RComPort2.ComProp.Stopbits:=sb2BITS;
  RComPort2.ComProp.WaitResult:=50;
  RComPort2.InBufSize:=1024;
  RComPort2.WaitFullBuffer:=FALSE;
  RComPort2.OnReadPacket:=RReadPacket;
  RComPort2.ComNumber:=Port2;
  if not RComPort2.Connected then RComPort2.Open;
  RComPort2.ReadActive:=True;
  sleep(500);

  while not Terminated do
  begin
    i:=0;
    while i<5 do
    begin
      GetRezistorData;
      sleep(80);
      INC(i);
    end;
  //  Synchronize(Form1.MyUpdate);
    if (Form1<>nil) then if Form1.Visible  then
    PostMessage(Form1.Handle,WM_NOTIFY_MSR,0,0);
  end;
  if RComPort1<>nil then RComPort1.Destroy;
  if RComPort2<>nil then RComPort2.Destroy;
end;

end.
