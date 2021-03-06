unit fm2409;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, MyPanel,Global,Container_TM2409;

type
  Tf2409 = class(TForm)
    d1: TMyPanel;
    d2: TMyPanel;
    d3: TMyPanel;
    d4: TMyPanel;
    d5: TMyPanel;
    d6: TMyPanel;
    d7: TMyPanel;
    d8: TMyPanel;
    Splitter1: TSplitter;
    Splitter20: TSplitter;
    Splitter25: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Splitter24: TSplitter;
    Splitter26: TSplitter;
    Splitter27: TSplitter;
    Splitter18: TSplitter;
    DE: TShape;
    Label1: TLabel;
    c1: TLabel;
    c2: TLabel;
    c3: TLabel;
    c4: TLabel;
    c5: TLabel;
    c6: TLabel;
    c7: TLabel;
    c8: TLabel;
    MyPanel17: TMyPanel;
    MyPanel18: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    MyPanel22: TMyPanel;
    MyPanel23: TMyPanel;
    MyPanel24: TMyPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SetValue(first:boolean);
    procedure SetNoValue;
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2409;
  private
    Number:integer;
  public
    procedure fNumber(n:integer);
  end;

var
  f2409: Tf2409;

implementation

{$R *.dfm}

procedure Tf2409.fNumber(n: Integer);
begin
  Number:=n;
end;

procedure Tf2409.ServMsd(var Msg: TMessage);
begin
  SetValue(false);
end;

procedure Tf2409.SetValue(first:boolean);
  procedure GiveMeName(Comp:TMyPanel;numb:TDeviceNameArr);
  begin
    Comp.Caption :='  '+DeviceArr[numb].Name+' '+DeviceArr[numb].SchemeName;
    Comp.Hint    :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.ShowHint:=true;
  end;
var   fUse      :TUse;
      fState    :TComSt;
      fDA       :TDA;
      fDataExh  :boolean;
      i         :integer;
begin
  if not Number in [1..2] then exit;
  fUse    :=TM2409[Number].Use;
  fState  :=TM2409[Number].ComState;
  fDataExh:=TM2409[Number].DataExh;
  fDA     :=TM2409[Number].DA;
  for i:=1 to 8 do
    if f2409.FindComponent('d'+IntToStr(i))<>nil then
    if fState[i]<>dsGray then
       TMyPanel(f2409.FindComponent('d'+IntToStr(i))).DeviceState:=dsGreen;//fState[i];
  if fDataExh then DE.Brush.Color:=_Green else DE.Brush.Color:=_Green;//_Red;
  if First then
    for i:=1 to 8 do
      if fUSE[i] then
        if f2409.FindComponent('d'+IntToStr(i))<>nil then
        GiveMeName(TMyPanel(f2409.FindComponent('d'+IntToStr(i))),fDA[i]);
end;

procedure Tf2409.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TM2409[Number].FormHandle:=0;
end;

procedure Tf2409.SetNoValue;
var i:integer;
begin
  for i:=1 to 8 do
    if f2409.FindComponent('d'+IntToStr(i))<>nil then
       TMyPanel(f2409.FindComponent('d'+IntToStr(i))).DeviceState:=dsGray;
  DE.Brush.Color:=clWhite;
end;

procedure Tf2409.FormActivate(Sender: TObject);
var i:integer;
begin
  if not Number in [1..2] then begin close; exit; end;
  for i:=1 to 8 do
  if f2409.FindComponent('c'+IntToStr(i))<>nil then
     TLabel(f2409.FindComponent('c'+IntToStr(i))).Caption:='COM'+IntToStr(Number+2)+IntToStr(i);
  if TM2409[Number]<>nil then
  begin
    SetValue(true);
    TM2409[Number].FormHandle:=f2409.Handle
  end else
    SetNoValue;
end;

end.
