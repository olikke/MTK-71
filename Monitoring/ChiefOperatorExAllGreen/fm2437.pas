unit fm2437;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,bdRecord,Manager_EM2437,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, XiButton,Container_EM2437, XiPanel,Global;

type
  Tf2437 = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    e1: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    m3: TEdit;
    m4: TEdit;
    m2: TEdit;
    m1: TEdit;
    m5: TEdit;
    m6: TEdit;
    m7: TEdit;
    m8: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    e7: TEdit;
    e8: TEdit;
    e9: TEdit;
    e10: TEdit;
    e11: TEdit;
    e12: TEdit;
    e13: TEdit;
    e14: TEdit;
    e15: TEdit;
    e16: TEdit;
    Panel1: TPanel;
    Panel5: TPanel;
    i2: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    Edit16: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Panel7: TPanel;
    out1: TShape;
    Panel8: TPanel;
    out3: TShape;
    Panel9: TPanel;
    out5: TShape;
    Panel10: TPanel;
    out7: TShape;
    Panel11: TPanel;
    out2: TShape;
    Panel12: TPanel;
    out4: TShape;
    Panel13: TPanel;
    out6: TShape;
    Panel14: TPanel;
    out8: TShape;
    Panel15: TPanel;
    Panel16: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel17: TPanel;
    RichEdit1: TRichEdit;
    Panel18: TPanel;
    Panel19: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel20: TPanel;
    XiButton5: TXiButton;
    XiButton6: TXiButton;
    XiButton7: TXiButton;
    p1: TPanel;
    t9: TEdit;
    t10: TEdit;
    u9: TUpDown;
    u10: TUpDown;
    b1: TXiButton;
    t11: TEdit;
    t12: TEdit;
    u11: TUpDown;
    u12: TUpDown;
    b2: TXiButton;
    p2: TPanel;
    t13: TEdit;
    t14: TEdit;
    u13: TUpDown;
    u14: TUpDown;
    b3: TXiButton;
    t15: TEdit;
    t16: TEdit;
    u15: TUpDown;
    u16: TUpDown;
    b4: TXiButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure XiButton7Click(Sender: TObject);
    procedure XiButton5Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure XiButton6Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2437;
    procedure SetValue;
    procedure SetNoValue;
    procedure TableVisible(vis:boolean);
    procedure SetIdentification;
    procedure SetCorrection(ChNumb:byte);
    procedure SetVideo;
    procedure LoadParameterFromDataBase;
  private
    Dev_ID:byte;
  public
    LastDataExh:boolean;
    First:boolean;
    u1,u2:boolean;
    procedure fNumber(n:byte);
  end;

var
  f2437: Tf2437;
  ss:String;

implementation

{$R *.dfm}

procedure Tf2437.fNumber(n: Byte);
begin
  Dev_ID:=n;
end;

procedure Tf2437.SetVideo;
begin
  if u1 then out1.Brush.Color:=EM2437[Dev_ID].ColorChannel1;
  if u2 then out5.Brush.Color:=EM2437[Dev_ID].ColorChannel3;
end;

procedure Tf2437.SetIdentification;
begin
  E2.Text   :='  '+IntToStr(EM2437[Dev_ID].DeviceTypeCode);
  E3.Text   :='  '+IntToStr(EM2437[Dev_ID].HardwareVersion);
  E4.Text   :='  '+IntToStr(EM2437[Dev_ID].SoftwareVersion);
  E5.Text   :='  '+IntToStr(EM2437[Dev_ID].SerialNumber);
  E6.Text   :='  '+DateToStr(EM2437[Dev_ID].DeviceMDate);
  if EM2437[Dev_ID]<>nil then
  if EM2437[Dev_ID].DataExh then SetValue else SetNoValue;
end;

procedure Tf2437.SetCorrection(ChNumb: Byte);
begin
  case ChNumb of
    1:
      begin
        if not EM2437[Dev_ID].Use1 then exit;
        E9.Text :='  '+IntToStr(EM2437[Dev_ID].GainFactor1);
        E10.Text:='  '+IntToStr(EM2437[Dev_ID].Equalization1);
      end;
    2:
      begin
        if not EM2437[Dev_ID].Use1 then exit;
        E11.Text:='  '+IntToStr(EM2437[Dev_ID].GainFactor2);
        E12.Text:='  '+IntToStr(EM2437[Dev_ID].Equalization2);
      end;
    3:
      begin
        if not EM2437[Dev_ID].Use2 then exit;
        E13.Text:='  '+IntToStr(EM2437[Dev_ID].GainFactor3);
        E14.Text:='  '+IntToStr(EM2437[Dev_ID].Equalization3);
      end;
    4:
      begin
        if not EM2437[Dev_ID].Use2 then exit;
        E15.Text:='  '+IntToStr(EM2437[Dev_ID].GainFactor4);
        E16.Text:='  '+IntToStr(EM2437[Dev_ID].Equalization4);
      end;
  end;

end;

procedure Tf2437.TableVisible(vis: Boolean);
var i:integer;
    Edit:TEdit;
begin
  if not vis then
  begin
    e1.Text :='  NO';
    e1.Color:=_Red;
  end else
  begin
    e1.Text :='  YES';
    e1.Color:=_Green;
  end;
  LastDataExh:=vis;
  if not vis then First:=true;
  for i:=2 to 16 do
  begin
    if (i=7) or (i=8) then continue;
    Edit:=f2437.FindComponent('e'+IntToStr(i)) as TEdit;
    if Edit<>nil then
    begin
      Edit.Enabled:=vis;
      if not vis then
      Edit.Text   :='';
    end;
  end;
end;

procedure Tf2437.XiButton5Click(Sender: TObject);
var F: file of T2437Corr;
    i: integer;
begin
  if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'
                            +#13#10'Action it is irreversible.You are really sure?','ATTENTION!',
                            MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    bd2437[Dev_ID][1].GainFactor  :=u9.Position;
    bd2437[Dev_ID][1].Equalization:=u10.Position;
    bd2437[Dev_ID][2].GainFactor  :=u11.Position;
    bd2437[Dev_ID][2].Equalization:=u12.Position;
    bd2437[Dev_ID][3].GainFactor  :=u13.Position;
    bd2437[Dev_ID][3].Equalization:=u14.Position;
    bd2437[Dev_ID][4].GainFactor  :=u15.Position;
    bd2437[Dev_ID][4].Equalization:=u16.Position;
    AssignFile(F, ExtractFilePath(ParamStr(0))+'EM2437.mtk');
    Rewrite(F);
    try
      for i:= 1 to 4 do Write (F, bd2437[i]);
    finally
      CloseFile(F)
    end
  end
end;

procedure Tf2437.XiButton6Click(Sender: TObject);
begin
  if Application.MessageBox('Values of the established parameters will be restored according to a database.'
                             +#13#10'You are really sure?','ATTENTION!',
                             MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  LoadParameterFromDataBase;
  if EM2437[Dev_ID].Use1 then
  begin
    b1Click(self);
    b2Click(self);
  end;
  if EM2437[Dev_ID].Use2 then
  begin
    b3Click(self);
    b4Click(self);
  end;
end;

procedure Tf2437.XiButton7Click(Sender: TObject);
begin
  if Application.MessageBox('Values of the parameters will be restored according to a database.'
                            +#13#10'You are really sure?','ATTENTION!',
                            MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    if EM2437[Dev_ID]<>nil then EM2437[Dev_ID].PermissionToChange:=false;
    Panel18.Visible  :=false;
    f2437.BorderIcons:=[biSystemMenu];
  end;
end;

procedure Tf2437.SetValue;
begin
  if not LastDataExh then TableVisible(true);
  if First then
  begin
    First:=false;
    SetIdentification;
    SetCorrection(1);
    SetCorrection(2);
    SetCorrection(3);
    SetCorrection(4);
    SetVideo;
  end;
end;

procedure Tf2437.SetNoValue;
begin
  if LastDataExh then TableVisible(false);
end;

procedure Tf2437.ServMsd(var Msg: TMessage);
var str:string;
begin
  str:=FormatDateTime('hh:nn:ssss.zz:',Now);
  case Msg.WParam of
    INTEGER(UnknownCommand)   : begin str:=str+#09+'Unknown command'+#09+#09;     end;
    INTEGER(StatusOfDevice)   : begin str:=str+#09+'Status of device'+#09+#09;
                                      if EM2437[Dev_ID]<>nil then
                                        if EM2437[Dev_ID].DataExh then SetValue
                                                                  else SetNoValue;  end;
    INTEGER(StatusOfVideo)    : begin str:=str+#09+'Status of video'+#09+#09;    SetVideo;  end;
    INTEGER(StatusOfFeed)     : begin str:=str+#09+'Status of feed'+#09+#09;      end;
    INTEGER(RunningTime)      : begin str:=str+#09+'Running time'+#09+#09;        end;
    INTEGER(Identification)   : begin str:=str+#09+'Identification'+#09+#09+#09; SetIdentification; end;
    INTEGER(CorrectionCh1)    : begin str:=str+#09+'Correction of channel 1'+#09;SetCorrection(1);  end;
    INTEGER(CorrectionCh2)    : begin str:=str+#09+'Correction of channel 2'+#09;SetCorrection(2);  end;
    INTEGER(CorrectionCh3)    : begin str:=str+#09+'Correction of channel 3'+#09;SetCorrection(3);  end;
    INTEGER(CorrectionCh4)    : begin str:=str+#09+'Correction of channel 4'+#09;SetCorrection(4);  end;
    INTEGER(StatusOfFeed11)   : begin str:=str+#09+'Status of feed 11'+#09+#09;   end;
    INTEGER(StatusOfFeed12)   : begin str:=str+#09+'Status of feed 12'+#09+#09;   end;
    INTEGER(StatusOfFeed21)   : begin str:=str+#09+'Status of feed 21'+#09+#09;   end;
    INTEGER(StatusOfFeed22)   : begin str:=str+#09+'Status of feed 22'+#09+#09;   end;
    INTEGER(ThresholdOfFeed11): begin str:=str+#09+'Threshold of feed 11'+#09+#09;end;
    INTEGER(ThresholdOfFeed12): begin str:=str+#09+'Threshold of feed 12'+#09+#09;end;
    INTEGER(ThresholdOfFeed21): begin str:=str+#09+'Threshold of feed 21'+#09+#09;end;
    INTEGER(ThresholdOfFeed22): begin str:=str+#09+'Threshold of feed 22'+#09+#09;end;
    INTEGER(MaskOfVideo)      : begin str:=str+#09+'Mask of video signal'+#09+#09;end;
  end;
  case Msg.LParam of
    INTEGER(Success)          : str:=str+'- success.';
    INTEGER(NoReply)          : str:=str+'- no reply.';
    INTEGER(NoSend)           : str:=str+'- no send.';
    INTEGER(ErrorCheckSum)    : str:=str+'- error of checksum.';
    INTEGER(Error1)           : str:=str+'- error 1.';
    INTEGER(Error2)           : str:=str+'- error 2.';
    INTEGER(Error3)           : str:=str+'- error 3.';
  end;
  RichEdit1.Lines.Add(str);
end;

procedure Tf2437.b1Click(Sender: TObject);
begin
  if mEM2437<>nil then mEM2437.ExternalCommand(CorrectionCh1,true,u9.Position,true,u10.Position,Dev_ID);
end;

procedure Tf2437.b2Click(Sender: TObject);
begin
  if mEM2437<>nil then mEM2437.ExternalCommand(CorrectionCh2,true,u11.Position,true,u12.Position,Dev_ID);
end;

procedure Tf2437.b3Click(Sender: TObject);
begin
  if mEM2437<>nil then
  mEM2437.ExternalCommand(CorrectionCh3,true,u13.Position,true,u14.Position,Dev_ID);
end;

procedure Tf2437.b4Click(Sender: TObject);
begin
  if mEM2437<>nil then mEM2437.ExternalCommand(CorrectionCh4,true,u15.Position,true,u16.Position,Dev_ID);
end;

procedure Tf2437.Button1Click(Sender: TObject);
begin
if mEM2437<>nil then mEM2437.ExternalCommand(StatusOfVideo,false,0,false,0,Dev_ID);
end;

procedure Tf2437.FormActivate(Sender: TObject);
var i:integer;
begin
 for i:=1 to 4 do
 if f2437.FindComponent('i'+IntToStr(i))<>nil then
 with TImage(f2437.FindComponent('i'+IntToStr(i))).Canvas do
 begin
   if i<>4 then Brush.Color:=clMedGray
           else Brush.Color:=clBlack;
   FillRect(TImage(f2437.FindComponent('i'+IntToStr(i))).ClientRect);
 end;
 Panel4.SetFocus;
 if EM2437[Dev_ID]<>nil then
 begin
   if EM2437[Dev_ID].Use1 then
   begin
     u1              :=true;
     out1.Brush.Color:=_Red;
     out1.Hint       :=EM2437[Dev_ID].Name1;
   end else                                                             
   begin
     for i:=1 to 4 do
     if f2437.FindComponent('e'+IntToStr(8+i))<>nil then
     begin
       TEdit(f2437.FindComponent('e'+IntToStr(8+i))).Text:='  no use';
       TEdit(f2437.FindComponent('e'+IntToStr(8+i))).Color:=clMedGray;
     end;
     p1.Visible:=false;
     u1        :=false;
   end;
   if EM2437[Dev_ID].Use2 then
   begin
     out5.Brush.Color:=_Red;
     out5.Hint       :=EM2437[Dev_ID].Name2;
     u2              :=true;
   end else
   begin
     for i:=1 to 4 do
     if f2437.FindComponent('e'+IntToStr(12+i))<>nil then
     begin
       TEdit(f2437.FindComponent('e'+IntToStr(12+i))).Text:='  no use';
       TEdit(f2437.FindComponent('e'+IntToStr(12+i))).Color:=clMedGray;
     end;
     p2.Visible:=false;
     u2        :=false;
   end;
 end;
 LastDataExh:=false;
 First      :=true;
 if EM2437[Dev_ID]<>nil then  EM2437[Dev_ID].FormHandle:=f2437.Handle;
 if EM2437[Dev_ID]<>nil then
   if EM2437[Dev_ID].DataExh then SetValue else SetNoValue;
end;

procedure Tf2437.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EM2437[Dev_ID]<>nil then  EM2437[Dev_ID].FormHandle:=0;
end;

procedure Tf2437.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    Panel18.Visible  :=true;
    f2437.BorderIcons:=[];
    if EM2437[Dev_ID]<>nil then EM2437[Dev_ID].PermissionToChange:=true;
    LoadParameterFromdataBase;
  end
   else ss:=''
end;

procedure Tf2437.LoadParameterFromDataBase;
begin
    u9.Position :=bd2437[Dev_ID][1].GainFactor;
    u10.Position:=bd2437[Dev_ID][1].Equalization;
    u11.Position:=bd2437[Dev_ID][2].GainFactor;
    u12.Position:=bd2437[Dev_ID][2].Equalization;
    u13.Position:=bd2437[Dev_ID][3].GainFactor;
    u14.Position:=bd2437[Dev_ID][3].Equalization;
    u15.Position:=bd2437[Dev_ID][4].GainFactor;
    u16.Position:=bd2437[Dev_ID][4].Equalization;
end;

end.
