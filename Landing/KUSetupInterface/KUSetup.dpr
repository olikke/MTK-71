program KUSetup;

uses
  Forms,
  Windows,
  SysUtils,
  MainForm in 'MainForm.pas' {Form1},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  Global in 'Global.pas';

{$R *.res}

var
  Mutex: hWnd;
  AppTitle: Array[0..$100] of Char;
begin
  StrPCopy(AppTitle, ExtractFileName(paramstr(0)));
  Mutex := CreateMutex(nil, False, AppTitle);
  if not((GetLastError = ERROR_ALREADY_EXISTS) or (Mutex = 0)) then
  begin
    Application.Initialize;
    Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
    CloseHandle(Mutex);
  end;
end.
