program WriteTV_SDI;

uses
  Forms,
  Main in 'Main.pas' {fMain},
  Container_TM2322 in 'Container_TM2322.pas',
  Global in 'Global.pas',
  hPing in 'hPing.pas',
  ICMP in 'ICMP.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
