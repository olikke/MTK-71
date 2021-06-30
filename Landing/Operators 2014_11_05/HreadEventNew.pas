unit HreadEventNew;

interface

uses
  Classes,Windows,Forms,SysUtils,Math,Protocol,DateUtils,Dialogs,Global,MMSystem,BufferQueue,LadogaClient,LadogaAnaliz;

type
  TNewWaitEvent = class(TThread)
  private
    hLadogaClient :TSendLadogaWSP;
    procedure GetEvent;
  protected
    procedure Execute; override;
  end;

  var LadogaStart,LadogaStop:int64;

implementation

uses Main;

var MTimerID:Cardinal;
    FlRead:byte;
    Counter:int64;
    Lad: array [1..3] of TLad;
    ZeroError:boolean;

procedure TNewWaitEvent.Execute;
begin
  QueryPerformanceCounter(LadogaStart);
  FlRead:=0;
  Counter:=0;
  ZeroError:=true;
  FillChar(SetLadoga,SizeOf(SetLadoga),0);
  if HOST_TP=2 then SendQueue:= TBufferQueue.Create;
  if HOST_TP=2 then hLadogaClient:=TSendLadogaWSP.Create(IP_SrvWSC1,IP_SrvWSC2,IP_SrvWSL1,IP_SrvWSL2,4567);
  if HOST_TP=1 then hLadogaAnaliz:=TLadogaAnaliz.Create;
  while (not Terminated) do
  begin
    GetEvent;
  end;
  timeKillEvent(MTimerID);
  Application.ProcessMessages;
  if Assigned(hLadogaClient) then
  begin
    hLadogaClient.Terminate;
    hLadogaClient.WaitFor;
  end;
  if Assigned(hLadogaAnaliz) then
  begin
    hLadogaAnaliz.Terminate;
    hLadogaAnaliz.WaitFor;
  end;
  if SendQueue<>nil then
  begin
    SendQueue.Free;
    SendQueue:=nil;
  end;
end;

//данные для WSP обновляются с частотой 50 Гц
procedure SendLadoga;
var str:string;
begin
  SetLength(str,Sizeof(TLadoga)+SizeOF(int64));
  cs_Ladoga.Enter;
  try
    move(Counter,Str[1],SizeOF(int64));
    move(Ladoga[HOST_TP],str[1+SizeOf(int64)],sizeof(TLadoga));
  finally
    cs_Ladoga.Leave;
  end;
  if not SendQueue.Full then SendQueue.Enqueue(str);
end;

procedure ReadLadoga;
var ValidMessage: array [1..3] of Boolean;
    nm:integer;
    Temp:DWord;
    mT,mD:Extended;
    Day,Month,Year:word;
    CS:Word;
begin
  INC(FlRead);
  INC(Counter);
  ValidMessage[1]:=false;
  rtdefsubaddr(FHandl,RT_RECEIVE,$11);
  rtgetblk(FHandl,0,@MSO[1],29);
  cs:=CheckSumW(@MSO[1],0,28);
  if (MSO[1][28]<>cs)OR(MSO[1][0]=0)then
  begin
    sleep(1);
    rtdefsubaddr(FHandl,RT_RECEIVE,$11);
    rtgetblk(FHandl,0,@MSO[1],29);
    cs:=CheckSumW(@MSO[1],0,28);
    if (MSO[1][28]<>cs)OR(MSO[1][0]=0)then  ValidMEssage[1]:=true;
  end;
  ValidMessage[2]:=false;
  rtdefsubaddr(FHandl,RT_RECEIVE,$12);
  rtgetblk(FHandl,0,@MSO[2],29);
  cs:=CheckSumW(@MSO[2],0,28);
  if (MSO[2][28]<>cs)OR(MSO[2][0]=0)then
  begin
    sleep(1);
    rtdefsubaddr(FHandl,RT_RECEIVE,$12);
    rtgetblk(FHandl,0,@MSO[2],29);
    cs:=CheckSumW(@MSO[2],0,28);
    if (MSO[2][28]<>cs)OR(MSO[2][0]=0)then  ValidMEssage[2]:=true;
  end;
  ValidMessage[3]:=false;
  rtdefsubaddr(FHandl,RT_RECEIVE,$13);
  rtgetblk(FHandl,0,@MSO[3],29);
  cs:=CheckSumW(@MSO[3],0,28);
  if (MSO[3][28]<>cs)OR(MSO[3][0]=0)then
  begin
    sleep(1);
    rtdefsubaddr(FHandl,RT_RECEIVE,$13);
    rtgetblk(FHandl,0,@MSO[3],29);
    cs:=CheckSumW(@MSO[3],0,28);
    if (MSO[3][28]<>cs)OR(MSO[3][0]=0)then  ValidMEssage[3]:=true;
  end;
  if FlRead > 110 then
  begin
    timeKillEvent(MTimerID);
    Application.ProcessMessages;
    exit;
  end;
  //Преобразование данных от Ладоги
  for nm:=1 to 3 do
  if not ValidMEssage[nm] then
  begin
    LAD[nm].laDataExh:=1;
    Temp             :=MSO[nm,1] shl 16 + MSO[nm,2];
    if Temp>=$80000000 then
    LAD[nm].laFi     :=-AddCodeD(Temp)*MSCML[1] else
    LAD[nm].laFi     :=Temp*MSCML[1];
    Temp             :=MSO[nm,3] shl 16 + MSO[nm,4];
    if Temp>=$80000000 then
    LAD[nm].laLmb    :=-AddCodeD(Temp)*MSCML[2] else
    LAD[nm].laLmb    :=Temp*MSCML[2];
    if MSO[nm,5]>=$8000 then
    LAD[nm].lagVn    :=-AddCode(MSO[nm,5])*MSCML[3] else
    LAD[nm].lagVn    :=(MSO[nm,5])*MSCML[3];
    if MSO[nm,6]>=$8000 then
    LAD[nm].lagVe    :=-AddCode(MSO[nm,6])*MSCML[4] else
    LAD[nm].lagVe    :=(MSO[nm,6])*MSCML[4];
    if MSO[nm,7]>=$8000 then
    LAD[nm].laVl     :=-AddCode(MSO[nm,7])*MSCML[5] else
    LAD[nm].laVl     :=(MSO[nm,7])*MSCML[5];
    LAD[nm].laK      :=(MSO[nm,8] shl 16 + MSO[nm,9])*MSCML[6];
    if MSO[nm,10]>=$8000 then
    LAD[nm].laVK     :=-AddCode(MSO[nm,10])*MSCML[7] else
    LAD[nm].laVK     :=MSO[nm,10]*MSCML[7];
    Temp             :=MSO[nm,11] shl 16 + MSO[nm,12];
    if Temp>=$80000000 then
    LAD[nm].laPsi    :=-AddCodeD(Temp)*MSCML[8] else
    LAD[nm].laPsi    :=Temp*MSCML[8];
    if MSO[nm,13]>=$8000 then
    LAD[nm].laVPsi   :=-AddCode(MSO[nm,13])*MSCML[9] else
    LAD[nm].laVPsi   :=MSO[nm,13]*MSCML[9];
    Temp             :=MSO[nm,14] shl 16 + MSO[nm,15];
    if Temp>=$80000000 then
    LAD[nm].laTeta   :=-AddCodeD(Temp)*MSCML[10] else
    LAD[nm].laTeta   :=Temp*MSCML[10];
    if MSO[nm,16]>=$8000 then
    LAD[nm].laVTeta  :=-AddCode(MSO[nm,16])*MSCML[11] else
    LAD[nm].laVTeta  :=MSO[nm,16]*MSCML[11];
    if MSO[nm,17]>=$8000 then
    LAD[nm].laVn     :=-AddCode(MSO[nm,17])*MSCML[12] else
    LAD[nm].laVn     :=MSO[nm,17]*MSCML[12];
    if MSO[nm,18]>=$8000 then
    LAD[nm].laVe     :=-AddCode(MSO[nm,18])*MSCML[13] else
    LAD[nm].laVe     :=MSO[nm,18]*MSCML[13];
    if MSO[nm,19]>=$8000 then
    LAD[nm].laVz     :=-AddCode(MSO[nm,19])*MSCML[14] else
    LAD[nm].laVz     :=MSO[nm,19]*MSCML[14];
    if MSO[nm,20]>=$8000 then
    LAD[nm].laSn     :=-AddCode(MSO[nm,20])*MSCML[15] else
    LAD[nm].laSn     :=MSO[nm,20]*MSCML[15];
    if MSO[nm,21]>=$8000 then
    LAD[nm].laSe     :=-AddCode(MSO[nm,21])*MSCML[16] else
    LAD[nm].laSe     :=MSO[nm,21]*MSCML[16];
    if MSO[nm,22]>=$8000 then
    LAD[nm].laSz     :=-AddCode(MSO[nm,22])*MSCML[17] else
    LAD[nm].laSz     :=MSO[nm,22]*MSCML[17];
    LAD[nm].laro     :=MSO[nm,23]*MSCML[18];
    mT               :=1.0*(MSO[nm,24] shl 1 + MSO[nm,25]/32768.0)/86400.0;
    Day              :=MSO[nm,26] shr 11;
    Month            :=(MSO[nm,26]-Day shl 11) shr 7;
    Year             :=2000+MSO[nm,26] - (Day shl 11) - (Month shl 7);
    if (Year<>2000) and (Month<>0) and (Day<>0) then
    mD               :=EncodeDate(Year,Month,Day)
    else md:=Now;
    LAD[nm].laDTL    :=TimeOf(mt)+DateOf(md);
    LAD[nm].laCC     :=MSO[nm,27];
  end else  LAD[nm].laDataExh:=0;
  cs_Ladoga.Enter;
  try
    Ladoga[HOST_TP].Central:=LAD[1];
    Ladoga[HOST_TP].Fore   :=LAD[2];
    Ladoga[HOST_TP].Aft    :=LAD[3];
  finally
    cs_Ladoga.Leave;
  end;
  if HOST_TP=1 then
  if not ValidMessage[1] then
  begin
    hLadogaAnaliz.LAD_BY_WSP:=LAD[1];
  end;
  if HOST_TP=2 then
  if not ValidMessage[1]  then  SendLadoga;
end;

procedure FLTimeCallBack(MTimerID,uMessage:UINT;dwUser,dw1,dw2:DWORD);stdcall;
begin
  if stop then exit;
  ReadLadoga;
end;

procedure TNewWaitEvent.GetEvent;
var LadogaSleep:word;
begin
  nInt:=0;
  case WaitForSingleObject(hEvent,2100) of
    WAIT_OBJECT_0:
      begin
        while nInt<>1 do
        begin
          ResetEvent(hEvent);
          tmkgetevd(FHandl,hEvent,nInt,wMode,wStatus,wCmd);
          if nInt = $FFFF then EXIT;
          if (nInt = 1) and (wCmd=CMD_SYNC_DATA) then
          begin
            QueryPerformanceCounter(LadogaStart);
            //время задержки синхросигнала относительно секундной метки шкалы времени
            LadogaSleep:=Ceil(rtgetcmddata(FHandl,CMD_SYNC_DATA)*0.0004);
            timeKillEvent(MTimerID);
            Application.ProcessMessages;
            sleep(10-LadogaSleep);
            //работа во второй половине 20-мс интервала
            FlRead:=0;
            ZeroError:=not ZeroError;
            ReadLadoga;
            MTimerID:=timeSetEvent(20,0,FLTimeCallBack,0,TIME_PERIODIC);
          end;
        end;
      end;
    WAIT_TIMEOUT:
      begin
        timeKillEvent(MTimerID);
        Application.ProcessMessages;
      end;
  end;
end;

end.
