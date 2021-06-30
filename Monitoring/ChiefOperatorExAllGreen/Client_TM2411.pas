unit Client_TM2411;

interface

uses Classes,Snmp,SeConst,Mgmtapi,SyncObjs,Windows,Global,Container_TM2411;

type
  TGetUPS = class(TThread)
  private
    fIP    :string;
    fEvent :TEvent;
    fNUmber:byte;
    procedure SNMPQuery;
  protected
    procedure Execute; override;
  public
    constructor Create(mip:string; Number:byte; Ev:TEvent);
  end;

var cTM2411:array[1..5] of TGetUPS;

const
  Count:Word = 6;
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

implementation

constructor TGetUPS.Create(mip: string; number:byte; Ev:TEvent);
begin
  inherited Create(true);
  fIP          :=mip;
  fNumber      :=Number;
  TM2411[fNumber]:=TUPS.Create;
  fEvent       :=Ev;
  Resume;
end;

procedure TGetUPS.SNMPQuery;
var i,OutAlarm : Word;
    Session: PSnmpMgrSession;
    VarBind: TSnmpVarBind;
    VarBindList: TSnmpVarBindList;
    ErrorStatus, ErrorIndex: TAsnInteger32;
    RootOid, DescOid : TAsnObjectIdentifier;
    RetVal : Integer;
    Position,alm_number : Cardinal;
    s:String;
    qParams:TUPSParam;
    qErr:TStringList;
    qMess:TStringList;
    cErr,cInf:Word;
    DataEx:boolean;
begin
  alm_number:=0;
  qErr:=TStringList.Create;
  qMess:=TStringList.Create;
  DataEx:=false;
  cErr:=0; cInf:=0;
  for i:=0 to 5 do qParams[i]:=0; qParams[1]:=-10;
  try
    Session := SnmpMgrOpen(PChar(fIP),PChar(Community),20,3);
    if not Assigned(Session) then exit;
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
            if not SnmpMgrStrToOid(PChar(s),@VarBind.name) then exit;
            VarBind.value.asnType := ASN_NULL;
            System.Move(VarBind,Pointer(DWORD(VarBindList.list)+Position)^,SizeOf(TSnmpVarBind));
            Inc(Position,SizeOf(TSnmpVarBind));
          end;
        except
           SnmpUtilVarBindListFree(@VarBindList);
           raise;
           exit
        end;
      end;
      try
        RetVal := SnmpMgrRequest(Session,SNMP_PDU_GETNEXT,@VarBindList,@ErrorStatus,@ErrorIndex);
        if RetVal = SNMPAPI_ERROR then  exit else
        begin
          DataEx:=true;
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
    finally
      SnmpMgrClose(Session);
    end;
  finally
    TM2411[fNumber].Analiz(qParams,DataEx);
    qErr.Free;
    qMess.Free;
  end;
end;

procedure TGetUPS.Execute;
begin
while not Terminated do
begin
  SNMPQuery;

  if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate)
                  else sleep(TimeToUpdate);
  if terminated then
  begin
    TM2411[fNumber].Destroy;
    TM2411[fNumber]:=nil;
    exit;
  end;
end;
end;

end.
