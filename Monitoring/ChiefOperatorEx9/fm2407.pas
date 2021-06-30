unit fm2407;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MyPanel,Global,fm2437,fm3401,fm5401,fm5402,
  Container_EM5401,Client_EM5402,Container_EM2437, StdCtrls,Client_EM3401;

type
  Tf2407 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    gb24371: TGroupBox;
    l24371: TLabel;
    s24371: TShape;
    gb24372: TGroupBox;
    l24372: TLabel;
    s24372: TShape;
    gb7402: TGroupBox;
    l7402: TLabel;
    gb24373: TGroupBox;
    l24373: TLabel;
    s24373: TShape;
    gb24374: TGroupBox;
    l24374: TLabel;
    s24374: TShape;
    gb3401: TGroupBox;
    l3401: TLabel;
    s3401: TShape;
    gb5401: TGroupBox;
    l5401: TLabel;
    s5401: TShape;
    gb54021: TGroupBox;
    l54021: TLabel;
    s54021: TShape;
    gb54022: TGroupBox;
    l54022: TLabel;
    s54022: TShape;
    gb0401: TGroupBox;
    l0401: TLabel;
    gb1926: TGroupBox;
    l1926: TLabel;
    gb1927: TGroupBox;
    l1927: TLabel;
    gb1928: TGroupBox;
    l1928: TLabel;
    gb1929: TGroupBox;
    l1929: TLabel;
    gb1921: TGroupBox;
    l1921: TLabel;
    gb1922: TGroupBox;
    l1922: TLabel;
    gb1923: TGroupBox;
    l1923: TLabel;
    gb1924: TGroupBox;
    l1924: TLabel;
    gb1925: TGroupBox;
    l1925: TLabel;
    Timer2: TTimer;
    procedure Timer2Timer(Sender: TObject);
    procedure gb24374Click(Sender: TObject);
    procedure gb24373Click(Sender: TObject);
    procedure gb24372Click(Sender: TObject);
    procedure gb54021Click(Sender: TObject);
    procedure gb54022Click(Sender: TObject);
    procedure gb5401Click(Sender: TObject);
    procedure gb3401Click(Sender: TObject);
    procedure gb24371Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    function  NameWithoutTab(str:string):string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f2407: Tf2407;

implementation

uses UndegroundForm;

{$R *.dfm}

function Tf2407.NameWithoutTab(str: string):string;
var i:integer;
begin
  result:=str[1];
  for i:=2 to Length(str)-1 do
    if ((str[i]<>#10) and  (str[i+1]<>#13)) and
       ((str[i]<>#13) and  (str[i-1]<>#10)) then
        result:=result+str[i] else result:=result+' ';
  result:=result+str[Length(str)];
end;

procedure Tf2407.FormActivate(Sender: TObject);
  procedure GiveMeLabel(L:TLabel;numb:TDeviceNAmeArr;GB:TGroupBox);
  begin
    L.Caption    :='  '+DeviceArr[numb].Name+' '+DeviceArr[numb].ShortSchemeName;
    GB.Hint      :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    GB.ShowHint  :=true;
  end;
begin
  GiveMeLabel(l24371,d24371,gb24371);
  GiveMeLabel(l24372,d24372,gb24372);
  GiveMeLabel(l24373,d24373,gb24373);
  GiveMeLabel(l24374,d24374,gb24374);
  GiveMeLabel(l7402,d7402,gb7402);
  GiveMeLabel(l3401,d3401,gb3401);
  GiveMeLabel(l5401,d5401,gb5401);
  GiveMeLabel(l54021,d54021,gb54021);
  GiveMeLabel(l54022,d54022,gb54022);
  GiveMeLabel(l0401,d0401,gb0401);
  GiveMeLabel(l1921,dpsu1,gb1921);
  GiveMeLabel(l1922,dpsu2,gb1922);
  GiveMeLabel(l1923,dpsu3,gb1923);
  GiveMeLabel(l1924,dpsu4,gb1924);
  GiveMeLabel(l1925,dpsu5,gb1925);
  GiveMeLabel(l1926,dpsu6,gb1926);
  GiveMeLabel(l1927,dpsu7,gb1927);
  GiveMeLabel(l1928,dpsu8,gb1928);
  GiveMeLabel(l1929,dpsu9,gb1929);
  Timer1Timer(self);
end;

procedure Tf2407.gb24371Click(Sender: TObject);
begin
  Und.NextForm(d24371);
  Close;
end;

procedure Tf2407.gb24372Click(Sender: TObject);
begin
  Und.NextForm(d24372);
  Close;
end;

procedure Tf2407.gb24373Click(Sender: TObject);
begin
  Und.NextForm(d24373);
  Close;
end;

procedure Tf2407.gb24374Click(Sender: TObject);
begin
  Und.NextForm(d24374);
  Close;
end;

procedure Tf2407.gb3401Click(Sender: TObject);
begin
  Und.NextForm(d3401);
  Close;
end;

procedure Tf2407.gb5401Click(Sender: TObject);
begin
  Und.NextForm(d5401);
  Close;
end;

procedure Tf2407.gb54021Click(Sender: TObject);
begin
  Und.NextForm(d54021);
  Close;
end;

procedure Tf2407.gb54022Click(Sender: TObject);
begin
  Und.NextForm(d54022);
  Close;
end;

procedure Tf2407.Timer1Timer(Sender: TObject);
  procedure SmartShapeColor(Shape:TShape;NewColor:TColor);
  begin
    if Shape.Brush.Color<>NewColor then Shape.Brush.Color:=NewColor;
  end;
begin
  SmartShapeColor(s5401 ,EM5401.Color);
  SmartShapeColor(s54021,EM5402[1].Color);
  SmartShapeColor(s54022,EM5402[2].Color);
  SmartShapeColor(s24371,EM2437[1].Color);
  SmartShapeColor(s24372,EM2437[2].Color);
  SmartShapeColor(s24373,EM2437[3].Color);
  SmartShapeColor(s24374,EM2437[4].Color);
  SmartShapeColor(s3401 ,EM3401.Color);
end;

procedure Tf2407.Timer2Timer(Sender: TObject);
begin
if (getkeyState(VK_ESCAPE)<0) or (getkeyState(VK_RBUTTON)<0) then close;
end;

end.
