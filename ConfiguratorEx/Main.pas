unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, winsock,http7302, XPMan, ExtCtrls, XiPanel,Global,UPSConfig,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,idGlobal,idSocketHandle,
  IdIPAddrMon,HTTP2409;

type
  TForm1 = class(TForm)
    XiPanel1: TXiPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    XPManifest1: TXPManifest;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    Button1: TButton;
    Memo2: TMemo;
    UDPServer: TIdUDPServer;
    Timer1: TTimer;
    ComboBox2: TComboBox;
    IPAddrMon: TIdIPAddrMon;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure UDPServerUDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MAIN;
    procedure ServMsu(var Msg: TMessage); message WM_NOTIFY_UPS;
    procedure ServMnp(var Msg: TMessage); message WM_NOTIFY_NP;
    procedure Check7302(DevType:TDeviceType);
    procedure UpdateIPAddressList;
    procedure Check2409;
    procedure StartToConfigureTM2409(dev:byte);
    procedure INITComSettings(dev:byte);
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  fStart,fStop:int64;
  fFreq       :int64;
  DevID       :byte;
  Dev2409     :byte;

implementation

{$R *.dfm}

procedure TForm1.ServMnp(var Msg: TMessage);
var str:string;
  procedure TM2409Start;
  begin
    Memo1.Lines.Clear;
    QueryPerformanceCounter(fStart);
    Memo1.Lines.Add('Start of a configuration of the device.');
    Button1.Enabled:=false;
    ComboBox1.Enabled:=false;
  end;
  procedure TM2409ChangeIP;
  begin
    Application.MessageBox(PAnsiChar('For setup of the device it is required to change network settings of the '+HOST_NAME+'.'+#10#13+
                           'Do not switch off the program and a computer during change of a configuration of a network.'+#10#13+
                           'It will take about 10 seconds.'),
                           'ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_OK);
    str:=FormatDateTime('hh:nn:ssss.zzzz  ',Now);
    str:=str+' Start procedure of change '+HOST_NAME+' network settings.';
    Memo2.Lines.Add(str);
    if Assigned(Permission) then Permission.SetEvent;
  end;
  procedure TM2409Stop(happy:boolean);
  begin
    Memo1.Clear;
    QueryPerformanceCounter(fStop);
    if happy then Memo1.Lines.Add('The configuration of the device is successfully complete.')
             else Memo1.Lines.Add('The configuration of the device finished with a error.');
    if fFreq=0 then QueryPerformanceFrequency(fFreq);
    if fFreq=0 then exit;
    Memo1.Lines.Add('Total time ='+FloatToStrF((fStop-fStart)/fFreq,ffFixed,6,2)+'s.');
    ComboBox1.Enabled:=true;
  end;
begin
  str:=FormatDateTime('hh:nn:ssss.zzzz ',Now);
  case Msg.WParam of
    INTEGER(npStart):         begin TM2409Start;      exit;  end;
    INTEGER(npStartChangeIP): begin TM2409ChangeIP;   exit;  end;
    INTEGER(npStop):          begin if Msg.LParam=INTEGER(Success) then TM2409Stop(true)
                                                                   else TM2409Stop(false); exit;  end;
    INTEGER(npStopChangeIP) : begin str:=str+' '+HOST_NAME+' network settings are changed '; end;
    INTEGER(npNewIP):         begin str:=str+' Installation of the new IP address -' end;
    INTEGER(np1):             begin str:=str+' Serial settings of COM port N1 -';     end;
    INTEGER(np2):             begin str:=str+' Serial settings of COM port N2 -';     end;
    INTEGER(np3):             begin str:=str+' Serial settings of COM port N3 -';     end;
    INTEGER(np4):             begin str:=str+' Serial settings of COM port N4 -';     end;
    INTEGER(np5):             begin str:=str+' Serial settings of COM port N5 -';     end;
    INTEGER(np6):             begin str:=str+' Serial settings of COM port N6 -';     end;
    INTEGER(np7):             begin str:=str+' Serial settings of COM port N7 -';     end;
    INTEGER(np8):             begin str:=str+' Serial settings of COM port N8 -';     end;
    INTEGER(npo1):            begin str:=str+' Operating settings of COM port N1 -';end;
    INTEGER(npo2):            begin str:=str+' Operating settings of COM port N2 -';end;
    INTEGER(npo3):            begin str:=str+' Operating settings of COM port N3 -';end;
    INTEGER(npo4):            begin str:=str+' Operating settings of COM port N4 -';end;
    INTEGER(npo5):            begin str:=str+' Operating settings of COM port N5 -';end;
    INTEGER(npo6):            begin str:=str+' Operating settings of COM port N6 -';end;
    INTEGER(npo7):            begin str:=str+' Operating settings of COM port N7 -';end;
    INTEGER(npo8):            begin str:=str+' Operating settings of COM port N8 -';end;
    INTEGER(npBasic):         begin str:=str+' The main settings -';                end;
  end;
  case Msg.LParam of
    INTEGER(Success):         begin str:=str+'successfully.';  end;
    INTEGER(Failure):         begin str:=str+'with a error.'; end
    else  begin str:=str+'with a error.'; Memo2.Lines.Add(str); str:=SysErrorMessage(Msg.LParam); end;
  end;
  Memo2.Lines.Add(str);
end;

procedure TForm1.ServMsu(var Msg: TMessage);
  procedure TM2411Start;
  begin
    if UPSStartWork then exit;  
    Memo1.Lines.Clear;
    QueryPerformanceCounter(fStart);
    Memo1.Lines.Add('Start of a configuration of the device.');
    Button1.Enabled:=false;
    ComboBox1.Enabled:=false;
    UPSStartWork:=true;
  end;
  procedure TM2411Complete(happy:boolean);
  begin
    Memo1.Clear;
    QueryPerformanceCounter(fStop);
    if happy then
    begin
      Memo1.Lines.Add('The configuration of the device is successfully complete.');
      if fFreq=0 then QueryPerformanceFrequency(fFreq);
      if fFreq=0 then exit;
      Memo1.Lines.Add('Total time ='+FloatToStrF((fStop-fStart)/fFreq,ffFixed,6,2)+'s.');
    end  else
    Memo1.Lines.Add('The configuration of the device finished with a error.');
    ComboBox1.Enabled:=true;
  end;
var str:string;
begin
  str:=FormatDateTime('hh:nn:ssss.zzzz  ',Now)+#09;
  case Msg.WParam of
    INTEGER(upsCOMOPEN)   :    begin str:=str+'Open COM port -'; end;
    INTEGER(upsLOGIN)     :    begin str:=str+'LOGIN -';         end;
    INTEGER(upsPASSWORD)  :    begin str:=str+'PASSWORD -';      end;
    INTEGER(upsFIND)      :    begin TM2411Start; exit;          end;
    INTEGER(upsCRASH)     :    begin TM2411Complete(false);  exit;end;
    INTEGER(upsBoot)      :    begin str:=str+'Check of a method of installation IP-address -'; end;
    INTEGER(upsReboot)    :    begin str:=str+'Reboot device. Wait about 1 minute -';  end;
    INTEGER(upsSetip)     :    begin str:=str+'Check of the established IP-address -';   end;
    INTEGER(upsBootManual):    begin str:=str+'Change of a method of installation IP-address -'; end;
    INTEGER(upsSave)      :    begin str:=str+'Save new settings -'; end;
    INTEGER(upsExit)      :    begin TM2411Complete(true);  exit;    end;
    INTEGER(upsYES)       :    exit;
    INTEGER(upsSetipFull) :    begin str:=str+'Setting new device configuration -';  end
    else ShowMEssage(IntToStr(Msg.WParam));
  end;
  case Msg.LParam of
     INTEGER(Success)     :    begin str:=str+#13#10+#09+#09'Success' end;
     INTEGER(Failure)     :    begin str:=str+#13#10+#09+#09'Error'end;
  end;
  Memo2.Lines.Add(str);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:integer;
begin
  Timer1.Enabled   :=false;
  ComboBox1.Enabled:=true;
  case Count2409 of
    1: begin
         Memo1.Lines.Add('Ready to a configuration of the new device.');
         ComboBox1.Enabled:=false;
         Button1.Enabled:=true;
       end;
    0: begin
         Memo1.Lines.Add('Device not found.');
       end
    else
       begin
         Memo1.Lines.Add('More than one device is found.'+
                         'For setup of this device it is recommended to disconnect a power supply from others TM-2409-1.'+
                         'Or you can choose the necessary device from the below list.');
         ComboBox2.Visible:=true;
         ComboBox2.Top:=Button1.Top;
         ComboBox2.Items.Clear;
         ComboBox2.Items.BeginUpdate;
         for i:=0 to Count2409-1 do
           ComboBox2.Items.Add('IP = "'+New2409[i].IP+'"'+' MAC = "'+New2409[i].MAC);
         ComboBox2.Items.EndUpdate;
       end;
  end;
end;

procedure TForm1.UDPServerUDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var IP,MAC:string;
    i     :integer;
    flag  :boolean;
begin
  if Length(AData)<>24 then exit;
  IP   :=IntToStr(AData[20])+'.'+IntToStr(AData[21])+'.'+IntToStr(AData[22])+'.'+IntToStr(AData[23]);
  MAC  :=IntToHex(AData[14],2)+':'+IntToHex(AData[15],2)+':'+IntToHex(AData[16],2)+':'+IntToHex(AData[17],2)+':'+IntToHex(AData[18],2)+':'+IntToHex(AData[19],2);
  if Count2409=0 then INC(Count2409) else
  begin
    flag :=true;
    for i:=0 to Count2409-1 do
    begin
      if MAC=New2409[i].MAC then flag:=false;
    end;
    if flag then INC(Count2409) else exit;
  end;
  SetLength(New2409,Count2409);
  New2409[Count2409-1].IP :=IP;
  New2409[Count2409-1].Mac:=MAC;
end;

procedure TForm1.ServMsd(var Msg: TMessage);
  procedure EM7302Start;
  begin
    QueryPerformanceCounter(fStart);
    Memo1.Lines.Add('Start of a configuration of the device.');
    Button1.Enabled:=false;
  end;
  procedure EM7302Complete;
  begin
    Memo1.Clear;
    QueryPerformanceCounter(fStop);
    Memo1.Lines.Add('The configuration of the device is successfully complete.');
    if fFreq=0 then QueryPerformanceFrequency(fFreq);
    if fFreq=0 then exit;
    Memo1.Lines.Add('Total time ='+FloatToStrF((fStop-fStart)/fFreq,ffFixed,6,2)+'s.');
    ComboBox1.Enabled:=true;
  end;
var str:string;
    NumberOfCase:byte;
begin
  str:=FormatDateTime('hh:nn:ssss.zzzz:',Now)+#09;
  case Msg.WParam of
    INTEGER(stStart):      begin EM7302Start;                                   exit;  end;
    INTEGER(stStop):       begin EM7302Complete;                                exit;  end;
    INTEGER(stERROR):      begin str:=str+'ERROR!'+#09;                         NumberOfCase:=3;  end;
    INTEGER(stCreation):   begin str:=str+'Socket create.'+#09+#09;              NumberOfCase:=1;  end;
    INTEGER(stConnection): begin str:=str+'Connection.'+#09+#09;                 NumberOfCase:=1;  end;
    INTEGER(stIP):         begin str:=str+'New IP address.'+#09+#09;             NumberOfCase:=1;  end;
    INTEGER(stMask):       begin str:=str+'New IP mask.'+#09+#09;                NumberOfCase:=1;  end;
    INTEGER(stGateway):    begin str:=str+'New Gateway.'+#09+#09;                NumberOfCase:=1;  end;
    INTEGER(stMethod):     begin str:=str+'New IP adress type.'+#09+#09;         NumberOfCase:=1;  end;
    INTEGER(stUpdate):     begin str:=str+'Network Configuration.'+#09;          NumberOfCase:=2;  end;
    INTEGER(stSource):     begin str:=str+'Configuration source N'+IntToStr(Msg.LParam shr 4)+#09;
                                                                                NumberOfCase:=4;   end;
    INTEGER(stDestination):begin str:=str+'Configuration destination N'+IntToStr(Msg.LParam shr 4)+#09;
                                                                                NumberOfCase:=4;   end;

    INTEGER(stSwitch):     begin str:=str+'Switching on destination N'+IntToStr(Msg.LParam shr 4)+#09;
                                                                                NumberOfCase:=4;   end;
    INTEGER(stAutoConfig): begin str:=str+'Auto configure of devices'+#09;      NumberOfCase:=1;   end;
    INTEGER(stDispIntens): begin str:=str+'Intensity of the display'+#09;       NumberOfCase:=1;   end;
  end;
  case NumberOfCase of
    1:    case Msg.LParam of
            INTEGER(Success): str:=str+'Success';
            INTEGER(Failure):  str:=str+'Failed';
          end;
    2:    case Msg.LParam of
            INTEGER(Success): str:=str+'Complete';
            INTEGER(Failure):  str:=str+'Failed';
          end;
    3:    begin
            Memo2.Lines.Add('');
            str:=str+'bla-bla-bla';
          end;
    4:    case (Msg.LParam and $0F) of
            INTEGER(Success): str:=str+'Success';
            INTEGER(Failure):  str:=str+'Failed';
          end;
  end;
  Memo2.Lines.Add(str);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ComboBox1.Enabled:=false;
  case DEVID of
    0:  EM7302:=THTTPInputThread.Create('192.168.101.1',Form1.Handle,'192.168.3.6','255.255.255.0','192.168.3.25',TEM7302);
    18: EM7302:=THTTPInputThread.Create('192.168.101.1',Form1.Handle,'192.168.4.6','255.255.255.0','192.168.4.25',TEM7302);
    1:  UPS   :=TUPS.Create(31,Form1.Handle,'192.168.3.12','255.255.255.0','192.168.3.25');
    2:  UPS   :=TUPS.Create(32,Form1.Handle,'192.168.3.14','255.255.255.0','192.168.3.25');
    3:  UPS   :=TUPS.Create(33,Form1.Handle,'192.168.3.16','255.255.255.0','192.168.3.25');
    4:  StartToConfigureTM2409(DEV2409);
    5:  StartToConfigureTM2409(DEV2409);
    6:  EM7303:=THTTPInputThread.Create('192.168.101.1',Form1.Handle,'192.168.3.8','255.255.255.0','192.168.3.25',TEM7303);
    7:  UPS   :=TUPS.Create(21,Form1.Handle,'192.168.1.4','255.255.255.128','192.168.1.122');
    8:  UPS   :=TUPS.Create(11,Form1.Handle,'192.168.1.130','255.255.255.128','192.168.1.232');
    9:  UPS   :=TUPS.Create(22,Form1.Handle,'192.168.1.6','255.255.255.128','192.168.1.122');
    10: StartToConfigureTM2409(DEV2409);
    11: StartToConfigureTM2409(DEV2409);
    16: UPS   :=TUPS.Create(51,Form1.Handle,'192.168.4.12','255.255.255.0','192.168.4.25');
    17: UPS   :=TUPS.Create(52,Form1.Handle,'192.168.4.14','255.255.255.0','192.168.4.25');
    19: StartToConfigureTM2409(DEV2409);
  end;
end;

procedure TForm1.UpdateIPAddressList;
var i:integer;
begin
  IPAddrMon.Active:=true;
  IPAddrMon.Busy:=true;
  SetLength(MyIP,IPAddrMon.IPAddresses.Count);
  CountMyIP:=IPAddrMon.IPAddresses.Count;
  for i:=0 to IPAddrMon.IPAddresses.Count-1 do
    MyIp[i]:=TRIM(IPAddrMon.IPAddresses.Strings[i]);
  IPAddrMon.Active:=false;
  IPAddrMon.Busy:=false;
end;

procedure TForm1.StartToConfigureTM2409(dev:byte);
begin
  UpdateIPAddressList;
  InitComSettings(devid);
  case DEVID of
    4:  TM2409:=TTM2409.Create(New2409[DEV].IP,'192.168.3.2', '255.255.255.0',  Form1.Handle,'TM-2409-1(A28/A3)');
    5:  TM2409:=TTM2409.Create(New2409[DEV].IP,'192.168.3.4', '255.255.255.0',  Form1.Handle,'TM-2409-1(A28/A4)');
    10: TM2409:=TTM2409.Create(New2409[DEV].IP,'192.168.1.8',  '255.255.255.128',Form1.Handle,'TM-2409-1(A5/A4)');
    11: TM2409:=TTM2409.Create(New2409[DEV].IP,'192.168.1.132','255.255.255.128',Form1.Handle,'TM-2409-1(A5/A5)');
    19: TM2409:=TTM2409.Create(New2409[DEV].IP,'192.168.4.2', '255.255.255.0',  Form1.Handle,'TM-2409-1(A51/A3)');
  end;
end;

procedure TForm1.InitComSettings(dev:byte);
var i:integer;
begin
  for i:=1 to 3 do
  begin
    ComSettings[i].Alias    :='UPS';
    ComSettings[i].BaudRate :=IntToStr(INTEGER(b115200)+2);
    ComSettings[i].DataBits :=IntToStr(INTEGER(d8));
    ComSettings[i].StopBits :=IntToStr(INTEGER(s1));
    ComSettings[i].Parity   :=Parity[pNone];
    ComSettings[i].ifType   :=IntToStr(INTEGER(rs232));
  end;
  if (dev=4) or (dev=19) then
  begin
    begin
      ComSettings[4].Alias    :='EM7212';
      ComSettings[4].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[4].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[4].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[4].Parity   :=Parity[pNone];
      ComSettings[4].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    for i:=5 to 6 do
    begin
      ComSettings[i].Alias    :='-';
      ComSettings[i].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[i].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[i].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[i].Parity   :=Parity[pNone];
      ComSettings[i].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[8].Alias    :='-';
      ComSettings[8].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[8].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[8].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[8].Parity   :=Parity[pNone];
      ComSettings[8].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[7].Alias    :='EM7212';
      ComSettings[7].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[7].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[7].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[7].Parity   :=Parity[pNone];
      ComSettings[7].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    exit;
  end;
  if (dev=5) then
  begin
    for i:=5 to 6 do
    begin
      ComSettings[i].Alias    :='EM5402';
      ComSettings[i].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[i].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[i].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[i].Parity   :=Parity[pNone];
      ComSettings[i].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[7].Alias    :='EM3401';
      ComSettings[7].BaudRate :=IntToStr(INTEGER(b115200)+2);
      ComSettings[7].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[7].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[7].Parity   :=Parity[pNone];
      ComSettings[7].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[8].Alias    :='EM5401';
      ComSettings[8].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[8].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[8].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[8].Parity   :=Parity[pNone];
      ComSettings[8].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
  end;
  if (dev=10) or (dev=11) then
  begin
    begin
      ComSettings[4].Alias    :='EM5401';
      ComSettings[4].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[4].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[4].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[4].Parity   :=Parity[pNone];
      ComSettings[4].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[5].Alias    :='EM5402';
      ComSettings[5].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[5].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[5].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[5].Parity   :=Parity[pNone];
      ComSettings[5].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[6].Alias    :='EM3401';
      ComSettings[6].BaudRate :=IntToStr(INTEGER(b115200)+2);
      ComSettings[6].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[6].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[6].Parity   :=Parity[pNone];
      ComSettings[6].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[7].Alias    :='LUNA';
      ComSettings[7].BaudRate :=IntToStr(INTEGER(b19200)+2); 
      ComSettings[7].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[7].StopBits :=IntToStr(INTEGER(s1));
      ComSettings[7].Parity   :=Parity[pNone];
      ComSettings[7].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
    begin
      ComSettings[8].Alias    :='PRLK';
      ComSettings[8].BaudRate :=IntToStr(INTEGER(b57600)+2);
      ComSettings[8].DataBits :=IntToStr(INTEGER(d8));
      ComSettings[8].StopBits :=IntToStr(INTEGER(s2));
      ComSettings[8].Parity   :=Parity[pEVEN];
      ComSettings[8].ifType   :=IntToStr(INTEGER(rs485wire2));
    end;
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var DT:TDevType;
begin
  if not (ComboBox1.ItemIndex in [0..9]) then exit;
  Memo1.Clear;
  Memo2.Clear;
  ComboBox2.Visible:=false;
  DT:=DeviceTM[ComboBox1.ItemIndex];
  DevID:=DeviceNm[ComboBox1.ItemIndex];
  ComboBox1.Enabled:=false;
  case INTEGER(DT) of
    INTEGER(dt7302):  Check7302(TEM7302);
    INTEGER(dt2411):  begin Button1.Enabled:=true; Memo1.Lines.Add('Ready to a configuration of the new device.'); end;
    INTEGER(dt2409):  Check2409;
    INTEGER(dt7303):  Check7302(TEM7303);
  end;
  Memo2.Lines.Clear;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  if Application.MessageBox('Are you  sure?','ATTENTION!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
    if Application.MessageBox('Are you  PRECISELY sure?','FINAL WARNING!',MB_DEFBUTTON2+MB_ICONWARNING+MB_YESNO)=mrYes then
    begin
      Button1.Enabled  :=true;
      Memo1.Lines.Add('Ready to a configuration of the new device.');
    end;
  Dev2409          :=ComboBox2.ItemIndex;
  ComboBox2.Visible:=false;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  case HOST_TP of
    2:  begin
          with ComboBox1.Items do
          begin
            Add('Remultiplexer        EM-7302-1   (A28/A7)');
            Add('Remultiplexer        EM-7302-1   (A51/A5)');
            Add('UPS module            TM-2411-1   (A28/A14)');
            Add('UPS module            TM-2411-1   (A28/A15)');
            Add('UPS module            TM-2411-1   (A28/A16)');
            Add('UPS module            TM-2411-1   (A51/A7)');
            Add('UPS module            TM-2411-1   (A51/A8)');
            Add('Gateway module    TM-2409-1   (A28/A3)');
            Add('Gateway module    TM-2409-1   (A28/A4)');
            Add('Gateway module    TM-2409-1   (A51/A3)');
            Add('Channel selector   EM-7303-1   (A28/A6)');
          end;
          DeviceTM[0]:=dt7302;  DeviceNm[0]:=0;
          DeviceTM[1]:=dt7302;  DeviceNm[1]:=18;
          DeviceTM[2]:=dt2411;   DeviceNm[2]:=1;
          DeviceTM[3]:=dt2411;   DeviceNm[3]:=2;
          DeviceTM[4]:=dt2411;   DeviceNm[4]:=3;
          DeviceTM[5]:=dt2411;   DeviceNm[5]:=16;
          DeviceTM[6]:=dt2411;   DeviceNm[6]:=17;
          DeviceTM[7]:=dt2409;   DeviceNm[7]:=4;
          DeviceTM[8]:=dt2409;   DeviceNm[8]:=5;
          DeviceTM[9]:=dt2409;   DeviceNm[9]:=19;
          DeviceTM[10]:=dt7303;   DeviceNm[10]:=6;
        end;
    1:  begin
          with ComboBox1.Items do
          begin
            Add('UPS module            TM-2411-1   (A5/A7)');
            Add('UPS module            TM-2411-1   (A5/A8)');
            Add('UPS module            TM-2411-1   (A5/A9)');
            Add('Gateway module   TM-2409-1   (A5/A4)');
            Add('Gateway module   TM-2409-1   (A5/A5)');
          end;
          DeviceTM[0]:=dt2411;    DeviceNm[0]:=7;
          DeviceTM[1]:=dt2411;    DeviceNm[1]:=8;
          DeviceTM[2]:=dt2411;    DeviceNm[2]:=9;
          DeviceTM[3]:=dt2409;    DeviceNm[3]:=10;
          DeviceTM[4]:=dt2409;    DeviceNm[4]:=11;
          DeviceTM[5]:=dtzero;    DeviceNm[5]:=12;
          DeviceTM[6]:=dtzero;    DeviceNm[6]:=13;
          DeviceTM[7]:=dtzero;    DeviceNm[7]:=14;
          DeviceTM[8]:=dtzero;    DeviceNm[8]:=15;
          DeviceTM[9]:=dtzero;    DeviceNm[8]:=16;
          DeviceTM[10]:=dtzero;   DeviceNm[8]:=16;
        end;
  end;


end;

procedure TForm1.Check2409;
var str:string;
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Wait...Search new device...');
  SetLength(str,8);
  str[1]:=chr($01);   str[2]:=chr($00);
  str[3]:=chr($00);   str[4]:=chr($08);
  str[5]:=chr($00);   str[6]:=chr($00);
  str[7]:=chr($00);   str[8]:=chr($00);
  UDPServer.Active:=true;
  Count2409:=0;
  Timer1.Enabled:=true;
  UDPServer.Send('255.255.255.255',4800,str);
  UDPServer.Send('255.255.255.255',4800,str);
  UDPServer.Send('255.255.255.255',4800,str);
  UDPServer.Send('255.255.255.255',4800,str);
end;

procedure TForm1.Check7302(DevType:TDeviceType);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add('Wait...Search new device...');
  if not ping(PAnsiChar('192.168.101.1'),PAnsiChar('aaaaaaaa'),10) then
  begin
    Memo1.Lines.Add('Device not found.');
    case INTEGER(DevType)of
      INTEGER(TEM7302):Memo1.Lines.Add('Check, that device is connected. Press and hold the safeboot button on the back of the unit and wait for blicking Identify LED');
      INTEGER(TEM7303): Memo1.Lines.Add('Check, that device is connected. Simultaneously press and hold the "SHIFT SRC" & "SHIFT DEST" blank buttons on the unit for five seconds.');
    end;
    ComboBox1.Enabled:=true;
  end else
  begin
    Memo1.Lines.Add('Ready to a configuration of the new device.');
    ComboBox1.Enabled:=false;
    Button1.Enabled:=true;
    ComboBox1.Enabled:=true;
  end;
end;

end.
