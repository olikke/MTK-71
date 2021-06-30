unit UnitDM;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, DBTables,Global;

type
  TDM = class(TDataModule)
    MTK: TDatabase;
    ComPort: TQuery;
    ComPortComPort: TIntegerField;
    ComPortBaudRate: TIntegerField;
    ComPortByteSize: TIntegerField;
    ComPortEnableDTR: TBooleanField;
    ComPortEnableRTS: TBooleanField;
    ComPortParity: TIntegerField;
    ComPortStopBits: TIntegerField;
    ComPortTimeOut: TIntegerField;
    Command_2220: TQuery;
    Command_2220Command_ID: TIntegerField;
    Command_2220Command: TIntegerField;
    Command_2220Comment_Eng: TStringField;
    ComDev: TQuery;
    ComDevDevice_ID: TIntegerField;
    ComDevComPort: TIntegerField;
    ComDevAdress: TIntegerField;
    QDin: TQuery;
    ComDevDeviceName: TStringField;
    DevList: TQuery;
    DevListDevice_Name: TStringField;
    DevListDevice_Name_Eng: TStringField;
    DevListDevice_ID: TIntegerField;
    Command_5401: TQuery;
    Command_5401Command_ID: TIntegerField;
    Command_5401Command: TIntegerField;
    Command_5401Comment_Eng: TStringField;
    Command_5401Command_Count: TIntegerField;
    Command_5401Answer_Count: TIntegerField;
    EM5401Param: TQuery;
    EM5401ParamSerial_Numb: TIntegerField;
    EM5401ParamFTP1: TSmallintField;
    EM5401ParamFTP2: TSmallintField;
    Command_7401: TQuery;
    Command_7401Command_ID: TIntegerField;
    Command_7401Command: TIntegerField;
    Command_7401Comment_Eng: TStringField;
    Command_7401Command_Count: TIntegerField;
    Command_7401Answer_Count: TIntegerField;
    Command_2437: TQuery;
    Command_2437Command_ID: TIntegerField;
    Command_2437Command: TIntegerField;
    Command_2437Comment_Eng: TStringField;
    Command_2437Command_Count: TIntegerField;
    Command_2437Answer_Count: TIntegerField;
    EM2437Param: TQuery;
    EM2437ParamSerial_Numb: TIntegerField;
    EM2437ParamPSS: TIntegerField;
    EM2437ParamGain1: TIntegerField;
    EM2437ParamGain2: TIntegerField;
    EM2437ParamGain3: TIntegerField;
    EM2437ParamGain4: TIntegerField;
    EM2437ParamEqual1: TIntegerField;
    EM2437ParamEqual2: TIntegerField;
    EM2437ParamEqual3: TIntegerField;
    EM2437ParamEqual4: TIntegerField;
    EM2437ParamPT11: TIntegerField;
    EM2437ParamPT12: TIntegerField;
    EM2437ParamPT21: TIntegerField;
    EM2437ParamPT22: TIntegerField;
    EM7401Param: TQuery;
    EM7401ParamSerial_Numb: TIntegerField;
    EM7401ParamSwithTable: TStringField;
    HostList: TQuery;
    HostListIP1: TStringField;
    HostListIP2: TStringField;
    HostListMask1: TStringField;
    HostListMask2: TStringField;
    ExternalConn: TQuery;
    ExternalConnName: TStringField;
    ExternalConnInclude: TBooleanField;
    Pass: TQuery;
    PassPass: TStringField;
    PassPass_ID: TIntegerField;
    EnterPassword: TQuery;
    PassQuantityUse: TIntegerField;
    LASetup: TQuery;
    LASetupLA_ID: TSmallintField;
    LASetupmName: TStringField;
    LASetupXE: TFloatField;
    LASetupYE: TFloatField;
    LASetupZE: TFloatField;
    LASetupXF: TFloatField;
    LASetupYF: TFloatField;
    LASetupZF: TFloatField;
    LASetupXG: TFloatField;
    LASetupYG: TFloatField;
    LASetupZG: TFloatField;
    KUSetup: TQuery;
    KUSetupX: TFloatField;
    KUSetupY: TFloatField;
    KUSetupZ: TFloatField;
    KUSetupAz: TFloatField;
    KUSetupUm: TFloatField;
    KUSetupUsY: TIntegerField;
    KUSetupAhxY: TIntegerField;
    KUSetupUsC: TIntegerField;
    KUSetupAhxC: TIntegerField;
    KUSetupFocus: TFloatField;
    KUSetupRx: TFloatField;
    KUSetupKx: TFloatField;
    KUSetupRy: TFloatField;
    KUSetupKy: TFloatField;
    KUSetupX0: TFloatField;
    KUSetupY0: TFloatField;
    KUSetupDevice_ID: TIntegerField;
    KUSetupAlf: TFloatField;
    KUSetupXi: TFloatField;
    KUSetupOm: TFloatField;
    Protocol: TQuery;
    SetTitle: TQuery;
    SetData: TQuery;
    FilterParam_F7: TQuery;
    FilterParam_F7RBL: TIntegerField;
    FilterParam_F7RWH: TIntegerField;
    FilterParam_F8: TQuery;
    FilterParam_F8Threshold: TIntegerField;
    Distance: TQuery;
    DistanceMaxDistance: TIntegerField;
    DistanceMinDistance: TIntegerField;
    MetricConst: TQuery;
    MetricConstMile: TFloatField;
    MetricConstFoot: TFloatField;
    Miscellaneous: TQuery;
    MiscellaneousParameter: TStringField;
    MiscellaneousValue: TBooleanField;
    SetTitle2: TQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 PR:=DM.MTK.Params.Strings[1];
 Delete(PR,1,9);
end;

end.
