unit VRD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls;

type
  Tfm_ARM = class(TForm)
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    GroupBox2: TGroupBox;
    StaticText3: TStaticText;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label1: TLabel;
    Label2: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Button1: TButton;
    StaticText4: TStaticText;
    Shape4: TShape;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_ARM: Tfm_ARM;

implementation

{$R *.dfm}

procedure Tfm_ARM.Button1Click(Sender: TObject);
begin
Close;
end;

end.
