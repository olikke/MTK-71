unit Client_EM5402;

interface

uses Classes,Global,Windows,SyncObjs,Container_TM2220,MyPanel,BDRecord,ComPortR,SysUtils,Graphics;

type
  TChannel = record
    Use           :boolean;
    TVDName       :string;
    Addr          :integer;
    PositiveQuery :cardinal;
    TotalQuery    :cardinal;
    DeviceMiss    :boolean;
    State         :TState;
  end;

type
  TComma         = record
    ChannelNumb  :integer;
    CommandType  :T2220_Command;
    Command      :T05;
    Commandlenght:byte;
  end;

  TCommand    =^TComma;

const
   CommandArray: array [T2220_Command] of byte =
   (1,2,3,4,12,13,14,15,16,17,18,19,20,21,22,0);


type
  TEM5402     = class(TThread)
  private
    fBaudRate :TBaudRate;
    fByteSize :TByteSize;
    fEnableDTR:boolean;
    fEnableRTS:boolean;
    fParity   :TParity;
    fStopBits :TStopBits;
    fTimeOut  :integer;
    fCom      :TComPortR;
    fComNumber:integer;
    fEvent    :TEvent;
    fNumb     :integer;
    fChannel  :array[1..4] of TChannel;
    sa4Event  :SECURITY_ATTRIBUTES;
    f5402     :Cardinal;
    f5402List :TList;
    fExternal :TList;
    fTempList :TList;
    fimage2220 :cardinal;
    fDev_ID2220:byte;
    fimage5402 :cardinal;
    fDev_ID5402:byte;
    fPositiveQuery:cardinal;
    fTotalQuery   :cardinal;
    FullCounter   :cardinal;
    fComState     :boolean;
    fColor        :TColor;
    fState        :TState;
    kunumb        :array [1..4] of byte;
    procedure INIT;
    procedure AddCommand(Device_ID:byte;Comm:T2220_Command;value:byte);
    procedure CreateList;
    procedure CheckList;
    procedure CheckState;
    procedure SendData(Command:TCommand);
    procedure FMEssageToForm2220(Command:T2220_Command;result:TResult;Device_ID:byte);
  public
    property    Color:TColor read fColor;
    property    State:TState read fState;
    function    ChannelState(numb:integer):TState;
    function    ChannelUse  (numb:integer):boolean;
    function    ChannelName (numb:integer):string;
    procedure   ReadPacket  (const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
    constructor Create(Event:TEvent;Numb:integer);
    function    ComState:boolean;
    function    DeviceState:boolean;
    procedure   ExternalCommand(Device_ID:byte;Comm:T2220_Command;value:byte);
    procedure   AboutForm2220(Handle:cardinal;DEV_ID:byte);
    procedure   AboutForm5402(Handle:cardinal;DEV_ID:byte);
  protected
    procedure Execute; override;
  end;

  var EM5402: array [1..2] of TEM5402;

implementation

procedure TEM5402.AboutForm5402(Handle: Cardinal; DEV_ID: Byte);
begin
  fimage5402 :=Handle;
  fDEV_ID5402:=DEV_ID;
end;

procedure TEM5402.AboutForm2220(Handle: Cardinal; DEV_ID: Byte);
begin
  fimage2220:=Handle;
  fDev_ID2220:=DEV_ID;
end;

procedure TEM5402.ExternalCommand(Device_ID: Byte; Comm: T2220_Command; value: Byte);
begin
  if not Device_ID in [1..4] then exit;
  AddCommand(Device_ID,Comm,Value);
end;

function TEM5402.ChannelUse(numb: Integer):boolean;
begin
  if not numb in [1..4] then result:=false
                        else result:=fChannel[numb].Use;
end;

function TEM5402.ChannelName(numb: Integer):string;
begin
  if not numb in [1..4] then result:=''
                        else result:=fChannel[numb].TVDName;
end;

function TEM5402.ChannelState(numb: Integer):TState;
begin
  if not numb in [1..4] then result:=dsRed
                        else result:=fChannel[numb].State;
end;

function TEM5402.ComState;
begin
  result:=fCOMState;
end;

function TEM5402.DeviceState;
begin
  result:=fComState;
end;

procedure TEM5402.CheckList;
var i,n:integer;
begin
  for i:=0 to f5402List.Count-1 do
    SendData(f5402List[i]);
  if fExternal.Count=0 then exit;
  fTempList.Assign(fExternal);
  fExternal.Clear;
  n:=fTempList.Count;
  for n:=0 to n-1 do SendData(fTempList[n]);
  for n:=0 to n-1 do Dispose(fTempList[n]);
  fTempList.Clear;
end;

procedure TEM5402.SendData(Command: TCommand);
var Comm    :T05;
    Lenght  :byte;
    CType   :T2220_Command;
    Signaled:cardinal;
    CNumber :byte;
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
    fCOM.ComNumber           :=fComNumber;
    if not fCOM.Connected then fCOM.Open;
    fCOM.ReadActive:=True;
  end;
  Comm   :=Command^.Command;
  Lenght :=Command^.Commandlenght;
  CType  :=Command^.CommandType;
  CNumber:=Command^.ChannelNumb;
  INC(fChannel[CNumber].TotalQuery);
  if not fCOM.WriteBuffer(@Comm[0],Lenght) then
  begin
    FMessageToForm2220(CType,NoSend,CNumber);
    exit;
  end;
  Signaled:=WaitForSingleObject(f5402,fTimeOut);
  if Signaled<>WAIT_OBJECT_0 then FMessageToForm2220(CType,NoReply,CNumber);
end;

procedure TEM5402.ReadPacket(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var pb            :^byte;
    i             :integer;
    ReceiveCommand:T20;
    wr            :byte;
    Address       :cardinal;
    Device_ID     :byte;
    LRC           :byte;
    Command       :T2220_Command;
    k,l,m,n       :single;
begin
  if p=nil then EXIT;
  Device_ID:=0;
  Command:=Unknown;
  if (Count<>5) and (Count<>21) then
  begin
    FMessageToForm2220(Command,NotIdent,Device_ID);
    SetEvent(f5402);
    exit;
  end;
  pb:=p;
  for i:=0 to Count-1 do
  begin
    wr:=pb^;
    ReceiveCommand[i]:=wr;
    INC(pb);
  end;
  if not  ReceiveCommand[1] in [1..4] then
  begin
    FMessageToForm2220(Command,Error1,Device_ID);
    SetEvent(f5402);
    exit;
  end;
  Address:=ReceiveCommand[0] shl 8 +ReceiveCommand[1];
  if Address<>fChannel[ReceiveCommand[1]].Addr then
  begin
    FMessageToForm2220(Command,Error1,Device_ID);
    SetEvent(f5402);
    exit;
  end else Device_ID:=ReceiveCommand[1];
  LRC:=0;
  for i := 0 to Count-2 do LRC:=LRC+ReceiveCommand[i];
  LRC:=$FF-LRC+1;
  if LRC<>ReceiveCommand[Count-1] then
  begin
    FMessageToForm2220(Command,ErrorCheckSum,Device_ID);
    SetEvent(f5402);
    exit;
  end;
  if ReceiveCommand[2]>$80 then
  begin
    FMEssageToForm2220(Command,Error2,Device_ID);
    SetEvent(f5402);
    //??? ?????? ???????, ?? ??? ????? ????????!
    if (ReceiveCommand[3] and $20) = $20 then fChannel[Device_ID].DeviceMiss:=true;
    exit;
  end;
  INC(fChannel[Device_ID].PositiveQuery);
  case ReceiveCommand[2] of
    1:   Command:=TVDon;
    2:   Command:=TVDoff;
    3:   Command:=LEDon;
    4:   Command:=LEDoff;
    12:  Command:=HEATERon;
    13:  Command:=HEATERoff;
    14:  Command:=HEATERauto;
    15:  Command:=FANon;
    16:  Command:=FANoff;
    17:  Command:=FANauto;
    18:  Command:=TVDd;
    19:  Command:=YCG;
    20:  Command:=YCE;
    21:  Command:=CCG;
    22:  Command:=CCE;
  end;
  if Command=TVDd then
  begin
     k:=ReceiveCommand[5]*256+ReceiveCommand[6];
     l:=k*1.13636364/1024;
     if (19.05-3.81*l)<>0 then
     k:=(5710*l-5050)/(19.05-3.81*l);

     m:=ReceiveCommand[9]*256+ReceiveCommand[10];
     n:=m*5/1024;
     m:=(n-0.8)/0.031;

     if (ReceiveCommand[15] and $40) = $40 then
     begin
       TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].TVDon:=true;
       if First[KUtoPort [(fNumb-1)*4]+Device_ID]
       then First[KUtoPort [(fNumb-1)*4]+Device_ID]:=false;
     end else
     begin
       TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].TVDon:=false;
       if First[KUtoPort [(fNumb-1)*4]+Device_ID] then
       AddCommand(Device_ID,TVDon,0);
     end;
     TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].U       :=ReceiveCommand[3]+ReceiveCommand[4]*0.1;
     TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].Temp    :=k;
     if (ReceiveCommand[15] and $80) = $80 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].TempAuthentic:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].TempAuthentic:=false;
     TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].Humidity:=m;
     if (ReceiveCommand[11] and $80) = $80 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].FAN:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].FAN:=false;
     TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].FANSpeed:=((ReceiveCommand[11] and $0F)*256+ReceiveCommand[12])*10;
     if (ReceiveCommand[15] and $02) = $02 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].FANMode:=auto
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].FANMode:=manual;
     if (ReceiveCommand[11] and $40) = $40 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].Heater:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].Heater:=false;
     if (ReceiveCommand[15] and $10) = $10 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].HeaterAuthentic :=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].HeaterAuthentic :=false;
     if (ReceiveCommand[15] and $01) = $01 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].HeaterMode:=auto
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].HeaterMode:=manual;
     if (ReceiveCommand[15] and $04) = $04 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].SSP:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].SSP:=false;
     if (ReceiveCommand[15] and $08) = $08 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].ColorSign:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].ColorSign:=false;
     if (ReceiveCommand[15] and $20) = $20 then TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].LED:=true
                                           else TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].LED:=false;
     i:=TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].YCGWrite(ReceiveCommand[16]);
     if i<>-1 then AddCommand(Device_ID,YCG,i);
     i:=TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].YCEWrite(ReceiveCommand[17]);
     if i<>-1 then AddCommand(Device_ID,YCE,i);
     i:=TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].CCGWrite(ReceiveCommand[18]);
     if i<>-1 then AddCommand(Device_ID,CCG,i);
     i:=TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].CCEWrite(ReceiveCommand[19]);
     if i<>-1 then AddCommand(Device_ID,CCE,i);
  end;
  TM2220[KUtoPort [(fNumb-1)*4]+Device_ID].SetTime;
  SetEvent(f5402);
  FMEssageToForm2220(Command,Success,Device_ID);
end;

procedure TEM5402.FMEssageToForm2220(Command: T2220_Command; result: TResult;Device_ID:byte);
begin
  if fimage2220=0 then exit;
  if Device_ID=fDEV_ID2220 then
  PostMessage(fimage2220,WM_NOTIFY_2220,Integer(Command),Integer(Result));
end;

procedure TEM5402.CheckState;
var i:integer;
    FullState:boolean;
    CountOfGreen:integer;
    FullCount   :integer;
begin
  INC(FullCounter);
  if (FullCounter mod 3)<>0 then exit;
  FullState   :=false;
  CountOfGreen:=0;
  FullCount   :=0;
  for i:=1 to 4 do
    if fChannel[i].Use then
    begin
      if fChannel[i].TotalQuery<>0 then
        if fChannel[i].PositiveQuery<>0 then
        begin
          fChannel[i].State:=dsGreen;
          FullState:=true;
          INC(CountOfGreen);
        end else
        begin
          if fChannel[i].DeviceMiss then fChannel[i].State:=dsYellow
                                    else fChannel[i].State:=dsRed;
        end
      else fChannel[i].State:=dsRed;
      INC(FullCount);
    end;
  for i:=1 to 4 do
  begin
    fChannel[i].TotalQuery   :=0;
    fChannel[i].PositiveQuery:=0;
    fChannel[i].DeviceMiss   :=false;
  end;
  fComState:=FullState;
  if FullCount<>0 then
    if CountOfGreen<>0 then
      if CountOfGreen=FullCount then
      begin
        fColor:=_Green;
        fState:=dsGreen
      end else
      begin
        fColor:=_Yell;
        fState:=dsYellow
      end else
    begin
      fColor:=_Red;
      fState:=dsRed
    end else
  begin
    fColor:=_Gray;
    fState:=dsGray;
  end;
  if fimage5402=0 then exit;
  if fDEV_ID5402=fnumb then
  PostMessage(fimage5402,WM_NOTIFY_5402,0,0);
end;

procedure TEM5402.INIT;
begin
  if fNumb=1 then fComNumber:=45
             else fComNumber:=46;
  fBaudRate :=br57600;
  fByteSize :=bs8;
  fEnableDTR:=false;
  fEnableRTS:=false;
  fParity   :=ptNONE;
  fStopBits :=sb1BITS;
  fTimeOut  :=100;
  sa4Event.nLength              := sizeof(sa4Event);
  sa4Event.lpSecurityDescriptor := NIL;
	sa4Event.bInheritHandle       := TRUE;
  f5402     := CreateEvent(@sa4Event,FALSE,FALSE,PAnsiChar('5402Event'+IntToStr(fNumb)));
end;

procedure TEM5402.CreateList;
var i:integer;
    Command:TCommand;
begin
  f5402List:=TList.Create;
  for i:=1 to 4 do
  if fChannel[i].Use then
  begin
    new(Command);
    Command^.ChannelNumb  :=i;
    Command^.CommandType  :=TVDd;
    Command^.Commandlenght:=4;
    Command^.Command[0]   :=HI(fChannel[i].Addr);
    Command^.Command[1]   :=LO(fChannel[i].Addr);
    Command^.Command[2]   :=CommandArray[TVDd];
    Command^.Command[3]   :=$ff-(Command^.Command[0]+Command^.Command[1]+Command^.Command[2])+1;
    f5402List.Add(Command);
  end;
end;

procedure TEM5402.AddCommand(Device_ID: Byte; Comm: T2220_Command; value: byte);
var Command:TCommand;
begin
  if not Device_ID in [1..4] then exit;
  if fChannel[Device_ID].Use then
  begin
    new(Command);
    Command^.ChannelNumb  :=Device_ID;
    Command^.CommandType  :=Comm;
    Command^.Command[0]   :=HI(fChannel[Device_ID].Addr);
    Command^.Command[1]   :=LO(fChannel[Device_ID].Addr);
    Command^.Command[2]   :=CommandArray[Comm];
    if (Comm<>YCG) and (Comm<>YCE)  and (Comm<>CCG) and (Comm<>CCE) then
    begin
      Command^.Commandlenght:=4;
      Command^.Command[3]   :=$ff-(Command^.Command[0]+Command^.Command[1]+Command^.Command[2])+1;
    end else
    begin
      Command^.Commandlenght:=5;
      Command^.Command[3]   :=value;
      Command^.Command[4]   :=$ff-(Command^.Command[0]+Command^.Command[1]+Command^.Command[2]+Command^.Command[3])+1;
    end;
    fExternal.Add(Command);
  end;
end;

constructor TEM5402.Create(Event:TEvent;Numb:integer);
var i:integer;
    n:integer;
begin
  inherited Create(true);
  FullCounter:=0;
  fimage2220 :=0;
  fimage5402 :=0;
  fColor     :=clSilver;
  fState     :=dsGray;
  fComState  :=false;
  fEvent     :=Event;
  fNumb      :=Numb;
  for i:=1 to 4 do
  if bdKU[KUtoPort [(fNumb-1)*4+i]].Use then
  begin
     fChannel[i].Use     :=true;
     fChannel[i].TVDName :=bdKU[KUtoPort [(fNumb-1)*4+i]].Name+'('+bdKU[KUtoPort [(fNumb-1)*4+i]].PName+')'+' '+bdKU[KUtoPort [(fNumb-1)*4+i]].Position;
     case fNumb of
       1: n:=$22 shl 8;
       2: n:=$24 shl 8;
     end;
     fChannel[i].Addr    :=n+i;
     fChannel[i].PositiveQuery:=0;
     fChannel[i].TotalQuery   :=0;
     fChannel[i].State        :=dsGray;
     TM2220[KUtoPort [(fNumb-1)*4+i]]    :=TTM2220.Create(KUtoPort [(fNumb-1)*4+i]);
     First[KUtoPort [(fNumb-1)*4+i]]:=true;
  end else
  begin
    fChannel[i].Use      :=false;
    fChannel[i].State    :=dsGray;
  end;
  fPositiveQuery:=0;
  fTotalQuery   :=0;
  fExternal     :=TList.Create;
  fTempList     :=TList.Create;
  INIT;
  CreateList;
  resume;
end;

procedure TEM5402.Execute;
var i:integer;
begin
  FreeOnterminate:=false;
  while not Terminated do
  begin
    CheckList;
    CheckState;
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      for i:=1 to 4 do
      begin
        TM2220[KUtoPort [(fNumb-1)*4]+i].Free;
        TM2220[KUtoPort [(fNumb-1)*4]+i]:=nil;
      end;
      f5402List.Free;
      f5402List:=nil;
      fExternal.Free;
      fExternal:=nil;
      fTempList.Free;
      fTempList:=nil;
      exit;
    end;
  end;
end;

end.
