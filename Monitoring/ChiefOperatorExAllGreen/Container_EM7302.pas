unit Container_EM7302;

interface

uses Global,Graphics,Windows,Graph,MyPanel;

type
  TName = array [0..7] of byte;

  TEM7302 = class
  private
    fSystemName : string;
    fSoftware   : string;
    fStop       : int64;
    fStart      : int64;
    fip         : string;
    fmask       : string;
    fMAC        : string;
    fimage      : THandle;
    LastNumber  : integer;
    LastCommand : TKUMO_Command;
    fComState   : boolean;
    fWSCSource  : byte;
    fVRDSource  : byte;
    fVRDHandle  : THandle;
    fUpdateVRDForm:boolean;
    fNumb       :integer;
    SourceTable :array [0..15] of TName;
    DestinTable :array [0..15] of TName;
    SourceLength:T15;
    DestinLength:T15;
    Commutation :T15;
    OldComm     :T15;
    tempComm    :T15;
    fGr         :TGraph;
    function    fColor:TColor;
    function    fState:TState;
    function    FDataExh :boolean;
    procedure   FMEssageToForm(Command:TKUMO_Command;Result:TResult);
    procedure   FMACWrite(MAC:string);
    procedure   Decoding (Dest,Sour:TName);
    procedure   ANALIZWSC;
    procedure   ANALIZVRD;
    procedure   ANALIZRepaint;
  public
    property    SystemName:string   read  fSystemName;
    property    Software  :string   read  fSoftware;
    property    IP        :string   read  fip;
    property    Mask      :string   read  fmask;
    property    FormHandle:THandle  write fimage;
    property    MAC       :string   read  fMAC  write fMACWrite;
    property    State     :TState   read  fState;
    property    Color     :TColor   read  fColor;
    procedure   VRDHandle(newHandle:THandle);
    procedure   FirstVRDMessage;
    function    DataExh   :boolean;
    function    ComState  :boolean;
    function    PacketAnaliz(count:integer;pm:pmm;Comm:TKUMO_Command):boolean;
    procedure   Err(count:integer;pn:pnn;reason:TResult);
    function    GetSourceName(i:integer):string;
    function    GetDestinName(i:integer):string;
    function    SourceNumber(DestNumber:integer):byte;
    function    PacketFor7212(ComState:boolean):T13;
    function    TableOfCommutation:T25;
    constructor Create(ipa:string;Gr:TGraph;numb:integer);
  end;

var   EM7302:array [1..2] of TEM7302;

implementation

uses Main;

function TEM7302.ComState:boolean;
begin
  result:=fComState;
end;

procedure TEM7302.FirstVRDMessage;
begin
  fVRDSource:=17;
end;

procedure TEM7302.VRDHandle(newHandle:THandle);
begin
  fVRDHandle:=newHandle;
  if fVRDHandle<>0 then fUpdateVRDForm:=true;
end;

function TEM7302.fColor:TColor;
begin
  if fDataExh then
    if fComState then
       result:=_Green
    else result:=_Yell
  else result:=_Red;
end;

function TEM7302.fState:TState;
begin
  if fDataExh then
    if fComState then
       result:=dsGreen
    else result:=dsYellow
  else result:=dsRed;
end;

function TEM7302.DataExh:boolean;
begin
  result:=fDataExh;
end;

function TEM7302.PacketFor7212(ComState:boolean):T13;
var i:integer;
begin
 // if ComState then
  for i:=0 to 13 do
  result[i]:=Commutation[i];
  fComState:=ComState;
end;

function TEM7302.TableOfCommutation:T25;
var i:integer;
begin
  for i:=0 to 15 do
  result[i]:=Commutation[i];
end;

function TEM7302.SourceNumber(DestNumber: Integer):byte;
begin
  if DestNumber in [0..15] then
  begin
    result:=Commutation[DestNumber];
  end else result:=16;
end;

function TEM7302.GetSourceName(i: Integer):string;
var j:integer;
begin
  result:='';
  for j:=0 to SourceLength[i]-1 do
  result:=result+chr(SourceTable[i][j]);
end;

function TEM7302.GetDestinName(i: Integer):string;
var j:integer;
begin
  result:='';
  for j:=0 to DestinLength[i]-1 do
  result:=result+chr(DestinTable[i][j]);
end;

procedure TEM7302.FMACWrite(MAC: string);
begin
  fMAC:=MAC;
  FMessageToForm(MA_C,Success);
end;

procedure TEM7302.Err(count:integer;pn:pnn;reason:TResult);
var AnswerB  :T255;
    ComCode  :word;
    Command  :TKUMO_Command;
begin
  AnswerB:=pn^;
  Dispose(pn);
  ComCode:=AnswerB[3] shl 8 + AnswerB[4];
  case ComCode of
    $424B:  //BK
      case AnswerB[6] of
        $49: Command:=BK_I;
        $4E: Command:=BK_N;
        $54: Command:=BK_T;
        $52: Command:=BK_R;
      end;
    $514E:  //QN
            begin
             //StartPacket:=3
            end;
  end;
  FMessageToForm(Command,reason);
end;

procedure TEM7302.FMEssageToForm(Command:TKUMO_Command;Result:TResult);
begin
  if fimage<>0 then
  PostMessage(fimage,WM_NOTIFY_KUMO,Integer(Command),Integer(Result));
end;

constructor TEM7302.Create(ipa:string;Gr:TGraph;numb:integer);
begin
  fComState     :=false;
  fWSCSource    :=17;
  fVRDSource    :=17;
  fStart        :=0;
  fStop         :=0;
  fip           :=ipa;
  fmask         :='255.255.255.0';
  fimage        :=0;
  LastNumber    :=0;
  fUpdateVRDForm:=false;
  LastCommand   :=BK_I;
  fGr           :=Gr;
  fNUmb         :=Numb;
  FillChar(Commutation,$80,SizeOf(Commutation));
  FillChar(OldComm    ,$80,SizeOf(OldComm));
  ReadTableFromKumo[fNumb]:=false;
end;

function TEM7302.PacketAnaliz(count: Integer;pm:pmm;Comm:TKUMO_Command):boolean;
var i:integer;
    n:integer;
    j:integer;
    FlagOfEnd:boolean;
    AnsCode  :word;
    MASS     :TB;
    str      :string;
    fCommand  :TKUMO_Command;
    fResult  :tResult;
    DestTemp :TName;
    SourTemp :TName;
begin
  result:=false;
  MASS:=pm^;
  Dispose(pm);
  if (MASS[0]<>$01) or (MASS[1]<>$4e) then exit;
  QueryPerformanceCounter(fStart);
  AnsCode:=MASS[3] shl 8 + MASS[4];

   case Comm of
    BK_I:
          if (AnsCode=$4B42) and (MASS[6]=$49) then
          begin
            result:=true;
            fCommand:=Comm;
            fResult:=Success;
          end;
    BK_N:
         if (AnsCode=$4B42) and (MASS[6]=$4E) then
         begin
            result:=true;
            fCommand:=BK_N;
            fResult:=Success;
            str:='';
            for i:= 8 to count-1 do
              if MASS[i]=$09 then break else
              str:=str+chr(MASS[i]);
            fSystemName:=str;
         end;
    BK_T,
    BK_R:
        if (AnsCode=$4B42) and ((MASS[6]=$54) or (MASS[6]=$52))then
        begin
            result:=true;
            fCommand:=Comm;
            fResult:=Success;
            str:='';
            for i:= 8 to count-1 do
              if MASS[i]=$09 then break else
              str:=str+chr(MASS[i]);
            fSoftware:=str;
        end;
    BK_D:
        if (AnsCode=$4552) and (MASS[6]=$30) and (MASS[7]=$30)
                           and (MASS[9]=$42) and (MASS[10]=$4b) then
        begin
          result:=true;
          fCommand:=Comm;
          fResult:=Success;
        end else
        if AnsCode=$0000 then
        begin
          result:=false;
          fCommand:=Comm;
          fResult:=Processing;
        end;
    QD_N: begin end;
    TI:   if (AnsCode=$4552) and (MASS[6]=$30) and (MASS[7]=$30)
                           and (MASS[9]=$54) and (MASS[10]=$49) then
          begin
            result:=true;
            fCommand:=Comm;
            fResult:=Success;
          end;
    QN_S: if (AnsCode=$4E51) and (MASS[6]=$53) then
          begin
            n:=10;
            fCommand:=Comm;
            fResult :=Processing;
            if LastCommand<>QN_S then LastNumber:=0;
            n:=10;
            for i:=LastNumber to 15 do
            begin
              SourceLength[i]:=0;
              for j:=0 to 7 do
              if MASS[n]<>$09 then
              begin
                //потому что KUMO - кривой!!
                //в таблице коммутации он не выдает название 16 входа!!
                //так что мы делаем его пустым сразу!!
                if i<>15 then SourceTable[i][j]:=MASS[n];
                if i<>15 then INC(SourceLength[i]);
                INC(n);
              end;
              FlagOfEnd:=false;
              j:=0;
              while not FlagOfEnd do
              begin
                if MASS[n]=$09 then INC(j);
                INC(n);
                if j=3 then FlagOfEnd:=true;
              end;
              INC(LastNumber);
              if LastNumber=15 then
              begin
                result:=true;
                fResult:=Success;
              end;
              if MASS[n+2]=$04 then
              begin
                j:=0;
                FlagOfEnd:=false;
                while not FlagOfEnd do
                begin
                  if MASS[n]=$09 then INC(j);
                  INC(n);
                  if j=3 then FlagOfEnd:=true;
                end;
              end;
              if n>=count-3 then break;
            end;
          end;
    QN_D: if (AnsCode=$4E51) and (MASS[6]=$44) then
          begin
            n:=10;
            fCommand:=Comm;
            fResult :=Processing;
            if LastCommand<>QN_D then LastNumber:=0;
            n:=10;
            for i:=LastNumber to 15 do
            begin
              DestinLength[i]:=0;
              for j:=0 to 7 do
              if MASS[n]<>$09 then
              begin
                DestinTable[i][j]:=MASS[n];
                INC(DestinLength[i]);
                INC(n);
              end;
              FlagOfEnd:=false;
              j:=0;
              while not FlagOfEnd do
              begin
                if MASS[n]=$09 then INC(j);
                INC(n);
                if j=3 then FlagOfEnd:=true;
              end;
              INC(LastNumber);
              if LastNumber=15 then
              begin
                result:=true;
                fResult:=Success;
              end;
              if MASS[n+2]=$04 then
              begin
                j:=0;
                FlagOfEnd:=false;
                while not FlagOfEnd do
                begin
                  if MASS[n]=$09 then INC(j);
                  INC(n);
                  if j=3 then FlagOfEnd:=true;
                end;
              end;
              if n>=count-3 then break;
            end;
          end;
    QD_B: if (AnsCode=$4451) then
          begin
            fCommand:=Comm;
            fResult :=Processing;
            if LastCommand<>QD_B then
            begin
              LastNumber:=0;
              FillChar(TempComm,17,SizeOf(TempComm));
            end;
            n:=2;
            for i:=LastNumber to 15 do
            begin
              j:=0;
              INC(n,4);
              while MASS[n]<>$09 do
              begin
                DestTemp[j]:=MASS[n];
                INC(n);
                INC(j);
              end;
              j:=0;
              while j<=3 do
              begin
                if MASS[n]=$09 then INC(j);
                INC(n);
              end;
              j:=0;
              while MASS[n]<>$09 do
              begin
                SourTemp[j]:=MASS[n];
                INC(n);
                INC(j);
              end;
              Decoding(DestTemp,SourTemp);
              if LastNumber=15 then
              begin
                result:=true;
                fResult:=Success;
                for j:=0 to 15 do
                  Commutation[j]:=TempComm[j];
                ReadTableFromKumo[fNumb]:=true;
                ANALIZWSC;
                ANALIZVRD;
                ANALIZRepaint;
              end;
              INC(LastNumber);
              j:=0;
              while j=0 do
              begin
                if MASS[n]=$04 then j:=1 else INC(n);
              end;
              if n>=count-3 then break;
              INC(n,3);
            end;
          end;
  end;
  LastCommand:=fCommand;
  FMessageToForm(fCommand,fResult);
end;

procedure TEM7302.ANALIZRepaint;
var i:integer;
    fl:boolean;
begin
  fl:=false;
  for i:=0 to 15 do
    if OldComm[i]<>Commutation[i] then
    begin
      fl:=true;
      break;
    end;
  if not fl then exit;
  for i:=0 to 15 do
    OldComm[i]:=Commutation[i];
  fGr.Change;
end;

procedure TEM7302.ANALIZWSC;
begin
  if fnumb=1 then
  if Commutation[14]<>fWSCSource then
    if fMain<>nil then
      if fMain.Visible then
      begin
        fWSCSource:=Commutation[14];
        PostMessage(fMain.Handle,WM_NOTIFY_MAIN,0,fWSCSource);
      end;
end;

procedure TEM7302.ANALIZVRD;
begin
  if fnumb=1 then
  if Commutation[15]<>fVRDSource then
  begin
    fVRDSource:=Commutation[15];
    if fVRDHandle<>0 then PostMessage(fVRDHandle,WM_NOTIFY_VRD,0,fVRDSource);
    if fMain<>nil then
      if fMain.Visible then PostMessage(fMain.Handle,WM_NOTIFY_MAIN,2,fVRDSource);
  end;
end;

procedure TEM7302.Decoding(Dest: TName; Sour: TName);
var i,l:integer;
    DN,SN:byte;
    Exactly:byte;
begin
  DN:=255; SN:=255;
  Exactly:=0;
  for i:=0 to 15 do
  begin
    for l:=0 to DestinLength[i]-1 do
    begin
      if Dest[l]=DestinTable[i,l] then INC(Exactly)
                                  else Exactly:=0;
    end;
    if Exactly=DestinLength[i] then
    begin
      DN:=i;
      break;
    end;
  end;
  Exactly:=0;
  for i:=0 to 15 do
  begin
    for l:=0 to SourceLength[i]-1 do
    begin
      if Sour[l]=SourceTable[i,l] then INC(Exactly)
                                  else Exactly:=0;
    end;
    if Exactly=SourceLength[i] then
    begin
      SN:=i;
      break;
    end;
  end;
  if DN in [0..15] then TempComm[DN] :=SN;
end;

function TEM7302.FDataExh:boolean;
begin
  QueryPerformanceCounter(fStop);
  if GlobalFreq<>0 then
  if (fStop-fStart)/GlobalFreq*1000>TimeToUpdate then result:=false
                                                 else result:=true
                                                 else
  QueryPerformanceFrequency(GlobalFreq);
  if not result then ReadTableFromKumo[fnumb]:=false;
end;

end.
