unit EM7401;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls,Global, Buttons;

type
  Tfm7401 = class(TForm)
    Panel15: TPanel;
    Panel16: TPanel;
    i3: TImage;
    Label4: TLabel;
    Panel17: TPanel;
    RichEdit1: TRichEdit;
    Panel6: TPanel;
    Panel8: TPanel;
    i1: TImage;
    Label5: TLabel;
    Panel11: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    e1: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    Panel12: TPanel;
    Panel13: TPanel;
    i2: TImage;
    Label6: TLabel;
    Panel14: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Source1: TStaticText;
    Receiver1: TStaticText;
    Source2: TStaticText;
    Source3: TStaticText;
    Source4: TStaticText;
    Receiver2: TStaticText;
    Receiver3: TStaticText;
    Receiver4: TStaticText;
    Panel3: TPanel;
    Image2: TImage;
    St1: TShape;
    St2: TShape;
    St3: TShape;
    St4: TShape;
    In1: TStaticText;
    Out1: TStaticText;
    In2: TStaticText;
    In3: TStaticText;
    In4: TStaticText;
    Out2: TStaticText;
    Out3: TStaticText;
    Out4: TStaticText;
    Panel18: TPanel;
    Panel19: TPanel;
    i4: TImage;
    Label3: TLabel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel4: TPanel;
    Image3: TImage;
    Image4: TImage;
    Label2: TLabel;
    Panel5: TPanel;
    In100: TStaticText;
    In101: TStaticText;
    In102: TStaticText;
    In103: TStaticText;
    In104: TStaticText;
    In105: TStaticText;
    In106: TStaticText;
    In107: TStaticText;
    Panel7: TPanel;
    Out100: TStaticText;
    Out101: TStaticText;
    Out102: TStaticText;
    Out103: TStaticText;
    Out104: TStaticText;
    Out105: TStaticText;
    Out106: TStaticText;
    Out107: TStaticText;
    Set0: TComboBox;
    Set1: TComboBox;
    Set2: TComboBox;
    Set3: TComboBox;
    Set4: TComboBox;
    Set5: TComboBox;
    Set6: TComboBox;
    Set7: TComboBox;
    Panel10: TPanel;
    St101: TShape;
    St102: TShape;
    St103: TShape;
    St104: TShape;
    Panel9: TPanel;
    In108: TStaticText;
    In109: TStaticText;
    In110: TStaticText;
    In111: TStaticText;
    In112: TStaticText;
    In113: TStaticText;
    In114: TStaticText;
    In115: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Set0Exit(Sender: TObject);
    procedure Set0Click(Sender: TObject);
    procedure Set0Enter(Sender: TObject);
    procedure Set0Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SetValues;
    procedure SetNoValues;
    procedure OutSet(OutP:byte;SetP:byte);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MSD;
    procedure RestoreBase;
    procedure Reload;
  private
    ss:String;
    mEM7401:TEM7401;
    fl_Update:boolean;
    fl_Change:boolean;
  public
    DEVICE_ID:cardinal;
  end;

var
  fm7401: Tfm7401;

const     NameIn:array [1..16] of string =
('TVD2(axial1)','TVD4(right)','TVD1(left)','TVD3(axial2)','EM-3401(A11)','EM-3401(A11)','None','None','WSC','WSC','WSL','WSL','WSR','WSR','VRD1','VRD1');
          NameOut1:Array[1..4] of String =
('EM-3401(A11','WSC','WSR','BC-5-1(A20)');
          NameOut2:Array[1..4] of String =
('TM-2407','WSL','VRD1','BC-5-1(A21)');
implementation

{$R *.dfm}

uses UnitDM;

procedure Tfm7401.RestoreBase;
var SwithTable:string[16];
    cr:TCross;
    j:integer;
begin
  DM.EM7401Param.ParamByName('Device_ID').Value:=DEVICE_ID;
  DM.EM7401Param.Open;
  cs_ArrDevice[Device_ID].Enter;
  with TEM7401(ArrDevice[DEVICE_ID]) do
  begin
    SwithTable:=DM.EM7401ParamSwithTable.Value;
    FillChar(cr,SizeOf(cr),0);
    for j:=1 to 8 do
    if (StrToHEX(SwithTable[j*2-1])<>-1) and (StrToHEX(SwithTable[j*2])<>-1) then
      cr[j]:= StrToHEX(SwithTable[j*2-1]) SHL 4 + StrToHEX(SwithTable[j*2])
    else  cr[j]:=0;
    Cross:=cr;
  end;
  cs_ArrDevice[Device_ID].Leave;
  DM.EM7401Param.Close;
end;

procedure Tfm7401.ServMsd(var Msg: TMessage);
begin
  if (Msg.WParam<>DEVICE_ID) then exit;
  cs_ArrDevice[DEVICE_ID].Enter; try mEM7401:=TEM7401((ArrDevice[DEVICE_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  case Msg.LParam of
    1..10:
       begin
         RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: '+Command_EM7401[Msg.LParam].cComment);
       end;
    200:
       begin
         RichEdit1.Font.Color:=clRed;
         RichEdit1.Lines.Add(TimeToStr(Now)+' '+'ATTENTION! DETECTED DEVICE CHANGE.');
         RichEdit1.Font.Color:=clBlack;
       end;
    201:
        begin
          RichEdit1.Lines.Add(TimeToStr(Now)+' No Answer');
        end;
    202:
        begin
          RichEdit1.Lines.Add(TimeToStr(Now)+' Successfully: Status of device');
        end;
  end;
  SetValues;
end;

procedure Tfm7401.OutSet(OutP:byte;SetP:byte);
var LRC:byte;
    n  :integer;
    pms:^Tmass;
begin
  //добавление в ExternalCom - аналогично CommandList,
  //но для 2404 RabCom добавляется по результатам анализа TQuestion.TM2404Analiz
  New(pms);
  pms^[1]:=DEVICE_ID;
  pms^[2]:=0;
  pms^[3]:=Command_EM7401[8].cComandCount;
  pms^[4]:=8;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[DEVICE_ID].cAdress;
  pms^[8]:=Command_EM7401[8].cComandCount-2;
  pms^[9]:=Command_EM7401[8].cCommand;
  pms^[10]:=OutP shl 4 + SetP;
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

procedure Tfm7401.Set0Change(Sender: TObject);
var b:byte;
    v:String;
begin
  b:=(Sender as TComboBox).ItemIndex;
  v:=(Sender as tComboBox).Name;
  Delete(v,1,3);
  OutSet(StrToInt(v),b);
  fl_Update:=true;
  fl_Change:=true;
end;

procedure Tfm7401.Set0Click(Sender: TObject);
begin
  fl_Update:=false;
end;

procedure Tfm7401.Set0Enter(Sender: TObject);
begin
  fl_Update:=false;
end;

procedure Tfm7401.Set0Exit(Sender: TObject);
begin
  fl_Update:=true;
end;

procedure Tfm7401.SetNOValues;
var cr:TCross;
    VST:byte;
    i:integer;
    b,d:byte;
    y1,y2,x1,x2:integer;
begin
    e1.Text:=' NO';
    e1.Color:=Color_R;
    e2.Text:='';
    e3.Text:='';
    e4.Text:='';
    e5.Text:='';
    e6.Text:='';
    St4.Brush.Color:=Color_R;
    St3.Brush.Color:=Color_R;
    St2.Brush.Color:=Color_R;
    St1.Brush.Color:=Color_R;
    ST101.Brush.Color:=St1.Brush.Color;
    ST102.Brush.Color:=St2.Brush.Color;
    ST103.Brush.Color:=St3.Brush.Color;
    ST104.Brush.Color:=St4.Brush.Color;
  if not fl_Update then exit;
  for i:=1 to 4 do
  begin
    b:=cr[i*2-1] and $0F;
    TStaticText(fm7401.FindComponent('Source'+IntToStr(i))).Caption:=NameIn[b+1];
  end;
  case Device_ID of
  30: for i:=1 to 4 do
      TStaticText(fm7401.FindComponent('Receiver'+IntToStr(i))).Caption:=NameOut1[i];
  31: for i:=1 to 4 do
      TStaticText(fm7401.FindComponent('Receiver'+IntToStr(i))).Caption:=NameOut2[i];
  end;
  with Image3.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image3.ClientRect);
  end;
  with Image4.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image4.ClientRect);
  end;
  for i:=1 to 8 do
  begin
    b:=cr[i] and $0F;
    d:=(cr[i] and $F0) shr 4;
    if (not (b in [0..15])) or (not (d in [0..7])) then continue;    
    if fm7401.FindComponent('Set'+IntToStr(d))<>nil then
    TComboBox(fm7401.FindComponent('Set'+IntToStr(d))).ItemIndex:=b;
    case b of
    0..7:
      with Image3.Canvas do
      begin
        x1:=0;
        x2:=Image3.Width;
        Pen.Color:=clBlack;
        Pen.Width:=2;
        y1:=TStaticText(fm7401.FindComponent('In'+IntToStr(b+100))).Top+12;
        y2:=TStaticText(fm7401.FindComponent('Out'+IntToStr(d+100))).Top+12;
        MoveTo(x1,y1);
        LineTo(x2,y2);
      end;
    8..15:
      with Image4.Canvas do
      begin
        x1:=Image4.Width;
        x2:=0;
        Pen.Color:=clBlack;
        Pen.Width:=2;
        y1:=TStaticText(fm7401.FindComponent('In'+IntToStr(b+100))).Top+12;
        y2:=TStaticText(fm7401.FindComponent('Out'+IntToStr(d+100))).Top+12;
        MoveTo(x1,y1);
        LineTo(x2,y2);
      end;
    end;
  end;
end;

procedure Tfm7401.SetValues;
var cr:TCross;
    VST:byte;
    i:integer;
    b,d:byte;
    y1,y2,x1,x2:integer;
begin
  if mEM7401.DataExh=0 then begin SetNoValues; exit; end;
  e1.Text:=' YES';
  e1.Color:=clLime;
  with mEM7401 do
  begin
    e2.Text:=' '+IntToStr(TypeU);
    e3.Text:=' '+IntToStr(VersU);
    e4.Text:=' '+IntToStr(VersP);
    e5.Text:=' '+IntToStr(SerNum);
    if UDate<>0 then e6.Text:='  '+DateToStr(UDate)
                else e6.Text:='  NO DATE';
    cr:=Cross;
    VST:=VMSVS;
  end;
  if VST and $40 <> $40 then St4.Brush.Color:=Color_R else St4.Brush.Color:=Color_G;
  if VST and $10 <> $10 then St3.Brush.Color:=Color_R else St3.Brush.Color:=Color_G;
  if VST and $04 <> $04 then St2.Brush.Color:=Color_R else St2.Brush.Color:=Color_G;
  if VST and $01 <> $01 then St1.Brush.Color:=Color_R else St1.Brush.Color:=Color_G;
  ST101.Brush.Color:=St1.Brush.Color;
  ST102.Brush.Color:=St2.Brush.Color;
  ST103.Brush.Color:=St3.Brush.Color;
  ST104.Brush.Color:=St4.Brush.Color;
  if not fl_Update then exit;
  for i:=1 to 4 do
  begin
    b:=cr[i*2-1] and $0F;
    TStaticText(fm7401.FindComponent('Source'+IntToStr(i))).Caption:=NameIn[b+1];
  end;
  case Device_ID of
  30: for i:=1 to 4 do
      TStaticText(fm7401.FindComponent('Receiver'+IntToStr(i))).Caption:=NameOut1[i];
  31: for i:=1 to 4 do
      TStaticText(fm7401.FindComponent('Receiver'+IntToStr(i))).Caption:=NameOut2[i];
  end;
  with Image3.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image3.ClientRect);
  end;
  with Image4.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image4.ClientRect);
  end;
  for i:=1 to 8 do
  begin
    b:=cr[i] and $0F;
    d:=(cr[i] and $F0) shr 4;
    if (not (b in [0..15])) or (not (d in [0..7])) then continue;    
    if fm7401.FindComponent('Set'+IntToStr(d))<>nil then
    TComboBox(fm7401.FindComponent('Set'+IntToStr(d))).ItemIndex:=b;
    case b of
    0..7:
      with Image3.Canvas do
      begin
        x1:=0;
        x2:=Image3.Width;
        Pen.Color:=clBlack;
        Pen.Width:=2;
        y1:=TStaticText(fm7401.FindComponent('In'+IntToStr(b+100))).Top+12;
        y2:=TStaticText(fm7401.FindComponent('Out'+IntToStr(d+100))).Top+12;
        MoveTo(x1,y1);
        LineTo(x2,y2);
      end;
    8..15:
      with Image4.Canvas do
      begin
        x1:=Image4.Width;
        x2:=0;
        Pen.Color:=clBlack;
        Pen.Width:=2;
        y1:=TStaticText(fm7401.FindComponent('In'+IntToStr(b+100))).Top+12;
        y2:=TStaticText(fm7401.FindComponent('Out'+IntToStr(d+100))).Top+12;
        MoveTo(x1,y1);
        LineTo(x2,y2);
      end;
    end;
  end;
end;

procedure Tfm7401.Button1Click(Sender: TObject);
var s:string;
    sw:string [18];
    cr:TCross;
    i:integer;
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be save in a DATABASE.'#13#10'Action it is irreversible.You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin
     cr:=TEM7401(ArrDevice[Device_ID]).Cross;
     sw:='''';
     for i:=1 to 8 do
     begin
       if HexToStr((cr[i] and $F0) shr 4)<>'Z'
       then sw:=sw+HexToStr((cr[i] and $F0) shr 4)
       else sw:=sw+'0';
       if HexToStr((cr[i] and $0F))<>'Z'
       then sw:=sw+HexToStr(cr[i] and $0F)
       else sw:=sw+'0';
     end;
     sw:=sw+'''';
     s:= 'UPDATE EM7401Param SET SwithTable='+sw+' WHERE Device_ID='+IntToStr(DEVICE_ID);
     DM.QDin.SQL.Clear;
     DM.QDin.SQL.Add(s);
     DM.QDin.ExecSQL;
     DM.QDin.Close;
   end else exit;
end;

procedure Tfm7401.Button2Click(Sender: TObject);
begin
   fl_Update:=true;
   if Application.MessageBox('Values of the established parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
   begin Reload; fl_Change:=false;
   end else exit;
end;

procedure Tfm7401.Button3Click(Sender: TObject);
begin
  fl_Update:=true;
  if fl_Change then
  if Application.MessageBox('Values of the parameters will be restored according to a database.'#13#10'You are really sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    //восстановление данных из базы данных
    Reload;
    fl_Change:=false;
  end;
  if not fl_Change then
  begin
    Panel12.Top:=225;
    Panel18.Top:=425;
    fm7401.Height:=456;
    Panel15.Height:=416;
    ss:='';
    BorderIcons:=[biSystemMenu];
    SetValues;
  end;
end;

procedure Tfm7401.Reload;
begin
  fl_Update:=true;
  RestoreBase;
  if TM2404State.DoIt[Device_ID] and $20 <>$20 then
  TM2404State.DoIt[DEVICE_ID]:=TM2404State.DoIt[DEVICE_ID]+$20;
end;

procedure Tfm7401.FormActivate(Sender: TObject);
var x1,y1,x2,y2,i:integer;
begin
  Fl_Change:=false;
  fl_Update:=true;
  with Image3.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image3.ClientRect);
  end;
  with Image4.Canvas do
  begin
    Brush.Color:=clWhite;
    FillRect(Image4.ClientRect);
  end;
  with Image1.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(Image1.ClientRect);
    Pen.Color:=clBlue;
    Pen.Width:=2;
    x1:=Source1.Left+Source1.Width;
    x2:=Receiver1.Left;
    y1:=Source1.Top+Source1.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=Source2.Top+Source2.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=Source3.Top+Source3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=Source4.Top+Source4.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;
  with Image2.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(Image2.ClientRect);
    Pen.Color:=clBlue;
    Pen.Width:=2;
    x1:=0;
    x2:=Image2.Width;
    y1:=In1.Top+In1.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=In2.Top+In2.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=In3.Top+In3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=In4.Top+In4.Height div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;
  cs_ArrDevice[Device_ID].Enter; try mEM7401:=TEM7401((ArrDevice[Device_ID])); finally cs_ArrDevice[Device_ID].Leave; end;
  for i:=1 to 4 do
  if fm7401.FindComponent('i'+IntToStr(i))<>nil then
  with TImage(fm7401.FindComponent('i'+IntToStr(i))).Canvas do
  begin
    if i<>4 then Brush.Color:=clMedGray
           else Brush.Color:=clBlack;
    FillRect(TImage(fm7401.FindComponent('i'+IntToStr(i))).ClientRect);
  end;
  SetValues;
end;

procedure Tfm7401.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var RG:TCOlor;
begin
  if Key=$20 then begin ss:=''; exit; end;
  ss:=ss+Chr(Key);
  if Length(ss)=Length(PR) then
  if UpperCase(ss)=upperCase(PR) then
  begin
    Panel18.Top:=225;
    Panel12.Top:=800;
    Panel15.Height:=Panel18.Top+Panel18.Height-Panel15.Top;
    fm7401.Height:=580;
    BorderIcons:=[];
  end
    else ss:='';
end;

end.
