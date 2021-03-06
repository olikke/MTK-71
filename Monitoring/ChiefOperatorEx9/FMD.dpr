program FMD;

uses
  Forms,
  Windows,
  SysUtils,
  Classes,
  Dialogs,
  Main in 'Main.pas' {FMain},
  fmARM in 'fmARM.pas' {fARM},
  fm2220 in 'fm2220.pas' {fKU},
  fm7302 in 'fm7302.pas' {fKumo},
  fm7212 in 'fm7212.pas' {fModulator},
  Global in 'Global.pas',
  Client_EM7212 in 'Client_EM7212.pas',
  ComPortR in 'ComPortR.pas',
  fm7210 in 'fm7210.pas' {f7210},
  Container_EM7302 in 'Container_EM7302.pas',
  Client_EM7302 in 'Client_EM7302.pas',
  Manager_EM7302 in 'Manager_EM7302.pas',
  BD in 'BD.pas',
  BDRecord in 'BDRecord.pas',
  fm2410 in 'fm2410.pas' {f2410},
  fm2409 in 'fm2409.pas' {f2409},
  fm2411 in 'fm2411.pas' {f2411},
  fm2437 in 'fm2437.pas' {f2437},
  fm5401 in 'fm5401.pas' {f5401},
  fm3401 in 'fm3401.pas' {f3401},
  fm5402 in 'fm5402.pas' {f5402},
  Container_EM2437 in 'Container_EM2437.pas',
  Container_EM5401 in 'Container_EM5401.pas',
  Client_EM5401 in 'Client_EM5401.pas',
  Manager_EM2437 in 'Manager_EM2437.pas',
  Container_TM2409 in 'Container_TM2409.pas',
  ICMP in 'ICMP.pas',
  Container_EM7210 in 'Container_EM7210.pas',
  Container_TM2410 in 'Container_TM2410.pas',
  Container_TM2322 in 'Container_TM2322.pas',
  hPing in 'hPing.pas',
  Client_EM5402 in 'Client_EM5402.pas',
  Container_TM2220 in 'Container_TM2220.pas',
  VRDSource in 'VRDSource.pas' {fVRDs},
  fm2407 in 'fm2407.pas' {f2407},
  Client_TM2411 in 'Client_TM2411.pas',
  Container_TM2411 in 'Container_TM2411.pas',
  Container_TM2408 in 'Container_TM2408.pas',
  fm2408 in 'fm2408.pas' {f2408},
  Container_TM2407 in 'Container_TM2407.pas',
  fmLanding in 'fmLanding.pas' {fLanding},
  Client_EM3401 in 'Client_EM3401.pas',
  ContainerLanding in 'ContainerLanding.pas',
  FullState in 'FullState.pas',
  UndegroundForm in 'UndegroundForm.pas' {Und},
  GRaph in 'GRaph.pas';

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
    Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TUnd, Und);
  Application.Run;
    CloseHandle(Mutex);
  end;
end.
