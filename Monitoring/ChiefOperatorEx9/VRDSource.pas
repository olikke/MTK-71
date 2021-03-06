unit VRDSource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XiButton,BDRecord,Global,Manager_EM7302,Container_EM7302,idGlobal,
  ExtCtrls;

type
  TfVRDs = class(TForm)
    start: TXiButton;
    ch1: TXiButton;
    ch2: TXiButton;
    ch3: TXiButton;
    ch4: TXiButton;
    ch5: TXiButton;
    ch6: TXiButton;
    ch7: TXiButton;
    ch8: TXiButton;
    ch9: TXiButton;
    ch10: TXiButton;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ch1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_VRD;
    procedure ChangeMonitoring(Source:byte);
  private
    { Private declarations }
  public
    LastSource:byte;
  end;

var
  fVRDs: TfVRDs;
  

implementation

uses Main;

{$R *.dfm}

procedure TfVRDs.ch1Click(Sender: TObject);
begin
  mEM7302[1].ExternalCommand(TI,16,(Sender as TXiButton).Tag);
end;

procedure TfVRDs.ChangeMonitoring(Source: Byte);
var Button:TXiButton;
begin
  if LastSource<>17 then
  begin
    Button:=fVRDs.FindComponent('ch'+IntToStr(LastSource+1)) as TXiButton;
    if Button<>nil then Button.ColorScheme:=csNeoSilver;
  end;
  Button:=fVRDs.FindComponent('ch'+IntToStr(Source+1)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSky;
  LastSource:=Source;
end;

procedure TfVRDs.ServMsd(var Msg: TMessage);
begin
  case Msg.WParam of
    0: ChangeMonitoring(Msg.LParam);
  end;
end;

procedure TfVRDs.startClick(Sender: TObject);
begin
  if fMain.UDPServer1.Active then
  try fMain.UDPServer1.SendBuffer(IP24081,fMain.UDPServer1.DefaultPort,ToBytes(1));
  except end;
  if fMain.UDPServer2.Active then
  try fMain.UDPServer2.SendBuffer(IP24082,fMain.UDPServer2.DefaultPort,ToBytes(1));
  except end;
  close;
end;

procedure TfVRDs.Timer1Timer(Sender: TObject);
begin
if (getkeyState(VK_ESCAPE)<0) or (getkeyState(VK_RBUTTON)<0) then close;
end;

procedure TfVRDs.FormActivate(Sender: TObject);
var i:integer;
    NEXT:integer;
    Button:TXiButton;
    KUch:byte;
begin
NEXT:=1;
  Button:=fVRDs.FindComponent('ch1') as TXiButton;
  if Button<>nil then
  begin
    Button.Caption :='ch1'+'     '+'LANDING';
    Button.ShowHint:=true;
    Button.Hint    :='ch1  LANDING';
    Button.Left    :=PositionVRD[NEXT].pLEFT;
    Button.Top     :=PositionVRD[NEXT].pTop;
    INC(NEXT);
  end;
  Button:=fVRDs.FindComponent('ch2') as TXiButton;
  if Button<>nil then
  begin
    Button.Caption :='ch2'+'     '+'MULTISCREEN';
    Button.ShowHint:=true;
    Button.Hint    :='ch2  MULTISCREEN';
    Button.Left    :=PositionVRD[NEXT].pLEFT;
    Button.Top     :=PositionVRD[NEXT].pTop;
    INC(NEXT);
  end;
  for i:=3 to 10 do
  begin
    KUch:=KUToport[i-2];
    Button:=fVRDs.FindComponent('ch'+IntToStr(i)) as TXiButton;
    if Button<>nil then
    begin
      Button.Visible:=bdKU[KUch].Use;
      if bdKU[KUch].Use then
      begin
        Button.Caption :=' ch'+IntToStr(i)+'  '+TRIM(bdKU[KUch].Name)+'  '+'('+TRIM(bdKU[KUch].PName)+')';
        Button.ShowHint:=true;
        Button.Hint    :='ch'+IntToStr(i)+'  '+bdKU[KUch].Name+' ('+ bdKU[KUch].PName+')'+#10#13+'TM-2221-2 '+TRIM(bdKU[KUch].Position);
        Button.Left    :=PositionVRD[NEXT].pLEFT;
        Button.Top     :=PositionVRD[NEXT].pTop;
        INC(NEXT);
      end;
    end;
  end;
  if NEXT>10 then exit;
  if NEXT mod 2 = 1 then Start.Top:=PositionVRD[NEXT-1].pTop+40
  else begin
    Start.Top  :=PositionVRD[NEXT].pTop;
    Start.Left :=PositionVRD[NEXT].pLEFT;
    Start.Width:=201;
  end; 
  Height   :=Start.Top+90;
  EM7302[1].VRDHandle(fVRDs.Handle);
end;

procedure TfVRDs.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EM7302[1].VRDHandle(0);
end;

end.
