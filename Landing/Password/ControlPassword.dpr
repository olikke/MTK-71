program ControlPassword;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  AddPassword in 'AddPassword.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
