program ResLuna;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Data in 'Data.pas',
  ComPort in 'ComPort.pas',
  RezCom in 'RezCom.pas',
  LunCom in 'LunCom.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
