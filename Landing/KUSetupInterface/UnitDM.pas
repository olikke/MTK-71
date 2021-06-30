unit UnitDM;

interface

uses
  SysUtils, Classes, DB, DBTables;

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
    ComDev: TQuery;
    ComDevDevice_ID: TIntegerField;
    ComDevComPort: TIntegerField;
    ComDevAdress: TIntegerField;
    Command_2220: TQuery;
    QDin: TQuery;
    Query: TQuery;
    Command_2220Command_ID: TIntegerField;
    Command_2220Command: TIntegerField;
    Command_2220Comment_Eng: TStringField;
    Command_7401: TQuery;
    Command_7401Command_ID: TIntegerField;
    Command_7401Command: TIntegerField;
    Command_7401Comment_Eng: TStringField;
    Command_7401Command_Count: TIntegerField;
    Command_7401Answer_Count: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
