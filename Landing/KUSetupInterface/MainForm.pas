unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DSPack, ExtCtrls,Global,UnitDM,XComDrv,DSUtil,DirectShow9, ActiveX,FastDib,
  Grids, Buttons;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Memo1: TMemo;
    RG: TRadioGroup;
    FilterGraph1: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    XComm1: TXComm;
    XComm2: TXComm;
    GB: TGroupBox;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    e4: TEdit;
    e5: TEdit;
    e6: TEdit;
    e7: TEdit;
    e8: TEdit;
    e11: TEdit;
    e12: TComboBox;
    e18: TComboBox;
    e17: TComboBox;
    e16: TComboBox;
    e15: TComboBox;
    e14: TComboBox;
    e13: TComboBox;
    e0: TEdit;
    e10: TEdit;
    GroupBox6: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    Button6: TButton;
    GroupBox7: TGroupBox;
    Button7: TButton;
    Button14: TButton;
    Button15: TButton;
    TT: TTimer;
    SP: TSpeedButton;
    procedure Button14Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SPClick(Sender: TObject);
    procedure e17Change(Sender: TObject);
    procedure e15Change(Sender: TObject);
    procedure e13Change(Sender: TObject);
    procedure e12Change(Sender: TObject);
    procedure TTTimer(Sender: TObject);
    procedure RGClick(Sender: TObject);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TVDOn;
    procedure SetFromChannel(KU,ARM:word);
    procedure Command7401(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
    procedure ChangePort;
    procedure SetNoValues;
    procedure SaveParametr (Numb:integer);
    procedure LoadParametr (Numb:integer);
    function  Command2220(Command:TMass;SendCount:Integer;ReceiveCount:Integer;CommandNumber:Integer):boolean;
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SysEnum:TSysDevEnum;
  CaptureFilter:  IbaseFilter         =nil;
  CapEnum:        TSysDevEnum         =nil;
  VideoFilter:    IBaseFilter         =nil;
  ISampleGrabb:   ISampleGrabber      =nil;
  VideoRender:    IBaseFilter         =nil;
  CaptureGraphBuilder2: ICaptureGraphBuilder2;
  GraphBuilder:   IGraphBuilder;
  MediaType:_AMMediaType;
  pvi:PvideoInfoHeader;
  BWidth, BHeight,MBitCount:integer;
  hr:Hresult;
  FastIn:TFastDib;
  fl_Video:boolean=true;
  ID:byte;
  flag:boolean=false;

const
  CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
  CLSID_ColorSpaceConverter:TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';
  CLSID_VR:TGUID = '{B87BEB7B-8D29-423F-AE4D-6582C10175AC}';

implementation

{$R *.dfm}

procedure TForm1.SaveParametr(Numb: Integer);
var s:string;
begin
  s:='Update Command_TM2220 Set Command='+IntToStr(savecom[1])+' Where Command_ID='+IntToStr(Numb);
  DM.Query.Close;
  DM.Query.SQL.Clear;
  DM.Query.SQL.Add(s);
  DM.Query.ExecSQL;
  s:='Update Command_TM2220 Set Command='+IntToStr(savecom[2])+' Where Command_ID='+IntToStr(Numb+1);
  DM.Query.Close;
  DM.Query.SQL.Clear;
  DM.Query.SQL.Add(s);
  DM.Query.ExecSQL;
  s:='Update Command_TM2220 Set Command='+IntToStr(savecom[3])+' Where Command_ID='+IntToStr(Numb+2);
  DM.Query.Close;
  DM.Query.SQL.Clear;
  DM.Query.SQL.Add(s);
  DM.Query.ExecSQL;
  s:='Update Command_TM2220 Set Command='+IntToStr(97)+' Where Command_ID='+IntToStr(Numb+3);
  DM.Query.Close;
  DM.Query.SQL.Clear;
  DM.Query.SQL.Add(s);
  DM.Query.ExecSQL;
  Command_TM2220[Numb].cCommand  :=savecom[1];
  Command_TM2220[Numb+1].cCommand:=savecom[2];
  Command_TM2220[Numb+2].cCommand:=savecom[3];
  Command_TM2220[Numb+3].cCommand:=97;
  Memo1.Lines.Add('Save TVD mode complete successfully');
end;

procedure TForm1.LoadParametr(Numb: Integer);
var Command,RCommand:TMass;
    i:integer;
    Result:integer;
begin
   Memo1.Lines.Add('Load TVD mode start');
   for i:=1 to 4 do
   begin
     Command[0] := HI(ComDev[DEVICE_ID].cAdress);
     Command[1] := LO(ComDev[DEVICE_ID].cAdress);
     Command[2] := $17;
     Command[3] := Command_TM2220[Numb+i-1].cCommand;
     Command[4] := $ff-(command[0]+command[1]+command[2]+command[3])+1;
     if not Command2220(Command,5,5,0) then exit else
     case i of
       1:Memo1.Lines.Add('Time-out of binding area and background extending mode setup');
       2:Memo1.Lines.Add('Time-out of electronic shutter mode setup');
       3:Memo1.Lines.Add('Time-out of video signal processing mode setup');
       4:Memo1.Lines.Add('Time-out of iris control mode setup');
       end;
   end;
   Memo1.Lines.Add('Load TVD mode complete successfully');
end;

function TForm1.Command2220(Command: TMass; SendCount: Integer; ReceiveCount: Integer; CommandNumber: Integer):boolean;
var Res:Cardinal;
    LRC     :byte;
    i:integer;
    k,l:double;
    ReceiveCommand:TMass;
    TypeCommand:byte;
    a:byte;
begin
  Result:=false;
  if XComm1.Opened=false then
  begin
    try XComm1.OpenDevice
    except
      Memo1.Lines.Add('Not possible open COM-port '+XComm1.DeviceName);
      exit;
    end;
    end;
  XComm1.PurgeIn;
  Res:=XComm1.SendData(Command,SendCount);
   if Res=0 then
   begin
     Memo1.Lines.Add('Error '+XComm1.DeviceName+'. Error send command: '+Command_TM2220[CommandNumber].cComment);
     exit;
   end;
   Res:=XComm1.ReadData(ReceiveCommand,ReceiveCount);
   if Res=0 then
   begin
     Memo1.Lines.Add('Error '+XComm1.DeviceName+'. There is no answer');
     exit;
   end;
   //проверка контрольной суммы
   LRC:=0;
   for i := 0 to ReceiveCount-2 do LRC:=LRC+ReceiveCommand[i];
   LRC:=$FF-LRC+1;
   if LRC<>ReceiveCommand[ReceiveCount-1] then
   begin
     Memo1.Lines.Add('Error '+XComm1.DeviceName+'.Error of check sum');
     exit;
   end;
   if (ReceiveCommand[2]=Command[2]+80) then
   begin
     Memo1.Lines.Add('Error '+XComm1.DeviceName+'.Mistake of performance. A code of the reason'+inttohex(ReceiveCommand[3],2));
     exit;
   end;
   if (ReceiveCommand[2]<>Command[2]) then
   begin
     Memo1.Lines.Add('Error '+XComm1.DeviceName+'.The unknown mistake of performance.');
     exit;
   end;
   if ReceiveCount=21 then
   begin
     if (ReceiveCommand[15] and $40) = $40 then e12.ItemIndex:=0 else e12.ItemIndex:=1;
     Result:=true;
     exit;
   end;
   case SendCount of
   4: //команды вкл/выкл
     begin
       e12.Enabled:=true;
       if ReceiveCount=5 then Memo1.Lines.Add('Successfully: '+Command_TM2220[CommandNumber].cComment) else exit;
       if ReceiveCommand[2]=$01 then e12.ItemIndex:=0;
       if ReceiveCommand[2]=$02 then e12.ItemIndex:=1;
       e12.Text:=e12.Items[e12.ItemIndex];
       e[12]:=e12.ItemIndex;
       Result:=true;
       exit;
     end;
   5: //комманды режимов КУ
     begin
       TypeCommand:=(ReceiveCommand[3] and $E0) shr 5;
       case TypeCommand of
       0: //установка площади привязки
         begin
           e14.Enabled:=true;
           e13.Enabled:=true;
           a:=(ReceiveCommand[3] and $10) shr 4;
           if a in [0..1] then
           begin
             e14.ItemIndex:=a;
             e14.Text:=e14.Items[a];
             e[14]:=a;
           end else
             e14.Text:='  No data';
           a:=(ReceiveCommand[3] and $0F)-6;
           if a in [0..9] then
           begin
             e13.ItemIndex:=a;
             e13.Text:=e13.Items[a];
             e[13]:=a;
           end else
             e13.Text:='  No data';
           Memo1.Lines.Add('Binding area and background extending mode - successfully setup');
           SaveCom[1]:=ReceiveCommand[3];
         end;
       1: //установка режима электронного затвора
         begin
           e15.Enabled:=true;
           e16.Enabled:=true;
           a:=(ReceiveCommand[3] and $18) shr 3;
           if a=01 then
           begin
             e15.ItemIndex:=0;
             e15.Text:=e15.Items[0];
             e[15]:=a;
           end else
           begin
             e15.ItemIndex:=1;
             e15.Text:=e15.Items[1];
           end;
           a:=(ReceiveCommand[3] and $07);
           if a in [0..7] then
           begin
             e16.ItemIndex:=a;
             e16.Text:=e16.Items[a];
             e[16]:=a;
           end else
             e16.Text:='  No data';
           Memo1.Lines.Add('Electronic shutter mode - successfully setup');
           SaveCom[2]:=ReceiveCommand[3];
         end;
       2: //установка режима обработки видеосигнала
         begin
           e17.Enabled:=true;
           e18.Enabled:=true;
           a:=(ReceiveCommand[3] and $0C) shr 2;
           if a in [1..3] then
           begin
             e17.ItemIndex:=a-1;
             e17.Text:=e17.Items[a-1];
             e[17]:=a-1;
           end else
             e17.Text:='  No data';
           a:=(ReceiveCommand[3] and $03);
           if a in [0..2] then
           begin
             e18.ItemIndex:=a;
             e18.Text:=e18.Items[a];
             e[18]:=a;
           end else
             e18.Text:='  No data';
           Memo1.Lines.Add('Video signal processing mode - successfully setup');
           SaveCom[3]:=ReceiveCommand[3];
         end;
       3: //управление ирисовой диафрагмой
         begin
           a:=(ReceiveCommand[3] and $01);
           if a=0 then
           begin
             ID:=ReceiveCommand[3]+1;
             flag:=true;
           end else flag:=false;
           SaveCom[4]:=ReceiveCommand[3];
         end;
       end;
       Result:=true;
       exit;
      end;
   end;
end;

procedure TForm1.SetNoValues;
var i:integer;
begin
  e11.Text:='  No';
  e11.Color:=clRed;
  for i:=12 to 18 do
  if (Form1.FindComponent('e'+IntToStr(i))<>nil)  and (Form1.Visible) then
  begin
    TComboBox(Form1.FindComponent('e'+IntToStr(i))).Text:='  No data';
    TComboBox(Form1.FindComponent('e'+IntToStr(i))).enabled:=false;
  end;
  GroupBox6.Enabled:=false;
  GroupBox7.Enabled:=false;
end;

procedure TForm1.SPClick(Sender: TObject);
var command:TMass;
    a,b:byte;
begin
  FillChar(SaveCom,4,0);
  if not Device_ID in [7..10] then exit;
  command[0]:=HI(ComDev[DEVICE_ID].cAdress);
  command[1]:=LO(ComDev[DEVICE_ID].cAdress);
  command[2]:=$17;
  //запрос установленной площади привязки
  a:=7;
  b:=0;
  command[3]:=(a shl 5)+b;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then exit;
  //запрос установленного режима электронного затвора
  b:=1;
  command[3]:=(a shl 5) +b;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then exit;
  //запрос установленного режима обработки видеосигнала
  b:=2;
  command[3]:=(a shl 5) +b;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then exit;
  //включить управление ирисовой диафрагмой
  b:=3;
  command[3]:=(a shl 5) +b;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then exit;
  if flag then
  begin
    command[3]:=ID;
    command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
    if not Command2220(Command,5,5,0) then exit;
  end;  
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
   LoadParametr((Sender as TButton).Tag);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i:integer;
begin
  Memo1.Lines.Add('Save TVD mode start');
  SP.Click;
  for i:=1 to 3 do  if SaveCom[i]=0 then
  begin
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Error save TVD mode '+IntToStr(i));
    exit;
  end;
  SaveParametr((Sender as TButton).Tag);
end;

procedure TForm1.ChangePort;
var s,s1,s2:string;
begin
  s:=XComm2.DeviceName;
  s1:='COM'+IntToStr(ComList[ComDev[23].cCom_ID].cCom);
  s2:='COM'+IntToStr(ComList[ComDev[24].cCom_ID].cCom);
  if s=s1 then s:=s2 else s:=s1;
  if XComm2.Opened then XComm2.CloseDevice;
  XComm2.DeviceName:=s;
  if XComm2.Opened=false then
  begin
    try XComm2.OpenDevice
    except
      begin
        Memo1.Lines.Add('Not possible open COM-port '+XComm2.DeviceName);
        exit;
      end;
    end;
    Memo1.Lines.Add(XComm2.DeviceName +  ' open successfully');
  end;
  XComm2.Tag:=0;
end;

procedure TForm1.Command7401(Command:TMASS; SendCount: Integer; ReceiveCount: Integer; CommandNumber:Integer);
var Result:Cardinal;
    LRC     :byte;
    i:integer;
    ReceiveCommand:TMass;
begin
  if XComm2.Opened=false then
  begin
    try XComm2.OpenDevice
    except
      Memo1.Lines.Add('Not possible open COM-port '+XComm2.DeviceName);
      exit;
    end;
    end;
  XComm2.PurgeIn;
  //если кол-во неудачных попыток = 4 - переход на другой порт
  if XComm2.Tag>=4 then ChangePort;
  XComm2.Tag:=XComm2.Tag+1;
  Result:=XComm2.SendData(Command,SendCount);
   if Result=0 then
   begin
     Memo1.Lines.Add('Error. '+XComm2.DeviceName+' (EM-7401). Error send command: '+Command_EM7401[CommandNumber].cComment);
     exit;
   end;
   Result:=XComm2.ReadData(ReceiveCommand,ReceiveCount);
   if Result=0 then
   begin
     Memo1.Lines.Add('Error. '+XComm2.DeviceName+'(EM-7401). There is no answer');
     exit;
   end else
   begin
     //проверка контрольной суммы
     LRC:=0;
     for i := 0 to ReceiveCount-2 do LRC:=LRC+ReceiveCommand[i];
     if LRC<>ReceiveCommand[ReceiveCount-1] then
     begin
       Memo1.Lines.Add('Error. '+XComm2.DeviceName+' (EM-7401). Error of check sum');
       exit;
     end;
     //проверка числа принятых байт
     if (Result<>ReceiveCount) or (ReceiveCommand[1]+2<>Result) then
     begin
       Memo1.Lines.Add('Error. '+XComm2.DeviceName+' (EM-7401). The number of the accepted bytes does not correspond to structure of a command.');
       exit;
     end;
     //проверка выполнения
     if (Command[0]<>ReceiveCommand[0]) or (Command[1]<>ReceiveCommand[1]) or (Command[2]<>ReceiveCommand[2]) then
     begin
       Memo1.Lines.Add('Error. '+XComm2.DeviceName+' (EM-7401). Nonexistent code of a command.');
       exit;
     end;
     Memo1.Lines.Add('Successfully: '+Command_EM7401[CommandNumber].cComment);
     XComm2.Tag:=0;
   end;
end;

procedure TForm1.e12Change(Sender: TObject);
var Command:TMass;
    i:integer;
begin
  if not Device_ID in [7..10] then exit;
  command[0]:=HI(ComDev[DEVICE_ID].cAdress);
  command[1]:=LO(ComDev[DEVICE_ID].cAdress);
  case e12.ItemIndex of
  0:  command[2]:=Command_TM2220[1].cCommand;
  1:  command[2]:=Command_TM2220[2].cCommand;
  end;
  command[3]:=$ff-(command[0]+command[1]+command[2])+1;
  if Command2220(Command,4,5,1) then
  case e12.ItemIndex of
  0: begin
       SP.Click;
       TT.Enabled:=true;
     end;
  1: begin
       for i:=13 to 18 do
       if (Form1.FindComponent('e'+IntToStr(i))<>nil)  and (Form1.Visible) then
       begin
         TComboBox(Form1.FindComponent('e'+IntToStr(i))).Text:='  No data';
         TComboBox(Form1.FindComponent('e'+IntToStr(i))).enabled:=false;
       end;
       TT.Enabled:=false;
    end;
  end;
end;

procedure TForm1.e13Change(Sender: TObject);
var Command:TMass;
    a,b,c:byte;
begin
  if not Device_ID in [7..10] then exit;
  command[0]:=HI(ComDev[DEVICE_ID].cAdress);
  command[1]:=LO(ComDev[DEVICE_ID].cAdress);
  command[2]:=$17;
  a:=0;
  b:=e14.ItemIndex;
  c:=e13.ItemIndex+6;
  command[3]:=(a shl 5)+(b shl 4)+c;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then
  begin
    e14.ItemIndex:=e[14];
    e13.ItemIndex:=e[13];
  end;
end;

procedure TForm1.e15Change(Sender: TObject);
var Command:TMass;
    a,b,c:byte;
begin
  if not Device_ID in [7..10] then exit;
  command[0]:=HI(ComDev[DEVICE_ID].cAdress);
  command[1]:=LO(ComDev[DEVICE_ID].cAdress);
  command[2]:=$17;
  a:=1;
  b:=e15.ItemIndex+1;
  c:=e16.ItemIndex;
  command[3]:=(a shl 5)+(b shl 3)+c;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then
  begin
    e15.ItemIndex:=e[15];
    e16.ItemIndex:=e[16];
  end;
end;

procedure TForm1.e17Change(Sender: TObject);
var Command:TMass;
    a,b,c,d:byte;
begin
  if not Device_ID in [7..10] then exit;
  command[0]:=HI(ComDev[DEVICE_ID].cAdress);
  command[1]:=LO(ComDev[DEVICE_ID].cAdress);
  command[2]:=$17;
  a:=2;
  b:=1; //зеркалный поворот всегда включён
  c:=e17.ItemIndex+1;
  d:=e18.ItemIndex;
  command[3]:=(a shl 5)+(b shl 4)+(c shl 2)+d;
  command[4]:=$ff-(command[0]+command[1]+command[2]+command[3])+1;
  if not Command2220(Command,5,5,0) then
  begin
    e17.ItemIndex:=e[17];
    e18.ItemIndex:=e[18];
  end;
end;

procedure TForm1.SetFromChannel(KU: Word; ARM: Word);
var  c,in7401,Out7401:word;
     command:tMass;
begin
   //отправить команду 7401
   //выбрать коммутатор
   case ARM of
   1: c:=30;
   2: c:=31;
   3: c:=30;
   end;
   //номер входа коммутатора
   case KU of
   7:  in7401:=2;
   8:  in7401:=0;
   9:  in7401:=1;
   10: in7401:=3;
   end;
   //номер выхода коммутатора
   case ARM of
   1:  out7401:=2;
   2:  out7401:=2;
   3:  out7401:=4;
   end;
   command[0]:=ComDev[c].cAdress;
   command[1]:=Command_EM7401[8].cComandCount-2;
   command[2]:=Command_EM7401[8].cCommand;
   command[3]:=out7401 shl 4 + in7401;
   command[4]:=command[0]+command[1]+command[2]+command[3];
   Command7401(Command,5,5,8);
   command[0]:=ComDev[c].cAdress;
   command[1]:=Command_EM7401[8].cComandCount-2;
   command[2]:=Command_EM7401[8].cCommand;
   command[3]:=((out7401+1) shl 4) + 7;
   command[4]:=command[0]+command[1]+command[2]+command[3];
   Command7401(Command,5,5,8);
end;

procedure TForm1.FormActivate(Sender: TObject);
var c,cv:integer;
begin
 fillChar(e,SizeOf(e),-1);
 DM.MTK.Connected:=true;
 DM.ComPort.Open;
 c:=1;
 While not DM.ComPort.Eof do
 begin
   c:=DM.ComPortComPort.Value;
   ComList[c].cCom:=DM.ComPortComPort.Value;
   cv:=DM.ComPortBaudRate.Value;
   case cv of
     110:    ComList[c].cBaudRate:=br110;
     300:    ComList[c].cBaudRate:=br300;
     600:    ComList[c].cBaudRate:=br600;
     1200:   ComList[c].cBaudRate:=br1200;
     2400:   ComList[c].cBaudRate:=br2400;
     4800:   ComList[c].cBaudRate:=br4800;
     9600:   ComList[c].cBaudRate:=br9600;
     14400:  ComList[c].cBaudRate:=br14400;
     19200:  ComList[c].cBaudRate:=br19200;
     38400:  ComList[c].cBaudRate:=br38400;
     56000:  ComList[c].cBaudRate:=br56000;
     57600:  ComList[c].cBaudRate:=br57600;
     115200: ComList[c].cBaudRate:=br115200;
   end;
   ComList[c].cBaudValue:=cv;
   cv:=DM.ComPortByteSize.Value;
   case cv of
     5: ComList[c].cByteSize:=db5;
     6: ComList[c].cByteSize:=db6;
     7: ComList[c].cByteSize:=db7;
     8: ComList[c].cByteSize:=db8;
   end;
   ComList[c].cEnableDTR:=DM.ComPortEnableDTR.Value;
   ComList[c].cEnableRTS:=DM.ComPortEnableRTS.Value;
   cv:=DM.ComPortParity.Value;
   case cv of
       0: ComList[c].cParity:=paNONE;
       1: ComList[c].cParity:=paODD;
       2: ComList[c].cParity:=paEVEN;
       3: ComList[c].cParity:=paMARK;
       4: ComList[c].cParity:=paSPACE;
   end;
   cv:=DM.ComPortStopBits.Value;
   case cv of
       1: ComList[c].cStopBits:=sb1;
      15: ComList[c].cStopBits:=sb1p5;
       2: ComList[c].cStopBits:=sb2;
   end;
   ComList[c].cTimeOut:=DM.ComPortTimeOut.Value;
   DM.ComPort.Next;
   if c>ComCount then break;
 end;
 DM.ComPort.Close;
 DM.Command_2220.Open;
 while not DM.Command_2220.Eof do
 begin
   c:=DM.Command_2220Command_ID.Value;
   if not(c in [1..33]) then exit;
   Command_TM2220[c].cCOM_ID  :=DM.Command_2220Command_ID.Value;
   Command_TM2220[c].cCommand :=DM.Command_2220Command.Value;
   Command_TM2220[c].cComment :=DM.Command_2220Comment_Eng.Value;
   DM.Command_2220.Next;
 end;
 DM.Command_2220.Close;
 DM.Command_7401.Open;
 while not DM.Command_7401.Eof do
 begin
   c:=DM.Command_7401Command_ID.Value;
   if not(c in [1..10]) then break;
   Command_EM7401[c].cCOM_ID  :=DM.Command_7401Command_ID.Value;
   Command_EM7401[c].cCommand :=DM.Command_7401Command.Value;
   Command_EM7401[c].cComment :=DM.Command_7401Comment_Eng.Value;
   Command_EM7401[c].cComandCount:=DM.Command_7401Command_Count.Value;
   Command_EM7401[c].cAnswerCount:=DM.Command_7401Answer_Count.Value;
   DM.Command_7401.Next;
 end;
 DM.Command_7401.Close;
 DM.ComDev.Open;
 while not DM.ComDev.Eof do
 begin
   c:=DM.ComDevDevice_ID.Value;
  // if not (c in [7..10]) then exit;
   ComDev[c].cDEV_ID:=c;
   ComDev[c].cCom_ID:=DM.ComDevComPort.Value;
   ComDev[c].cAdress:=DM.ComDevAdress.Value;
   DM.ComDev.Next;
 end;
 DM.ComDev.Close;
 DM.MTK.Connected:=false;
 with XComm2 do
  begin
    //номер COM порта для выбранной камеры
    c:=(ComDev[23].cCom_ID);
    BaudRate:=ComList[c].cBaudRate;
    BaudValue:=ComList[c].cBaudValue;
    Buffers.InputSize:=128;
    Buffers.OutputSize:=128;
    Buffers.InputTimeout:=ComList[c].cTimeOut;
    Buffers.OutputTimeout:=0;
    DataControl.DataBits:=ComList[c].cByteSize;
    DataControl.Parity:=ComList[c].cParity;
    DataControl.StopBits:=ComList[c].cStopBits;
    DeviceName:='COM'+IntToStr(ComList[c].cCom);
    TimeOuts.ReadInterval:=1;
    TimeOuts.ReadMultiplier:=0;
    TimeOuts.ReadConstant:=1;
    TimeOuts.WriteMultiplier:=0;
    TimeOuts.WriteConstant:=1;
  end;
  with XComm1 do
  begin
    //номер COM порта для выбранной камеры
    c:=(ComDev[8].cCom_ID);
    BaudRate:=ComList[c].cBaudRate;
    BaudValue:=ComList[c].cBaudValue;
    Buffers.InputSize:=128;
    Buffers.OutputSize:=128;
    Buffers.InputTimeout:=ComList[c].cTimeOut;
    Buffers.OutputTimeout:=0;
    DataControl.DataBits:=ComList[c].cByteSize;
    DataControl.Parity:=ComList[c].cParity;
    DataControl.StopBits:=ComList[c].cStopBits;
    DeviceName:='COM'+IntToStr(ComList[c].cCom);
    TimeOuts.ReadInterval:=1;
    TimeOuts.ReadMultiplier:=1;
    TimeOuts.ReadConstant:=1;
    TimeOuts.WriteMultiplier:=1;
    TimeOuts.WriteConstant:=1;
  end;
end;

procedure TForm1.TTTimer(Sender: TObject);
var command:TMass;
    i:integer;
begin
  command[0]:=HI(ComDev[Device_ID].cAdress);
  command[1]:=LO(ComDev[Device_ID].cAdress);
  command[2]:=Command_TM2220[18].cCommand;
  command[3]:=$ff-(command[0]+command[1]+command[2])+1;
  if not Command2220(Command,4,21,18) then SetNoValues else
  begin
    GroupBox6.Enabled:=true;
    GroupBox7.Enabled:=true;
    E11.Text:='  Yes';
    E11.Color:=clLime;
  end;
end;

procedure TForm1.TVDOn;
var command:TMass;
    i:integer;
begin
  COM_ID:=ComDev[DEVICE_ID].cCom_ID;
  if XComm1.Opened then XComm1.CloseDevice;
  XComm1.BaudRate:=ComList[COM_ID].cBaudRate;
  XComm1.BaudValue:=ComList[COM_ID].cBaudValue;
  XComm1.Buffers.InputSize:=128;
  XComm1.Buffers.OutputSize:=128;
  XComm1.Buffers.InputTimeout:=ComList[COM_ID].cTimeOut;
  XComm1.Buffers.OutputTimeout:=ComList[COM_ID].cTimeOut;
  XComm1.DataControl.DataBits:=ComList[COM_ID].cByteSize;
  XComm1.DataControl.Parity:=ComList[COM_ID].cParity;
  XComm1.DataControl.StopBits:=ComList[COM_ID].cStopBits;
  XComm1.DeviceName:='COM'+IntToStr(ComList[COM_ID].cCom);
  if Xcomm1.Opened=false then
  begin
    try XComm1.OpenDevice
    except
      begin Memo1.Lines.Clear;
          Memo1.Lines.Add('Not possible open COM-port '+XComm1.DeviceName);
          exit;
      end;
    end;
    Memo1.Lines.Clear;
    Memo1.Lines.Add(XComm1.DeviceName+' open');
  end;
  command[0]:=HI(ComDev[Device_ID].cAdress);
  command[1]:=LO(ComDev[Device_ID].cAdress);
  command[2]:=Command_TM2220[1].cCommand;
  command[3]:=$ff-(command[0]+command[1]+command[2])+1;
  if not Command2220(Command,4,5,1) then
  begin
    SetNoValues;
    exit;
  end;
  SP.Click;
  TT.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
    buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
    CompName:String;
    Size: Cardinal;
    BRes : boolean;
begin
  DEVICE_ID:=8;
  HOST_TP:=0;
  Size := MAX_COMPUTERNAME_LENGTH + 1;
  BRes := GetComputerName(@buffer, Size);
  CompName := trim(uppercase(StrPas(buffer)));
  if (UpperCase(CompName)='OLIKKE') or( UpperCase(CompName)='WSP') then HOST_TP:=1;
  if UpperCase(CompName)='WSL' then HOST_TP:=2;
  if UpperCase(CompName)='WSR' then HOST_TP:=3;
  FastIn:=TFastDib.Create;
  Panel1.Visible:=true;
  FilterGraph1.Stop;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  CapEnum:=TSysDevEnum.Create;
  CaptureFilter:=nil; FilterGraph1.Active := true;
  CapEnum.SelectGUIDCategory(CLSID_VideoInputDeviceCategory);
  if(CapEnum.CountFilters > 0) then
    for i:=0  to  CapEnum.CountFilters-1 do
      if((Pos('DECKLINK', UpperCase(CapEnum.Filters[i].FriendlyName)) <> 0)) then
      begin
        CaptureFilter := CapEnum.GetBaseFilter(i);
        break;
      end;
  CapEnum.Free;
  if not Assigned(CaptureFilter) then
  begin
    Application.MessageBox('Video board "DeckLink Intensity Pro" not detected.','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureFilter, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect DeckLink Video Capture.','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr:=GraphBuilder.AddFilter(VideoRender, 'VideoRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,nil,VideoFilter as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      Panel1.Visible:=false;
      exit;
    end;
    hr:=RenderStream(nil, nil, VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter,VideoRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      Panel1.Visible:=false;
      exit;
    end;
  end;
  (FilterGraph1 as IFilterGraph).SetDefaultSyncSource;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoRender as IVideoWindow do
  begin
    put_Owner(Form1.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(Panel1.Left,Panel1.Top,Panel1.Width,Panel1.Height);
    put_Visible(true);
    put_MessageDrain(Form1.Handle);
  end;
  FilterGraph1.Play;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FilterGraph1.Stop;
  FilterGRaph1.ClearGraph;
  FastIn.Destroy;
  try XComm1.CloseDevice except end;
  try XComm2.CloseDevice except end;
end;

procedure TForm1.RGClick(Sender: TObject);
var i:integer;
begin
  TT.Enabled:=false;
  fillChar(e,SizeOf(e),-1);
  case RG.ItemIndex of
  0: Device_ID:=7;
  1: Device_ID:=8;
  2: Device_ID:=10;
  3: Device_ID:=9;
  end;
  TVDOn;
  SetFromChannel(DEVICE_ID,HOST_TP);
end;

procedure TForm1.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var BLackCount:integer; //кол-во абсолютно чёрных пикселей
    Scaling:integer;
    n,m,c,d:integer;
    pc: TFColor;
    RGBGrey:byte;
    AllCount:integer;
begin
  BlackCount:=0;
  Scaling:=2;
  c:=0;  d:=0;
  AllCount:=0;
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  for n:=1 to (BWidth div Scaling)-1 do
    begin
      c:=0;
      for m := 1 to (BHeight div Scaling)-1 do
      begin
        if (n>=288) or (m>=384) then continue;
        pc:=FastIn.GetPixel(n*Scaling,m*Scaling);
        RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
        if RGBGrey=0 then Inc(BlackCount);
        inc(c);
        inc(AllCount);
      end;
      inc(d);
    end;
  if BlackCount=AllCount then begin  fl_Video:=false; exit; end else fl_Video:=true;
end;

end.
