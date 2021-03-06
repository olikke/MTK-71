unit fm2220;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,Container_TM2220,Client_EM5402,Global,
  Buttons,bdRecord;

type
  TfKU = class(TForm)
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
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit19: TEdit;
    Edit18: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
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
    e17: TEdit;
    e18: TEdit;
    e19: TEdit;
    Panel1: TPanel;
    Panel5: TPanel;
    i2: TImage;
    Label1: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    i3: TImage;
    Label2: TLabel;
    Panel9: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel10: TPanel;
    Panel11: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel12: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Panel13: TPanel;
    Panel14: TPanel;
    i5: TImage;
    Label5: TLabel;
    Panel15: TPanel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Panel16: TPanel;
    Panel17: TPanel;
    i6: TImage;
    Label6: TLabel;
    Panel18: TPanel;
    Button9: TButton;
    Button10: TButton;
    Panel19: TPanel;
    Panel20: TPanel;
    i7: TImage;
    Label7: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    i8: TImage;
    Label8: TLabel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    i9: TImage;
    Label9: TLabel;
    Panel27: TPanel;
    RichEdit1: TRichEdit;
    Label10: TLabel;
    eYCG: TEdit;
    udYCG: TUpDown;
    bYCG: TSpeedButton;
    Label11: TLabel;
    eYCE: TEdit;
    udYCE: TUpDown;
    bYCE: TSpeedButton;
    Label12: TLabel;
    eCCG: TEdit;
    udCCG: TUpDown;
    bCCG: TSpeedButton;
    Label13: TLabel;
    eCCE: TEdit;
    udCCE: TUpDown;
    bCCE: TSpeedButton;
    Panel28: TPanel;
    Button15: TButton;
    Button11: TButton;
    Button12: TButton;
    Timer2: TTimer;
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure bCCEClick(Sender: TObject);
    procedure bCCGClick(Sender: TObject);
    procedure bYCEClick(Sender: TObject);
    procedure bYCGClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_2220;
    procedure SetValues;
    procedure SetNoValues;
    procedure TableVisible(vis:boolean);
    procedure SetCommand(Command:T2220_Command;value:byte);
  private
    LastDataExh:boolean;
    Numb :integer;
  public
    procedure fNumber(n:byte);
  end;

var
  fKU: TfKU;
  ss:String;

implementation

{$R *.dfm}

procedure TfKU.fNumber(n: Byte);
begin
  Numb:=n;
end;

procedure TfKU.ServMsd(var Msg: TMessage);
var str:string;
begin
  str:=FormatDateTime('hh:nn:ssss.zzzz:',Now);
  case Msg.WParam of
    INTEGER(TVDon):        str:=str+#09+'TVD on';
    INTEGER(TVDoff):       str:=str+#09+'TVD off';
    INTEGER(LEDon):        str:=str+#09+'LED on';
    INTEGER(LEDoff):       str:=str+#09+'LED off';
    INTEGER(HEATERon):     str:=str+#09+'HEATER on';
    INTEGER(HEATERoff):    str:=str+#09+'HEATER off';
    INTEGER(HEATERauto):   str:=str+#09+'HEATER auto';
    INTEGER(FANon):        str:=str+#09+'FAN on';
    INTEGER(FANoff):       str:=str+#09+'FAN off';
    INTEGER(FANauto):      str:=str+#09+'FAN auto';
    INTEGER(TVDd):         str:=str+#09+'TVD diagnostic';
    INTEGER(YCG):          str:=str+#09+'YCG';
    INTEGER(YCE):          str:=str+#09+'YCE';
    INTEGER(CCG):          str:=str+#09+'CCG';
    INTEGER(CCE):          str:=str+#09+'CCE';
    INTEGER(Unknown):      str:=str+#09+'Unknown';
  end;
  case Msg.LParam of
    INTEGER(Success):      str:=str+#09+'Success';
    INTEGER(NoReply):      str:=str+#09+'No answer';
    INTEGER(NoSend):       str:=str+#09+'Send error';
    INTEGER(ErrorCheckSum):str:=str+#09+'Error of CheckSum';
    INTEGER(NotIdent):     str:=str+#09+'Command not identify';
    INTEGER(ERROR1):       str:=str+#09+'Device not identify';
    INTEGER(ERROR2):       str:=str+#09+'Mistake of performance';
  end;
  if TM2220[Numb].DataExh then SetValues else SetNoValues;
  RichEdit1.Lines.Add(str)
end;

procedure TfKU.SetCommand(Command: T2220_Command; value: Byte);
begin
  if Numb in [1..4] then EM5402[1].ExternalCommand(Numb,Command,value)
                    else EM5402[2].ExternalCommand(Numb-4,Command,value);
end;

procedure TfKU.SetNoValues;
begin
  if LastDataExh then TableVisible(false);
end;

procedure TfKU.TableVisible(vis: Boolean);
var i:integer;
begin
  LastDataExh:=vis;
  for i:=2 to 19 do
  if fKU.FindComponent('e'+IntToStr(i))<>nil then
  begin
    TEdit(fKU.FindComponent('e'+IntToStr(i))).Text:='';
    TEdit(fKU.FindComponent('e'+IntToStr(i))).Enabled:=vis;
    TEdit(fKU.FindComponent('e'+IntToStr(i))).Color:=clWhite
  end;
  Panel1.Enabled:=vis;
  if vis then
  begin
    e1.Color:=_Green;
    e1.Text :='  YES'
  end else
  begin
    e1.Color:=_Red;
    e1.Text :='  NO'
  end;
end;

procedure TfKU.Timer1Timer(Sender: TObject);
begin
  if TM2220[Numb].DataExh then SetValues else SetNoValues;
end;

procedure TfKU.Timer2Timer(Sender: TObject);
var TP:TPoint;
begin
if (getkeyState(VK_ESCAPE)<0) or (getkeyState(VK_RBUTTON)<0) then close;
end;

procedure TfKU.SetValues;
  procedure SmartEditColor(Edit:TEdit;Color:TColor);
  begin
    if Edit.Color<>Color then Edit.Color:=Color;
  end;
begin
  if not LastDataExh then TableVisible(true);
  if TM2220[numb].TVDon then
  begin
    e2.Text:='ON';
    SmartEditColor(e2,_Green)
  end else
  begin
    e2.Text:='OFF';
    SmarteditColor(e2,clSilver)
  end;
  e3.Text :=FloatToStrF(TM2220[numb].U,ffFixed,6,2);
  SmartEditColor(e3,TM2220[numb].ColorU);
  e4.Text :=FloatToStrF(TM2220[numb].Temp,ffFixed,6,2);
  SmartEditColor(e4,TM2220[numb].ColorTemp);
  if TM2220[numb].TempAuthentic then
  begin
    e5.Text:='YES';
    SmartEditColor(e5,_Green)
  end else
  begin
    e5.Text:='NO';
    SmartEditColor(e5,_Red)
  end;
  e6.Text :=FloatToStrF(TM2220[numb].Humidity,ffFixed,6,2);
  SmartEditColor(e6,TM2220[numb].ColorHumidity);
  if TM2220[numb].FAN then
  begin
    e7.Text :='ON';
    SmartEditColor(e7,_Green);
    e8.Text :=IntToStr(TM2220[numb].FANSpeed);
    SmartEditColor(e8,TM2220[numb].ColorFanSpeed);
  end else
  begin
    e7.Text :='OFF';
    SmartEditColor(e7,clSilver);
    e8.Text :='NO USE';
    SmartEditColor(e8,clSilver);
  end;
  if TM2220[numb].FANMode = auto then e9.Text:='AUTO'
                                 else e9.Text:='MANUAL';
  if TM2220[numb].Heater then
  begin
    e10.Text :='ON';
    SmartEditColor(e10,_Green);
    if TM2220[numb].HeaterAuthentic then
    begin
      e11.Text:='YES';
      SmartEditColor(e11,_Green)
    end else
    begin
      e11.Text:='NO';
      SmartEditColor(e11,_Red)
    end;
  end else
  begin
    e10.Text :='OFF';
    SmartEditColor(e10,_Gray);
    e11.Text :='NO USE';
    SmartEditColor(e11,_Gray);
  end;
  if TM2220[numb].HeaterMode = auto then e12.Text:='AUTO'
                                    else e12.Text:='MANUAL';
  if TM2220[numb].SSP then
  begin
    e13.Text:='YES';
    SmartEditColor(e13,_Green)
  end else
  begin
    e13.Text:='NO';
    SmartEditColor(e13,_Red)
  end;
  if TM2220[numb].ColorSign then
  begin
    e14.Text:='YES';
    SmartEditColor(e14,_Green)
  end else
  begin
    e14.Text:='NO';
    SmartEditColor(e14,_Red)
  end;
  if TM2220[numb].LED then e15.Text:='ON'
                      else e15.Text:='OFF';
  e16.Text :=IntToStr(TM2220[numb].YCG);
  e17.Text :=IntToStr(TM2220[numb].YCE);
  e18.Text :=IntToStr(TM2220[numb].CCG);
  e19.Text :=IntToStr(TM2220[numb].CCE);
end;

procedure TfKU.bCCEClick(Sender: TObject);
begin
  SetCommand(CCE,udCCE.Position);
end;

procedure TfKU.bCCGClick(Sender: TObject);
begin
  SetCommand(CCG,udCCG.Position);
end;

procedure TfKU.Button10Click(Sender: TObject);
begin
  SetCommand(LEDoff,0);
end;

procedure TfKU.Button11Click(Sender: TObject);
begin
  if Application.MessageBox('Values of the established parameters will be restored according to a database.'
                             +#13#10'You are really sure?','ATTENTION!',
                             MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    udYCG.Position:=bdKU[Numb].YCG;
    udYCE.Position:=bdKU[Numb].YCE;
    udCCG.Position:=bdKU[Numb].CCG;
    udCCE.Position:=bdKU[Numb].CCE;
    bYCG.Click;
    bYCE.Click;
    bCCG.Click;
    bCCE.Click;
  end;
end;

procedure TfKU.Button12Click(Sender: TObject);
begin
  if Application.MessageBox('Values of the parameters will be restored according to a database.'
                            +#13#10'You are really sure?','ATTENTION!',
                            MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    TM2220[Numb].PermissionToChange:=false;
    Panel19.Top:=305+1000;
    Panel22.Top:=380+1000;
    Panel28.Top:=455+1000;
    fKU.BorderIcons:=[biSystemMenu];
  end;
end;

procedure TfKU.Button15Click(Sender: TObject);
var F: file of TKUr;
    i: integer;
begin
  if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'
                            +#13#10'Action it is irreversible.You are really sure?','ATTENTION!',
                            MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    bdKU[Numb].YCG:=udYCG.Position;
    bdKU[Numb].YCE:=udYCE.Position;
    bdKU[Numb].CCG:=udCCG.Position;
    bdKU[Numb].CCE:=udCCE.Position;
    AssignFile(F, ExtractFilePath(ParamStr(0))+'KU.mtk');
    Rewrite(F);
    try
      for i:= 1 to 8 do Write (F, bdKU[i]);
    finally
      CloseFile(F)
    end
  end
end;

procedure TfKU.Button1Click(Sender: TObject);
begin
  SetCommand(TVDon,0)
end;

procedure TfKU.Button2Click(Sender: TObject);
begin
  SetCommand(TVDoff,0)
end;

procedure TfKU.Button3Click(Sender: TObject);
begin
  SetCommand(FANon,0)
end;

procedure TfKU.Button4Click(Sender: TObject);
begin
  SetCommand(FANoff,0)
end;

procedure TfKU.Button5Click(Sender: TObject);
begin
  SetCommand(FANauto,0)
end;

procedure TfKU.Button6Click(Sender: TObject);
begin
  SetCommand(HEATERon,0)
end;

procedure TfKU.Button7Click(Sender: TObject);
begin
  SetCommand(HEATERoff,0)
end;

procedure TfKU.Button8Click(Sender: TObject);
begin
  SetCommand(HEATERauto,0)
end;

procedure TfKU.Button9Click(Sender: TObject);
begin
  SetCommand(LEDon,0)
end;

procedure TfKU.bYCEClick(Sender: TObject);
begin
  SetCommand(YCE,udYCE.Position)
end;

procedure TfKU.bYCGClick(Sender: TObject);
begin
  SetCommand(YCG,udYCG.Position)
end;

procedure TfKU.FormActivate(Sender: TObject);
var i:integer;
begin
  Caption:=bdKU[Numb].Name+' ('+ bdKU[numb].PName+') '+'TM-2221-2 '+TRIM(bdKU[numb].Position);
  Panel19.Top:=305+1000;
  Panel22.Top:=380+1000;
  Panel28.Top:=455+1000;
  for i:=1 to 9 do
  begin
    if fKU.FindComponent('i'+IntToStr(i))= nil then continue;
    with TImage(fKU.FindComponent('i'+IntToStr(i))).Canvas do
    begin
      if (i<7) or (i=9) then Brush.Color:=clMedGray
                        else Brush.Color:=clBlack;
      FillRect(TImage(fKU.FindComponent('i'+IntToStr(i))).ClientRect)
    end;
  end;
  Panel4.SetFocus;
  if not Numb in [1..8] then begin close; exit end;
  LastDataExh:=true;
  if TM2220[Numb].DataExh then SetValues else SetNoValues;
  if numb in [1..4] then EM5402[1].AboutForm2220(fKU.Handle,numb)
                    else EM5402[2].AboutForm2220(fKU.Handle,numb-4)
end;

procedure TfKU.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if numb in [1..4] then EM5402[1].AboutForm2220(0,0)
                    else EM5402[2].AboutForm2220(0,0)
end;

procedure TfKU.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    TM2220[Numb].PermissionToChange:=true;
    Panel19.Top:=305;
    Panel22.Top:=380;
    Panel28.Top:=455;
    udYCG.Position:=TM2220[Numb].bdYCG;
    udYCE.Position:=TM2220[Numb].bdYCE;
    udCCG.Position:=TM2220[Numb].bdCCG;
    udCCE.Position:=TM2220[Numb].bdCCE;
    fKU.BorderIcons:=[];
  end
   else ss:=''
end;

end.
