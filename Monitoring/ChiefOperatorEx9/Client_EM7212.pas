unit Client_EM7212;

interface

uses Global,Container_EM7302,ComPortR,Classes,Windows,BDRecord,MyPanel,Graphics,Container_EM7210,SyncObjs,SysUtils;

type
  TEM7212=class(TThread)
  private
    fCOM      :array [1..2]  of TComPortR;
    fNumb     :array [1..2]  of byte;
    fBaudRate :TBaudRate;
    fByteSize :TByteSize;
    fEnableDTR:boolean;
    fEnableRTS:boolean;
    fParity   :TParity;
    fStopBits :TStopBits;
    fTimeOut  :integer;
    c7212     :Cardinal;
    sa4Event  :SECURITY_ATTRIBUTES;
    fHandle   :THandle;
    fActive   :byte;
    fComErr   :array [1..2] of integer;
    f7302Err  :integer;
    fStart    :int64;
    fStop     :int64;
    FState    :TState;
    FColor    :TColor;
    Event     :TEvent;
    numb      :byte;
    fEM7302    :TEM7302;
    NeedToInitialize:boolean;
    NeedToMatrixWr  :boolean;
    fDateOFCreate:TDateTime;
    fCodeOFDevice:byte;
    fPO          :byte;
    fNUMBER      :cardinal;
    fCom1Name,fCom2Name:string;
    procedure AnalizState;
    procedure INIT;
    procedure ANALIZ(TB:T13);
    procedure NoDataFromKUMO;
    procedure SendData(TB:T255;Length:integer);
    function  FDataExh :boolean;
    procedure FMEssageToForm(ComPort:byte;Result:TResult);
    function  FComState1:boolean;
    function  FComState2:boolean;
    function  FEM7302State:boolean;
    procedure Mistake(Result:TResult);
    procedure IncError;
    function  FdsEM7302State:TState;
    procedure WhoAreU;
    procedure CheckNumber;
    procedure SendMatrix;
  public
    constructor Create(ev:tEvent;n:byte);
    procedure   ReadPacket(const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
    property    FormHandle   :THandle  write fHandle;
    property    DataExh      :boolean  read  FDataExh;
    property    EM7302State  :boolean  read  FEM7302State;
    property    dsEM7302State:TState   read  FdsEM7302State;
    property    State        :TState   read  FState;
    property    Color        :TColor   read  FColor;
    property    DateOfCreate :TdateTime read fDateOfCreate;
    property    CodeOfDevice :byte      read fCodeOfDevice;
    property    PO           :byte      read fPO;
    property    Number       :cardinal  read fNumber;  
    function    Com1State    :boolean;
    function    Com2State    :boolean;
    property    Com1Name     :string read fCom1Name;
    property    Com2Name     :string read fCom2Name;
  protected
    procedure   Execute; override;
  end;

  var
  EM72121,EM72122:TEM7212;

implementation

procedure TEM7212.AnalizState;
var i:integer;
    f:boolean;
begin
  if (not FEM7302State)  or
  (not FComState1 and not FComState2) then
  begin
  //olikke!!!!!!!
    if not NeedToInitialize then
    NeedToInitialize:=(not FComState1 and not FComState2);
    fState  :=dsRed;
    fColor  :=_Red;
    if not fComState1 then f7302Err:=4;
    for i:=0 to 13 do
    EM7210[i].WriteDataExh(0);
    exit;
  end;
  f:=true;
  for i:=0 to 13 do
    if EM7210[i].Use then
      if not EM7210[i].DataExh then
      begin
        f:=false;
        break;
      end;
  if f then
  begin
    fState  :=dsGreen;
    fColor  :=_Green;
  end else
  begin
    fState  :=dsYellow;
    fColor  :=_Yell;
  end;
end;

function TEM7212.FdsEM7302State:TState;
begin
  if FEM7302State then result:=dsGreen else result:=dsRed;
end;

function TEM7212.Com1State:boolean;
begin
  result:=FComState1;
end;

function TEM7212.Com2State:boolean;
begin
  result:=FComState2;
end;

function TEM7212.FEM7302State:boolean;
begin
  if f7302Err>=3 then result:=false
                 else result:=true;
end;

function TEM7212.FComState1:boolean;
begin
  result:=false;
  if fComErr[1]>=3 then fComErr[1]:=3
                   else result:=true;
end;

function TEM7212.FComState2:boolean;
begin
  result:=false;
  if fComErr[2]>=3 then fComErr[2]:=3
                   else result:=true;
end;

function TEM7212.FDataExh;
begin
  QueryPerformanceCounter(fStop);
  if GlobalFreq=0 then QueryPerformanceFrequency(GlobalFreq);
  if (fStop-fStart)/GlobalFreq*1000>TimeToUpdate*2 then result:=false
                                                   else result:=true;
end;

procedure TEM7212.INIT;
begin
  case numb of
    1: begin
         fNumb[1]  :=34;
         fNumb[2]  :=57;
         fCom1Name:='COM34';
         fCom2Name:='COM57';
         fEM7302    :=EM7302[1];
       end;
    2: begin
         fNumb[1]  :=37;
         fNumb[2]  :=54;
         fCom1Name :='COM37';
         fCom2Name :='COM54';
         fEM7302    :=EM7302[2];
       end;
  end;
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
  c7212     := CreateEvent(@sa4Event,FALSE,FALSE,NIL);
  fActive   :=1;
end;

procedure TEM7212.SendData(TB: T255; Length: Integer);
var Signaled:cardinal;
begin
  if fActive=1 then fActive:=2
               else fActive:=1;
  if fCOM[fActive]=nil then
  begin
    fCOM[fActive]:=TComPortR.Create(nil);
    fCOM[fActive].ComProp.BaudRate    :=fBaudRate;
    fCOM[fActive].ComProp.ByteSize    :=fByteSize;
    fCOM[fActive].ComProp.EnableDTR   :=fEnableDTR;
    fCOM[fActive].ComProp.EnableRTS   :=fEnableRTS;
    fCOM[fActive].ComProp.Parity      :=fParity;
    fCOM[fActive].ComProp.Stopbits    :=fStopBits;
    fCOM[fActive].ComProp.WaitResult  :=fTimeOut;
    fCOM[fActive].InBufSize           :=1024;
    fCOM[fActive].WaitFullBuffer      :=false;
    fCOM[fActive].OnReadPacket        :=ReadPacket;
    fCOM[fActive].ComNumber           :=fNumb[fActive];
    if not fCOM[fActive].Connected then fCOM[fActive].Open;
    fCOM[fActive].ReadActive:=True;
  end;
  if not fCOM[fActive].WriteBuffer(@TB[0],Length) then
  begin
    FMessageToForm(fActive,NoSend);
    INCError;
    exit;
  end;
  Signaled:=WaitForSingleObject(c7212,fTimeOut);
  if Signaled=WAIT_OBJECT_0 then
  begin
    fComErr[fActive]:=0;
  end else
  begin
    FMessageToForm(fActive,NoReply);
    INCError;
    exit;
  end;
end;

procedure TEM7212.IncError;
begin
  INC(fComErr[fActive]);
  if fComErr[fActive]>=3 then
  begin
    fCom[fActive].Connected:=false;
    fCom[fActive]:=nil;
  end;
end;

procedure TEM7212.FMEssageToForm(ComPort:byte; Result: TResult);
begin
  if fHandle<>0 then
  PostMessage(fHandle,WM_NOTIFY_7212,ComPort,Integer(Result));
end;

procedure TEM7212.Mistake(Result:tResult);
begin
  FMessageToForm(fActive,Result);
  INC(fComErr[fActive]);
  // $34 - ?????? ????????????? KUMO (?????? ?????)
end;

procedure TEM7212.CheckNumber;
begin
  case Numb of
    1: begin
         NeedToMatrixWr:=fNumber<>n7212.first.FactNumber;
         n7212.first.FactNumber:=fNumber;
       end;
    2: begin
         NeedToMatrixWr:=fNumber<>n7212.second.FactNumber;
         n7212.second.FactNumber:=fNumber;
       end;
  end;
  if not NeedToMatrixWr then FMEssageToForm(fActive,InitSuccess) else
                             FMEssageToForm(fActive,InitNewDevice);
end;

procedure TEM7212.ReadPacket(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var i,j:integer;
    pb:^byte;
    wr:byte;
    ReceiveCommand:array[0..40] of byte;
    Result:tResult;
    n1,n2,n3:byte;
begin
  if p=nil then exit;
  Result:=NotIdent;
  SetEvent(c7212);
  pb:=p;
  for i:=0 to Count-1 do
  begin
    wr:=pb^;
    ReceiveCommand[i]:=wr;
    INC(pb);
  end;
  if Count=4 then
  //NAK
  begin
    if (ReceiveCommand[0]=$15) and (ReceiveCommand[1]=$37) then
    begin
      case ReceiveCommand[2] of
        $34: Result:=Error1;
        $35: Result:=ErrorCheckSum;
        $37: Result:=Error2;
        $38: Result:=Error3;
      end;
      Mistake(Result);
    end;
    exit;
  end;
  //?????? ?? ?????????????
  if (Count=18) then
  if (ReceiveCommand[4]=$47) and (ReceiveCommand[5]=$4f) then
  begin
    n1:=ReceiveCommand[7] and $7F;
    n2:=ReceiveCommand[8] and $7F;
    n3:=(ReceiveCommand[9] and $7F)+2000;
    try fDateOfCreate:=EncodeDate(n3,n2,n1)
    except fDateOfCreate:=Date;  end;
    fCodeOfDevice:=ReceiveCommand[10] and $7F;
    fPO:=ReceiveCommand[11]-$80;
    n1:=ReceiveCommand[12] and $7F;
    n2:=ReceiveCommand[13] and $7F;
    n3:=ReceiveCommand[14] and $7F;
    fNumber:=n1 shl 14 + n2 shl 7 + n3;
    CheckNumber;
    NeedToInitialize:=false;
    exit;
  end;
    //?????? ??????? ?????? ??????
  if (Count=11) then
  if (ReceiveCommand[4]=$5A) and (ReceiveCommand[5]=$59) then
  begin
    NeedToMatrixWr:=ReceiveCommand[7]=$AA;
    if NeedToMatrixWr then FMEssageToForm(fActive,RefreshFail)
    else FMEssageToForm(fActive,RefreshSuccess);
    exit;
  end;
  if (Count<>41) then
  begin
    Mistake(Result);
    exit;
  end;
  FMEssageToForm(fActive,Success);
  QueryPerformanceCounter(fStart);
  for i:=0 to 13 do
  begin
    EM7210[i+(numb-1)*14].WriteDataExh(ReceiveCommand[i*2+8]);
  end;
  wr:=0;
  for j:=0 to 1 do
  for i:=1 to 7 do
  begin
    if wr>13 then break;
    //olikke
    EM7210[wr+(numb-1)*14].VideoExh:=(ReceiveCommand[35+j] and ($01 shl (7-i)) = $01 shl (7-i));
    INC(wr);
  end;
  if ReceiveCommand[37]=$80 then f7302Err:=0
  else
  if f7302Err<4 then INC(f7302Err);
end;

constructor TEM7212.Create(ev:TEvent;n:byte);
var i:integer;
begin
  inherited Create(true);
  fDateOfCreate:=Date;
  event:=ev;
  numb:=n;
  INIT;
  fStart    :=0;
  fStop     :=0;
  fHandle   :=0;
  fComErr[1]:=3;
  fComErr[2]:=3;
  f7302Err  :=3;
  fState    :=dsGray;
  fColor    :=_Gray;
  for i:=0 to 13 do
    EM7210[i+(n-1)*13+n-1]:=TEM7210.Create(i,n);
  NeedToInitialize:=true;
  resume;
end;

procedure TEM7212.NoDataFromKUMO;
var VC:T255;
begin
  VC[0]:=$01;
  VC[1]:=$4F;
  VC[2]:=$30;
  VC[3]:=$57;
  VC[4]:=$58;
  VC[5]:=$09;
  VC[6]:=$40;
  CheckSumCalculation(VC,7);
  VC[9]:=$04;
  SendData(VC,10);
end;

procedure TEM7212.ANALIZ(TB: T13);
var i:integer;
   VC:T255;
begin
  VC[0]:=$01;
  VC[1]:=$4F;
  VC[2]:=$30;
  VC[3]:=$57;
  VC[4]:=$58;
  VC[5]:=$09;
  for i:=0 to 13 do
  begin
    if EM7210[i].Use then VC[6+i]:=$80+TB[i]+1
                     else VC[6+i]:=$80;
    EM7210[i].Source:=TB[i]+1;
  end;
  CheckSumCalculation(VC,20);
  VC[22]:=$04;
  SendData(VC,23);
end;

procedure TEM7212.WhoAreU;
var    VC:T255;
begin
  VC[0] :=$01;
  VC[1] :=$4E;
  VC[2] :=$30;
  VC[3] :=$4F;
  VC[4] :=$47;
  VC[5] :=$09;
  VC[6] :=$ee;
  VC[7] :=$46;
  VC[8] :=$35;
  VC[9] :=$04;
  SendData(VC,10);
end;

procedure TEM7212.SendMatrix;
var    VC:T255;
       k:Trec;
       i:integer;
begin
  case numb of
    1: k :=n7212.first;
    2: k :=n7212.second;
  end;
  VC[0] :=$01;
  VC[1] :=$4E;
  VC[2] :=$30;
  VC[3] :=$59;
  VC[4] :=$5A;
  VC[5] :=$09;
  VC[6] :=k.TestEntry+$80;
  for i:=0 to 15 do
    VC[7+i]:=k.EmptyEntry[i];
  CheckSumCalculation(VC,23);
  VC[25] :=$04;
  SendData(VC,26);
end;

procedure TEM7212.Execute;
var TB:T13;
    i :integer;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(Event.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      if fCom[1]<>nil  then fCom[1].Connected:=false;
      if fCom[2]<>nil  then fCom[2].Connected:=false;
      for i:=0 to 13 do
      begin
        EM7210[i].Free;
        EM7210[i]:=nil;
      end;
      exit;
    end;
    if NeedToInitialize then
    begin
      FMEssageToForm(fActive,NeedToInit);
      NeedToMatrixWr:=false ;
      WhoAreU;
    end;
    if NeedToMatrixWr then
    begin
      fTimeOut  :=400;
      FMEssageToForm(fActive,NeedToRefresh);
      SendMatrix;
      fTimeOut  :=100;
    end;
    if (not NeedToInitialize) and (not NeedToMatrixWr) then
    if fEM7302<>nil then
    if fEM7302.DataExh  and ReadTableFromKumo[numb] then
    begin
      TB:=fEM7302.PacketFor7212(FEM7302State);
      ANALIZ(TB);
    end else
    begin
      fEM7302.PacketFor7212(false);
      NoDataFromKUMO;
    end else NoDataFromKUMO;
    AnalizState;
  end;
end;

end.
