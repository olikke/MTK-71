unit Manager_EM2437;

interface

uses Global,Container_EM2437,BDRecord,SysUtils,Windows,Dialogs;

type
  TmEM2437 = class
    fPresence :array [1..4] of boolean;
    fLostCount:array [1..4] of byte;
    procedure   fSimpleCommand(Command:T2437_Command;
                               AddValue1:boolean;Value1:byte;
                               AddValue2:boolean;Value2:byte;
                               InternalID:byte);
  public
    procedure   NewPacket(Com2437: T2437_Command; ReceiveCommand: T25;InternalID:byte);
    procedure   Analiz(InternalID,Status:byte);
    procedure   EndOfInternalLine(d1,d2,d3,d4:boolean);
    procedure   MessageToForm(InternalID:byte;Com2437:T2437_Command;Result:TResult);
    procedure   ExternalCommand(Command:T2437_Command;
                               AddValue1:boolean;Value1:byte;
                               AddValue2:boolean;Value2:byte;
                               InternalID:byte);
    constructor Create;
    destructor  Destroy;
  end;

var
  mEM2437:TmEM2437;

implementation

procedure TmEM2437.ExternalCommand(Command: T2437_Command;
                                   AddValue1: Boolean; Value1: Byte;
                                   AddValue2: Boolean; Value2: Byte; InternalID: Byte);
begin
  fSimpleCommand(Command,AddValue1,Value1,AddValue2,Value2,InternalID);
end;

procedure TmEM2437.NewPacket(Com2437: T2437_Command; ReceiveCommand: T25; InternalID: Byte);
var Day,Month,Year:Word;
    UDate         :TDateTime;
begin
  if not InternalID in [1..4] then exit;
  case INTEGER(Com2437) of
    INTEGER(StatusOfDevice)   :    ;
    INTEGER(StatusOfVideo)    :    EM2437[InternalID].pStatusOfVideo:=ReceiveCommand[3];
    INTEGER(StatusOfFeed)     :    EM2437[InternalID].pStatusOfFeed :=ReceiveCommand[3];
    INTEGER(RunningTime)      :    ;
    INTEGER(Identification)   :
      begin
        EM2437[InternalID].DeviceTypeCode  :=(ReceiveCommand[5] and $F0) shr 4;
        EM2437[InternalID].HardwareVersion :=ReceiveCommand[5] and $0F;
        EM2437[InternalID].SoftwareVersion :=ReceiveCommand[6];
        EM2437[InternalID].SerialNumber    :=ReceiveCommand[7] shl 16 + ReceiveCommand[8] shl 8 + ReceiveCommand[9];
        Day:=(ReceiveCommand[3] and $F8) shr 3;
        Month:=(ReceiveCommand[3] and $07) shl 1 + (ReceiveCommand[4] and $80) shr 7;
        Year:=ReceiveCommand[4] and $7F +2000;
        try
          UDate:=EncodeDate(Year,Month,Day);
        except
          UDate:=Date;
        end;
        EM2437[InternalID].DeviceMDate:=UDate;
      end;
    INTEGER(CorrectionCh1)    :
      begin
        EM2437[InternalID].GainFactor1  :=ReceiveCommand[3];
        EM2437[InternalID].Equalization1:=ReceiveCommand[4];
        if not EM2437[InternalID].PermissionToChange then
        begin
          if (ReceiveCommand[3]<>bd2437[InternalID][1].GainFactor) or
             (ReceiveCommand[4]<>bd2437[InternalID][1].Equalization) then
          fSimpleCommand(CorrectionCh1 ,true,bd2437[InternalID][1].GainFactor,true,bd2437[InternalID][1].Equalization,InternalID);
        end;
      end;
    INTEGER(CorrectionCh2)    :
      begin
        EM2437[InternalID].GainFactor2  :=ReceiveCommand[3];
        EM2437[InternalID].Equalization2:=ReceiveCommand[4];
        if not EM2437[InternalID].PermissionToChange then
        begin
          if (ReceiveCommand[3]<>bd2437[InternalID][2].GainFactor) or
             (ReceiveCommand[4]<>bd2437[InternalID][2].Equalization) then
          fSimpleCommand(CorrectionCh2 ,true,bd2437[InternalID][2].GainFactor,true,bd2437[InternalID][2].Equalization,InternalID);
        end;
      end;
    INTEGER(CorrectionCh3)    :
      begin
        EM2437[InternalID].GainFactor3  :=ReceiveCommand[3];
        EM2437[InternalID].Equalization3:=ReceiveCommand[4];
        if not EM2437[InternalID].PermissionToChange then
        begin
          if (ReceiveCommand[3]<>bd2437[InternalID][3].GainFactor) or
             (ReceiveCommand[4]<>bd2437[InternalID][3].Equalization) then
          fSimpleCommand(CorrectionCh3 ,true,bd2437[InternalID][3].GainFactor,true,bd2437[InternalID][3].Equalization,InternalID);
        end;
      end;
    INTEGER(CorrectionCh4)    :
      begin
        EM2437[InternalID].GainFactor4  :=ReceiveCommand[3];
        EM2437[InternalID].Equalization4:=ReceiveCommand[4];
        if not EM2437[InternalID].PermissionToChange then
        begin
          if (ReceiveCommand[3]<>bd2437[InternalID][4].GainFactor) or
             (ReceiveCommand[4]<>bd2437[InternalID][4].Equalization) then
          fSimpleCommand(CorrectionCh4 ,true,bd2437[InternalID][4].GainFactor,true,bd2437[InternalID][4].Equalization,InternalID);
        end;
      end;
    INTEGER(StatusOfFeed11)   :    ;
    INTEGER(StatusOfFeed12)   :    ;
    INTEGER(StatusOfFeed21)   :    ;
    INTEGER(StatusOfFeed22)   :    ;
    INTEGER(ThresholdOfFeed11):    ;
    INTEGER(ThresholdOfFeed12):    ;
    INTEGER(ThresholdOfFeed21):    ;
    INTEGER(ThresholdOfFeed22):    ;
    INTEGER(MaskOfVideo)      :    ;
  end;
end;

procedure TmEM2437.MessageToForm(InternalID: Byte; Com2437: T2437_Command; Result: TResult);
begin
  if not InternalID in [1..4] then exit;
  if EM2437[InternalID].FormHandle<>0  then
  PostMessage(EM2437[InternalID].FormHandle,WM_NOTIFY_2437,INTEGER(Com2437),INTEGER(Result));
end;

procedure TmEM2437.EndOfInternalLine(d1: Boolean; d2: Boolean; d3: Boolean; d4: Boolean);
var i:integer;
begin
  fPresence[1]:=d1;
  fPresence[2]:=d2;
  fPresence[3]:=d3;
  fPresence[4]:=d4;
  for i:=1 to 4 do
  if not fPresence[i] then
  begin
    MessageToForm(i,StatusOfDevice,NoReply);
    if fLostCount[i]<3 then INC(fLostCount[i])
                    else EM2437[i].DataExh:=false
  end else
  begin
    fLostCount[i]:=0;
    EM2437[i].DataExh:=true;
  end;
end;

procedure TmEM2437.fSimpleCommand(Command:T2437_Command;AddValue1:boolean;Value1:byte;AddValue2:boolean;Value2:byte;InternalID:byte);
var Comm:T5401Question;
begin
  if not InternalID in [1..4] then exit;
  new(Comm);
  Comm^.Comm2437:=Command;
  Comm^.DevType :=dtEM2437;
  Comm^.DevNumb :=InternalID;
  if AddValue1 then
    if AddValue2 then Comm^.length:=6
                 else Comm^.length:=5
               else Comm^.length:=4;
  Comm^.MASS[0] :=EM2437Addr+InternalID;
  Comm^.MASS[1] :=Comm^.length-2;
  Comm^.MASS[2] :=Command2437[Command];
  case Comm^.length of
    4: Comm^.MASS[3]:=Comm^.MASS[0]+Comm^.MASS[1]+Comm^.MASS[2];
    5: begin
         Comm^.MASS[3]:=Value1;
         Comm^.MASS[4]:=Comm^.MASS[0]+Comm^.MASS[1]+Comm^.MASS[2]+Comm^.MASS[3];
       end;
    6: begin
         Comm^.MASS[3]:=Value1;
         Comm^.MASS[4]:=Value2;
         Comm^.MASS[5]:=Comm^.MASS[0]+Comm^.MASS[1]+Comm^.MASS[2]+Comm^.MASS[3]+Comm^.MASS[4];
       end;
  end;
  cs_QuestionList.Enter;
  try
    QuestionList.Add(Comm);
  finally
    cs_QuestionList.Leave;
  end;

end;

procedure TmEM2437.Analiz(InternalID,Status: Byte);
begin
  if not InternalID in [1..4] then exit;
  if fPresence[InternalID] then
  begin
    if (Status and $40 = $40)then
    begin
      fSimpleCommand(StatusOfVideo,false,0,false,0,InternalID);
    end
  end else
  begin
    fSimpleCommand(Identification,false,0,false,0,InternalID);
    fSimpleCommand(MaskOfVideo   ,true,EM2437[InternalID].Mask,false,0,InternalID);
    fSimpleCommand(CorrectionCh1 ,false,0,false,0,InternalID);
    fSimpleCommand(CorrectionCh2 ,false,0,false,0,InternalID);
    fSimpleCommand(CorrectionCh3 ,false,0,false,0,InternalID);
    fSimpleCommand(CorrectionCh4 ,false,0,false,0,InternalID);
    fSimpleCommand(StatusOfVideo,false,0,false,0,InternalID);
  end;
  MessageToForm(InternalID,StatusOfDevice,Success);                              
end;

constructor TmEM2437.Create;
var i:integer;
begin
  inherited;
  for i:=1 to 4 do fPresence[i] :=false;
  for i:=1 to 4 do fLostCount[i]:=3;
  for i:=1 to 4 do EM2437[i]:=TEM2437.Create(i);
end;

destructor TmEM2437.Destroy;
var i:integer;
begin
  for i:=1 to 4 do begin EM2437[i].Free; EM2437[i]:=nil; end;
  inherited;
end;

end.
