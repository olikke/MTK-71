program WriteTV;

uses
  Forms,
  main in 'main.pas' {nMain},
  Ping in 'Ping.pas',
  WSL in 'WSL.pas',
  Global in 'Global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TnMain, nMain);
  Application.Run;
end.
