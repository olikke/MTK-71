unit fm7302;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XiPanel, StdCtrls, ExtCtrls, MyPanel, XiButton, ComCtrls,Container_EM7302,
  Global,BDRecord,Manager_EM7302,Client_EM7212;

type
  TfKumo = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    a1: TEdit;
    e1: TEdit;
    a2: TEdit;
    a3: TEdit;
    a4: TEdit;
    a5: TEdit;
    a6: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    Panel1: TPanel;
    Panel5: TPanel;
    i2: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    XiPanel1: TXiPanel;
    in1: TXiButton;
    k1: TMyPanel;
    k2: TMyPanel;
    k3: TMyPanel;
    k4: TMyPanel;
    k5: TMyPanel;
    k6: TMyPanel;
    k7: TMyPanel;
    k8: TMyPanel;
    k9: TMyPanel;
    k10: TMyPanel;
    k11: TMyPanel;
    k12: TMyPanel;
    k13: TMyPanel;
    k14: TMyPanel;
    k15: TMyPanel;
    k16: TMyPanel;
    in2: TXiButton;
    in3: TXiButton;
    in4: TXiButton;
    in5: TXiButton;
    in6: TXiButton;
    in7: TXiButton;
    in8: TXiButton;
    in9: TXiButton;
    in10: TXiButton;
    in11: TXiButton;
    in12: TXiButton;
    in13: TXiButton;
    in14: TXiButton;
    in15: TXiButton;
    in16: TXiButton;
    p1: TMyPanel;
    out1: TXiButton;
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
    p15: TMyPanel;
    p16: TMyPanel;
    out2: TXiButton;
    out3: TXiButton;
    out4: TXiButton;
    out5: TXiButton;
    out6: TXiButton;
    out7: TXiButton;
    out8: TXiButton;
    out9: TXiButton;
    out10: TXiButton;
    out11: TXiButton;
    out12: TXiButton;
    out13: TXiButton;
    out14: TXiButton;
    out15: TXiButton;
    out16: TXiButton;
    in00: TXiPanel;
    i0: TImage;
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    RichEdit1: TRichEdit;
    Timer1: TTimer;
    c1: TCheckBox;
    c2: TCheckBox;
    c3: TCheckBox;
    c4: TCheckBox;
    c5: TCheckBox;
    c6: TCheckBox;
    c7: TCheckBox;
    c8: TCheckBox;
    c9: TCheckBox;
    c10: TCheckBox;
    c11: TCheckBox;
    c12: TCheckBox;
    c13: TCheckBox;
    c14: TCheckBox;
    c15: TCheckBox;
    c16: TCheckBox;
    procedure in1Click(Sender: TObject);
    procedure out1Click(Sender: TObject);
    procedure c1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetValues(First:boolean);
    procedure SetNoValues;
    procedure TableVisible(vis:boolean);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_KUMO;
    procedure RepaintTable;
    procedure PaintCommutation(DestNumb:byte);
    procedure ChangeCommutation(SourceNumb:byte);
  private
    LastDataExh:boolean;
    Commutation:T25;
    LastDestin,LastSource:byte;
    bd7210     :array [0..13] of Tb7210;
    Numb:integer;
  public
    procedure fNumber(n:integer);
  end;

var
  fKumo: TfKumo;

implementation

{$R *.dfm}

procedure TfKumo.fNumber(n: Integer);
begin
  numb:=n;
  EM7302[numb].FormHandle:=self.Handle;
end;

procedure TfKumo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EM7302[Numb]<>nil then EM7302[Numb].FormHandle:=0;
end;

procedure TfKumo.ChangeCommutation(SourceNumb: Byte);
begin
  if not (SourceNumb in [1..16]) then exit;
  if LastSource=SourceNumb then exit;
  mEM7302[Numb].ExternalCommand(TI,LastDestin,SourceNumb);
end;

procedure TfKumo.in1Click(Sender: TObject);
begin
  ChangeCommutation((Sender as TXiButton).Tag);
end;

procedure TfKumo.PaintCommutation(DestNumb: Byte);
var kNumb:byte;
    Button:TXiButton;
begin
  if not (DestNumb  in [1..16]) then exit;
  if DestNumb=LastDestin then exit;
  Button:=fKumo.FindComponent('out'+IntToStr(DestNumb)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSky;
  Button:=fKumo.FindComponent('out'+IntToStr(LastDestin)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSilver;
  LastDestin:=DestNumb;
  kNumb:=Commutation[DestNumb-1]+1;
  if not (kNumb in [1..16]) then exit;
  if LastSource=kNumb then exit;
  Button:=fKumo.FindComponent('in'+IntToStr(kNumb)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSky;
  Button:=fKumo.FindComponent('in'+IntToStr(LastSource)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSilver;
  LastSource:=kNumb;
end;

procedure TfKumo.out1Click(Sender: TObject);
begin
  PaintCommutation((Sender as TXiButton).Tag);
end;

procedure TfKumo.RepaintTable;
var i,j:integer;
    y1,y2:integer;
    Button:TXiButton;
    CheckBox:TCheckBox;
begin
  Commutation:=EM7302[numb].TableOfCommutation;

  i0.Canvas.Lock;
  with i0.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(i0.ClientRect);
    Pen.Color:=clBlue;
    Pen.Width:=2;
    Pen.Style:=psSolid;
    for i:=0 to 15 do
    begin
      CheckBox:=fKumo.FindComponent('c'+IntToStr(i+1)) as TCheckBox;
      if CheckBox<>nil then
      if not CheckBox.Checked then continue;
      Button:=fKumo.FindComponent('out'+IntToStr(i+1)) as TXiButton;
      if Button<>nil then y1:=Button.Top+Button.Height div 2 - in00.Top
                     else y1:=0;
      j:=Commutation[i];
      Button:=fKumo.FindComponent('in'+IntToStr(j+1)) as TXiButton;
      if Button<>nil then y2:=Button.Top+Button.Height div 2 - in00.Top
                     else y2:=0;
      MoveTo(0,y2);
      LineTo(i0.Width,y1);
      if LastDestin=i+1 then
      if LastSource<>j+1 then
      begin
        Button:=fKumo.FindComponent('in'+IntToStr(j+1)) as TXiButton;
        if Button<>nil then Button.ColorScheme:=csNeoSky;
        Button:=fKumo.FindComponent('in'+IntToStr(LastSource)) as TXiButton;
        if Button<>nil then Button.ColorScheme:=csNeoSilver;
          LastSource:=j+1;
      end;  
    end;
  end;
  i0.Canvas.Unlock;
end;

procedure TfKumo.ServMsd(var Msg: TMessage);
var str:string;
begin
  str:=FormatDateTime('hh:nn:ssss.zzzz:',Now);
  case Msg.WParam of
    INTEGER(BK_I): str:=str+#09+'BK_I'+#09;
    INTEGER(BK_N): begin str:=str+#09+'BK_N'+#09;  e2.Text:=EM7302[numb].SystemName; end;
    INTEGER(BK_T): begin str:=str+#09+'BK_T'+#09;  e3.Text:=EM7302[numb].Software;   end;
    INTEGER(BK_R): begin str:=str+#09+'BK_R'+#09;  e3.Text:=EM7302[numb].Software;   end;
    INTEGER(BK_D): begin str:=str+#09+'BK_D'+#09; end;
    INTEGER(QD_B):
    begin
      str:=str+#09+'QD_B'+#09;
      if Msg.LParam=INTEGER(Success) then RepaintTable;
    end;
    INTEGER(QD_N): str:=str+#09+'QD_N'+#09;
    INTEGER(TI)  : str:=str+#09+'TI'+#09;
    INTEGER(QN_S): begin str:=str+#09+'QN_S'+#09;   end;
    INTEGER(QN_D): begin str:=str+#09+'QN_D'+#09;   end;
    INTEGER(MA_C): begin str:=str+#09+'MAC'+#09;   e4.Text:=EM7302[numb].ip;
                         e5.Text:=EM7302[numb].mask;     e6.Text:=EM7302[numb].MAC; end;
  end;
  case Msg.LParam of
    INTEGER(Success)      : str:=str+'Success';
    INTEGER(NoReply)      : str:=str+'No answer';
    INTEGER(NoSend)       : str:=str+'Send error';
    INTEGER(ErrorCheckSum): str:=str+'Error of CheckSum';
    INTEGER(NotOpened)    : str:=str+'Socket not open';
    INTEGER(NotIdent)     : str:=str+'Command not identify';
    INTEGER(Processing)   : str:=str+'In progress';
  end;
  RichEdit1.Lines.Add(str);
end;

procedure TfKumo.c1Click(Sender: TObject);
begin
  if fKumo.FindComponent('out'+IntToStr((Sender as TCheckBox).Tag))<>nil then
     TXiButton(fKumo.FindComponent('out'+IntToStr((Sender as TCheckBox).Tag))).Enabled:=(Sender as TCheckBox).Checked;
end;

procedure TfKumo.FormActivate(Sender: TObject);
var i:integer;
begin
  case Numb of
     1: for i:=0 to 13 do bd7210[i]:=bd7210_1[i];
     2: for i:=0 to 13 do bd7210[i]:=bd7210_2[i];
  end;
  LastDestin:=255;
  LastSource:=255;
  for i:=1 to 3 do
  begin
    if fKumo.FindComponent('i'+IntToStr(i))= nil then continue;
    with TImage(fKumo.FindComponent('i'+IntToStr(i))).Canvas do
    begin
      Brush.Color:=clMedGray;
      FillRect(TImage(fKumo.FindComponent('i'+IntToStr(i))).ClientRect);
    end;
  end;
  with i0.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(i0.ClientRect);
  end;
  if EM7302[numb]<>nil then
  if EM7302[numb].DataExh then SetValues(true)
                    else SetNoValues
                    else SetNoValues;
  Panel7.SetFocus;
  LastDataExh:=false;
  for i:=0 to 13 do
  if bd7210[i].Use then
  begin
    if fKumo.FindComponent('p'+IntToStr(i+1))<>nil then
    begin
      TMyPanel(fKumo.FindComponent('p'+IntToStr(i+1))).Caption:=bd7210[i].SName;
      TMyPanel(fKumo.FindComponent('p'+IntToStr(i+1))).Hint:=bd7210[i].Name;
      TMyPanel(fKumo.FindComponent('p'+IntToStr(i+1))).ShowHint:=true;
    end;
    if fKumo.FindComponent('c'+IntToStr(i+1))<>nil then
      TCheckBox(fKumo.FindComponent('c'+IntToStr(i+1))).Checked:=true;
  end else
  begin
    if fKumo.FindComponent('out'+IntToStr(i+1))<>nil then
      TXiButton(fKumo.FindComponent('out'+IntToStr(i+1))).Enabled:=false;
  end;
  if (Numb=1) then
  begin
    p15.Caption :=DeviceArr[d2322].Name;
    p15.ShowHint:=true;
    p15.Hint    :=DeviceArr[d2322].FullName+#10#13+DeviceArr[d2322].Name+DeviceArr[d2322].SchemeName;
    c15.Checked :=true;
    p16.Caption :=DeviceArr[d2408].Name;
    p16.ShowHint:=true;
    p16.Hint    :=DeviceArr[d2408].FullName+#10#13+DeviceArr[d2408].Name+DeviceArr[d2408].SchemeName;
    c16.Checked :=true;
  end else
  begin
    out15.Enabled:=false;
    out16.Enabled:=false;
    p15.Font.Height:=-14;
    p16.Font.Height:=-14;
  end;
  for i:=1 to 8 do
  if bdKU[KUToPort[i]].Use then
  begin
    if fKumo.FindComponent('k'+IntToStr(i+2))<>nil then
    begin
    TMyPanel(fKumo.FindComponent('k'+IntToStr(i+2))).Caption:=bdKU[KUToPort[i]].Name;
    TMyPanel(fKumo.FindComponent('k'+IntToStr(i+2))).Hint:=bdKU[KUToPort[i]].Name+' ('+ bdKU[KUToPort[i]].PName+')'
                                                               +#10#13+'TM-2221-2 '+TRIM(bdKU[KUToPOrt[i]].Position);
    TMyPanel(fKumo.FindComponent('k'+IntToStr(i+2))).ShowHint:=true;
    end;
  end else
    if fKumo.FindComponent('in'+IntToStr(i+2))<>nil then
      TXiButton(fKumo.FindComponent('in'+IntToStr(i+2))).Enabled:=false;
  k16.Caption:=p16.Caption;
  k16.ShowHint:=true;
  k16.Hint:=p16.Hint;
  Panel4.SetFocus;
end;

procedure TfKumo.TableVisible(vis: Boolean);
var i:integer;
    v:boolean;
begin
  LastDataExh:=vis;
  v:=vis;
  for i:=2 to 6 do
  if fKumo.FindComponent('a'+IntToStr(i))<>nil then
  TEdit(fKumo.FindComponent('a'+IntToStr(i))).Enabled:=v;
  for i:=2 to 11 do
  if fKumo.FindComponent('e'+IntToStr(i))<>nil then
  begin
    TEdit(fKumo.FindComponent('e'+IntToStr(i))).Enabled:=v;
    if not v then
    TEdit(fKumo.FindComponent('e'+IntToStr(i))).Text:='';
  end;
end;

procedure TfKumo.SetValues(First:boolean);
begin
  e1.Color:=_Green;
  e1.Text:='YES';
  if not LastDataExh then TableVisible(true);
  if First then
  begin
    e2.Text:=EM7302[Numb].SystemName;
    e3.Text:=EM7302[Numb].Software;
    e4.Text:=EM7302[Numb].ip;
    e5.Text:=EM7302[Numb].mask;
    e6.Text:=EM7302[NUmb].MAC;
  end;
end;

procedure TfKumo.SetNoValues;
begin
  e1.Color:=_Red;
  e1.Text:='NO';
  if LastDataExh then TableVisible(false);
end;

procedure TfKumo.Timer1Timer(Sender: TObject);
begin
  if EM7302[Numb]<>nil then
  if EM7302[Numb].DataExh then SetValues(false)
                    else SetNoValues
                    else SetNoValues;
end;

end.
