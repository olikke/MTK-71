unit fmLanding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyPanel, StdCtrls, ExtCtrls,ContainerLanding;

type
  TfLanding = class(TForm)
    Panel4: TPanel;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit18: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    e1: TMyPanel;
    e3: TMyPanel;
    e5: TMyPanel;
    e7: TMyPanel;
    e8: TMyPanel;
    e9: TMyPanel;
    e10: TMyPanel;
    e11: TMyPanel;
    e12: TMyPanel;
    e13: TMyPanel;
    e14: TMyPanel;
    e15: TMyPanel;
    e2: TMyPanel;
    e4: TMyPanel;
    e6: TMyPanel;
    e16: TMyPanel;
    e17: TMyPanel;
    e0: TMyPanel;
    Edit5: TEdit;
    Timer1: TTimer;
    MyPanel1: TMyPanel;
    MyPanel2: TMyPanel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValue;
    procedure SetNoValue;
    procedure SmartDeviceState(Panel:TMyPanel;State:TState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLanding: TfLanding;

implementation

{$R *.dfm}

procedure TfLanding.SmartDeviceState(Panel: TMyPanel; State: TState);
begin
  if Panel.DeviceState<>State then Panel.DeviceState:=State;
end;

procedure TfLanding.SetValue;
begin
  e0.Caption:='YES';
  SmartDeviceState(e0,dsGreen);
  SmartDeviceState(e1,Landing.ShipPower);
  SmartDeviceState(e2,Landing.OLS1);
  SmartDeviceState(e3,Landing.OLS2);
  SmartDeviceState(e4,Landing.RACS1);
  SmartDeviceState(e5,Landing.RACS2);
  SmartDeviceState(e6,Landing.Ilmen1);
  SmartDeviceState(e7,Landing.Ilmen2);
  SmartDeviceState(e8,Landing.WSP);
  SmartDeviceState(e9,Landing.WSL);
  SmartDeviceState(e10,Landing.WSR);
  SmartDeviceState(e11,Landing.VRD);
  SmartDeviceState(e12,Landing.KU1);
  SmartDeviceState(e13,Landing.KU2);
  SmartDeviceState(e14,Landing.KU3);
  SmartDeviceState(e15,Landing.KU4);
  SmartDeviceState(e16,Landing.tm2320);
  SmartDeviceState(e17,Landing.tm2402);
end;

procedure TfLanding.Timer1Timer(Sender: TObject);
begin
  if Landing.DataExh then SetValue
                     else SetNoValue;
end;

procedure TfLanding.SetNoValue;
var i:integer;
begin
  e0.Caption:='NO';
  SmartdeviceState(e0,dsRed);
  for i:=1 to 17 do
  if (i<>4) and (i<>5) then
  if fLanding.FindComponent('e'+IntToStr(i))<>nil then
     SmartDeviceState(fLanding.FindComponent('e'+IntToStr(i)) as TMyPanel,dsGray);
end;

procedure TfLanding.FormActivate(Sender: TObject);
begin
  Panel4.SetFocus;
  if Landing.DataExh then SetValue
                     else SetNoValue;
end;

end.
