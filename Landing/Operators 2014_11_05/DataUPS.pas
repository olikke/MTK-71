unit DataUPS;


interface

uses Classes,Types,SysUtils,Dialogs,Snmp,SeConst,Mgmtapi,Global,
     Windows,Graphics,ExtCtrls,UPS,SyncObjs;

type
  TGetUPS = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure Return;
    procedure Analiz(var qParams:TUPSParam;var qErr:TStringList;
                     var qMess:TStringList;var cErr,cInf,DataEx:Word);
  public
    IP:String[15];
    Device_ID:Word;
    FEvent:TEvent;
    State:boolean;
   // uHandle:Cardinal;
  end;

const
//Границы параметров  i-номер, k=0-нижняя граница, к=1-верхняя граница
  G1Params:TUPSParam=(60,10,195,495,215,100);
  G2Params:TUPSParam=(100,40,250,505,225,900);
  Y1Params:TUPSParam=(40,0,187,490,190,45);
  Y2Params:TUPSParam=(59,45,264,510,250,1000);

  str:string='aaaaaaaa';

  OutParam : Array[1..6] of String = ('.1.3.6.1.2.1.33.1.2.4',
                                      '.1.3.6.1.2.1.33.1.2.7',
                                      '.1.3.6.1.2.1.33.1.3.3.1.3',
                                      '.1.3.6.1.2.1.33.1.4.2',
                                      '.1.3.6.1.2.1.33.1.4.4.1.2',
                                      '.1.3.6.1.2.1.33.1.4.4.1.4');
  COMMUNITY='public';
  ALARMROOT=   '.1.3.6.1.2.1.33.1.6.2.1.2';
  ADESCROOT=   '.1.3.6.1.2.1.33.1.6.3';

  AlarmListName:Array[1..24] of String=
('One or more batteries have been determined to require replacement.',
'UPS is drawing power from the batteries.',
'The remaining battery run-time is dangerously low.',
'UPS is unable to sustain the present load when and if mains is lost.',
'A temperature is out of tolerance.',
'An input condition is out of tolerance.',
'An output condition (other than Output Overload) is out of tolerance.',
'The output load exceeds the UPS output capacity.',
'The Bypass is presently engaged on the UPS.',
'The Bypass is out of tolerance.',
'UPS has shutdown as requested, i.e., the output is off.',
'The entire UPS has shutdown as commanded.',
'An uncorrected problem has been detected in the UPS charger.',
'The output of the UPS is in the off state.',
'The UPS system is in the off state.',
'The failure of one or more fans in the UPS has been detected.',
'The failure of one or more fuses has been detected.',
'A general fault in the UPS has been detected.',
'The result of the last diagnostic test indicates a failure.',
'A problem has been encountered in the communications between the UPS and Computer/SNMP box/card.',
'The UPS output is off and the UPS is awaiting the return of input power.',
'A shutdown countdown is underway.',
'The UPS will turn off power to the load in less than 5 seconds; this may be either a timed shutdown or a low battery shutdown.',
'A test is in progress.');

var GetUPS:Array[1..5] of TGetUPS;


implementation
USES Main;

const Count:Word = 6;


procedure TGetUPS.Return;
var  State:Word;
     Color:TColor;
begin
 { if AIPSList.IndexOf(Pointer(uHandle))>=0
    then AIPSList.Delete(AIPSList.IndexOf(Pointer(uHandle))); }
    
  State:=TUPS(ArrDevice[Device_ID]).State AND $0F;
  Color:=clWhite;
  case State of
  0 : Color:=Color_R;
  1 : Color:=Color_G;
  2 : Color:=clWhite;
  3 : Color:=Color_Y;
  end;

  if NMain.FindComponent('dev'+IntToStr(Device_ID))<>nil then
    TShape(NMain.FindComponent('dev'+IntToStr(Device_ID))).Brush.Color:=Color;

  if fm_UPS <> nil then if fm_UPS.Visible then
    PostMessage(fm_UPS.Handle,WM_NOTIFY_MSG,3,Device_ID);
end;

procedure TGetUPS.Analiz(var qParams:TUPSParam;var qErr:TStringList;
                         var qMess:TStringList;var cErr,cInf,DataEx:Word);
var i,Alarm,State,Result:Integer;
var qState:TUPSParam;

begin//
 //У-во: 0-неисправно,1-исправно,2-не опрошено,3-желтая зона.
  Result:=1;
  Alarm:=1;
  if cInf  > 0 then Alarm:=3;
  if cErr  > 0 then Alarm:=0;
  for i:=0 to 5 do
    begin
      State:=0; qState[i]:=0;
      if (qParams[i]>=Y1Params[i])AND(qParams[i]<=Y2Params[i])then State:=3;
      if (qParams[i]>=G1Params[i])AND(qParams[i]<=G2Params[i])then State:=1;
      if State = 0 then begin Result:=0;Continue;end;
      if Result<>0 then if State=3 then Result:=3 else Result:=1;
      qState[i]:=State;
    end;
  case Alarm of
  0: Result:=0;
  3: if Result=1 then Result:=3;
  end;
  Result:=Alarm SHL 4 + Result;
  if DataEx=0 then Result:=0;
  try
    cs_ArrStateDevice.Enter;try ArrStateDevice[Device_ID].ResultState:= Result AND $0F;finally cs_ArrStateDevice.Leave;end;
    With TUPS(ArrDevice[Device_ID]) do
      begin
        DataExh:=DataEx;
        Params:=qParams;
        PState:=qState;
        State:=Result;
        Directive.Clear;
        if qErr<>nil then  if qErr.Count>0 then Directive.AddStrings(qErr);
        Information.Clear;
        if qMess<>nil then if qMess.Count>0 then Information.AddStrings(qMess);
      end;
    except //При ошибке ничего не делать
    cs_ArrStateDevice.Enter;try ArrStateDevice[Device_ID].ResultState:=0;finally cs_ArrStateDevice.Leave;end;
    end;
end;

procedure TGetUPS.Execute;
var i,j,OutAlarm : Word;
    Session: PSnmpMgrSession;
    VarBind: TSnmpVarBind;
    VarBindList: TSnmpVarBindList;
    ErrorStatus, ErrorIndex: TAsnInteger32;
    RootOid, DescOid : TAsnObjectIdentifier;
    RetVal : Integer;
    Position,alm_number : Cardinal;
    s:String;
    HOST:String;

var qParams:TUPSParam;
    qErr:TStringList;
    qMess:TStringList;
    cErr,cInf,DataEx:Word;

begin
  State:=true;
  FreeOnTerminate:=True;   //Освобождение ресурсов по окончании
while not Terminated do
begin
  FEvent.WaitFor(INFINITE);
  FEvent.ResetEvent;
  if terminated then
  begin
    FEvent.Free;
    State:=false;
    exit;
  end;
  alm_number:=0;
  HOST:=IP;
  qErr:=TStringList.Create;
  qMess:=TStringList.Create;
  for i:=0 to 5 do qParams[i]:=0; qParams[1]:=-10;
  try
    Session := SnmpMgrOpen(PChar(HOST),PChar(Community),20,3);
    if not Assigned(Session) then begin state:=false; exit; end;
    try
      with VarBindList do
        begin
          len := Count;
          list := SnmpUtilMemAlloc(SizeOf(TSnmpVarBind)*Count);
          Position := 0;
          try
            for i := 0 to Count - 1 do
              begin
                s:=OutParam[i+1];
                if not SnmpMgrStrToOid(PChar(s),@VarBind.name) then begin state:=false; exit; end;
                VarBind.value.asnType := ASN_NULL;
                System.Move(VarBind,Pointer(DWORD(VarBindList.list)+Position)^,
                            SizeOf(TSnmpVarBind));
                Inc(Position,SizeOf(TSnmpVarBind));
              end;
          except
             SnmpUtilVarBindListFree(@VarBindList);
             raise;
             begin state:=false; exit; end;
          end;
        end;
       try
         RetVal := SnmpMgrRequest(Session,SNMP_PDU_GETNEXT,//SNMP_PDU_GET,
                                  @VarBindList,@ErrorStatus,@ErrorIndex);
         if RetVal = SNMPAPI_ERROR then
               begin
                 cs_ArrStateDevice.Enter;try ArrStateDevice[Device_ID].ResultState:=2;
                 finally cs_ArrStateDevice.Leave;end;
                 DataEx:=0;
                 begin state:=false; exit; end;
               end
                                   else
               begin
                 DataEx:=1;
                 Position := 0;
                 for i := 0 to VarBindList.len - 1 do
                   begin
                     VarBind:=PSnmpVarBind(DWORD(VarBindList.list)+Position)^;
                     with VarBind.value do
                       case asnType of ASN_INTEGER:qParams[i]:=number; end;
                     Inc(Position,SizeOf(TSnmpVarBind));
                   end;
               end;
       finally
         SnmpUtilVarBindListFree(@VarBindList);
       end;
       //Сбор тревог
       try
        if not SnmpMgrStrToOid(PChar(ALARMROOT),@RootOid) then begin state:=false; exit; end;
        if not SnmpMgrStrToOid(PChar(ADESCROOT),@DescOid) then begin state:=false; exit; end;
        qErr.Clear;
        qMess.Clear;
        cErr:=0;
        cInf:=0;
        with VarBindList do
         begin
          len := 1;
          list := SnmpUtilMemAlloc(SizeOf(TSnmpVarBind));
          SnmpUtilOidCpy(@VarBindList.list^.name,@RootOid);
          OutAlarm:=0;
          while OutAlarm=0 do
            begin
              VarBindList.list.value.asnType := ASN_NULL;
              RetVal := SnmpMgrRequest(Session,SNMP_PDU_GETNEXT,@VarBindList,
                                       @ErrorStatus,@ErrorIndex);
              if RetVal = SNMPAPI_ERROR then BREAK;
              if (ErrorStatus = SNMP_ERRORSTATUS_NOSUCHNAME) or
                 (SnmpUtilOidNCmp(@RootOid,@VarBindList.list^.name,RootOid.idLength)<>0) or
                 (ErrorStatus > 0) then Break;
			      	if(VarBindList.list.value.asnType = ASN_OBJECTIDENTIFIER)then
                if(0=SnmpUtilOidNCmp(@VarBindList.list.value.obj,
   		            @DescOid,DescOid.idLength)) then
                begin
                  s:=SnmpUtilOidToA(@VarBindList.list.value.obj);
                  for j:=Length(s) downto 1 do if s[j]='.' then
                    begin
                      alm_number:=StrToInt(COPY(S,j+1,2));
                      BREAK;
                    end;
                  case alm_number of
                  2,4,9:begin
                          qErr.Add(IntToStr(cErr+1)+'.'+AlarmListName[alm_number]);
                          INC(cErr);
                        end;
                  else  begin
                          qMess.Add(IntToStr(cInf+1)+'.'+AlarmListName[alm_number]);
                          INC(cInf);
                        end;
                  end;
                end;
            end;
         end;
       finally
         SnmpUtilVarBindListFree(@VarBindList);
       end;
    finally
    SnmpMgrClose(Session);
    end;
  finally
    Analiz(qParams,qErr,qMess,cErr,cInf,DataEx);
    qErr.Free;
    qMess.Free;
    Synchronize(Return);
  end;
end;
end;

end.
