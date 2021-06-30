unit UPSconfig;

interface

uses Classes,ComPortR,Windows,Global,SyncObjs;

type
  T255  = array [0..255] of byte;

type
  TUPStype = (od,ge,BootMethod,Reboot,Setip,BootMethodManual,nvSave,y,ext,SetipFull);

  TCommand = record
    Text     :T255;
    Length   :byte;
  end;

var Command  :array [TUPStype] of TCommand;

type
  TUPS = class(TThread)
  private
    fCom       :TComPortR;
    fBaudRate  :TBaudRate;
    fByteSize  :TByteSize;
    fEnableDTR :boolean;
    fEnableRTS :boolean;
    fParity    :TParity;
    fStopBits  :TStopBits;
    fTimeOut   :integer;
    fComNumb   :integer;
    sa4Event   :SECURITY_ATTRIBUTES;
    cUPS       :Cardinal;
    fERROR     :byte;
    fWnd       :HWND;
    fBootMethod:boolean;
    fREBOOT    :boolean;
    fNEXTStep  :TUPSStep;
    fFINISHED  :boolean;
    fAnswer    :string;
    fip        :Stric;
    fMask      :Stric;
    fGateway   :Stric;
    RestartEv  :TEvent;
    WaitingTime:integer;
    procedure  StartComPort;
    procedure  INITCommand;
    function   SendData(UPSType:TUPSType):boolean;
    procedure  FMessageToForm(Step:TUPSStep;Result:TResult);
    function   SendOneCommand(UPSType:TUPSType;Step:TUPSStep):boolean;
  protected
   procedure   Execute; override;
  public
    constructor Create(ComNumb:byte;Wnd:HWND;ip,Mask,Gateway:Stric);
    procedure   ReadPacket(const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
  end;

var  UPS:TUPS;

implementation

procedure TUPS.INITCommand;
  procedure WriteCommand(UPSType:TUPSType;str:string);
  var i:integer;
  begin
    for i:=0 to Length(str)-1 do
    Command[UPSType].Text[i]:=ord(str[i+1]);
    Command[UPSType].Length :=Length(str);
  end;
var str:string;
      i:integer;
begin
  WriteCommand(od,chr($0D));
  WriteCommand(ge,'ge'+chr($0D));
  WriteCommand(BootMethod,'boot-method'+chr($0D));
  WriteCommand(Reboot,'reboot'+chr($0D));
  WriteCommand(Setip,'setip'+chr($0D));
  WriteCommand(BootMethodManual,'boot-method manual'+chr($0D));
  WriteCommand(nvSave,'nvsave'+chr($0D));
  WriteCommand(y,'y');
  WriteCommand(ext,'exit'+chr($0D));
  WriteCommand(SetipFull,'setip '+fIP+' '+fMASK+' '+fGateway+chr($0D));
end;

procedure TUPS.FMessageToForm(Step: TUPSStep; Result: TResult);
begin
  if IsWindow(FWnd) then
  PostMessage(fWnd,WM_NOTIFY_UPS,INTEGER(Step),INTEGER(Result));
end;

function TUPS.SendData(UPSType:TUPSType):boolean;
var Signaled:cardinal;
begin
  result:=false;
  fAnswer:='';
  if fCOM=nil then StartComPort;
  if not fCOM.WriteBuffer(@Command[UPSType].Text[0],Command[UPSType].Length) then
  begin
    INC(fERROR);
    exit;
  end;
  Signaled:=WaitForSingleObject(cUPS,fTimeOut);
  if Signaled=WAIT_OBJECT_0 then
  begin
    result:=true;
    fERROR:=0;
  end else
  begin
    INC(fERROR);
    exit;
  end;
end;

procedure TUPS.ReadPacket(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var i:integer;
    pb:^byte;
    wr:byte;
    str:string;
    Sign:byte;
begin
  if p=nil then exit;
  str:='';
  pb:=p;
  for i:=0 to Count-1 do
  begin
      wr:=pb^;
      str:=str+chr(wr);
      INC(pb);
  end;
  fAnswer:=fAnswer+str;
  str:=fAnswer;
  Sign:=0;
  if  POS('GEDE-SNMP-UPS-Interface login:',str)<>0 then  Sign:=1 else
  if  POS('Password:',str)<>0 then Sign:=2 else
  if (POS('boot-method =',str)<>0) and (POS('GEDE>',str)<>0) then Sign:=4 else
  if (POS('New setting will take effect on next reboot!',str)<>0) and (POS('GEDE>',str)<>0)then Sign:=5 else
  if  POS('Are you sure? (y/n)',str)<>0 then Sign:=6 else
  if (POS('IP address = ',str)<>0) and (POS('GEDE>',str)<>0) then Sign:=7 else
  if  POS('System will reboot in 5 seconds',str)<>0 then  Sign:=8  else
  if  POS('GEDE>',str)<>0 then Sign:=3;
  if Sign<>0 then fAnswer:='';
  case Sign of
    1:   begin
           fNextStep:=upsLOGIN;
           fReboot:=false;
           RestartEv.SetEvent;
         end;
    2:   begin
           fNextStep:=upsPASSWORD;
           fReboot:=false;
         end;
    3:   begin
           if fBootMethod then
           begin
             fNextStep   :=upsBoot;
             fBootMethod :=false;
           end;
           if fReboot then
           begin
             fNextStep  :=upsReboot;
             fReboot    :=false;
           end;
         end;
    4:   begin
           if POS('boot-method = MANUAL',str)<>0 then
           begin
             if not fReboot then
             begin
               fNextStep   :=upsSetip;
               fBootMethod :=false;
             end;
           end else
           begin
             fNextStep     :=upsBootManual;
           end;
         end;
    5:  begin
           fNextStep :=upsSave;
           fREBOOT:=true;
        end;
    6:  begin
           fNextStep:=upsYes;
        end;
    7:  begin
          if POS(fip,str)<>0 then
            if POS(fMask,str)<>0 then
            begin
              fNextStep:=upsExit;
            end else else
          begin
              fNextStep:=upsSetipFull;
              fBootMethod:=false;
          end;
        end;
    8:  begin
          fBootMethod:=true;
          WaitingTime:=45000;
        end;
  end;
  SetEvent(cUPS);
end;

procedure TUPS.StartComPort;
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
    fCOM.ComNumber           :=fComNumb;
    if not fCOM.Connected then fCOM.Open;
    fCOM.ReadActive:=True;
    if fCom.Connected then  FMEssageToForm(upsComOPEN,Success)
                      else  FMEssageToForm(upsComOPEN,Failure);
end;

constructor TUPS.Create(ComNumb:byte;WND:HWND;ip,Mask,Gateway:stric);
begin
  inherited Create(true);
  UPSStartWork:=false;
  fComNumb   :=ComNumb;
  fBaudRate  :=br115200;
  fByteSize  :=bs8;
  fEnableDTR :=false;
  fEnableRTS :=false;
  fParity    :=ptNone;
  fStopBits  :=sb1BITS;
  fTimeOut   :=150;
  sa4Event.nLength              := sizeof(sa4Event);
  sa4Event.lpSecurityDescriptor := NIL;
	sa4Event.bInheritHandle       := TRUE;
  cUPS       := CreateEvent(@sa4Event,FALSE,FALSE,NIL);
  fCOM       :=nil;
  fERROR     :=0;
  fWND       :=WND;
  fBootMethod:=true;
  fREBOOT    :=false;
  fNextStep  :=upsFIND;
  fFinished  :=false;
  fip        :=ip;
  fMask      :=Mask;
  fGateway   :=Gateway;
  WaitingTime:=fTimeOut;
  INITCommand;
  RestartEv  :=TEvent.Create(nil,false,false,'Restart');
  resume;
end;

function TUPS.SendOneCommand(UPSType:TUPSType;Step:TUPSStep):boolean;
var flag:boolean;
begin
  flag:=false;
  result:=false;
  while not flag do
  begin
    flag:=SendData(UPSType);
    if not flag then
    if fERROR<=3 then
    begin
      fCom.Connected:=false;
      fCom:=nil;
    end else
    begin
      FMEssageToForm(Step,Failure);
      FMessageToForm(upsCRASH,Failure);
      flag:=true;
    end else result:=true;
  end;
end;

procedure TUPS.Execute;
begin
  FreeOnTerminate:=true;
  while not fFinished do
  begin;
    if WaitForSingleObject(RestartEv.Handle,WaitingTime)=Wait_Object_0 then
    begin
      WaitingTime:=fTimeOut;
      RestartEv.ResetEvent;
    end;
    case INTEGER(fNextStep) of
      INTEGER(upsFIND):
        begin
          fFinished:= not SendOneCommand(od,upsFIND);
          FMEssageToForm(upsFIND,Success);
        end;
      INTEGER(upsLOGIN):
        begin
          fFinished := not SendOneCommand(ge,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsPASSWORD):
        begin
          fFinished := not SendOneCommand(ge,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsBOOT):
        begin
          fFinished := not SendOneCommand(BootMethod,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsReboot):
        begin
          fFinished := not SendOneCommand(Reboot,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsSetip):
        begin
          fFinished := not SendOneCommand(Setip,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsBootManual):
        begin
          fFinished := not SendOneCommand(BootMethodManual,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsSave):
        begin
          fFinished := not SendOneCommand(nvSave,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsYes):
        begin
          fFinished := not SendOneCommand(y,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
      INTEGER(upsExit):
        begin
          fFinished := not SendOneCommand(ext,fNextStep);
          fFinished:=true;
          FMEssageToForm(upsExit,Success);
        end;
      INTEGER(upsSetipFull):
        begin
          fFinished := not SendOneCommand(SetipFull,fNextStep);
          if not fFinished then  FMEssageToForm(fNextStep,Success);
        end;
    end;
  end;
  fCom.Connected:=false;
  fCom:=nil;
  RestartEv.Free;
end;

end.
