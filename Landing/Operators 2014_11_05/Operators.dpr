program Operators;

uses
  Forms,
  Windows,
  SysUtils,
  Classes,
  Main in 'Main.pas' {NMain},
  TM2404 in 'TM2404.pas' {fm_TM_2404},
  KU in 'KU.pas' {fm_KU},
  UPS in 'UPS.pas' {fm_UPS},
  ARM in 'ARM.pas' {fm_ARM},
  Global in 'Global.pas',
  Algorithm in 'Algorithm.pas',
  WSC in 'WSC.pas',
  Ping in 'Ping.pas',
  TM2410 in 'TM2410.pas' {fm2410},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  QThread in 'QThread.pas',
  EM5402 in 'EM5402.pas' {fm5402},
  EM7401 in 'EM7401.pas' {fm7401},
  EM2437 in 'EM2437.pas' {fm2437},
  EM5401 in 'EM5401.pas' {fm5401},
  EM3401 in 'EM3401.pas' {fm3401},
  NoExh in 'NoExh.pas' {Exh},
  Luna in 'Luna.pas' {OLS},
  Protocol in 'Protocol.pas',
  Rezistor in 'Rezistor.pas' {RACS},
  TM2409 in 'TM2409.pas' {fm2409},
  Telem in 'Telem.pas' {Telemetric},
  PassWord in 'PassWord.pas' {PasswordDlg},
  ListPreview in 'ListPreview.pas' {LP},
  DataUPS in 'DataUPS.pas',
  DataCalc in 'DataCalc.pas',
  TM2320 in 'TM2320.pas' {fm2320},
  ComPortR in 'ComPortR.pas',
  face3401 in 'face3401.pas',
  ReadCom in 'ReadCom.pas',
  fmHELP in 'fmHELP.pas' {HELP},
  ToMonitoringSystem in 'ToMonitoringSystem.pas',
  HreadEventNew in 'HreadEventNew.pas',
  LadogaAnaliz in 'LadogaAnaliz.pas',
  LadogaClient in 'LadogaClient.pas',
  BufferQueue in 'BufferQueue.pas',
  MSC in 'MSC.pas' {MS};

{$R *.res}

var
  Mutex: hWnd;
  AppTitle: Array[0..$100] of Char;
var buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
    Size: Cardinal;
    Name:string;
begin
  StrPCopy(AppTitle, ExtractFileName(paramstr(0)));
  Mutex := CreateMutex(nil, False, AppTitle);
  if not((GetLastError = ERROR_ALREADY_EXISTS) or (Mutex = 0)) then
  begin
    Application.Initialize;
    Application.CreateForm(TNMain, NMain);
  Application.CreateForm(TDM, DM);
  Size := MAX_COMPUTERNAME_LENGTH + 1;
    Windows.GetComputerName(@buffer, Size);
    Name:=StrPas(buffer);
    HOST_TP:=0;
    if (UpperCase(Name)='OLIKKE') or( UpperCase(Name)='WSP') then HOST_TP:=1;
    if UpperCase(Name)='WSL' then HOST_TP:=2;
    if UpperCase(Name)='WSR' then HOST_TP:=3;
    if HOST_TP=0 then
    begin
      Application.MessageBox('Computer name is unknown. Application will be closed.','System error',MB_DEFBUTTON2+MB_ICONERROR);
      Application.Terminate;
    end;
    if HOST_TP=1 then Application.CreateForm(TPasswordDlg, PasswordDlg);
    Application.Run;
    CloseHandle(Mutex);
  end;
end.
