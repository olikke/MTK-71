program BD;

uses
  Forms,
  fmMain in 'fmMain.pas' {Form1},
  BDRecord in 'BDRecord.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
