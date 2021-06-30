unit HTTP2409;

interface

uses Classes,Global,SysUtils,Windows,SyncObjs,idHTTP,Dialogs;

type
  TTM2409 = class(TThread)
    private
      fOldIP  :String;
      fIP     :String;
      fMask   :String;
      fWnd    :HWND;
      fHTTP   :TidHTTP;
      fName   :String;
      sNewIP  :String;
      sConfirm:String;
      sPort   :array [1..8] of String;
      sOper   :array [1..8] of String;
      sBasic  :String;
      procedure SendToForm(Step:TNPStep;result:TResult);
      procedure SendToFormEx(Step:TNPStep;LE:cardinal);
      procedure INIT;
      procedure HTTPCreate;
      function  ChangeNetwork:boolean;
      function  ChangePortSettings(numb:byte):boolean;
      function  ChangeBasic:boolean;
      function  ChangeOperationSettings(numb:byte):boolean;
    public
      constructor Create(oldIP,NewIP,NewMask:Stric;WND:HWND;Name:string);
    protected
      procedure Execute; override;
  end;

var TM2409:TTM2409;
    Permission:TEvent;

implementation

procedure TTM2409.INIT;
var i:integer;
begin
  sNewIP  :='http://'+fOldIP+'/Set.htm?IP='+fIP+'&Netmask='+fMask+'&Gateway=&IPConfig=0&DNS1=&DNS2=&SnmpMode=0&SnmpCommunity=&SnmpContact=&SnmpLocation=&IPLocationServer=&IPLocationPort=0&IPLocationPeriod=0&Submit=Submit&setfunc=Network';
  sConfirm:='http://'+fOldIP+'/09Set.htm?';
  for i:=1 to 8 do
  begin
    sPort[i]:='http://'+fIP+'/Set.htm?'+
              'PortAlias=' +ComSettings[i].Alias+
              '&BaudRate=' +ComSettings[i].BaudRate+
              '&DataBits=' +ComSettings[i].DataBits+
              '&StopBits=' +ComSettings[i].StopBits+
              '&Parity='   +ComSettings[i].Parity+
              '&FlowCtrl=0&FIFO=1'+
              '&IfType='   +ComSettings[i].ifType+
              '&PortNo='   +IntToStr(i)+
              '&Submit=Submit&setfunc=Serial';
  end;
  sBasic    :='http://'+fIP+'/Set.htm?'+
              'ServerName='+fName+
              '&TimeZone=23&Year=2014&Month=5&Day=7&Hour=6&Minutes=55&Seconds=37&TimeServerIP=&WebDisable=0&ConDisable=0&lcmprotect=0&resetprotect=0&Submit=Submit&setfunc=Basic';
  for i:=1 to 8 do
  begin
    sOper[i]:='http://'+fIP+'/Set.htm?'+
              'OpMode=02&TCPAliveCheck=0&MaxConnect=4'+
              '&ignorejam=0&allowdrvctrl=0&packlen=0'+
              '&DelimiterChar1=0&DelimiterChar2=0'+
              '&delimprocess=1&ForceTxTime=0&'+
              'PortNo='+IntToStr(i)+
              '&Submit=Submit&setfunc=OPMode';
  end;
end;

procedure TTM2409.SendToForm(Step: TNPStep; result: TResult);
begin
  if IsWindow(FWnd) then
  PostMessage(FWND,WM_NOTIFY_NP,Integer(Step),Integer(Result));
end;

procedure TTM2409.SendToFormEx(Step: TNPStep; LE:cardinal);
begin
  if IsWindow(FWnd) then
  PostMessage(FWND,WM_NOTIFY_NP,Integer(Step),LE);
end;

constructor TTM2409.Create(oldIP: Stric; NewIP: Stric; NewMask: Stric;WND:HWND; Name:string);
begin
  inherited Create(true);
  fOldIP    :=oldIP;
  fIP       :=NewIP;
  fMask     :=NewMask;
  fWND      :=WND;
  INIT;
  Permission:=TEvent.Create(nil,false,false,'Permission');
  fHTTP     :=nil;
  fName     :=Name;
  resume;
end;

procedure TTM2409.HTTPCreate;
begin
  fHTTP:=TidHTTP.Create(nil);
  fHTTP.Request:=TidHTTPRequest.Create(fHTTP);
  fHTTP.Request.BasicAuthentication:=false;
  fHTTP.HTTPOptions:=[hoForceEncodeParams];
  fHTTP.Request.Connection:='Keep-Alive';
end;

function TTM2409.ChangeNetwork:boolean;
var i:integer;
begin
  result:=true;
  fHTTP.DisconnectNotifyPeer;
  //http://192.168.3.26/Set.htm?IP=192.168.3.27&Netmask=255.255.255.0&Gateway=&IPConfig=0&DNS1=&DNS2=&SnmpMode=0&SnmpCommunity=&SnmpContact=&SnmpLocation=&IPLocationServer=&IPLocationPort=0&IPLocationPeriod=0&Submit=Submit&setfunc=Network
  try fHTTP.Get(sNewIP);
  except
    SendToFormEx(npNewIP,GetLastError);
    result:=false;
    exit;
  end;
  Sleep(2000);
  try fHTTP.Get(sConfirm);
  except
    SendToFormEx(npNewIP,GetLastError);
    result:=false;
    exit;
  end;
  fHTTP.DisconnectNotifyPeer;
  sleep(2000);
  for i:=1 to 10 do
  begin
    result:=ping(PAnsiChar(fIP),PAnsiChar('aaaaaaaa'),10);
    if result then break
              else sleep(1000);
  end;
  if result then SendToForm(npNewIP,Success) else SendToForm(npNewIP,Failure);
  sConfirm:='http://'+fIP+'/09Set.htm?';
end;

function TTM2409.ChangePortSettings(numb:byte):boolean;
var str :string;
    Step:TNpStep;
begin
  result:=true;
  if not numb  in [1..8] then
  begin
    result:=false;
    exit;
  end;
  case numb of
    1: Step:=np1;
    2: Step:=np2;
    3: Step:=np3;
    4: Step:=np4;
    5: Step:=np5;
    6: Step:=np6;
    7: Step:=np7;
    8: Step:=np8;
  end;
  try str:=fHTTP.Get(sPort[numb]);
  except
    SendToFormEx(Step,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Serial Settings OK!',str)=0 then
  begin
    SendToForm(Step,Failure);
    result:=false;
    exit;
  end;
  sleep(2000);
  try str:=fHTTP.Get(sConfirm);
  except
    SendToFormEx(Step,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Now Save/Restart OK!',str)=0 then
  begin
    SendToForm(Step,Failure);
    result:=false;
    exit;
  end;
  SendToForm(Step,Success);
  sleep(2000);
end;

function TTM2409.ChangeOperationSettings(numb:byte):boolean;
var str :string;
    Step:TNpStep;
begin
  result:=true;
  if not numb  in [1..8] then
  begin
    result:=false;
    exit;
  end;
  case numb of
    1: Step:=npo1;
    2: Step:=npo2;
    3: Step:=npo3;
    4: Step:=npo4;
    5: Step:=npo5;
    6: Step:=npo6;
    7: Step:=npo7;
    8: Step:=npo8;
  end;
  try str:=fHTTP.Get(sOper[numb]);
  except
    SendToFormEx(Step,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Operating Settings OK!',str)=0 then
  begin
    SendToForm(Step,Failure);
    result:=false;
    exit;
  end;
  sleep(2000);
  try str:=fHTTP.Get(sConfirm);
  except
    SendToFormEx(Step,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Now Save/Restart OK!',str)=0 then
  begin
    SendToForm(Step,Failure);
    result:=false;
    exit;
  end;
  SendToForm(Step,Success);
  sleep(2000);
end;

function TTM2409.ChangeBasic;
var str :string;
begin
  result:=true;
  try str:=fHTTP.Get(sBasic);
  except
    SendToFormEx(npBasic,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Basic Settings OK!',str)=0 then
  begin
    SendToForm(npBasic,Failure);
    result:=false;
    exit;
  end;
  sleep(2000);
  try str:=fHTTP.Get(sConfirm);
  except
    SendToFormEx(npBasic,GetLastError);
    result:=false;
    exit;
  end;
  if POS('Now Save/Restart OK!',str)=0 then
  begin
    SendToForm(npBasic,Failure);
    result:=false;
    exit;
  end;
  SendToForm(npBasic,Success);
  sleep(2000);
end;

procedure TTM2409.Execute;
var AddNewIP:stric;
    i       :integer;
  procedure ExitSoft(Result:TResult);
  begin
    //olikke - сначала возвратим настройки сети, если они были изменены
    if (AddNewIP<>'') and (AddNewIP<>'NoChange') then
    begin
      SendToForm(npStartChangeIP,Success);
      WaitForSingleObject(Permission.Handle,INFINITE);
      if not NeedToChange(AddNewIP,false,fWND) then SendToForm(npStopChangeIP,Success)
      else SendToForm(npStopChangeIP,Failure);
      AddNewIP:=''
    end;
    if fHTTP<>nil then
    begin
      fHTTP.DisconnectNotifyPeer;
      fHTTP.Free;
      fHTTP:=nil;
    end;
    Permission.Free;
    SendToForm(npStop,Result);
  end;
begin
  FreeOnTerminate:=true;
  SendToForm(npStart,Success);
  AddNewIP:=ChangeIP(fOldIP);
  if AddNewIP='' then
  begin
    //same problem
    ExitSoft(Failure);
    exit;
  end;
  if AddNewIP<>'NoChange' then
  begin
    //добавление нового IP
    SendToForm(npStartChangeIP,Success);
    WaitForSingleObject(Permission.Handle,INFINITE);
    if NeedToChange(AddNewIP,true,fWnd) then SendToForm(npStopChangeIP,Success)
    else begin
      SendToForm(npStopChangeIP,Failure);
      ExitSoft(Failure);
      exit;
    end;
  end;
  HTTPCreate;
  if not ChangeNetwork then
  begin
    ExitSoft(Failure);
    exit;
  end;
  for i:=1 to 8 do
    if not ChangePortSettings(i) then
    begin
      ExitSoft(Failure);
      exit;
    end;
  for i:=1 to 8 do
    if not ChangeOperationSettings(i) then
    begin
      ExitSoft(Failure);
      exit;
    end;
  if not ChangeBasic then
  begin
    ExitSoft(Failure);
    exit;
  end;
  ExitSoft(Success);;
end;

end.
