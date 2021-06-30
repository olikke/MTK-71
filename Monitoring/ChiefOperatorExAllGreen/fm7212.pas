unit fm7212;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, XiPanel,Global,Client_EM7212,fm7302,Container_EM7210,
  MyPanel,fm7210;

type
  TfModulator = class(TForm)
    Im: TImage;
    XiPanel2: TXiPanel;
    Timer1: TTimer;
    RichEdit1: TRichEdit;
    p7212: TMyPanel;
    Label1: TLabel;
    p1: TMyPanel;
    p2: TMyPanel;
    p3: TMyPanel;
    p4: TMyPanel;
    p5: TMyPanel;
    p6: TMyPanel;
    p7: TMyPanel;
    p8: TMyPanel;
    p9: TMyPanel;
    p10: TMyPanel;
    p11: TMyPanel;
    p12: TMyPanel;
    p13: TMyPanel;
    p14: TMyPanel;
    x1: TMyPanel;
    X2: TMyPanel;
    x3: TMyPanel;
    x4: TMyPanel;
    x5: TMyPanel;
    x6: TMyPanel;
    x7: TMyPanel;
    x8: TMyPanel;
    x9: TMyPanel;
    x10: TMyPanel;
    x11: TMyPanel;
    x12: TMyPanel;
    x13: TMyPanel;
    x14: TMyPanel;
    X15: TMyPanel;
    X16: TMyPanel;
    X17: TMyPanel;
    p15: TMyPanel;
    p16: TMyPanel;
    p17: TMyPanel;
    procedure p16Click(Sender: TObject);
    procedure p15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure p17Click(Sender: TObject);
    procedure p1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_7212;
    procedure SetValues(First:boolean);
    procedure SetNoValues;
    procedure GiveName;
  private
    EM7212:TEM7212;
    startn,stopn:integer;
    fcom1,fcom2:string;
  public
    Device:TDeviceNameArr;
  end;

var
  fModulator: TfModulator;

implementation

uses UndegroundForm;

{$R *.dfm}

procedure TfModulator.GiveName;
var
    y,x,x0:integer;
    kn    :integer;
    Button:TMyPanel;
    i,j   :integer;
    str   :string;
    n15,n16,n17:TDeviceNameArr;
begin
  begin
    kn:=startn;
    x0:=p7212.Left;
    for i:=0 to 13 do
    begin
      if EM7210[kn].Use then
      for j:=1 to 2 do
      begin
        if j=1 then str:='p' else str:='x';
        Button:=fModulator.FindComponent(str+IntToStr(i+1)) as TMyPanel;
        if Button=nil then continue;
        Button.Enabled:=true;
        if j=1 then
        begin
          Button.Caption:=' TM-2226-1 '+EM7210[kn].Name;
          Button.ShowHint:=true;
          Button.Hint:=EM7210[kn].Hint;
          Button.Cursor:=crHandPoint;
          Button.Tag   :=kn;
        end;
      end else
      begin
        for j:=1 to 2 do
        begin
          if j=1 then str:='p' else str:='x';
          Button:=fModulator.FindComponent(str+IntToStr(i+1)) as TMyPanel;
          if Button=nil then continue;
          Button.Enabled:=false;
          if j=1 then
          begin
            Button.Caption:=' NOT USE';
            Button.ShowHint:=false;
            Button.Cursor:=crDefault;
          end;
        end;
      end;
      Button:=fModulator.FindComponent('p'+IntToStr(i+1)) as TMyPanel;
      if Button=nil then continue;
      y :=Button.Top+Button.Height div 2;
      x :=Button.Left+Button.Width;
      with IM.Canvas do
      begin
        Pen.Color:=clBlack;
        Pen.Width:=2;
        MoveTo(x,y);
        LineTo(x0,y);
      end;
      inc(kn);
    end;
    x:=p15.Left;
    y:=p15.Top+p15.Height div 2;
    with IM.Canvas do
    begin
      Pen.Color:=clBlack;
      Pen.Width:=2;
      MoveTo(x,y);
      LineTo(x0,y);
    end;
    y:=p16.Top+p16.Height div 2;
    with IM.Canvas do
    begin
      Pen.Color:=clBlack;
      Pen.Width:=2;
      MoveTo(x,y);
      LineTo(x0,y);
    end;
    y:=p17.Top+p17.Height div 2;
    with IM.Canvas do
    begin
      Pen.Color:=clBlack;
      Pen.Width:=2;
      MoveTo(x,y);
      LineTo(x0,y);
    end;
  end;
 case integer(Device) of
    integer(d72121): begin n15:=d24091; n16:=d24093; n17:=d73021; end;
    integer(d72122): begin n15:=d24093; n16:=d24091; n17:=d73022; end;
  end;
  p15.Caption:=' '+DeviceArr[n15].Name+' '+DeviceArr[n15].SchemeName;
  p15.Hint   :=DeviceArr[n15].FullName+#10#13+DeviceArr[n15].Name+DeviceArr[n15].SchemeName;
  p16.Caption:=' '+DeviceArr[n16].Name+' '+DeviceArr[n16].SchemeName;
  p16.Hint   :=DeviceArr[n16].FullName+#10#13+DeviceArr[n16].Name+DeviceArr[n16].SchemeName;
  p17.Caption:=' '+DeviceArr[n17].Name+' '+DeviceArr[n17].SchemeName;
  p17.Hint   :=DeviceArr[n17].FullName+#10#13+DeviceArr[n17].Name+DeviceArr[n17].SchemeName;
  Label1.Caption:=DeviceArr[device].SchemeName;
  if Device=d72121 then
  begin
    p15.Tag:=INTEGER(d24091);
    p16.Tag:=INTEGER(d24093);
    p17.Tag:=INTEGER(d73021);
  end else
  begin
    p15.Tag:=INTEGER(d24093);
    p16.Tag:=INTEGER(d24091);
    p17.Tag:=INTEGER(d73022);
  end;
  
end;

procedure TfModulator.SetValues(First:boolean);
  procedure SmartDeviceState(Panel:TMyPanel;ds:TState);
  begin
    if Panel.DeviceState<>ds then Panel.DeviceState:=ds;
  end;
var i,j   :integer;
    kn    :integer;
    str   :string;
    Button:TMyPanel;
begin

  if EM7212.EM7302State then
  begin
    SmartDeviceState(x17,dsGreen);
    SmartDeviceState(p17,dsGreen);
  end else
  begin
    SmartDeviceState(x17,dsRed);
    SmartDeviceState(p17,dsRed);
  end;
  if EM7212.COM1State then
  begin
    SmartDeviceState(x15,dsGreen);
    SmartDeviceState(p15,dsGreen);
  end else
  begin
    SmartDeviceState(x15,dsRed);
    SmartDeviceState(p15,dsRed);
  end;
  if EM7212.COM2State then
  begin
    SmartDeviceState(x16,dsGreen);
    SmartDeviceState(p16,dsGreen);
  end else
  begin
    SmartDeviceState(x16,dsRed);
    SmartDeviceState(p16,dsRed);
  end;
  kn:=startn;
  for i:=0 to 13 do
  begin
    if EM7210[kn].Use then
    for j:=1 to 2 do
    begin
      if j=1 then str:='p' else str:='x';
      Button:=fModulator.FindComponent(str+IntToStr(i+1)) as TMyPanel;
      if Button=nil then continue;
      if EM7210[kn].DataExh then SmartDeviceState(Button,dsGreen)
                            else SmartDeviceState(Button,dsgreen);
    end;
    inc(kn);
  end;
end;

procedure TfModulator.Timer1Timer(Sender: TObject);
begin
{  if EM7212<>nil then
  if EM7212.DataExh then SetValues(false)
                    else SetNoValues
                    else SetNoValues; }
end;

procedure TfModulator.SetNoValues;
  procedure SmartDeviceState(Panel:TMyPanel;ds:TState);
  begin
    if Panel.DeviceState<>ds then Panel.DeviceState:=ds;
  end;
var i,j   :integer;
    str   :string;
    Button:TMyPanel;
begin
   for i:=0 to 13 do
    begin
      if EM7210[i].Use then
      for j:=1 to 2 do
      begin
        if j=1 then str:='p' else str:='x';
        Button:=fModulator.FindComponent(str+IntToStr(i+1)) as TMyPanel;
        if Button=nil then continue;
        SmartDeviceState(Button,dsRed);
      end;
    end;
   for i:=15 to 17 do
     for j:=1 to 2 do
      begin
        if j=1 then str:='p' else str:='x';
        Button:=fModulator.FindComponent(str+IntToStr(i)) as TMyPanel;
        if Button=nil then continue;
        SmartDeviceState(Button,dsRed);
      end;
end;

procedure TfModulator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EM7212<>nil then EM7212.FormHandle:=0;
  EM7212:=nil;
end;

procedure TfModulator.p15Click(Sender: TObject);
begin
  Und.NextForm(TDeviceNameArr(p15.Tag));
  close;
end;

procedure TfModulator.p16Click(Sender: TObject);
begin
  Und.NextForm(TDeviceNameArr(p16.Tag));
  close;
end;

procedure TfModulator.p17Click(Sender: TObject);
begin
  Und.NextForm(TDeviceNameArr(p17.Tag));
  close;
end;

procedure TfModulator.p1Click(Sender: TObject);
begin
  if f7210=nil then Application.CreateForm(Tf7210,f7210);
  f7210.PostNumber:=(Sender as TMyPanel).Tag;
  f7210.ShowModal;
end;

procedure TfModulator.ServMsd(var Msg: TMessage);
var str:string;
begin
  str:=FormatDateTime('hh:nn:ssss.zz:',Now);
  case Msg.WParam of
    1: str:=str+#09+fcom1+#09;
    2: str:=str+#09+fcom2+#09;
  end;
  case Msg.LParam of
    INTEGER(Success)      : str:=str+'Success';
    INTEGER(NoReply)      : str:=str+'No answer';
    INTEGER(NoSend)       : str:=str+'Send error';
    INTEGER(ErrorCheckSum): str:=str+'Error of CheckSum';
    INTEGER(NotOpened)    : str:=str+'Socket not open';
    INTEGER(NotIdent)     : str:=str+'Command not identify';
    INTEGER(Processing)   : str:=str+'In progress';
    INTEGER(ERROR1)       : str:=str+'EM-7302-1 not connected';
    INTEGER(ERROR2)       : str:=str+'Missing SOH';
    INTEGER(ERROR3)       : str:=str+'Missing EOT';
    INTEGER(NeedToInit)   : str:=str+'Need to initialize device';
    INTEGER(InitSuccess)  : str:=str+'Device initialization was successful';
    INTEGER(InitNewDevice): str:=str+'New device found';
    INTEGER(needToRefresh): str:=str+'Need to update device settings';
    INTEGER(RefreshSuccess):str:=str+'Device configuration is complete';
    INTEGER(RefreshFail)  : str:=str+'Failed to configure the device'
  end;
  RichEdit1.Lines.Add(str);
end;

procedure TfModulator.FormActivate(Sender: TObject);
begin
  RichEdit1.Clear;
  case integer(Device) of
    integer(d72121): begin EM7212:=EM72121; startn:=0;  stopn:=13; end;
    integer(d72122): begin EM7212:=EM72122; startn:=14; stopn:=27; end;
  end;
  GiveName;
  fcom1:='COM1';
  fcom2:='COM2';
  if EM7212<>nil then
  begin
    EM7212.FormHandle:=fModulator.Handle;
    fcom1:=EM7212.Com1Name;
    fcom2:=EM7212.Com2Name;
  end;
  if EM7212<>nil then
  SetValues(True) else SetNoValues;
end;

end.
