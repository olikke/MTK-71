unit Client_EM3401;

interface

uses Classes,ComPortR,Global,Windows,SyncObjs,Graphics,MyPanel,dialogs,sysutils;

var
  ArrEM3401:Array[1..93] of Byte = ($FF,$55,$AA,$00,
  //1-?????  ???   fore
     $5A,$5A,$5A,$13,$13,$13,$00,$4B,$00,$4B,$22,$44,$16,$05,$07,
     $09,$1B,$16,$1C,$18,$06,$05,$07,$09,$1B,$16,$1C,$18,$06,$05,
     $07,$09,$1B,$16,$1C,$18,$06,$05,$07,$09,$1B,$16,$1C,$18,
  //2-?????  ?????   aft
     $5A,$5A,$5A,$13,$13,$13,$00,$6E,$10,$4E,$01,$C4,$15,$05,$05,
     $07,$16,$12,$17,$13,$05,$05,$05,$07,$16,$12,$17,$13,$05,$05,
     $05,$07,$16,$12,$17,$13,$05,$05,$05,$07,$16,$12,$17,$13,$DB);

type
 TEM3401 = class(TThread)
 private
   fNumb:integer;
   fBaudRate :TBaudRate;
   fByteSize :TByteSize;
   fEnableDTR:boolean;
   fEnableRTS:boolean;
   fParity   :TParity;
   fStopBits :TStopBits;
   fTimeOut  :integer;
   fCom      :TComPortR;
   fError    :byte;
   AnsEvent  :TEvent;
   FDataExh  :boolean;
   fSynchro1 :TColor;
   fSynchro2 :TColor;
   fSumm1    :TColor;
   fSumm2    :TColor;
   FColor    :TColor;
   FState    :TState;
   fUse1     :boolean;
   fUse2     :boolean;
   procedure Init;
   procedure SendPacket;
   procedure AnalizState;
   function  fChannel1:TState;
   function  fChannel2:TState;
 public
   constructor Create(Use1,Use2:boolean);
   procedure   ReadPacket(const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
   property    DataExh        :boolean read FDataExh;
   function    ComState:boolean;
   property    Synchro1:TColor  read fSynchro1;
   property    Synchro2:TColor  read fSynchro2;
   property    Channel1:TState  read fChannel1;
   property    Channel2:TState  read fChannel2;
   property    Summ1   :TColor  read fSumm1;
   property    Summ2   :TColor  read fSumm2;
   property    Color   :TColor  read FColor;
   property    State   :TState  read FState;
 protected
   procedure Execute; override;
 end;

var EM3401:TEM3401;
//olikke
//???????? ?????????  ? ??????!

implementation

function TEM3401.fChannel1:TState;
begin
  if not fDataExh then
  begin
    result:=dsRed;
    exit;
  end;
  if fSynchro1=_Red then result:=dsRed else
  if fSynchro1=_Yell then result:=dsYellow else
  if fSynchro1=_Green then result:=dsGreen else
  if fSynchro1=_Gray then result:=dsGray;
end;

function TEM3401.fChannel2:TState;
begin
  if not fDataExh then
  begin
    result:=dsRed;
    exit;
  end;
  if fSynchro2=_Red then result:=dsRed else
  if fSynchro2=_Yell then result:=dsYellow else
  if fSynchro2=_Green then result:=dsGreen else
  if fSynchro2=_Gray then result:=dsGray;
end;

function TEM3401.ComState:boolean;
begin
  result:=fDataExh;
end;

procedure TEM3401.ReadPacket(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var
  pb:^byte;
  Res:byte;
  FS :byte;
begin
  if p=nil then EXIT;
  Res:=0;
  pb :=p;
  FS :=0;
  INC(pb,2);
  Res:=pb^;
  if fUse1 then
    if((Res and $01)<>0)then
    begin
      fSynchro1:=_Green;
      INC(FS);
    end else
      fSynchro1:=_Red
    else INC(FS);
  if fUse2 then
    if((Res and $04)<>0)then
    begin
      fSynchro2:=_Green;
      INC(FS);
    end else
      fSynchro2:=_Red
    else INC(FS);
  if((Res and $10)<>0)then
  begin
    fSumm1:=_Green;
    INC(FS);
  end else
    fSumm1:=_Red;
  if((Res and $20)<>0)then
  begin
    fSumm2:=_Green;
    INC(FS);
  end else
    fSumm2:=_Red;
  if FS=4 then
  begin
    fColor:=_Green;
    fState:=dsGreen;
  end else
  begin
    if (fUse1 and (fSynchro1=_Red)) or
       (fUse2 and (fSynchro2=_Red)) then
    begin
      fColor:=_Red;
      fState:=dsRed;
    end else
    begin
      fColor:=_Yell;
      fState:=dsYellow;
    end;
  end;
  AnsEvent.SetEvent;
end;

procedure TEM3401.SendPacket;
begin
  if fCom=nil then
  begin
    fCOM:=TComPortR.Create(nil);
    fCOM.ComProp.BaudRate    :=fBaudRate;
    fCOM.ComProp.ByteSize    :=fByteSize;
    fCOM.ComProp.EnableDTR   :=fEnableDTR;
    fCOM.ComProp.EnableRTS   :=fEnableRTS;
    fCOM.ComProp.Parity      :=fParity;
    fCOM.ComProp.Stopbits    :=fStopBits;
    fCOM.ComProp.WaitResult  :=fTimeOut;
    fCOM.InBufSize           :=1024;
    fCOM.WaitFullBuffer      :=false;
    fCOM.OnReadPacket        :=ReadPacket;
    fCOM.ComNumber           :=fNumb;
    if not fCOM.Connected then fCOM.Open;
    fCOM.ReadActive:=True;
  end;
  if not fCOM.WriteBuffer(@ArrEM3401[1],93) then
  begin
    INC(fError);
    exit;
  end;
  case WaitForSingleObject(AnsEvent.Handle, fTimeOut) of
    WAIT_FAILED:   INC(fError);
    WAIT_TIMEOUT:  INC(fError);
    WAIT_OBJECT_0: fError:=0;
  end;
end;

procedure TEM3401.AnalizState;
begin
  if fError>=3 then
  begin
    fError:=3;
    if fCom<>nil then
    begin
      fCom.Close;
      fCom:=nil;
    end;
    fDataExh:=false;
    fState  :=dsRed;
    fColor  :=_Red;
  end else
  fDataExh:=true;
end;

constructor TEM3401.Create(Use1,Use2:boolean);
var i:integer;
    s:byte;
begin
  inherited Create(true);
  s:=0;
  for i:=4 to 92 do
  s:=s+ArrEM3401[i];
  ArrEM3401[93]:=s;
  Init;
  fError   :=0;
  AnsEvent :=TEvent.Create(nil,false,false,'AnsEvent');
  FDataExh :=false;
  fUse1    :=Use1;
  fUse2    :=Use2;
  if fUse1 then fSynchro1:=_Red else fSynchro1:=_Gray;
  if fUse2 then fSynchro2:=_Red else fSynchro2:=_Gray;
  fSumm1   :=_Red;
  fSumm2   :=_Red;
  fColor   :=_Red;
  fState   :=dsRed;
  resume;
end;

procedure TEM3401.Init;
begin
  fNumb     :=47;
  fBaudRate :=br115200;
  fByteSize :=bs8;
  fEnableDTR:=false;
  fEnableRTS:=false;
  fParity   :=ptNONE;
  fStopBits :=sb1BITS;
  fTimeOut  :=100;
end;

procedure TEM3401.Execute;
begin
  FreeOnterminate:=false;
  while not Terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(StopEvent5401.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      if fCom<>nil then
      begin
        fCom.ReadActive:=false;
        fCom:=nil;
      end;
      AnsEvent.Free;
    end;
    SendPacket;
    AnalizState;
  end;
end;

end.
