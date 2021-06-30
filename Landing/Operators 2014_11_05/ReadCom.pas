unit ReadCom;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, Global, ComPortR;

type
  TReadCPort = class(TThread)
  private
    procedure SetName;
  protected
    procedure Execute; override;
    procedure RReadPacket(const p:Pointer;const Count:Integer;
                          const ErrCode:Cardinal;const NComPort:Word);
    procedure LReadPacket(const p:Pointer;const Count:Integer;
                          const ErrCode:Cardinal;const NComPort:Word);
    procedure ComPortCreate(ComType,ComNumber:Word;var ComPort:TComPortR);
  end;

implementation

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
{$ENDIF}

{ TReadCPort }

procedure TReadCPort.SetName;
{$IFDEF MSWINDOWS}
var
  ThreadNameInfo: TThreadNameInfo;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'ReadComPort';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

procedure TReadCPort.RReadPacket(const p:Pointer;const Count:Integer;
                             const ErrCode:Cardinal;const NComPort:Word);
var LRC:byte;
    i,j:integer;
    pb:^word;
    LunWord:int64;
    raw:dword;
    TL:TLu;
    Read:Array [0..18] of word;
    Answer:Array [0..18] of word;
    TR:TRz;
begin
  if p=nil then EXIT;
  if Count<>18 then EXIT;
  INC(ResRes);
  pb:=p;
  for i:=0 to 8 do
    begin
      raw:=pb^;
      Read[i]:=raw;
      INC(pb);
    end;
  LRC:=0;
  for i:=0 to 7 do
    LRC:=LRC+HI(Read[i])+LO(Read[i]);
  LRC:=$FF-LRC+1;
  if LRC<>Read[8] shr 8 then exit;
  FillChar(Answer,SizeOf(Answer),0);
   if (Read[0] and $1800) shr 11 = $00 then  Answer[0]:=2 else
     if (Read[0] and $1800) shr 11 = $02 then Answer[0]:=3 else exit;
   for i:=1 to 4 do Answer[i]:=Read[i];
   LRC:=0;
   for i:=0 to 7 do LRC:=LRC+HI(Answer[i])+LO(Answer[i]);
   Answer[8]:=$FF-LRC+1;
   //Передача ответа
   try
    RezCom.WriteBuffer(@Answer,SizeOf(word)*9);
   except //При ошибке перезапустить порт
   begin
      RezCom.Close;
      RezCom:=nil;
    end;
  end;
   //расшифровка полученного ответа
   Tr[1]:=Read[0];
   Tr[2]:=Read[1];
   Tr[3]:=Read[2];
   Tr[4]:=Read[3];
  //т.к. возможны отрицательные значения преобразования доп кода
   raw:=Read[4];
   if raw>=32768 then Tr[5]:=0-AddCode(raw)
     else Tr[5]:=raw;
   raw:=Read[5];
   if raw>=32768 then Tr[6]:=0-AddCode(raw)
     else Tr[6]:=raw;
   raw:=Read[6];
   if raw>=32768 then Tr[7]:=0-AddCode(raw)
     else Tr[7]:=raw;
   Tr[8]:=Read[7];
   if Host_TP=1 then
   begin
     cs_ArrDevice[45].Enter;
     try TResistor(ArrDevice[45]).Accomp:=(Tr[1] and $200) shr 9;
         TResistor(ArrDevice[45]).NPrlk:=(Tr[1] and $1800) shr 11;
         TResistor(ArrDevice[45]).LandPoint:=(Tr[1] and $E000) shr 13;
         TResistor(ArrDevice[45]).NomLa:=Tr[2] and $1FFF;
         TResistor(ArrDevice[45]).Distanse:=Tr[3];
         TResistor(ArrDevice[45]).Corse:=Tr[4]*Rcl/2;
         TResistor(ArrDevice[45]).Altitude:=Tr[5]*Rcl/2;
         TResistor(ArrDevice[45]).SpeedLA:=Tr[6]*Rcs;
         TResistor(ArrDevice[45]).SpeedVr:=Tr[7]*Rcs;
         TResistor(ArrDevice[45]).Glissad:=Tr[8]*Rcl/2;
     finally cs_ArrDevice[45].Leave;  end;
   end;
   if Host_TP=2 then
   begin
     cs_ArrDevice[46].Enter;
     try for i:=1 to 8 do  LeftRz[i]:=TR[i];
     finally cs_ArrDevice[46].Leave; end;
   end;
end;

procedure TReadCPort.LReadPacket(const p:Pointer;const Count:Integer;
                             const ErrCode:Cardinal;const NComPort:Word);
var LRC:byte;
    i,j:integer;
    pb:^byte;
    LunWord:int64;
    raw:byte;
    TL:TLu;
    Read:Array [0..255] of byte;
    Answer:Array [0..255] of byte;
begin
  if p=nil then EXIT;
  if Count<>15 then EXIT;
  INC(LunRes);
  pb:=p;
  for i:=0 to 14 do
    begin
      raw:=pb^;
      Read[i]:=raw;
      INC(pb);
    end;
  if Read[0]<>$01 then exit;
  LRC:=0;
  for i:=0 to 13 do
    LRC:=LRC+Read[i];
  LRC:=$FF-LRC+1;
  if LRC<>Read[14] then exit;
  FillChar(Answer,SizeOf(Answer),0);
  Answer[0]:=Read[0];
  Answer[1]:=Read[1];
  Answer[2]:=$00;
  Answer[3]:=$ff-Answer[1]-Answer[2]-Answer[0]+1;
   //Передача ответа
  try
    LunaCom.WriteBuffer(@Answer,4);
  except //При ошибке перезапустить порт
    begin
      LunaCom.Close;
      LunaCom:=nil;
    end;
  end;
  //расшифровка полученного ответа
  TL[1]:=Read[1];
  LunWord:=Read[3] shl 8 + Read[2];
  //т.к. возможны отрицательные значения преобразования доп кода
  if LunWord>=32768 then TL[2]:=0-AddCode(LunWord)
     else TL[2]:=LunWord;
  LunWord:=Read[5] shl 8 + Read[4];
  if LunWord>=32768 then TL[3]:=0-AddCode(LunWord)
     else TL[3]:=LunWord;
  LunWord:=Read[7] shl 8 + Read[6];
  if LunWord>=32768 then TL[4]:=0-AddCode(LunWord)
     else TL[4]:=LunWord;
  LunWord:=Read[9] shl 8 + Read[8];
  if LunWord>=32768 then TL[5]:=0-AddCode(LunWord)
     else TL[5]:=LunWord;
  LunWord:=Read[11] shl 8 + Read[10];
  if LunWord>=32768 then TL[6]:=0-AddCode(LunWord)
     else TL[6]:=LunWord;
  LunWord:=Read[13] shl 8 + Read[12];
  if LunWord>=32768 then TL[7]:=0-AddCode(LunWord)
     else TL[7]:=LunWord;
  TL[8]:=1;
  if Host_TP=1 then
  begin
     cs_ArrDevice[38].Enter;
     try TLuna(ArrDevice[38]).Work:=TL[1];
         TLuna(ArrDevice[38]).AlphaST:=TL[2]*Rcl;
         TLuna(ArrDevice[38]).AlphaGL:=TL[3]*Rcl;
         TLuna(ArrDevice[38]).ErrorST:=TL[4]*Rcl;
         TLuna(ArrDevice[38]).PsiShip:=TL[5]*Rcl;
         TLuna(ArrDevice[38]).Betta:=TL[6]*Rcl;
         TLuna(ArrDevice[38]).ErrorB:=TL[7]*Rcl;
     finally cs_ArrDevice[38].Leave; end;
  end;
  if Host_TP=2 then
  begin
    cs_ArrDevice[39].Enter;
    try for i:=1 to 7 do  LeftLU[i]:=TL[i];
    finally cs_ArrDevice[39].Leave; end;
  end;
end;

procedure TReadCPort.ComPortCreate(ComType,ComNumber:Word;var ComPort:TComPortR);
begin
    ComPort:=TComPortR.Create(nil);
    ComPort.ComProp.BaudRate:=ComList[ComNumber].cBaudRate;
    ComPort.ComProp.ByteSize:=ComList[ComNumber].cByteSize;
    ComPort.ComProp.EnableDTR:=ComList[ComNumber].cEnableDTR;
    ComPort.ComProp.EnableRTS:=ComList[ComNumber].cEnableRTS;
    ComPort.ComProp.Parity:=ComList[ComNumber].cParity;
    ComPort.ComProp.Stopbits:=ComList[ComNumber].cStopBits;
    case ComType of
      1:  ComPort.OnReadPacket:=RReadPacket;
      2:  ComPort.OnReadPacket:=LReadPacket;
    end;
    ComPort.ComProp.WaitResult:=ComList[ComNumber].cTimeOut;
    ComPort.InBufSize:=1024;
    ComPort.WaitFullBuffer:=False;
    ComPort.ComNumber:=ComList[ComNumber].cCom;
    if not ComPort.Connected then ComPort.Open;
    ComPort.ReadActive:=True;
end;

procedure TReadCPort.Execute;
var i:integer;
begin
  SetName;
  while not terminated do
    begin
      if ResRes > OldRes then
      begin
          OldRes:=ResRes;
          case HOST_TP of
          1: begin cs_ArrDevice[45].Enter; try TResistor(ArrDevice[45]).TimeSt:=1; finally cs_ArrDevice[45].Leave; end;  end;
          2: begin cs_ArrDevice[46].Enter; try LeftRz[9]:=1; finally cs_ArrDevice[46].Leave; end;  end
          end;
      end else
      begin
          case HOST_TP of
          1: begin cs_ArrDevice[45].Enter; try TResistor(ArrDevice[45]).TimeSt:=0; finally cs_ArrDevice[45].Leave; end;  end;
          2: begin cs_ArrDevice[46].Enter; try LeftRz[9]:=0; finally cs_ArrDevice[46].Leave; end;  end
          end;
          if RezCom<>nil then begin RezCom.Close;RezCom:=nil;end;
      end;
      if LunRes > OldLun then
      begin
          OldLun:=LunRes;
          case HOST_TP of
          1: begin cs_ArrDevice[38].Enter; try  TLuna(ArrDevice[38]).TimeSt:=1; finally cs_ArrDevice[38].Leave; end;  end;
          2: begin cs_ArrDevice[39].Enter; try LeftLU[8]:=1; finally cs_ArrDevice[39].Leave; end;  end
          end;
      end  else
      begin
          case HOST_TP of
          1: begin cs_ArrDevice[38].Enter; try  TLuna(ArrDevice[38]).TimeSt:=0; finally cs_ArrDevice[38].Leave; end;  end;
          2: begin cs_ArrDevice[39].Enter; try LeftLU[8]:=0; finally cs_ArrDevice[39].Leave; end;  end
          end;
          if LunaCom<>nil then begin LunaCom.Close;LunaCom:=nil;end;
      end; 
      Sleep(1000);
      if ResRes > 4294967294 then begin ResRes:=0;OldRes:=0;end;
      if LunRes > 4294967294 then begin LunRes:=0;OldLun:=0;end;
      if (ExternalDevice.PRLK<>0) then
      if RezCom=nil then
        begin
          ResRes:=0;
          OldRes:=0;
          if HOST_TP=1 then i:=ComDev[45].cCom_ID;
          if HOST_TP=2 then i:=ComDev[46].cCom_ID;
          ComPortCreate(1,i,RezCom);
          Sleep(500);
        end;
      if (ExternalDevice.OLS<>0)then
      if LunaCom=nil then
        begin
          LunRes:=0;
          OldLun:=0;
          if HOST_TP=1 then i:=ComDev[38].cCom_ID;
          if HOST_TP=2 then i:=ComDev[39].cCom_ID;
          ComPortCreate(2,i,LunaCom);
          Sleep(500);
        end;
    end;
  if RezCom<>nil  then RezCom.Connected:=false;
  if LunaCom<>nil then LunaCom.Connected:=false;
end;

end.
