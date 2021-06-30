unit Client_EM5401;

interface
uses Classes,Global,SyncObjs,Manager_EM2437,SysUtils,ComPortR,Windows,Container_EM5401,MyPanel,Graphics,Dialogs;

type
  TcEM5401 = class(TThread)
  private
    fNumb     :byte;
    fBaudRate :TBaudRate;
    fByteSize :TByteSize;
    fEnableDTR:boolean;
    fEnableRTS:boolean;
    fParity   :TParity;
    fStopBits :TStopBits;
    fTimeOut  :integer;
    Success5401:TEvent;
    Failure5401:TEvent;
    Event5401  :array[0..1] of THandle;
    sa3Event  :SECURITY_ATTRIBUTES;
    fCom      :TComPortR;
    fHandle   :cardinal;
    TempList  :TList;
    fComState :boolean;
    FStateOfInternalLine:T5401Question;
    fPositiveQuery      :cardinal;
    fTotalQuery         :cardinal;
    fInternalReply      :cardinal;
    fInternalState      :TState;
    procedure FMessageToForm(Comm5401:T5401_Command;Comm2437:T2437_Command;DevType:TDeviceType;DevNumb:byte;Result:tResult);
    procedure Init;
    procedure SendData(Command:T5401Question);
    procedure CheckList;
    procedure AnalizPacket5401(Com5401:T5401_Command;ReceiveCommand:T25);
  public
    property    FormHandle    :THandle  write fHandle;
    property    InternalState :TState   read fInternalState;
    procedure   ReadPacket    (const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
    function    ComState      :boolean;
    constructor Create;
  protected
    procedure Execute; override;
  end;

  var cEM5401:TcEM5401;

implementation

function TcEM5401.ComState:boolean;
begin
  result:=fComState;
end;

procedure TcEM5401.FMessageToForm(Comm5401:T5401_Command;Comm2437:T2437_Command;DevType:TDeviceType;DevNumb:byte;Result:tResult);
begin
  case INTEGER(DevType) of
    INTEGER(dtEM5401):  if fHandle<>0 then PostMessage(fHandle,WM_NOTIFY_5401,Integer(Comm5401),Integer(Result));
    INTEGER(dtEM2437):  mEM2437.MessageToForm(DevNumb,Comm2437,Result);
  end;
end;

procedure TcEM5401.SendData(Command:T5401Question);
var Signaled:cardinal;
    Mass    :T25;
    len     :integer;
    Com5401 :T5401_Command;
    Com2437 :T2437_Command;
    DevType :TDeviceType;
    DevNumb :byte;
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
  INC(fTotalQuery);
  Mass   :=Command^.MASS;
  Len    :=Command^.length;
  DevType:=Command^.DevType;
  DevNumb:=Command^.DevNumb;
  case INTEGER(DevType) of
    INTEGER(dtEM5401): Com5401:=Command^.Comm5401;
    INTEGER(dtEM2437): Com2437:=Command^.Comm2437;
  end;
  if not fCOM.WriteBuffer(@Mass[0],Len) then
  begin
    FMEssageToForm(Com5401,Com2437,DevType,DevNumb,NoSend);
    exit;
  end;
  Signaled:=WaitForMultipleObjects(2,@Event5401,false,fTimeOut);
  case Signaled of
    WAIT_FAILED:       ;
    WAIT_TIMEOUT:      FMEssageToForm(Com5401,Com2437,DevType,DevNumb,NoReply);
    WAIT_OBJECT_0 + 0: FMessageToForm(Com5401,Com2437,DevType,DevNumb,Success);
    WAIT_OBJECT_0 + 1: ;
  end;
end;

procedure TcEM5401.AnalizPacket5401(Com5401: T5401_Command; ReceiveCommand: T25);
var Day,Month,Year:Word;
    UDate         :TDateTime;
    i             :integer;
    InternalID    :byte;
    D2437         :array [1..4] of boolean;
    Status        :byte;
begin
  case INTEGER(Com5401) of
    INTEGER(Identification5401):
      begin
        EM5401.DeviceTypeCode  :=(ReceiveCommand[5] and $F0) shr 4;
        EM5401.HardwareVersion :=ReceiveCommand[5] and $0F;
        EM5401.SoftwareVersion :=ReceiveCommand[6];
        EM5401.SerialNumber    :=ReceiveCommand[7] shl 16 + ReceiveCommand[8] shl 8 + ReceiveCommand[9];
        Day:=(ReceiveCommand[3] and $F8) shr 3;
        Month:=(ReceiveCommand[3] and $07) shl 1 + (ReceiveCommand[4] and $80) shr 7;
        Year:=ReceiveCommand[4] and $7F +2000;
        try
          UDate:=EncodeDate(Year,Month,Day);
        except
          UDate:=Date;
        end;
        EM5401.DeviceMDate:=UDate;
      end;
    INTEGER(StateOfInternalLine):
      begin
        FillChar(d2437,SizeOf(d2437),false);
        INC(fInternalReply);
        for i:=1 to ReceiveCommand[1] div 2 - 1 do
        begin
          InternalID:=5;
          case ReceiveCommand[1+2*i] of
            EM5401Addr  : InternalID:=0;
            EM2437Addr+1: InternalID:=1;
            EM2437Addr+2: InternalID:=2;
            EM2437Addr+3: InternalID:=3;
            EM2437Addr+4: InternalID:=4;
          end;
          if InternalID=5 then continue;
          if InternalID=0 then EM5401.Analiz5401 else
          if InternalID in [1..4] then
          begin
            Status:=ReceiveCommand[2+2*i];
            mEM2437.Analiz(InternalID,Status);
            d2437[InternalID]:=true;
          end;
        end;
        mEM2437.EndOfInternalLine(d2437[1],d2437[2],d2437[3],d2437[4]);
      end;
  end;
end;

procedure TcEM5401.ReadPacket(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var pb            :^byte;
    i             :integer;
    wr            :byte;
    ReceiveCommand:T25;
    Com5401       :T5401_Command;
    Com2437       :T2437_Command;
    DevType       :TDeviceType;
    DevNumb       :byte;
    LRC           :integer;
begin
  if p=nil then EXIT;
  Com5401:=UnknownCommand5401;
  Com2437:=UnknownCommand;
  DevType:=dtEM5401;
  DevNumb:=0;
  if (Count>22) or (Count<=4) then
  begin
    FMessageToForm(Com5401,Com2437,DevType,DevNumb,NotIdent);
    Failure5401.SetEvent;
    exit;
  end;
  pb:=p;
  for i:=0 to Count-1 do
  begin
    wr:=pb^;
    ReceiveCommand[i]:=wr;
    INC(pb);
  end;
  DevNumb:=5;
  case ReceiveCommand[0] of
    EM5401Addr  : begin DevNumb:=0; DevType:=dtEm5401; end;
    EM2437Addr+1: begin DevNumb:=1; DevType:=dtEM2437; end;
    EM2437Addr+2: begin DevNumb:=2; DevType:=dtEM2437; end;
    EM2437Addr+3: begin DevNumb:=3; DevType:=dtEM2437; end;
    EM2437Addr+4: begin DevNumb:=4; DevType:=dtEM2437; end;
  end;
  if DevNumb=5 then
  begin
    FMessageToForm(Com5401,Com2437,DevType,DevNumb,NotIdent);
    Failure5401.SetEvent;
    exit;
  end;
  case Integer(devType) of
    INTEGER(dtEM5401):
      case ReceiveCommand[2] of
        0:  Com5401:=UnknownCommand5401;
        1:  Com5401:=StatusOfDevice5401;
        2:  Com5401:=StatusOfSynchro;
        3:  Com5401:=StatusOfTest;
        6:  Com5401:=StateOfInternalLine;
        8:  Com5401:=RunningTime5401;
        9:  Com5401:=Identification5401;
        21: Com5401:=StatusOfFeed1;
        22: Com5401:=StatusOfFeed2;
        25: Com5401:=ThresholdOfFeed1;
        26: Com5401:=ThresholdOfFeed2;
      end;
    INTEGER(dtEM2437):
      case ReceiveCommand[2] of
        0:  Com2437:=UnknownCommand;
        1:  Com2437:=StatusOfDevice;
        2:  Com2437:=StatusOfVideo;
        5:  Com2437:=StatusOfFeed;
        8:  Com2437:=RunningTime;
        9:  Com2437:=Identification;
        11: Com2437:=CorrectionCh1;
        12: Com2437:=CorrectionCh2;
        13: Com2437:=CorrectionCh3;
        14: Com2437:=CorrectionCh4;
        21: Com2437:=StatusOfFeed11;
        22: Com2437:=StatusOfFeed12;
        23: Com2437:=StatusOfFeed21;
        24: Com2437:=StatusOfFeed22;
        25: Com2437:=ThresholdOfFeed11;
        26: Com2437:=ThresholdOfFeed12;
        27: Com2437:=ThresholdOfFeed21;
        28: Com2437:=ThresholdOfFeed22;
        32: Com2437:=MaskOfVideo;
      end;
  end;
  if ((DevType=dtEM5401) and (Com5401=UnknownCommand5401)) or
     ((DevType=dtEM2437) and (Com2437=UnknownCommand)) then
  begin
    FMessageToForm(Com5401,Com2437,DevType,DevNumb,NotIdent);
    Failure5401.SetEvent;
    exit;
  end;
  LRC:=0;
  //проверка контрольной суммы
  for i := 0 to ReceiveCommand[1] do
  begin
    LRC:=LRC+ReceiveCommand[i];
    if LRC>255 then LRC:=LRC-256;
  end;
  if LRC<>ReceiveCommand[ReceiveCommand[1]+1] then
  begin
    FMessageToForm(Com5401,Com2437,DevType,DevNumb,NotIdent);
    Failure5401.SetEvent;
    exit;
  end;
  case INTEGER(DevType) of
    INTEGER(dtEM5401):  AnalizPacket5401(Com5401,ReceiveCommand);
    INTEGER(dtEM2437):  mEM2437.NewPacket(Com2437,ReceiveCommand,DevNumb);
  end;
  INC(fPositiveQuery);
  Success5401.SetEvent;
end;

procedure TcEM5401.Init;
begin
  fNumb     :=48;
  fBaudRate :=br57600;
  fByteSize :=bs8;
  fEnableDTR:=false;
  fEnableRTS:=false;
  fParity   :=ptNONE;
  fStopBits :=sb1BITS;
  fTimeOut  :=100;
  sa3Event.nLength              := sizeof(sa3Event);
  sa3Event.lpSecurityDescriptor := NIL;
	sa3Event.bInheritHandle       := TRUE;
  Success5401 :=TEvent.Create(@sa3Event,FALSE,FALSE,'Success5401');
  Failure5401 :=TEvent.Create(@sa3Event,FALSE,FALSE,'Failure5401');
  Event5401[0]:=Success5401.Handle;
  Event5401[1]:=Failure5401.Handle;
end;

constructor TcEM5401.Create;
begin
  inherited Create(true);
  QuestionList   :=TList.Create;
  cs_QuestionList:=TCriticalSection.Create;
  EM5401         :=TEM5401.Create;
  mEM2437        :=TmEM2437.Create;
  fPositiveQuery :=0;
  fTotalQuery    :=0;
  FHandle        :=0;
  TempList       :=TList.Create;
  fComState      :=false;
  fInternalState :=dsRed;
  Init;
  //комманда состояния внутренней шины
  new(FStateOfInternalLine);
  FStateOfInternalLine^.length  :=4;
  FStateOfInternalLine^.Comm5401:=StateOfInternalLine;
  FStateOfInternalLine^.MASS[0] :=EM5401Addr;
  FStateOfInternalLine^.MASS[1] :=$02;
  FStateOfInternalLine^.MASS[2] :=Command5401[StateOfInternalLine];
  FStateOfInternalLine^.MASS[3] :=FStateOfInternalLine^.MASS[0]+FStateOfInternalLine^.MASS[1]+FStateOfInternalLine^.MASS[2];
  FStateOfInternalLine^.DevType :=dtEM5401;
  FStateOfInternalLine^.DevNumb :=0;
  resume;
end;

procedure TcEM5401.CheckList;
var i:integer;
    Command:T5401Question;
    r:integer;
begin
  SendData(FStateOfInternalLine);
  cs_QuestionList.Enter;
  try
    TempList.Assign(QuestionList);
    QuestionList.Clear;
  finally
    cs_QuestionList.Leave;
  end;
  r:=Templist.Count;
  if r>0 then
  begin
    for i:=0 to r-1 do
    begin
      Command:=TempList[i];
      SendData(Command);
      sleep(1);
    end;
    for i:=0 to r-1 do
    begin
      Command:=TempList[i];
      dispose(Command);
    end;
  end;
  TempList.Clear;
end;

procedure TcEM5401.Execute;
var RoundCount:cardinal;
begin
  FreeOnterminate:=false;
  RoundCount     :=0;
  fInternalReply :=0;
  while not Terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(StopEvent5401.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      EM5401.Destroy;
      EM5401:=nil;
      mEM2437.Destroy;
      mEM2437:=nil;
      cs_QuestionList.Enter;
      try
        QuestionList.Free;
      finally
        cs_QuestionList.Leave;
      end;
      TempList.Free;
      TempList:=nil;
      Dispose(FStateOfInternalLine);
      exit;
    end;
    CheckList;
    INC(RoundCount);
    if RoundCount mod 3 = 0 then
    begin
      if FTotalQuery<>0 then
        if FPositiveQuery<>0 then fComState:=true
                             else fComState:=false
                             else fComState:=false;
      FTotalQuery   :=0;
      FPositiveQuery:=0;
      if fInternalReply=0 then
      begin
        fInternalState:=dsRed;
        mEM2437.EndOfInternalLine(false,false,false,false);
        mEM2437.EndOfInternalLine(false,false,false,false);
        mEM2437.EndOfInternalLine(false,false,false,false);
      end else fInternalState:=dsGreen;
      fInternalReply:=0;
    end;
  end;
end;

end.
