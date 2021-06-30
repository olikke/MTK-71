unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Math, ExtCtrls, Protocol, MMSystem, ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    l1: TLabel;
    e1: TEdit;
    e2: TEdit;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    e3: TEdit;
    e4: TEdit;
    l6: TLabel;
    l5: TLabel;
    l8: TLabel;
    l10: TLabel;
    e6: TEdit;
    e5: TEdit;
    e8: TEdit;
    e10: TEdit;
    l13: TLabel;
    l14: TLabel;
    l15: TLabel;
    l16: TLabel;
    e13: TEdit;
    e14: TEdit;
    e15: TEdit;
    e16: TEdit;
    l12: TLabel;
    l11: TLabel;
    l9: TLabel;
    l7: TLabel;
    e7: TEdit;
    e9: TEdit;
    e11: TEdit;
    e12: TEdit;
    {e21: TEdit; }
    l20: TLabel;
    l19: TLabel;
    e19: TEdit;
    l18: TLabel;
    e18: TEdit;
    l17: TLabel;
    e17: TEdit;
    e20: TEdit;
    GroupBox3: TGroupBox;
    Label38: TLabel;
    ComboBox1: TComboBox;
    Label44: TLabel;
    ComboBox2: TComboBox;
    GroupBox4: TGroupBox;
    Label43: TLabel;
    Label45: TLabel;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Panel1: TPanel;
    Button2: TButton;
    Button1: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    Edit717: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    ep1: TEdit;
    ep2: TEdit;
    ep3: TEdit;
    ep4: TEdit;
    ep6: TEdit;
    ep5: TEdit;
    ep8: TEdit;
    ep10: TEdit;
    ep13: TEdit;
    ep14: TEdit;
    ep16: TEdit;
    ep7: TEdit;
    ep9: TEdit;
    ep11: TEdit;
    ep12: TEdit;
    ep19: TEdit;
    ep18: TEdit;
    ep17: TEdit;
    ep20: TEdit;
    GroupBox5: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    GroupBox6: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    GroupBox7: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    en1: TEdit;
    en2: TEdit;
    en3: TEdit;
    en4: TEdit;
    en6: TEdit;
    en5: TEdit;
    en8: TEdit;
    en10: TEdit;
    en13: TEdit;
    en14: TEdit;
    en15: TEdit;
    en16: TEdit;
    en7: TEdit;
    en9: TEdit;
    en11: TEdit;
    en12: TEdit;
    en19: TEdit;
    en18: TEdit;
    en17: TEdit;
    en20: TEdit;
    GroupBox8: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    GroupBox9: TGroupBox;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ep15: TEdit;
    Tabs_SW: TTabControl;
    RadioGroup15: TRadioGroup;
    RadioGroup16: TRadioGroup;
    RadioGroup17: TRadioGroup;
    RadioGroup18: TRadioGroup;
    RadioGroup19: TRadioGroup;
    RadioGroup20: TRadioGroup;
    RadioGroup21: TRadioGroup;
    Label17: TLabel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    RadioGroup7: TRadioGroup;
    RadioGroup8: TRadioGroup;
    RadioGroup9: TRadioGroup;
    RadioGroup10: TRadioGroup;
    RadioGroup11: TRadioGroup;
    RadioGroup12: TRadioGroup;
    RadioGroup13: TRadioGroup;
    RadioGroup14: TRadioGroup;
    Label18: TLabel;
    Label47: TLabel;
    RadioGroup22: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    {procedure RadioGroup16Click(Sender: TObject);}


    procedure Tabs_SWChange(Sender: TObject);
    {procedure CheckBox4Click(Sender: TObject);
    procedure Label46Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);}
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure INIT(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure PostSendedMas(FHandl:THandle;MAS1,MAS2,MAS3:TMAS);
    procedure PostSendedWord(FHandl:THandle;GR,KC,CD:Word);
    procedure Edit717Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure SetData_p(Sender: TObject);
    procedure SetData_c(Sender: TObject);
    procedure SetData_n(Sender: TObject);
    procedure e1Change(Sender: TObject);
    {procedure Edit41Change(Sender: TObject);}

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var sd,cc1:Word;
    tStart:Single;
    MSI:Array[1..20] of Boolean;
    MSCML:Array[1..20] of Extended;
    MS_n,MS_c,MS_p{,MS456} :Array[1..20] of Extended;
    PostNum:Word;
    DT1:TDateTime;
    Interval:Integer;
    uTimerID:HWND;
    fl:boolean=false;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject); //стоп
begin
  if Button3.Enabled then  Button3Click(Self);
  Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PortList.Free;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Button3.Enabled then  Button3Click(Self);
end;

procedure TForm1.SetData_n(Sender: TObject);
begin
  if TRIM(en1.Text)='' then En1.Text:='0';
  if TRIM(en2.Text)='' then En2.Text:='0';
  if TRIM(en3.Text)='' then En3.Text:='0';
  if TRIM(en4.Text)='' then En4.Text:='0';
  if TRIM(en5.Text)='' then En5.Text:='0';
  if TRIM(en6.Text)='' then En6.Text:='0';
  if TRIM(en7.Text)='' then En7.Text:='0';
  if TRIM(en8.Text)='' then En8.Text:='0';
  if TRIM(en9.Text)='' then En9.Text:='0';
  if TRIM(en10.Text)=''then En10.Text:='0';
  if TRIM(en11.Text)=''then En11.Text:='0';
  if TRIM(en12.Text)=''then En12.Text:='0';
  if TRIM(en13.Text)=''then En13.Text:='0';
  if TRIM(en14.Text)=''then En14.Text:='0';
  if TRIM(en15.Text)=''then En15.Text:='0';
  if TRIM(en16.Text)=''then En16.Text:='0';
  if TRIM(en17.Text)=''then En17.Text:='0';
  if TRIM(en18.Text)=''then En18.Text:='0';
  {case RadioGroup1.ItemIndex of
  0: begin }
     MS_n[1]:=StrToFloatDef(en1.Text,0);    //Эл.координата FI
     MS_n[2]:=StrToFloatDef(en2.Text,0);    //Эл.координата LM
     MS_n[3]:=StrToFloatDef(en3.Text,0);    //Сев.скорость Vn
     MS_n[4]:=StrToFloatDef(en4.Text,0);    //Вост.скорость Ve
     MS_n[5]:=StrToFloatDef(en5.Text,0);    //Скорость от лага
     MS_n[6]:=StrToFloatDef(en6.Text,0);    //Курс
     MS_n[7]:=StrToFloatDef(en7.Text,0);    //Угл.скор.курса
     MS_n[8]:=StrToFloatDef(en8.Text,0);    //Угол кил.качки
     MS_n[9]:=StrToFloatDef(en9.Text,0);    //Угл.скор.кил.качки
     MS_n[10]:=StrToFloatDef(en10.Text,0);  //Угол борт.качки
     MS_n[11]:=StrToFloatDef(en11.Text,0);  //Угл.скор.борт.качки
     MS_n[12]:=StrToFloatDef(en12.Text,0);  //Лин.скорость Vn
     MS_n[13]:=StrToFloatDef(en13.Text,0);  //Лин.скорость Ve
     MS_n[14]:=StrToFloatDef(en14.Text,0);  //Лин.скорость Vz
     MS_n[15]:=StrToFloatDef(en15.Text,0);  //Перемещ.Sn
     MS_n[16]:=StrToFloatDef(en16.Text,0);  //Перемещ.Se
     MS_n[17]:=StrToFloatDef(en17.Text,0);  //Перемещ.Sz
     MS_n[18]:=StrToFloatDef(en18.Text,0);  //Угол накл.палубы
  MS_n[19]:=Time; en19.Text:=TimeToStr(MS_n[19]);
  MS_n[20]:=Date; en20.Text:=dateToStr(MS_n[20]);
end;

procedure TForm1.SetData_c(Sender: TObject);
begin
  if TRIM(e1.Text)='' then E1.Text:='0';
  if TRIM(e2.Text)='' then E2.Text:='0';
  if TRIM(e3.Text)='' then E3.Text:='0';
  if TRIM(e4.Text)='' then E4.Text:='0';
  if TRIM(e5.Text)='' then E5.Text:='0';
  if TRIM(e6.Text)='' then E6.Text:='0';
  if TRIM(e7.Text)='' then E7.Text:='0';
  if TRIM(e8.Text)='' then E8.Text:='0';
  if TRIM(e9.Text)='' then E9.Text:='0';
  if TRIM(e10.Text)=''then E10.Text:='0';
  if TRIM(e11.Text)=''then E11.Text:='0';
  if TRIM(e12.Text)=''then E12.Text:='0';
  if TRIM(e13.Text)=''then E13.Text:='0';
  if TRIM(e14.Text)=''then E14.Text:='0';
  if TRIM(e15.Text)=''then E15.Text:='0';
  if TRIM(e16.Text)=''then E16.Text:='0';
  if TRIM(e17.Text)=''then E17.Text:='0';
  if TRIM(e18.Text)=''then E18.Text:='0';
  {case RadioGroup1.ItemIndex of
  0: begin  }
     MS_c[1]:=StrToFloatDef(e1.Text,0);    //Эл.координата FI
     MS_c[2]:=StrToFloatDef(e2.Text,0);    //Эл.координата LM
     MS_c[3]:=StrToFloatDef(e3.Text,0);    //Сев.скорость Vn
     MS_c[4]:=StrToFloatDef(e4.Text,0);    //Вост.скорость Ve
     MS_c[5]:=StrToFloatDef(e5.Text,0);    //Скорость от лага
     MS_c[6]:=StrToFloatDef(e6.Text,0);    //Курс
     MS_c[7]:=StrToFloatDef(e7.Text,0);    //Угл.скор.курса
     MS_c[8]:=StrToFloatDef(e8.Text,0);    //Угол кил.качки
     MS_c[9]:=StrToFloatDef(e9.Text,0);    //Угл.скор.кил.качки
     MS_c[10]:=StrToFloatDef(e10.Text,0);  //Угол борт.качки
     MS_c[11]:=StrToFloatDef(e11.Text,0);  //Угл.скор.борт.качки
     MS_c[12]:=StrToFloatDef(e12.Text,0);  //Лин.скорость Vn
     MS_c[13]:=StrToFloatDef(e13.Text,0);  //Лин.скорость Ve
     MS_c[14]:=StrToFloatDef(e14.Text,0);  //Лин.скорость Vz
     MS_c[15]:=StrToFloatDef(e15.Text,0);  //Перемещ.Sn
     MS_c[16]:=StrToFloatDef(e16.Text,0);  //Перемещ.Se
     MS_c[17]:=StrToFloatDef(e17.Text,0);  //Перемещ.Sz
     MS_c[18]:=StrToFloatDef(e18.Text,0);  //Угол накл.палубы
    {end;
  1: begin
     MS123[1]:=0;
     MS123[2]:=0;
     MS123[3]:=0;
     MS123[4]:=0;
     MS123[5]:=0;
     MS123[6]:=0;
     MS123[7]:=0;
     MS123[8]:=0;
     MS123[9]:=0;
     MS123[10]:=0;
     MS123[11]:=0;
     MS123[12]:=0;
     MS123[13]:=0;
     MS123[14]:=0;
     MS123[15]:=0;
     MS123[16]:=0;
     MS123[17]:=0;
     MS123[18]:=0;
     end;
  end;}
  MS_c[19]:=Time; e19.Text:=TimeToStr(MS_c[19]);
  MS_c[20]:=Date; e20.Text:=dateToStr(MS_c[20]);
end;

procedure TForm1.SetData_p(Sender: TObject);
begin
  if TRIM(ep1.Text)='' then Ep1.Text:='0';
  if TRIM(ep2.Text)='' then Ep2.Text:='0';
  if TRIM(ep3.Text)='' then Ep3.Text:='0';
  if TRIM(ep4.Text)='' then Ep4.Text:='0';
  if TRIM(ep5.Text)='' then Ep5.Text:='0';
  if TRIM(ep6.Text)='' then Ep6.Text:='0';
  if TRIM(ep7.Text)='' then Ep7.Text:='0';
  if TRIM(ep8.Text)='' then Ep8.Text:='0';
  if TRIM(ep9.Text)='' then Ep9.Text:='0';
  if TRIM(ep10.Text)=''then Ep10.Text:='0';
  if TRIM(ep11.Text)=''then Ep11.Text:='0';
  if TRIM(ep12.Text)=''then Ep12.Text:='0';
  if TRIM(ep13.Text)=''then Ep13.Text:='0';
  if TRIM(ep14.Text)=''then Ep14.Text:='0';
  if TRIM(ep15.Text)=''then Ep15.Text:='0';
  if TRIM(ep16.Text)=''then Ep16.Text:='0';
  if TRIM(ep17.Text)=''then Ep17.Text:='0';
  if TRIM(ep18.Text)=''then Ep18.Text:='0';
  {case RadioGroup1.ItemIndex of
  0: begin }
     MS_p[1]:=StrToFloatDef(ep1.Text,0);    //Эл.координата FI
     MS_p[2]:=StrToFloatDef(ep2.Text,0);    //Эл.координата LM
     MS_p[3]:=StrToFloatDef(ep3.Text,0);    //Сев.скорость Vn
     MS_p[4]:=StrToFloatDef(ep4.Text,0);    //Вост.скорость Ve
     MS_p[5]:=StrToFloatDef(ep5.Text,0);    //Скорость от лага
     MS_p[6]:=StrToFloatDef(ep6.Text,0);    //Курс
     MS_p[7]:=StrToFloatDef(ep7.Text,0);    //Угл.скор.курса
     MS_p[8]:=StrToFloatDef(ep8.Text,0);    //Угол кил.качки
     MS_p[9]:=StrToFloatDef(ep9.Text,0);    //Угл.скор.кил.качки
     MS_p[10]:=StrToFloatDef(ep10.Text,0);  //Угол борт.качки
     MS_p[11]:=StrToFloatDef(ep11.Text,0);  //Угл.скор.борт.качки
     MS_p[12]:=StrToFloatDef(ep12.Text,0);  //Лин.скорость Vn
     MS_p[13]:=StrToFloatDef(ep13.Text,0);  //Лин.скорость Ve
     MS_p[14]:=StrToFloatDef(ep14.Text,0);  //Лин.скорость Vz
     MS_p[15]:=StrToFloatDef(ep15.Text,0);  //Перемещ.Sn
     MS_p[16]:=StrToFloatDef(ep16.Text,0);  //Перемещ.Se
     MS_p[17]:=StrToFloatDef(ep17.Text,0);  //Перемещ.Sz
     MS_p[18]:=StrToFloatDef(ep18.Text,0);  //Угол накл.палубы
     {end;
  1: begin
     MS123[1]:=0;
     MS123[2]:=0;
     MS123[3]:=0;
     MS123[4]:=0;
     MS123[5]:=0;
     MS123[6]:=0;
     MS123[7]:=0;
     MS123[8]:=0;
     MS123[9]:=0;
     MS123[10]:=0;
     MS123[11]:=0;
     MS123[12]:=0;
     MS123[13]:=0;
     MS123[14]:=0;
     MS123[15]:=0;
     MS123[16]:=0;
     MS123[17]:=0;
     MS123[18]:=0;
     end;
  end;}
  MS_p[19]:=Time; ep19.Text:=TimeToStr(MS_p[19]);
  MS_p[20]:=Date; ep20.Text:=dateToStr(MS_p[20]);
end;

procedure TForm1.INIT(Sender: TObject);
var i:byte;
    cd1,cd2:Single;
begin

  cd1:= 1.0/2147483648.0;
  cd2:= 1.0/32768.0;

  sd := 64497;
  kc[1]:=64061;  zm[1]:=32;   cc[1]:=64;
  kc[2]:=64093;  zm[2]:=64;   cc[2]:=64;
  kc[3]:=64125;  zm[3]:=96;   cc[3]:=64;

  SetData_c(Self);

  for i:=1 to 20 do
   begin
     case i of 1,2,6,8,10,19: MSI[i]:=TRUE; else MSI[i]:=false;end;

     case i of
                 1,2,6,8,10: MSCML[i]:=360.0*cd1;
                         18: MSCML[i]:=360.0*cd2;
      3,4,5,7,9,11,12,13,17: MSCML[i]:=32.0*cd2;
                         14: MSCML[i]:=16.0*cd2;
                      15,16: MSCML[i]:=64.0*cd2;
                         19: MSCML[i]:=0.5*cd1;
     end;
   end;
  IOCTL_TMK_GetVersion :=CTL_CODE(TMK_KRNLDRVR,VTMK_GetVersion,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkselect  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkselect,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkconfig  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkconfig,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkdefevent:=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkdefevent,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcreset    :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcreset,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcdefbase  :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcdefbase,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcstart    :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcstart,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcputw     :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcputw,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkgetevd  :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkgetevd,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcputblk   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcputblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcgetw     :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcgetw,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcgetblk   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcgetblk,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_tmkdone    :=CTL_CODE(TMK_KRNLDRVR,VTMK_tmkdone,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
  IOCTL_TMK_bcdefbus   :=CTL_CODE(TMK_KRNLDRVR,VTMK_bcdefbus,
                                 METHOD_NEITHER,FILE_ANY_ACCESS);
end;


procedure TForm1.FormCreate(Sender: TObject);
var DT:TDateTime;
begin
  PortList:=TList.Create;
  DT:=TIME;
  tStart:=DT-TRUNC(DT);
  INIT(Self);
  {CD1:=StrToInt(Edit41.Text);}
  SetData_c(Self);
  ComboBox1.ItemIndex:=6;
  ComboBox2.ItemIndex:=7;
  ComboBox3.ItemIndex:=12;
  ComboBox4.ItemIndex:=10;
  e18.Text:=FloatToStr(0.3);
  ComboBox1.Items.Clear;
  ComboBox1.Items.Add(FloatToStr(0));
  ComboBox1.Items.Add(FloatToStr(0.25));
  ComboBox1.Items.Add(FloatToStr(0.5));
  ComboBox1.Items.Add(FloatToStr(0.75));
  ComboBox1.Items.Add(FloatToStr(1));
  ComboBox1.Items.Add(FloatToStr(1.25));
  ComboBox1.Items.Add(FloatToStr(1.5));
  ComboBox1.Items.Add(FloatToStr(1.75));
  ComboBox1.Items.Add(FloatToStr(2));
  ComboBox1.Text:='1';
  ComboBox3.Items.Clear;
  ComboBox3.Items.Add(FloatToStr(0));
  ComboBox3.Items.Add(FloatToStr(0.25));
  ComboBox3.Items.Add(FloatToStr(0.5));
  ComboBox3.Items.Add(FloatToStr(0.75));
  ComboBox3.Items.Add(FloatToStr(1));
  ComboBox3.Items.Add(FloatToStr(1.25));
  ComboBox3.Items.Add(FloatToStr(1.5));
  ComboBox3.Items.Add(FloatToStr(1.75));
  ComboBox3.Items.Add(FloatToStr(2));
  ComboBox3.Items.Add(FloatToStr(2.25));
  ComboBox3.Items.Add(FloatToStr(2.5));
  ComboBox3.Items.Add(FloatToStr(2.75));
  ComboBox3.Items.Add(FloatToStr(3));
  ComboBox3.Text:='2';
  /////////////////////////////////////////////////////////////////
  SetData_p(Self);
  ComboBox5.ItemIndex:=6;
  ComboBox6.ItemIndex:=7;
  ComboBox7.ItemIndex:=12;
  ComboBox8.ItemIndex:=10;
  ep18.Text:=FloatToStr(0.3);
  ComboBox5.Items.Clear;
  ComboBox5.Items.Add(FloatToStr(0));
  ComboBox5.Items.Add(FloatToStr(0.25));
  ComboBox5.Items.Add(FloatToStr(0.5));
  ComboBox5.Items.Add(FloatToStr(0.75));
  ComboBox5.Items.Add(FloatToStr(1));
  ComboBox5.Items.Add(FloatToStr(1.25));
  ComboBox5.Items.Add(FloatToStr(1.5));
  ComboBox5.Items.Add(FloatToStr(1.75));
  ComboBox5.Items.Add(FloatToStr(2));
  ComboBox5.Text:='1';
  ComboBox7.Items.Clear;
  ComboBox7.Items.Add(FloatToStr(0));
  ComboBox7.Items.Add(FloatToStr(0.25));
  ComboBox7.Items.Add(FloatToStr(0.5));
  ComboBox7.Items.Add(FloatToStr(0.75));
  ComboBox7.Items.Add(FloatToStr(1));
  ComboBox7.Items.Add(FloatToStr(1.25));
  ComboBox7.Items.Add(FloatToStr(1.5));
  ComboBox7.Items.Add(FloatToStr(1.75));
  ComboBox7.Items.Add(FloatToStr(2));
  ComboBox7.Items.Add(FloatToStr(2.25));
  ComboBox7.Items.Add(FloatToStr(2.5));
  ComboBox7.Items.Add(FloatToStr(2.75));
  ComboBox7.Items.Add(FloatToStr(3));
  ComboBox7.Text:='2';
  ///////////////////////////////////////////////////////////
  SetData_n(Self);
  ComboBox9.ItemIndex:=6;
  ComboBox10.ItemIndex:=7;
  ComboBox11.ItemIndex:=12;
  ComboBox12.ItemIndex:=10;
  en18.Text:=FloatToStr(0.3);
  ComboBox9.Items.Clear;
  ComboBox9.Items.Add(FloatToStr(0));
  ComboBox9.Items.Add(FloatToStr(0.25));
  ComboBox9.Items.Add(FloatToStr(0.5));
  ComboBox9.Items.Add(FloatToStr(0.75));
  ComboBox9.Items.Add(FloatToStr(1));
  ComboBox9.Items.Add(FloatToStr(1.25));
  ComboBox9.Items.Add(FloatToStr(1.5));
  ComboBox9.Items.Add(FloatToStr(1.75));
  ComboBox9.Items.Add(FloatToStr(2));
  ComboBox9.Text:='1';
  ComboBox11.Items.Clear;
  ComboBox11.Items.Add(FloatToStr(0));
  ComboBox11.Items.Add(FloatToStr(0.25));
  ComboBox11.Items.Add(FloatToStr(0.5));
  ComboBox11.Items.Add(FloatToStr(0.75));
  ComboBox11.Items.Add(FloatToStr(1));
  ComboBox11.Items.Add(FloatToStr(1.25));
  ComboBox11.Items.Add(FloatToStr(1.5));
  ComboBox11.Items.Add(FloatToStr(1.75));
  ComboBox11.Items.Add(FloatToStr(2));
  ComboBox11.Items.Add(FloatToStr(2.25));
  ComboBox11.Items.Add(FloatToStr(2.5));
  ComboBox11.Items.Add(FloatToStr(2.75));
  ComboBox11.Items.Add(FloatToStr(3));
  ComboBox11.Text:='2';
end;


procedure FNTimeCallBack(uTimerID,uMessage:UINT;dwUser,dw1,dw2:DWORD);stdcall;
begin
  Form1.Timer1Timer(Form1);
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,nTMK:Word;
    awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
    PName,PortName:String;
    FHandl: THandle;
    flag:byte;
begin
  Edit717Change(Self);
  SetData_c(Self);
  SetData_p(Self);
  SetData_n(Self);
  Button1.Enabled:=False;
  Button3.Enabled:=True;
  PortList.Clear; hEvent:=0; PName:='\\.\TMK1553BDevice';
  case RadioGroup22.ItemIndex of
    0:  begin i:=0; nTMK:=0; flag:=1; end;
    1:  begin i:=1; nTMK:=1; flag:=1; end;
    2:  begin i:=0; nTMK:=0; flag:=0; end;
  end;
  repeat
    begin //пробуем получить дескриптор порта
      PortName:=PName+IntToStr(i);
      FHandl := CreateFile(PChar(PortName),
                 GENERIC_READ or GENERIC_WRITE,
                 0,nil,OPEN_EXISTING,FILE_FLAG_OVERLAPPED,0);
      if FHandl <> INVALID_HANDLE_VALUE then //если порт есть то добавить в список
        begin
          PortList.Add(POINTER(FHandl));
          if not DeviceIoControl(FHandl,IOCTL_TMK_GetVersion,@awVTMK4InBuf,0,
                                 @awVTMK4OutBuf,2,cbVTMK4Ret,NIL) then
            begin
              ShowMessage('Load driver error!');
              CloseHandle(FHandl);EXIT;
            end;
          if awVTMK4OutBuf[0]<770 then
            begin
              ShowMessage('Old version of driver!');
              CloseHandle(FHandl);EXIT;
            end;
          if hEvent = 0 then
            begin
		          sa4Event.nLength := sizeof(sa4Event);
		          sa4Event.lpSecurityDescriptor := NIL;
	     	      sa4Event.bInheritHandle := TRUE;
              hEvent := CreateEvent(@sa4Event,FALSE,FALSE,NIL);
              if INTEGER(hEvent) = 0 then
                begin
           	      ShowMessage('CreateEvent failed!,Test BC<->RT Error');
                  CloseHandle(hEvent);
                  CloseHandle(FHandl);
                 EXIT;
               end;
            end;
          // Задание конфигурации используемых плат
          awVTMK4InBuf[0]:=nTMK;
          if not DeviceIoControl(FHandl,IOCTL_TMK_tmkconfig,@awVTMK4InBuf,2,
                                 @awVTMK4OutBuf,2,cbVTMK4Ret,NIL) then
            begin
              ShowMessage('Error of configuration!');
              CloseHandle(FHandl);
              CloseHandle(hEvent);
              EXIT;
            end;
          // Выбор платы
          awVTMK4InBuf[0]:=nTMK;
          if not DeviceIoControl(FHandl,IOCTL_TMK_tmkselect,@awVTMK4InBuf,2,
                                 @awVTMK4OutBuf,2,cbVTMK4Ret,NIL) then
            begin
              ShowMessage('Choice error!');
              CloseHandle(FHandl);
              CloseHandle(hEvent);
              EXIT;
            end;
          //Связь платы и сообщения
		     	tmkdefevent(FHandl,hEvent,TRUE);
          // инициализация платы в режиме передачи
          if bcreset(FHandl)<>0 then
            begin
              ShowMessage('Initialization error!');
              CloseHandle(FHandl);
              CloseHandle(hEvent);
              EXIT;
            end;
          // Проверка формирования сообщений
          if BcEventTest(FHandl,hEvent)<>0 then
            begin
              ShowMessage('Error BcEventTest!');
              CloseHandle(FHandl);
              CloseHandle(hEvent);
              EXIT;
            end;
         // INC(nTMK);
        end
      else
        begin
          CloseHandle(FHandl); //закрыть дескриптор
        end;
    end;
    INC(flag);
    if flag=1 then
    begin
      nTMK:=1;
      i:=1;
    end;
    until flag=2;
  PostNum:=0; //Каждая секунда - слово синхронизации и запрос ответа
  DT1:=Time;
  if CheckBox1.Checked then Interval:=StrToInt(TRIM(Edit717.Text))
                       else Interval:=20;
  uTimerID:=timeSetEvent(Interval,0,FNTimeCallBack,0,TIME_PERIODIC);
end;

procedure MyWait(FHandl:THandle;hEvent:HWND;
                 var msgInt:Integer;
                 var msgResult:Word;
                 var msgAW:Word);
begin
   msgInt:=0;
   While msgInt=0 do
   CASE WaitForSingleObject(hEvent,0) of
   WAIT_OBJECT_0:
     begin
       ResetEvent(hEvent);
       tmkgetevd(FHandl,hEvent,TmkEvD);
       msgInt := tmkEvD.nInt;
       if msgInt=0 then msgInt:=10;
       msgResult := tmkEvD.bc.wResult;
       if (msgInt=2) then msgAW := tmkEvD.bc.wAW1;
       if fl then
       msgAW := tmkEvD.bc.wAW1;
     end;
   WAIT_TIMEOUT: msgInt:=0;
   ELSE msgInt:=-1;
   END;
end;

procedure TForm1.PostSendedWord(FHandl:THandle;GR,KC,CD:Word);
var msgInt:Integer;
    msgResult,msgAW:Word;
begin
  bcreset(FHandl);
  bcdefbase(FHandl,0);                 //Выбор нулевой базы
  case GR of
  0:begin
      fl:=true;
      bcputw(FHandl,0,KC);             //Запись в базу КС
      bcstart(FHandl,0,CTRL_C_AD);     //команда управления формата КС-ОС+ИС
    end;
  1:begin
      fl:=false;
      bcputw(FHandl,0,KC);             //Запись в базу КС
      bcputw(FHandl,1,CD);             //Запись в базу CD
      bcstart(FHandl,0,CTRL_CD_BRCST); //Передача в групповом режиме   CTRL_CD_BRCST
    end;
  end;
  MyWait(FHandl,hEvent,msgInt,msgResult,msgAW);
end;

procedure TForm1.PostSendedMAS(FHandl:THandle;MAS1,MAS2,MAS3:TMAS);
var i,msgResult,msgAW:Word;
    MAS:TMAS;
    msgInt:Integer;
begin
  bcreset(FHandl);      // msgLength:=30;
  bcdefbus(FHandl,0);   //Основная ЛС
  bcdefbase(FHandl,0);  //Выбор 0-й базы
  for i:=1 to 3 do
    begin
      case i of 1:MAS:=MAS1;2:MAS:=MAS2;3:MAS:=MAS3;end;
      //Пересылка массива
      bcputblk(FHandl,0,@MAS,30);         //Запись в базу массива данных с 0-го адреса
      if bcstart(FHandl,0,DATA_BC_RT_BRCST)<>0 then Form1.Caption:='!!!'; //Передача в групповом режиме
      MyWait(FHandl,hEvent,msgInt,msgResult,msgAW);
      Sleep(1);
    end;
end;

procedure TForm1.Tabs_SWChange(Sender: TObject);
begin
  RadioGroup1.Visible:=false;
  RadioGroup2.Visible:=false;
  RadioGroup3.Visible:=false;
  RadioGroup4.Visible:=false;
  RadioGroup5.Visible:=false;
  RadioGroup6.Visible:=false;
  RadioGroup7.Visible:=false;
  RadioGroup8.Visible:=false;
  RadioGroup9.Visible:=false;
  RadioGroup10.Visible:=false;
  RadioGroup11.Visible:=false;
  RadioGroup12.Visible:=false;
  RadioGroup13.Visible:=false;
  RadioGroup14.Visible:=false;
  RadioGroup15.Visible:=false;
  RadioGroup16.Visible:=false;
  RadioGroup17.Visible:=false;
  RadioGroup18.Visible:=false;
  RadioGroup19.Visible:=false;
  RadioGroup20.Visible:=false;
  RadioGroup21.Visible:=false;
  case Tabs_SW.TabIndex of
  0:begin
  RadioGroup1.Visible:=true;
  RadioGroup2.Visible:=true;
  RadioGroup3.Visible:=true;
  RadioGroup4.Visible:=true;
  RadioGroup5.Visible:=true;
  RadioGroup6.Visible:=true;
  RadioGroup7.Visible:=true;
  end;
  1:begin
  RadioGroup8.Visible:=true;
  RadioGroup9.Visible:=true;
  RadioGroup10.Visible:=true;
  RadioGroup11.Visible:=true;
  RadioGroup12.Visible:=true;
  RadioGroup13.Visible:=true;
  RadioGroup14.Visible:=true;
  end;
  2:Begin
  RadioGroup15.Visible:=true;
  RadioGroup16.Visible:=true;
  RadioGroup17.Visible:=true;
  RadioGroup18.Visible:=true;
  RadioGroup19.Visible:=true;
  RadioGroup20.Visible:=true;
  RadioGroup21.Visible:=true;
  end;

end;

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,m,dp,cr:Integer;
    data_p,data_c,data_n:INTEGER;
    mData_p,mData_c,mData_n:DWord;
    stw_p,stw_c,stw_n :DWord;
    mlw_p,mlw_c,mlw_n :DWord;
    rd:Single;
    ST:_SYSTEMTIME;
    ABk,TBk,AKk,TKk:Single;
    DT:TDateTime;
    FHandl:THandle;
    awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
var DT2 : TDateTime;
    MDT:Integer;
    l:byte;
begin


  INC(cc1); if cc1>$FFFF then cc1:=1;  //Количество посылок данных
  DT:=(TIME-tStart)*24*3600;
  ABk:=StrToFloat(ComboBox3.Text);   TBk:=StrToFloat(ComboBox4.Text);
  AKk:=StrToFloat(ComboBox1.Text);   TKk:=StrToFloat(ComboBox2.Text);

  if TBk>0   then MS_c[10]:=ABk*sin(pi*2.0*DT/TBk)+StrToFloatDef(E10.Text,0)
             else MS_c[10]:=StrToFloatDef(E10.Text,0);
  if TKk>0   then MS_c[8]:=AKk*sin(pi*2.0*DT/TKk)+StrToFloat(E8.Text)
             else MS_c[8]:=StrToFloat(E8.Text);
  Edit3.Text:=FloatToStrF(MS_c[8],ffFixed,6,2);
  Edit5.Text:=FloatToStrF(MS_c[10],ffFixed,6,2);

  ABk:=StrToFloat(ComboBox7.Text);   TBk:=StrToFloat(ComboBox9.Text);
  AKk:=StrToFloat(ComboBox5.Text);   TKk:=StrToFloat(ComboBox6.Text);
  if TBk>0   then MS_n[10]:=ABk*sin(pi*2.0*DT/TBk)+StrToFloat(En10.Text)
             else MS_n[10]:=StrToFloat(En10.Text);
  if TKk>0   then MS_n[8]:=AKk*sin(pi*2.0*DT/TKk)+StrToFloat(En8.Text)
             else MS_n[8]:=StrToFloat(En8.Text);
  Edit4.Text:=FloatToStrF(MS_n[8],ffFixed,6,2);
  Edit6.Text:=FloatToStrF(MS_n[10],ffFixed,6,2);
  MS_P[19]:=1;

  ABk:=StrToFloat(ComboBox11.Text);   TBk:=StrToFloat(ComboBox12.Text);
  AKk:=StrToFloat(ComboBox9.Text);   TKk:=StrToFloat(ComboBox10.Text);
  if TBk>0   then MS_p[10]:=ABk*sin(pi*2.0*DT/TBk)+StrToFloat(Ep10.Text)
             else MS_p[10]:=StrToFloat(Ep10.Text);
  if TKk>0   then MS_p[8]:=AKk*sin(pi*2.0*DT/TKk)+StrToFloat(Ep8.Text)
             else MS_p[8]:=StrToFloat(Ep8.Text);
  Edit1.Text:=FloatToStrF(MS_p[8],ffFixed,6,2);
  Edit2.Text:=FloatToStrF(MS_p[10],ffFixed,6,2);


  if MS_c[6]>360 then MS_c[6]:=MS_c[6]-360;
  if MS_p[6]>360 then MS_p[6]:=MS_p[6]-360;
  if MS_n[6]>360 then MS_n[6]:=MS_n[6]-360;


  MS_c[19]:=Time;  MS_p[19]:=MS_c[19]; MS_n[19]:=MS_C[19];
  MS_c[20]:=Date;  MS_p[20]:=MS_c[20]; MS_n[20]:=MS_C[20];
  ep19.Text:=TimeToStr(MS_p[19]);
  ep20.Text:=dateToStr(MS_p[20]);
  en19.Text:=TimeToStr(MS_n[19]);
  en20.Text:=dateToStr(MS_n[20]);
  e19.Text :=TimeToStr(MS_c[19]);
  e20.Text :=dateToStr(MS_c[20]);

  m:=0;
  MAS1[m]:=kc[1];MAS2[m]:=kc[2];MAS3[m]:=kc[3]; INC(m);
  MAS1[m]:=zm[1];MAS2[m]:=zm[2];MAS3[m]:=zm[3]; INC(m);
  for i:=1 to 18 do
    begin
      data_p:=TRUNC(MS_p[i]/MSCML[i]);
      data_c:=TRUNC(MS_c[i]/MSCML[i]);
      data_n:=TRUNC(MS_n[i]/MSCML[i]);
      ByWordCS(data_p,stw_p,mlw_p);
      ByWordCS(data_c,stw_c,mlw_c);
      ByWordCS(data_n,stw_n,mlw_n);
      if MSI[i] then //два слова
        begin
          MAS1[m]:=stw_p;MAS2[m]:=stw_c;MAS3[m]:=stw_n; INC(m);
          MAS1[m]:=mlw_p;MAS2[m]:=mlw_c;MAS3[m]:=mlw_n; INC(m);
        end     else begin MAS1[m]:=mlw_p;MAS2[m]:=mlw_c;MAS3[m]:=mlw_n;INC(m);end;
    end;

  mData_p:=TRUNC(MS_p[19]*32768*86400);
  mData_c:=TRUNC (MS_c[19]*32768*86400);
  mData_n:=TRUNC(MS_n[19]*32768*86400);
  
  ByWordCD(mdata_p,stw_p,mlw_p);
  ByWordCD(mdata_c,stw_c,mlw_c);
  ByWordCD(mdata_n,stw_n,mlw_n);
  MAS1[m]:=stw_p;MAS2[m]:=stw_c;MAS3[m]:=stw_n; INC(m);
  MAS1[m]:=mlw_p;MAS2[m]:=mlw_c;MAS3[m]:=mlw_n; INC(m);

  DatetimeToSystemTime(now,ST);
  data_p:=(ST.wDay shl 11)+(ST.wMonth shl 7)+ST.wYear-2000;
  data_p:=(ST.wDay shl 11)+(ST.wMonth shl 7)+ST.wYear-2000;
  data_p:=(ST.wDay shl 11)+(ST.wMonth shl 7)+ST.wYear-2000;
  ByWordCS(data_p,stw_p,mlw_p);
  ByWordCS(data_c,stw_c,mlw_c);
  ByWordCS(data_n,stw_n,mlw_n);
  MAS1[m]:=mlw_p;MAS2[m]:=mlw_c;MAS3[m]:=mlw_n; INC(m);

  cc[1]:=0;cc[2]:=0;cc[3]:=0;
  //////////////////////////////////////////
  Case RadioGroup1.ItemIndex of
   1: cc[1]:=cc[1]+16384;
   2: cc[1]:=cc[1]+32768;
   3: cc[1]:=cc[1]+49152;
  end;
  If RadioGroup2.ItemIndex=1 Then cc[1]:=cc[1]+12288;
  If RadioGroup3.ItemIndex=1 Then cc[1]:=cc[1]+3072;
  If RadioGroup4.ItemIndex=1 Then cc[1]:=cc[1]+768;
  If RadioGroup5.ItemIndex=1 Then cc[1]:=cc[1]+192;
  Case RadioGroup6.ItemIndex of
   1: cc[1]:=cc[1]+16;
   2: cc[1]:=cc[1]+32;
   3: cc[1]:=cc[1]+48;
  end;
  If RadioGroup7.ItemIndex=1 Then cc[1]:=cc[1]+12;
////////////////////////////////////////////////
  Case RadioGroup8.ItemIndex of
   1: cc[2]:=cc[2]+16384;
   2: cc[2]:=cc[2]+32768;
   3: cc[2]:=cc[2]+49152;
  end;
  If RadioGroup9.ItemIndex=1 Then cc[2]:=cc[2]+12288;
  If RadioGroup10.ItemIndex=1 Then cc[2]:=cc[2]+3072;
  If RadioGroup11.ItemIndex=1 Then cc[2]:=cc[2]+768;
  If RadioGroup12.ItemIndex=1 Then cc[2]:=cc[2]+192;
  Case RadioGroup13.ItemIndex of
   1: cc[2]:=cc[2]+16;
   2: cc[2]:=cc[2]+32;
   3: cc[2]:=cc[2]+48;
  end;
  If RadioGroup14.ItemIndex=1 Then cc[2]:=cc[2]+12;
/////////////////////////////////////////////////////
  Case RadioGroup15.ItemIndex of
   1: cc[3]:=cc[3]+16384;
   2: cc[3]:=cc[3]+32768;
   3: cc[3]:=cc[3]+49152;
  end;
  If RadioGroup16.ItemIndex=1 Then cc[3]:=cc[3]+12288;
  If RadioGroup17.ItemIndex=1 Then cc[3]:=cc[3]+3072;
  If RadioGroup18.ItemIndex=1 Then cc[3]:=cc[3]+768;
  If RadioGroup19.ItemIndex=1 Then cc[3]:=cc[3]+192;
  Case RadioGroup20.ItemIndex of
   1: cc[3]:=cc[3]+16;
   2: cc[3]:=cc[3]+32;
   3: cc[3]:=cc[3]+48;
  end;
  If RadioGroup21.ItemIndex=1 Then cc[3]:=cc[3]+12;

  MAS1[m]:=cc[1];MAS2[m]:=cc[2];MAS3[m]:=cc[3]; INC(m);
  MAS1[m]:=CheckSUM(@MAS1,1,29);
  MAS2[m]:=CheckSUM(@MAS2,1,29);
  MAS3[m]:=CheckSUM(@MAS3,1,29);

  if PortList.Count > 0 then //ПЕРЕДАЧА СООБЩЕНИЙ
    for i:=0 to PortList.Count-1 do
      begin
        FHandl:=Integer(PortList.Items[i]);
        // Выбор устройства на плате
        awVTMK4InBuf[0]:=i;
        DeviceIoControl(FHandl,IOCTL_TMK_tmkselect,@awVTMK4InBuf,2,
                       @awVTMK4OutBuf,2,cbVTMK4Ret,NIL);
	     	tmkdefevent(FHandl,hEvent,TRUE);

        if PostNum=0 then PostSendedWord(FHandl,1,KC1,CD1); //Синхронизация
        PostSendedMas(FHandl,MAS1,MAS2,MAS3);               //Слова данных
        if PostNum=0 then PostSendedWord(FHandl,0,KC2,0);   //Запрос ответа
     end;

  INC(PostNum);
  if PostNum >= 50 then
    begin
      PostNum:=0;
      DT2:=Time;
      DateTimeToSystemTime(DT2-DT1,ST);
      MDT:=ST.wSecond*1000+ST.wMilliseconds;
      Label46.Caption:='Interval of synchronization: '+IntToStr(MDT)+' [ms]';
      DT1:=Time;
    end; 
end;

procedure TForm1.CheckBox1Click(Sender: TObject);  //test mode
begin
  TimeKillEvent(uTimerID);
  if CheckBox1.Checked then Interval:=StrToInt(TRIM(Edit717.Text))
                       else Interval:=20;
  uTimerID:=timeSetEvent(Interval,0,FNTimeCallBack,0,TIME_PERIODIC);
end;

procedure TForm1.Edit717Change(Sender: TObject);
begin
  if TRIM(Edit717.Text)='' then Edit717.Text:='20';
  Interval:=StrToInt(TRIM(Edit717.Text));
  if Interval<20 then begin Interval:=20; Edit717.Text:='20'; end;
end;

procedure TForm1.Button3Click(Sender: TObject);  //stop
var i:Word;
    FHandl: THandle;
begin
  Button1.Enabled:=True;
  Button3.Enabled:=False;
  TimeKillEvent(uTimerID);
  Application.ProcessMessages;
//  Timer1.Enabled:=False;
  if PortList.Count>0 then
  for i:=0 to PortList.Count-1 do
    begin
      FHandl:=INTEGER(Integer(PortList.Items[i]));
      tmkdefevent(FHandl,hEvent,TRUE);
      tmkdone(FHandl,0);
      if INTEGER(FHandl)<>0 then CloseHandle(FHandl); //закрыть дескриптор
    end;
//  if INTEGER(hEvent)<>0 then CloseHandle(hEvent); //закрыть дескриптор
  PortList.Clear;

end;

procedure TForm1.e1Change(Sender: TObject);
var i,num:Word;
    sign: Shortint;
    s,s1,s2:String;
begin
  s:=(Sender as TEdit).Text;
  sign:=1;
  {if StrToCurr(s) < 0 then begin sign:=false; delete(s,1,1); end;}
  
  if TRIM(s)='' then EXIT;
  s2:=s;
  for i:=1 to Length(s) do
    if ((ORD(S[i])<45)OR(ORD(S[i])>57))AND(S[i]<>DecimalSeparator){AND
      (S[i]<>'-')}  then S[i]:=DecimalSeparator;
  {if StrToFloatDef(S,10)=10 then
    begin
      ShowMessage('Symbol error +->  "'+S2[Length(s2)]+'"');
      (Sender as TEdit).Text:=COPY(S2,1,Length(s2)-1);
      EXIT;
    end;}
  (Sender as TEdit).Text:=S;
  (Sender as TEdit).SelStart:=Length(s);
  s1:=(Sender as TEdit).Name;
  i:=Length(s1);
   while i>0 do
    begin
      if ((ORD(S1[i])<45)OR(ORD(S1[i])>57))then BREAK;
      DEC(i);
    end;
  INC(i);
  s2:=COPY(s1,i,Length(s1));
  num:=StrToInt(s2);
  if ORD(S[1])= 45 then
  begin
  sign:=-1;
  s[1]:='0';
  end;
  case (Sender as TEdit).Tag of
    0:  MS_p[num]:=sign*StrToFloat(S);
    1:  MS_c[num]:=sign*StrToFloat(S);
    2:  MS_n[num]:=sign*StrToFloat(S);
  end;
end;


end.
