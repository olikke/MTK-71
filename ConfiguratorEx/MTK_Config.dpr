program MTK_Config;

uses
  Forms,
  Windows,
  SysUtils,
  Classes,
  Main in 'Main.pas' {Form1},
  Global in 'Global.pas',
  HTTP7302 in 'HTTP7302.pas',
  ICMP in 'ICMP.pas',
  UPSconfig in 'UPSconfig.pas',
  ComPortR in 'ComPortR.pas',
  HTTP2409 in 'HTTP2409.pas',
  HTTP7303 in 'HTTP7303.pas';

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
    Application.CreateForm(TForm1, Form1);
    Size := MAX_COMPUTERNAME_LENGTH + 1;
    Windows.GetComputerName(@buffer, Size);
    Name:=StrPas(buffer);
    HOST_TP:=0;
    if ( UpperCase(Name)='WSC') then
    begin
      HOST_TP:=1;
      HOST_NAME:='WSC';
    end;
    if (UpperCase(Name)='OLIKKE') or (UpperCase(Name)='WSP') then
    begin
      HOST_TP:=2;
      HOST_NAME:='WSP';
    end;
    if HOST_TP=0 then
    begin
      Application.MessageBox('Computer name is unknown. Application will be closed.','System error',MB_DEFBUTTON2+MB_ICONERROR);
      Application.Terminate;
    end;
    CloseHandle(Mutex);
    Application.Run;
  end;
end.
