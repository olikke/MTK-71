unit Protocol;
interface
USES Types,Windows,Dialogs,SysUtils,Classes;

type TMAS=Array[0..29]of Word;
     TMSE=Array[0..20]of Extended;
     TMSO=Array[1..3] of TMAS;
     TAMSE=Array[1..3] of TMSE;

TTmkEventData = Array[0..3]of Word;

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
      VTMK_rtreset=35;
      VTMK_rtputcmddata=68;
      VTMK_rtclranswbits=56;
      VTMK_rtdefaddress=47;
      VTMK_rtdefpage=41;
      VTMK_rtdefsubaddr=49;
      VTMK_rtputblk=53;
      VTMK_rtsetanswbits=55;
      VTMK_rtgetcmddata=67;
      VTMK_rtgetblk=54;

      METHOD_BUFFERED = 0;
      METHOD_IN_DIRECT=1;
      METHOD_OUT_DIRECT=2;
      METHOD_NEITHER=3;
      FILE_ANY_ACCESS=0;
      FILE_READ_ACCESS=$0001;
      FILE_WRITE_ACCESS=$0002;
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
      CMD_SYNC=$401;
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
      SREQ=$01;
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
    IOCTL_TMK_rtreset,
    IOCTL_TMK_rtputcmddata,
    IOCTL_TMK_rtclranswbits,
    IOCTL_TMK_rtdefaddress,
    IOCTL_TMK_rtdefpage,
    IOCTL_TMK_rtdefsubaddr,
    IOCTL_TMK_rtputblk,
    IOCTL_TMK_rtsetanswbits,
    IOCTL_TMK_rtgetcmddata,
    IOCTL_TMK_rtgetblk,
    IOCTL_TMK_bcdefbus:DWord;

var PortName:String; //имя порта, для дальнейшей работы
    PortList:TList;  //Список FHandl портов для работы
var FHandl,hEvent: THandle; {дескриптор порта}
    KC,ZM,CC:Array[1..3] of DWord;
    sa4Event:SECURITY_ATTRIBUTES;
    TmkEvD:TTmkEventData;
    nInt:Integer;
    wMode,wStatus,wCmd:word;
    wPrevSReq:TMAS;
var Stop:Boolean;
    sd,SumSend,OSumSend:DWord;
    Errors:Array[1..3] of DWord;
    MSO:TMSO;
    oMSO:TMSO =
       ((0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
        (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
        (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0));
    IntT:Single;

var MSI:Array[1..20] of Boolean;     //array флагов True - слово имеет старший и младший разряды
    MSCML:Array[1..20] of Extended;  //цена деления
    MS1,MS2 : TAMSE;

var wSReq:Word;
    FVisible:Word=0;
    LSleep : Single;

    StopRead:Boolean=False;
    Pause:Word = 10;

procedure INIT;

function  CTL_CODE(DeviceType,mFunction,Method,Access:CARDINAL):CARDINAL;
function  bcputblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word):Integer;
function  bcputw(FHandl:THandle;bcAddr,bcData:Word):Integer;
function  bcdefbase(FHandl:THandle;bcBasePC:Word):Integer;
function  bcstart(FHandl:THandle;bcBase,bcCtrlCode:Word):Integer;
function  BcEventTest(FHandl,hEvent:THandle):Integer;
function  bcreset(FHandl:THandle):Integer;
function  bcdefbus(FHandl:THandle; bcBus:Word):Integer;
function  bcgetw(FHandl:THandle;bcAddr:Word):Integer;
procedure bcgetblk(FHandl:THandle;bcAddr:Word;pcBuffer:Pointer;cwLength:Word);

procedure tmkdefevent(FHandl,hEvent:THandle;fEventSet:Boolean);
function  tmkgetmode:Integer;
procedure tmkgetevd(FHandl,hEvent:THandle;var nInt:Integer;var wMode,wStatus,wCmd:word);
function  tmkdone(FHandl:THandle;tmkNumber:Word):Integer;

function  rtreset(FHandl:THandle):Integer;
function  rtdefbus(FHandl:THandle; bcBus:Word):Integer;

procedure rtputcmddata(FHandl:THandle;rtBusCommand,rtData:DWord);
procedure rtclranswbits(FHandl:THandle;rtClrControl:DWord);
function  rtdefaddress(FHandl:THandle;rtAddress:DWord):Integer;
function  rtdefpage(FHandl:THandle;rtPage:DWord):Integer;
procedure rtdefsubaddr(FHandl:THandle;rtDir,rtSubAddr:DWord);
procedure rtputblk(FHandl:THandle;rtAddr:Word;pcBuffer:Pointer;cwLength:Word);
procedure rtsetanswbits(FHandl:THandle;rtSetControl:DWord);
function  rtgetcmddata(FHandl:THandle;rtBusCommand:DWord):DWord;
function  rtgetblk(FHandl:THandle;rtAddr:DWord;pcBuffer:Pointer;cwLength:DWord):DWord;

implementation

//USES Ladoga;

function CTL_CODE(DeviceType,mFunction,Method,Access:DWord):CARDINAL;
begin
  DeviceType:=DeviceType shl 16;
  Access:=Access shl 14;
  mFunction:=mFunction+$800;
  mFunction:=mFunction shl 2;
  Result:=DeviceType+Access+mFunction+Method;
end;

function rtgetblk(FHandl:THandle;rtAddr:DWord;pcBuffer:Pointer;cwLength:DWord):DWord;
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtAddr;
  awVTMK4InBuf[1] := LOWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[2] := HIWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[3] := cwLength;
  if DeviceIoControl(FHandl,IOCTL_TMK_rtgetblk,@awVTMK4InBuf,8,
                                               @awVTMK4OutBuf,0,
                                               cbVTMK4Ret,NIL)
    then Result:=GetLastError();
end;

function rtgetcmddata(FHandl:THandle;rtBusCommand:DWord):DWord;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtBusCommand;
  DeviceIoControl(FHandl,IOCTL_TMK_rtgetcmddata,@awVTMK4InBuf,2,
                                                @awVTMK4OutBuf,2,
                                                cbVTMK4Ret,NIL);
  Result:=awVTMK4OutBuf[0];
end;

procedure rtsetanswbits(FHandl:THandle;rtSetControl:DWord);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtSetControl;
  DeviceIoControl(FHandl,IOCTL_TMK_rtsetanswbits,@awVTMK4InBuf,2,
                                                 @awVTMK4OutBuf,0,
                                                 cbVTMK4Ret,NIL);
end;

procedure rtputblk(FHandl:THandle;rtAddr:Word;pcBuffer:Pointer;cwLength:Word);
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtAddr;
  awVTMK4InBuf[1] := LOWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[2] := HIWORD(INTEGER(pcBuffer));
  awVTMK4InBuf[3] := cwLength;
  DeviceIoControl(FHandl,IOCTL_TMK_rtputblk,@awVTMK4InBuf,8,
                                            @awVTMK4OutBuf,0,
                                            cbVTMK4Ret,NIL);
end;

procedure rtdefsubaddr(FHandl:THandle;rtDir,rtSubAddr:DWord);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtDir;
  awVTMK4InBuf[1] := rtSubAddr;
  DeviceIoControl(FHandl,IOCTL_TMK_rtdefsubaddr,@awVTMK4InBuf,4,
                                                @awVTMK4OutBuf,0,
                                                cbVTMK4Ret,NIL);
end;

function rtdefpage(FHandl:THandle;rtPage:DWord):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtPage;
  DeviceIoControl(FHandl,IOCTL_TMK_rtdefpage,@awVTMK4InBuf,2,
                                             @awVTMK4OutBuf,0,
                                             cbVTMK4Ret,NIL);
  Result:=GetLastError();
end;

function rtdefaddress(FHandl:THandle;rtAddress:DWord):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtAddress;
  DeviceIoControl(FHandl,IOCTL_TMK_rtdefaddress,@awVTMK4InBuf,2,
                                                @awVTMK4OutBuf,0,
                                                cbVTMK4Ret,NIL);
  Result:=GetLastError();
end;

procedure rtclranswbits(FHandl:THandle;rtClrControl:DWord);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtClrControl;
  DeviceIoControl(FHandl,IOCTL_TMK_rtclranswbits,@awVTMK4InBuf,2,
                                                 @awVTMK4OutBuf,0,
                                                 cbVTMK4Ret,NIL);
end;

procedure rtputcmddata(FHandl:THandle;rtBusCommand,rtData:DWord);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := rtBusCommand;
  awVTMK4InBuf[1] := rtData;
  DeviceIoControl(FHandl,IOCTL_TMK_rtputcmddata,@awVTMK4InBuf,4,
                                                @awVTMK4OutBuf,0,
                                                cbVTMK4Ret,NIL);
end;

function rtreset(FHandl:THandle):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  DeviceIoControl(FHandl,IOCTL_TMK_rtreset,@awVTMK4InBuf,0,
                                           @awVTMK4OutBuf,0,
                                           cbVTMK4Ret,NIL);
  Result:=GetLastError();
end;

function rtdefbus(FHandl:THandle; bcBus:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0] := bcBus;
  DeviceIoControl(FHandl,IOCTL_TMK_bcdefbus,
  @awVTMK4InBuf,2,@awVTMK4OutBuf,0,cbVTMK4Ret,NiL);
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

function tmkdone(FHandl:THandle;tmkNumber:Word):Integer;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
begin
  awVTMK4InBuf[0]:=tmkNumber;
  DeviceIoControl(FHandl,IOCTL_TMK_tmkdone,@awVTMK4InBuf,2,
                                           @awVTMK4OutBuf,0,
                                           cbVTMK4Ret,NIL);
  result:=GetLastError;
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

function tmkgetmode:Integer;
var awVTMK4InBuf :Array[0..3]of Word;
    awVTMK4OutBuf:Array[0..3]of Word;
    cbVTMK4Ret:DWord;
begin
  if not DeviceIoControl(FHandl,IOCTL_TMK_tmkgetmode,@awVTMK4InBuf,0,
                                              @awVTMK4OutBuf,2,
                                              cbVTMK4Ret,NIL)
               then ShowMessage('NOT tmkgetmode');
  Result:=awVTMK4OutBuf[0];
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

procedure tmkgetevd(FHandl,hEvent:THandle;var nInt:Integer;var wMode,wStatus,wCmd:word);
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..5]of Word;
    cbVTMK4Ret:DWord;
begin
  if not DeviceIoControl(FHandl,IOCTL_TMK_tmkgetevd,@awVTMK4InBuf,0,
                                                    @awVTMK4OutBuf,12,
                                                    cbVTMK4Ret,NIL)
             then begin nInt:=$FFFF; EXIT; end;
  nInt    := awVTMK4OutBuf[0];
  wStatus := awVTMK4OutBuf[1];
  wMode   := awVTMK4OutBuf[2];
  wCmd    := awVTMK4OutBuf[3];
end;

function BcEventTest(FHandl,hEvent:THandle):Integer;
var msgCmd:Word;
begin
  msgCmd:=$F800+CI_MASK+CMD_RESET;
  if bcputw(FHandl,0,msgCmd)<>0 then begin ShowMessage('NO bcputw!');result:=1;EXIT;end;
  if bcstart(FHandl,0,CTRL_C_BRCST)<>0 then begin ShowMessage('NO bcstart!');result:=1;EXIT;end;
  if WaitForSingleObject(hEvent,200)=WAIT_OBJECT_0 then
      begin
        ResetEvent(hEvent);
        tmkgetevd(FHandl,hEvent,nInt,wMode,wStatus,wCmd);
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

procedure INIT;
var i:Word;
    cd1,cd2:Single;
begin
  sd   :=64497;
  kc[1]:=64061;  zm[1]:=64;   cc[1]:=64; // kc1:=kc[1];
  kc[2]:=64093;  zm[2]:=128;  cc[2]:=64; // kc2:=kc[2];
  kc[3]:=64125;  zm[3]:=193;  cc[3]:=64; // kc3:=kc[3];

  cd1:=1.0/2147483648.0;
  cd2:=1.0/32768.0;


   for i:=1 to 20 do
   case i of
                 1,2,6,8,10: MSCML[i]:=360.0*cd1;
                         18: MSCML[i]:=360.0*cd2;
      3,4,5,7,9,11,12,13,17: MSCML[i]:=32.0*cd2;
                         14: MSCML[i]:=16.0*cd2;
                      15,16: MSCML[i]:=64.0*cd2;
                         19: MSCML[i]:=1.0;
                         20: MSCML[i]:=1.0;
   end;
   
  IOCTL_TMK_GetVersion :=CTL_CODE(TMK_KRNLDRVR,VTMK_GetVersion,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkselect  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkselect,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkconfig  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkconfig,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkdefevent:=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkdefevent,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcreset    :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcreset,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcdefbase  :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcdefbase,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcstart    :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcstart,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcputw     :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcputw,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkgetevd  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkgetevd,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcputblk   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcputblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcgetw     :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcgetw,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcgetblk   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcgetblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkdone    :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkdone,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtreset    :=CTL_CODE(TMK_KRNLDRVR,VTMK_rtreset,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtputcmddata:=CTL_CODE(TMK_KRNLDRVR,VTMK_rtputcmddata,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtclranswbits:=CTL_CODE(TMK_KRNLDRVR,VTMK_rtclranswbits,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtdefaddress:=CTL_CODE(TMK_KRNLDRVR,VTMK_rtdefaddress,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtdefpage  :=CTL_CODE(TMK_KRNLDRVR,VTMK_rtdefpage,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtdefsubaddr:=CTL_CODE(TMK_KRNLDRVR,VTMK_rtdefsubaddr,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtputblk    :=CTL_CODE(TMK_KRNLDRVR,VTMK_rtputblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtsetanswbits:=CTL_CODE(TMK_KRNLDRVR,VTMK_rtsetanswbits,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtgetcmddata :=CTL_CODE(TMK_KRNLDRVR,VTMK_rtgetcmddata,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_rtgetblk     :=CTL_CODE(TMK_KRNLDRVR,VTMK_rtgetblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcdefbus   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcdefbus,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
end;

end.
