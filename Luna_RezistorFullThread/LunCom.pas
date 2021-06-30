unit LunCom;

interface

uses
  Classes,ComPort,Data,SysUtils,Math,Messages,Windows;

type
  tLunCom = class(TThread)
  private
    LComPort1,LComPort2:TComPort;
    t,t1:double;
    procedure LReadPacket(const p:Pointer;const Count:Integer;
                          const ErrCode:Cardinal;const NComPort:Word);
    procedure GetLunaData;
  protected
    procedure Execute; override;
  public
    Port1,Port2:Word;
    fError:boolean;
  end;

implementation

uses Unit1;

procedure TLunCom.GetLunaData;
var tr:double;
    LunSend:TAByte;
    LunWord:Array[0..5]of Word;
    m,i:integer;
begin
  t1:=t1+0.001;
  tr:=sin(2*pi*t1)*0.5;
  LunSend[0]:=1;
  LunSend[1]:=7;
  LunWord[0]:=TRUNC(4/Rcl);
  LunWord[1]:=TRUNC(4/Rcl);
  if fError then LunWord[2]:=TRUNC(tr/Rcl)
  else LunWord[2]:=0;
  LunWord[3]:=0;
  LunWord[4]:=TRUNC(1/Rcl);
  LunWord[5]:=0;
  m:=2;
  for i:=0 to 5 do
    begin
      LunSend[m]:=LunWord[i]-((LunWord[i]shr 8)shl 8);INC(m);
      LunSend[m]:=LunWord[i] shr 8; INC(m);
    end;
  LunSend[m]:=$FF-CheckSUM(@LunSend,0,14)+1;
  cs_LunUpdate.Enter;
  try
  for i:=0 to 15 do LunUpdateForm.LByte[i]:=LunSend[i];
  finally cs_LunUpdate.Leave; end;
  try
    LComPort1.WriteBuffer(@LunSend,15);
    cs_LunUpdate.Enter;
    try LunUpdateForm.LunSend:=LunUpdateForm.LunSend+1;
    finally cs_LunUpdate.Leave; end;
  except
    begin
      LComPort1.Close;
      LComPort1.Open;
    end;
  end;
  sleep(5);
  try
    LComPort2.WriteBuffer(@LunSend,15);
    cs_LunUpdate.Enter;
    try LunUpdateForm.LunSend:=LunUpdateForm.LunSend+1;
    finally cs_LunUpdate.Leave; end;
  except 
    begin
      LComPort2.Close;
      LComPort2.Open;
    end;
  end;
end;

procedure TLunCom.LReadPacket(const p:Pointer;const Count:Integer;
                             const ErrCode:Cardinal;const NComPort:Word);
var i,j:Word;
    raw:byte;
    pb :^byte;
begin
  if p=nil then EXIT;
  pb:=p;
  for i:=0 to 3 do
    begin
      raw:=pb^;
      LunAnswer[i]:=raw;
      INC(pb);
    end;
  if LunAnswer[3]=$FF-CheckSUM(@LunAnswer,0,3)+1 then
  if (LunAnswer[0]=01) and (LunAnswer[2]=0) then
     begin
       cs_LunUpdate.Enter;
       try LunUpdateForm.LunAnsw:=LunUpdateForm.LunAnsw+1;
       finally cs_LunUpdate.Leave; end;
     end;
end;

procedure tLunCom.Execute;
var i:integer;
begin
  t1:=0;
  LunUpdateForm.LunSend:=0;
  LunUpdateForm.LunAnsw:=0;
  LComPort1:=TComPort.Create(nil);
  LComPort1.ComProp.BaudRate:=br19200;
  LComPort1.ComProp.ByteSize:=bs8;
  LComPort1.ComProp.EnableDTR:=False;
  LComPort1.ComProp.EnableRTS:=False;
  LComPort1.ComProp.Parity:=ptNONE;
  LComPort1.ComProp.Stopbits:=sb1BITS;
  LComPort1.ComProp.WaitResult:=10;
  LComPort1.InBufSize:=1024;
  LComPort1.WaitFullBuffer:=FALSE;
  LComPort1.OnReadPacket:=LReadPacket;
  LComPort1.ComNumber:=Port1;
  if not LComPort1.Connected then LComPort1.Open;
  LComPort1.ReadActive:=True;
  Sleep(500);

  LComPort2:=TComPort.Create(nil);
  LComPort2.ComProp.BaudRate:=br19200;
  LComPort2.ComProp.ByteSize:=bs8;
  LComPort2.ComProp.EnableDTR:=False;
  LComPort2.ComProp.EnableRTS:=False;
  LComPort2.ComProp.Parity:=ptNONE;
  LComPort2.ComProp.Stopbits:=sb1BITS;
  LComPort2.ComProp.WaitResult:=50;
  LComPort2.InBufSize:=1024;
  LComPort2.WaitFullBuffer:=FALSE;
  LComPort2.OnReadPacket:=LReadPacket;
  LComPort2.ComNumber:=Port2;
  if not LComPort2.Connected then LComPort2.Open;
  LComPort2.ReadActive:=True;
  Sleep(500);

  while not Terminated do
  begin
    i:=0;
    while i<6 do
    begin
      GetLunaData;
      sleep(100);
      INC(i);
    end;
    //Synchronize(Form1.MyUpdate);
    if (Form1<>nil) then if Form1.Visible then
    PostMessage(Form1.Handle,WM_NOTIFY_MSL,0,0);
  end;
  if LComPort1<>nil then LComPort1.Destroy;
  if LComPort2<>nil then LComPort2.Destroy;
end;

end.
