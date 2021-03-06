program AdjustingMTK201Eb;

uses
  Forms,
  Windows,
  SysUtils,
  Main in 'Main.pas' {Form1},
  Global in 'Global.pas';

{$R *.res}

var
    buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
    Size: Cardinal;
    Name:string;
begin
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Windows.GetComputerName(@buffer, Size);
  Name:=StrPas(buffer);
  Device_IN:=0;
  if (UpperCase(Name)='WSP') or (UpperCase(Name)='WSC') or (UpperCase(Name)='OLIKKE')then Device_IN:=54;
  if Device_IN=0 then
  begin
    Application.MessageBox('Computer name is unknown. Application will be closed.','System error',MB_DEFBUTTON2+MB_ICONERROR);
    Application.Terminate;
    exit;
  end;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
