unit fmHELP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  THELP = class(TForm)
    RichEdit1: TRichEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    HELP_ID:byte;
  end;

var
  HELP: THELP;

implementation

{$R *.dfm}

procedure THelp.FormActivate(Sender: TObject);
begin
  {case HELP_ID of
  0:  RichEdit1.Lines.LoadFromFile();
  1:
  end;}
end;



end.
