unit fm5402;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MyPanel,Client_EM5402,Global, StdCtrls;

type
  Tf5402 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    Splitter1: TSplitter;
    Splitter20: TSplitter;
    Splitter25: TSplitter;
    Splitter22: TSplitter;
    PP1: TMyPanel;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_5402;
  private
    Number:byte;
  public
    name  :string;
    procedure fNumber(n:byte);
  end;

var
  f5402: Tf5402;

implementation

{$R *.dfm}

procedure Tf5402.fNumber(n:byte);
begin
  Number:=n;
end;

procedure Tf5402.ServMsd(var Msg: TMessage);
begin
  SetValues(false);
end;

procedure Tf5402.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EM5402[number]<>nil then
  EM5402[number].AboutForm5402(0,0);
end;

procedure Tf5402.SetValues(First: Boolean);
  procedure SmartDeviceState(Panel:TMyPanel;NewState:TState);
  begin
    //крайне рекомендуется от морганий
    if Panel.DeviceState<>NewState then Panel.DeviceState:=NewState;
  end;
var i:integer;
    Panel:TMyPanel;
begin
  if First then
    for i:=1 to 4 do
    if EM5402[number].ChannelUse(i) then
    begin
      Panel:=f5402.FindComponent('d'+IntToStr(i)) as TMyPanel;
      if Panel<>nil then Panel.Caption:=EM5402[number].ChannelName(i);
    end;
  for i:=1 to 4 do
  if EM5402[number].ChannelUse(i) then
  begin
    Panel:=f5402.FindComponent('d'+IntToStr(i)) as TMyPanel;
    if Panel<>nil then SmartDeviceState(Panel,EM5402[number].ChannelState(i));
  end;
  SmartDeviceState(PP1,EM5402[number].State);
end;

procedure Tf5402.FormActivate(Sender: TObject);
begin
  if not number in [1..2] then begin close; exit end;
  SetValues(true);
  if EM5402[number]<>nil then
  EM5402[number].AboutForm5402(f5402.Handle,number);
  Label1.Caption:=name;
end;

end.
