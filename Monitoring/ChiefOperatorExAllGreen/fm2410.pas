unit fm2410;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, MyPanel, StdCtrls,Global,Container_TM2410;

type
  Tf2410 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    d5: TMyPanel;
    d6: TMyPanel;
    d7: TMyPanel;
    d8: TMyPanel;
    d9: TMyPanel;
    d10: TMyPanel;
    d11: TMyPanel;
    d12: TMyPanel;
    d13: TMyPanel;
    d14: TMyPanel;
    d15: TMyPanel;
    d16: TMyPanel;
    Splitter1: TSplitter;
    Splitter18: TSplitter;
    Splitter19: TSplitter;
    Splitter20: TSplitter;
    Splitter21: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Splitter24: TSplitter;
    Splitter25: TSplitter;
    Splitter26: TSplitter;
    Splitter27: TSplitter;
    Splitter28: TSplitter;
    Splitter29: TSplitter;
    Splitter30: TSplitter;
    Splitter31: TSplitter;
    Splitter32: TSplitter;
    Splitter33: TSplitter;
    Splitter34: TSplitter;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    l7: TLabel;
    l8: TLabel;
    l12: TLabel;
    l14: TLabel;
    l16: TLabel;
    MyPanel17: TMyPanel;
    MyPanel18: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    MyPanel22: TMyPanel;
    MyPanel23: TMyPanel;
    MyPanel24: TMyPanel;
    MyPanel25: TMyPanel;
    MyPanel26: TMyPanel;
    MyPanel27: TMyPanel;
    MyPanel28: TMyPanel;
    MyPanel29: TMyPanel;
    MyPanel30: TMyPanel;
    MyPanel31: TMyPanel;
    MyPanel32: TMyPanel;
    l9: TLabel;
    l10: TLabel;
    l11: TLabel;
    l13: TLabel;
    l15: TLabel;
    Timer1: TTimer;
    n1: TLabel;
    n2: TLabel;
    n3: TLabel;
    n4: TLabel;
    n5: TLabel;
    n6: TLabel;
    n7: TLabel;
    n8: TLabel;
    n9: TLabel;
    n10: TLabel;
    n11: TLabel;
    n12: TLabel;
    n13: TLabel;
    n14: TLabel;
    n15: TLabel;
    n16: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2410;
  private
    Numb:integer;
  public
    procedure fNumber(n:integer);
  end;

var
  f2410: Tf2410;

implementation

{$R *.dfm}

procedure Tf2410.fNumber(n: Integer);
begin
  Numb:=n;
end;

procedure Tf2410.ServMsd(var Msg: TMessage);
begin
  Timer1.Enabled:=false;
  SetValues(false);
  Timer1.Enabled:=true;
end;


procedure Tf2410.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // TM24101.FormHandle:=0;
 // TM24102.FormHandle:=0;
end;

procedure Tf2410.SetValues(First: Boolean);
  procedure GiveMeName(Comp:TMyPanel;numb:TDeviceNameArr);
  begin
    Comp.Caption :='  '+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.Hint    :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.ShowHint:=true;
  end;
  procedure SmartDeviceState(Panel:TMyPanel;NewState:TState);
  begin
    //?????? ????????????? ?? ????????
    if Panel.DeviceState<>NewState then Panel.DeviceState:=NewState;
  end;
var
    fUse      :TUse;
    fExch     :TExch;
    fDA       :TDA;
    fip       :Tip;
    i         :integer;
    Panel     :TMyPanel;
    Lab       :TLabel;
    t1,t2     :TTM2410;
begin
  case Numb of
    1: begin t1:=TM24101; t2:=TM24101d; end;
    2: begin t1:=TM24102; t2:=TM24102d; end;
  end;
  fUse  :=t1.Use;
  fExch :=t1.Exch;
  fDA   :=t1.DA;
  fip   :=t1.ip;
  if First then
  begin
    for i:=1 to 16 do
    begin
      if not fUse[i] then continue;
      Panel:=f2410.FindComponent('d'+IntToStr(i)) as TMyPanel;
      if Panel=nil then continue;
      GiveMeName(Panel,fDA[i]);
      Lab:=f2410.FindComponent('l'+IntToStr(i)) as TLabel;
      if Lab=nil then continue;
      Lab.Caption:=fip[i];
    end;
  end;
  for i:=1 to 16 do
  begin
    if not fUse[i] then continue;
    if i=5 then continue;
    Panel:=f2410.FindComponent('d'+IntToStr(i)) as TMyPanel;
    if Panel=nil then continue;
    if fExch[i]<>dsGray then
    SmartDeviceState(Panel,dsGreen);
  end;
  fUse  :=t2.Use;
  fExch :=t2.Exch;
  fDA   :=t2.DA;
  fip   :=t2.ip;
  if First then
  begin
    for i:=1 to 16 do
    begin
      if not fUse[i] then continue;
     // Panel:=f2410.FindComponent('d'+IntToStr(i)) as TMyPanel;
     // if Panel=nil then continue;
     // GiveMeName(Panel,fDA[i]);
      Lab:=f2410.FindComponent('n'+IntToStr(i)) as TLabel;
      if Lab=nil then continue;
      Lab.Caption:=fip[i];
    end;
  end;
end;

procedure Tf2410.Timer1Timer(Sender: TObject);
begin
  SetValues(false);
end;

procedure Tf2410.FormActivate(Sender: TObject);
begin
  SetValues(true);
end;

end.
