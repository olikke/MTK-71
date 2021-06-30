unit Protocol;
interface
USES Types,Windows,Dialogs,SysUtils,Classes;

type TMAS=Array[0..29]of Word;

type
tbc  = record wResult,wAW1,wAW2:word;end;
tbcx = record wBase,wResultX:word;end;
trt  = record wStatus,wCmd:word;end;
tmt  = record wBase,wResultX:word;end;
tmrt = record wStatus:word;end;
TTmkEventData = record
  nInt:Integer;
  wMode:word;
  bc:tbc;
  bcx:tbcx;
  rt:trt;
  mt:tmt;
  mrt:tmrt;
end;

CONST VTMK_GetVersion=86;
      VTMK_tmkselect=5;
      VTMK_tmkdefevent=11;
      VTMK_bcreset=13;
      VTMK_bcdefbus=27;
      VTMK_bcdefbase=20;
      VTMK_tmkconfig=2;
      VTMK_bcputw=22;
      VTMK_bcstart=29;
      VTMK_tmkgetevd=12;
      VTMK_bcputblk=25;
      VTMK_bcgetw=23;
      VTMK_bcgetblk=26;
      VTMK_tmkdone=3;

      METHOD_BUFFERED = 0;
      METHOD_IN_DIRECT=1;
      METHOD_OUT_DIRECT=2;
      METHOD_NEITHER=3;
      FILE_ANY_ACCESS=0;
      FILE_READ_ACCESS=$0001;  // file & pipe
      FILE_WRITE_ACCESS=$0002; // file & pipe
      TMK_KRNLDRVR=$8000;
      CI_MASK=$03E0;
      CMD_RESET=$408;
      CTRL_C_BRCST=$0B;
      DATA_BC_RT_BRCST=$08;
      CTRL_CD_BRCST=$0C;
      RT_RECEIVE=$0000;
      NWORDS_MASK=$001F;
      BC_MODE=$00;
      RT_MODE=$80;
      MT_MODE=$100;
      CMD_SYNC_DATA=$011;
      CMD_GET_VECTOR=$410;
      CTRL_C_AD=$05;
      S_IB_MASK=$04;
      ADDRESS_MASK=$F800;
      SREQ_MASK=$0100;
      DATA_RT_BC=$01;
      RT_TRANSMIT=$0400;
      DATA_RT_RT_BRCST=$0A;
      DATA_RT_RT=$02;
      CTRL_CD_A=$04;
      CTRL_C_A=$03;

//Коды операций
var IOCTL_TMK_tmkgetmode,
    IOCTL_TMK_tmkselect,
    IOCTL_TMK_bcputw,
    IOCTL_TMK_bcputblk,
    IOCTL_TMK_bcstart,
    IOCTL_TMK_GetVersion,
    IOCTL_TMK_tmkdefevent,
    IOCTL_TMK_bcreset,
    IOCTL_TMK_bcdefbase,
    IOCTL_TMK_tmkconfig,
    IOCTL_TMK_tmkgetevd,
    IOCTL_TMK_bcgetw,
    IOCTL_TMK_bcgetblk,
    IOCTL_TMK_tmkdone,
    IOCTL_TMK_bcdefbus:DWord;

var PortList : TList;  //Список FHandl портов для работы
var hEvent : THandle; {дескриптор порта}
//    hEvent:Array[1..2] of THandle; {дескриптор порта}
    KC,ZM,CC:Array[1..3] of DWord;
    MAS,MAS1,MAS2,MAS3:TMAS;
    sa4Event:SECURITY_ATTRIBUTES;
    TmkEvD:TTmkEventData;
    KC1:Word = $FBF1; //Синхронизация
    CD1:Word = $0000; //Синхронизация
    KC2:Word = $1FE2;//$07F2; //Передать ответное слово

    wPrevSReq:TMAS;


function  bcputblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word):Integer;
procedure tmkdefevent(FHandl,hEvent:THandle;fEventSet:Boolean);
function  bcputw(FHandl:THandle;bcAddr,bcData:Word):Integer;
function  IntToBin(Value:Word;Digits:integer): string;
function  BinToInt(Value:string):Integer;
function  CheckSUM(p:Pointer;Start,Count:Word):Word;
function  CTL_CODE(DeviceType,mFunction,Method,Access:DWord):Dword;
function  tmkgetmode(FHandl:THandle):Integer;
function  bcdefbase(FHandl:THandle;bcBasePC:Word):Integer;
function  bcstart(FHandl:THandle;bcBase,bcCtrlCode:Word):Integer;
function  BcEventTest(FHandl,hEvent:THandle):Integer;
function  bcreset(FHandl:THandle):Integer;
function  bcdefbus(FHandl:THandle; bcBus:Word):Integer;
function  iRazr(w1,w2,pr:Word):Word;
procedure tmkgetevd(FHandl,hEvent:THandle;var pEvD:TTmkEventData);
function  bcgetw(FHandl:THandle;bcAddr:Word):Integer;
procedure bcgetblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word);
procedure CSum(DW:DWord;var c1,c2:Word);
procedure ByWordCS(IW:Integer;var W1,W2:DWord);
procedure ByWordCD(IW:DWord;var W1,W2:DWord);
function  tmkdone(FHandl:THandle;tmkNumber:Word):Integer;

implementation

USES UNIT1;

function tmkdone(FHandl:THandle;tmkNumber:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0]:=tmkNumber;
  DeviceIoControl(FHandl,IOCTL_TMK_tmkdone,@awVTMK4InBuf,2,
                                           @awVTMK4OutBuf,0,
                                           cbVTMK4Ret,NIL);
  Result:=GetLastError;
end;

procedure CSum(DW:DWord;var c1,c2:Word);
var i,w1,w2:Word;
    DW1,DW2:DWord;
begin
  W1:=DW SHR 16;       //ST
  W2:=DW-(W1 SHL 16);  //ML
  DW1:=W1 SHL 15;
  DW2:=W2 SHL 15;
  c1:=LOWORD(DW1) SHR 15;
  c2:=LOWORD(DW2) SHR 15;
  for i:=2 to 16 do
    begin
      DW1:=DW1 SHR 1;
      DW2:=DW2 SHR 1;
      c1:=c1+LOWORD(DW1)SHR 15;
      c2:=c2+LOWORD(DW2)SHR 15;
    end;
  c1:=((c1 mod 2)+1)mod 2;
  c2:=((c2 mod 2)+1)mod 2;
end;

procedure ByWordCS(IW:Integer;var W1,W2:DWord);
var DW:DWord;
    pIW:Pointer;
    pDW:^DWord;
begin
  pIW:=@IW;
  pDW:=piw;
  DW:=pDW^;  //Преобразовать integer во DWORD!!!
  W1:=DW SHR 16;       //ST
  W2:=DW-(W1 SHL 16);  //ML
end;

procedure ByWordCD(IW:DWord;var W1,W2:DWord);
var DW:DWord;
    pIW:Pointer;
    pDW:^DWord;
begin
  pIW:=@IW;
  pDW:=piw;
  DW:=pDW^;  //Преобразовать integer во WORD!!!
  W1:=DW SHR 16;       //ST
  W2:=DW-(W1 SHL 16);  //ML
end;


procedure bcgetblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word);
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := bcAddr;
  awVTMK4InBuf[1] := LOWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[2] := HIWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[3] := cwLength;
  DeviceIoControl(FHandl,IOCTL_TMK_bcgetblk,@awVTMK4InBuf,8,
                                            @awVTMK4OutBuf,0,
                                            cbVTMK4Ret,NIL);
end;

function bcgetw(FHandl:THandle;bcAddr:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0]:=bcAddr;
  DeviceIoControl(FHandl,IOCTL_TMK_bcgetw,@awVTMK4InBuf,2,
                                          @awVTMK4OutBuf,0,
                                          cbVTMK4Ret,NIL);
  Result:=awVTMK4OutBuf[0];
end;

function bcdefbase(FHandl:THandle;bcBasePC:Word):Integer;
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..3]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0]:=bcBasePC;
  DeviceIoControl(FHandl,IOCTL_TMK_bcdefbase,@awVTMK4InBuf,2,
                                             @awVTMK4OutBuf,0,
                                             cbVTMK4Ret,NIL);
  Result:=GetLastError;
end;

function bcreset(FHandl:THandle):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  DeviceIoControl(FHandl,IOCTL_TMK_bcreset,
   @awVTMK4InBuf,0,@awVTMK4OutBuf,0,cbVTMK4Ret,NIL);
  result:=GetLastError;
end;

function bcdefbus(FHandl:THandle; bcBus:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := bcBus;
  DeviceIoControl(FHandl,IOCTL_TMK_bcdefbus,
  @awVTMK4InBuf,2,@awVTMK4OutBuf,0,cbVTMK4Ret,NiL);
  result:=GetLastError;
end;

function IntToBin(Value:word;Digits:integer): string;
var i: integer;
begin
  result := '';
  for i := 0 to Digits - 1 do
    if Value and (1 shl i) > 0 then result := '1' + result
                               else result := '0' + result;
end;

function BinToInt(Value:string):Integer;
var i, iValueSize: Integer;
begin
  Result := 0;
  iValueSize := Length(Value);
  for i := iValueSize downto 1 do
     if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
 end;

function iRazr(w1,w2,pr:Word):Word;
var i:Word;
    s1,s2,s3:String[16];
begin
  s1:=IntToBin(w1,16);
  s2:=IntToBin(w2,16);
  s3:='0000000000000000';
  if pr=1 then for i:=1 to 16 do if(s2[i]='0')then s2[i]:='1'else s2[i]:='0';
  for i:=1 to 16 do if(s1[i]<>'0')AND(s2[i]<>'1')then s3[i]:='1'else s3[i]:='0';
  RESULT:=BinToInt(s3);
end;

{Вычисление контрольной суммы}
function  CheckSUM(p:Pointer;Start,Count:Word):Word;
var i:Word;
    pb:^Word;
begin
 {$R-}
 pb:=p;
 Result:=0;
 INC(pb,Start);
 For i:=Start to Count-1 do
   begin
     Result:=Result+pb^;
     INC(pb);
   end;
 {$R+}
end;

function CTL_CODE(DeviceType,mFunction,Method,Access:DWord):Dword;
begin
  DeviceType:=DeviceType shl 16;
  Access:=Access shl 14;
  mFunction:=mFunction+$800;
  mFunction:=mFunction shl 2;
  Result:=DeviceType+Access+mFunction+Method;
end;

function tmkgetmode(FHandl:THandle):Integer;
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..3]of Word;
    cbVTMK4Ret:DWord;
begin
  if not DeviceIoControl(FHandl,IOCTL_TMK_tmkgetmode,@awVTMK4InBuf,0,
                                              @awVTMK4OutBuf,2,
                                              cbVTMK4Ret,NIL)
               then ShowMessage('NOT');
  Result:=awVTMK4OutBuf[0];
end;

function bcstart(FHandl:THandle;bcBase,bcCtrlCode:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := bcBase;
  awVTMK4InBuf[1] := bcCtrlCode;
  DeviceIoControl(FHandl,IOCTL_TMK_bcstart,@awVTMK4InBuf,4,
                                           @awVTMK4OutBuf,0,
                                           cbVTMK4Ret,NIL);
  Result:=GetLastError;
end;

function bcputw(FHandl:THandle;bcAddr,bcData:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := bcAddr;
  awVTMK4InBuf[1] := bcData;
  DeviceIoControl(FHandl,IOCTL_TMK_bcputw,@awVTMK4InBuf,4,
                                          @awVTMK4OutBuf,0,
                                          cbVTMK4Ret,NIL);
  Result:=GetLastError;
end;

function bcputblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word):Integer;
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..3]of Word;
    cbVTMK4Ret,aMAS:DWord;
begin
  aMAS:=INTEGER(pcBuffer);
  awVTMK4InBuf[0] := bcAddr;
  awVTMK4InBuf[1] := LOWORD(aMAS);
  awVTMK4InBuf[2] := HIWORD(aMAS);
  awVTMK4InBuf[3] := cwLength;
  DeviceIoControl(FHandl,IOCTL_TMK_bcputblk,@awVTMK4InBuf,8,
                                            @awVTMK4OutBuf,0,
                                            cbVTMK4Ret,NIL);
  Result:=GetLastError;
end;

procedure tmkgetevd(FHandl,hEvent:THandle;var pEvD:TTmkEventData);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..6]of Word;
    cbVTMK4Ret:DWord;
begin
  if not DeviceIoControl(FHandl,IOCTL_TMK_tmkgetevd,@awVTMK4InBuf,0,
                                             @awVTMK4OutBuf,12,
                                             cbVTMK4Ret,NIL)
  then ShowMessage(IntToStr(GetLastError));

  pEvD.nInt  := awVTMK4OutBuf[0];
  pEvD.wMode := awVTMK4OutBuf[2];
//  ShowMessage(IntToStr(TmkEvD.nInt));
  case pEvD.wMode of
    BC_MODE:
      begin
        case pEvD.nInt of
          1: begin
               pEvD.bc.wResult:=awVTMK4OutBuf[3];
             end;
          2: begin
               pEvD.bc.wResult:=awVTMK4OutBuf[3];
               pEvD.bc.wAW1   :=awVTMK4OutBuf[4];
               pEvD.bc.wAW2   :=awVTMK4OutBuf[5];
             end;
          3: begin
               pEvD.bcx.wResultX:= awVTMK4OutBuf[3];
               pEvD.bcx.wBase   := awVTMK4OutBuf[4];
             end;
          4: begin
               TmkEvD.bcx.wBase := awVTMK4OutBuf[3];
             end;
        end;
      end;
    MT_MODE:
      begin
        case pEvD.nInt of
          3: begin
               pEvD.mt.wResultX := awVTMK4OutBuf[3];
               pEvD.mt.wBase    := awVTMK4OutBuf[4];
             end;
          4: begin
               TmkEvD.mt.wBase := awVTMK4OutBuf[3];
             end;
        end;
      end;
    RT_MODE:
      begin
        case pEvD.nInt of
          1: begin
               pEvD.rt.wCmd := awVTMK4OutBuf[3];
             end;
        2,3: begin
               pEvD.rt.wStatus := awVTMK4OutBuf[3];
             end;
        end;
      end;
  end;
end;

function BcEventTest(FHandl,hEvent:THandle):Integer;
var msgCmd:Word;
begin
  msgCmd:=$F800+CI_MASK+CMD_RESET;
  if bcputw(FHandl,0,msgCmd)<>0 then
    begin ShowMessage('NO bcputw!');result:=1;EXIT;end;
  if bcstart(FHandl,0,CTRL_C_BRCST)<>0 then
    begin ShowMessage('NO bcstart!');result:=1;EXIT;end;
  if WaitForSingleObject(hEvent,200)=WAIT_OBJECT_0 then
      begin
        ResetEvent(hEvent);
        tmkgetevd(FHandl,hEvent,tmkEvD);
        result := 0;
      end
    else result := 1;
end;

procedure tmkdefevent(FHandl,hEvent:THandle;fEventSet:Boolean);
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret,hVxDEvent,hEventSet:DWord;
begin
  hVxDEvent:=hEvent;
  if fEventSet then hEventSet:=1 else hEventSet:=0;
  awVTMK4InBuf[0] := LOWORD(hVxDEvent);
  awVTMK4InBuf[1] := HIWORD(hVxDEvent);
  awVTMK4InBuf[2] := LOWORD(hEventSet);
  awVTMK4InBuf[3] := HIWORD(hEventSet);
  if not DeviceIoControl(FHandl,IOCTL_TMK_tmkdefevent,@awVTMK4InBuf,8,
                                               @awVTMK4OutBuf,0,
                                               cbVTMK4Ret,NIL)
               then ShowMessage('NOT tmkdefevent');
end;

end.
