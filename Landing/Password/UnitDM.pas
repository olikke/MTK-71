unit UnitDM;

interface

uses
  SysUtils, Classes,DB,DBTables;

type
  TDM = class(TDataModule)
    MTK: TDatabase;
    Password: TQuery;
    PasswordPass: TStringField;
    EnterPassword: TQuery;
    ReadPassword: TQuery;
    ReadPasswordPass: TStringField;
    ReadPasswordNameOP: TStringField;
    ReadPasswordDateCreate: TStringField;
    ReadPasswordDateLastUse: TStringField;
    ReadPasswordQuantityUse: TIntegerField;
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
