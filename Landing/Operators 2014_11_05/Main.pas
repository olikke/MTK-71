unit Main;

interface
uses
  Windows, Messages, SysUtils, Graphics, Forms, Classes,SyncObjs,DateUtils,
  Controls, Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls,Mask,
  DirectShow9,ActiveX,DSUtil,DSPack,FastDib, FastDraw, DataCalc,
  Password,Registry,DataUPS, Global,ComPortR,Algorithm,WSC,Ping,QThread,
  IdBaseComponent,IdComponent,IdGlobal,IdSocketHandle, IdContext,
  IdTCPServer, IdCustomTCPServer, IdAntiFreezeBase, IdAntiFreeze, IdScheduler,INIFiles, 
  IdUDPServer, IdUDPBase, IdSchedulerOfThread, IdSchedulerOfThreadDefault,MAth,MSC,
  GradProgress,REadCom,Betta, XPMan, XiButton, MyPanel,ToMonitoringSystem,HreadEventNew,LadogaAnaliz;
type
  TNMain = class(TForm)
    SampleGrabber: TSampleGrabber;
    OpenDialog1: TOpenDialog;
    IdAntiFreeze1: TIdAntiFreeze;
    IdSchedulerOfThreadDefault1: TIdSchedulerOfThreadDefault;
    TextTimer: TTimer;
    UDPServer1: TIdUDPServer;
    UDPServer2: TIdUDPServer;
    VRDServer: TIdTCPServer;
    PC: TPageControl;
    TS1: TTabSheet;
    GroupBox27: TGroupBox;
    Panel2: TPanel;
    Panel1: TPanel;
    TS3: TTabSheet;
    Panel: TPanel;
    iMTK: TImage;
    Shape1: TShape;
    Label131: TLabel;
    Shape2: TShape;
    Label132: TLabel;
    L101: TLabel;
    L102: TLabel;
    L103: TLabel;
    L104: TLabel;
    L105: TLabel;
    L106: TLabel;
    L107: TLabel;
    L108: TLabel;
    L109: TLabel;
    L110: TLabel;
    L111: TLabel;
    L113: TLabel;
    L114: TLabel;
    L112: TLabel;
    L116: TLabel;
    TS4: TTabSheet;
    PMedia: TPanel;
    iMedia: TImage;
    L117: TLabel;
    L118: TLabel;
    L119: TLabel;
    L120: TLabel;
    L121: TLabel;
    L122: TLabel;
    L123: TLabel;
    L124: TLabel;
    L125: TLabel;
    L126: TLabel;
    l127: TLabel;
    L128: TLabel;
    L129: TLabel;
    L130: TLabel;
    L131: TLabel;
    L132: TLabel;
    L133: TLabel;
    L134: TLabel;
    L135: TLabel;
    L136: TLabel;
    L137: TLabel;
    L138: TLabel;
    L139: TLabel;
    L141: TLabel;
    L142: TLabel;
    L143: TLabel;
    L144: TLabel;
    L145: TLabel;
    L146: TLabel;
    L148: TLabel;
    L147: TLabel;
    L151: TLabel;
    L152: TLabel;
    L155: TLabel;
    L156: TLabel;
    L160: TLabel;
    L159: TLabel;
    L158: TLabel;
    L157: TLabel;
    L162: TLabel;
    L163: TLabel;
    L165: TLabel;
    L166: TLabel;
    L168: TLabel;
    L150: TLabel;
    L149: TLabel;
    L153: TLabel;
    L154: TLabel;
    L161: TLabel;
    TS5: TTabSheet;
    iPower: TImage;
    P2421: TPanel;
    i2421: TImage;
    Label75: TLabel;
    PCB1: TPanel;
    iPCB1: TImage;
    Label13: TLabel;
    D4: TImage;
    D2: TImage;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    PCB2: TPanel;
    iPCB2: TImage;
    Label82: TLabel;
    D3: TImage;
    D1: TImage;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label93: TLabel;
    Label147: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label180: TLabel;
    Panel26: TPanel;
    SynchroTime: TTimer;
    UDPCommandServer: TIdUDPServer;
    AnswerWaitTimer: TTimer;
    Label197: TLabel;
    Legend1: TGroupBox;
    iL1: TImage;
    l71: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Legend2: TGroupBox;
    iL2: TImage;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    OpenDialog2: TOpenDialog;
    TelemT: TTimer;
    GroupBox35: TGroupBox;
    Dev0: TShape;
    FilterGraph1: TFilterGraph;
    WSCPanel: TPanel;
    Panel39: TPanel;
    i1: TImage;
    Label251: TLabel;
    Panel41: TPanel;
    Panel43: TPanel;
    sp1: TSpeedButton;
    dev1: TShape;
    Panel44: TPanel;
    sp2: TSpeedButton;
    dev2: TShape;
    Panel45: TPanel;
    sp3: TSpeedButton;
    dev3: TShape;
    KUPanel: TPanel;
    Panel17: TPanel;
    i2: TImage;
    Label252: TLabel;
    Panel19: TPanel;
    Panel46: TPanel;
    sp7: TSpeedButton;
    dev7: TShape;
    Panel47: TPanel;
    sp8: TSpeedButton;
    dev8: TShape;
    Panel48: TPanel;
    sp10: TSpeedButton;
    dev10: TShape;
    Panel4: TPanel;
    sp9: TSpeedButton;
    dev9: TShape;
    Protocolling: TPanel;
    Panel50: TPanel;
    i3: TImage;
    Label253: TLabel;
    Panel59: TPanel;
    Panel60: TPanel;
    sp16: TSpeedButton;
    dev16: TShape;
    Panel119: TPanel;
    sp20: TSpeedButton;
    dev20: TShape;
    ShipSystem: TPanel;
    Panel121: TPanel;
    i4: TImage;
    Label254: TLabel;
    Panel122: TPanel;
    Panel123: TPanel;
    sp38: TSpeedButton;
    dev38: TShape;
    Panel124: TPanel;
    sp40: TSpeedButton;
    dev40: TShape;
    Panel125: TPanel;
    sp45: TSpeedButton;
    dev45: TShape;
    dev39: TShape;
    dev41: TShape;
    dev46: TShape;
    TM2402: TPanel;
    Panel126: TPanel;
    i5: TImage;
    Label255: TLabel;
    Panel127: TPanel;
    Panel128: TPanel;
    sp22: TSpeedButton;
    dev22: TShape;
    Panel129: TPanel;
    sp12: TSpeedButton;
    dev12: TShape;
    Panel130: TPanel;
    sp13: TSpeedButton;
    dev13: TShape;
    Panel131: TPanel;
    sp14: TSpeedButton;
    dev14: TShape;
    Panel49: TPanel;
    sp15: TSpeedButton;
    dev15: TShape;
    Panel132: TPanel;
    sp17: TSpeedButton;
    dev17: TShape;
    Panel133: TPanel;
    sp18: TSpeedButton;
    dev18: TShape;
    Panel134: TPanel;
    sp19: TSpeedButton;
    dev19: TShape;
    XPManifest1: TXPManifest;
    SpeedButton18: TSpeedButton;
    VR: TPanel;
    Panel136: TPanel;
    i6: TImage;
    Label256: TLabel;
    Panel137: TPanel;
    Panel140: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    TRmode: TPanel;
    Panel138: TPanel;
    i7: TImage;
    Label257: TLabel;
    Panel139: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton7: TSpeedButton;
    tr: TButton;
    Button8: TButton;
    Button7: TButton;
    Panel37: TPanel;
    Label190: TLabel;
    Label191: TLabel;
    Label193: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label48: TLabel;
    i8: TImage;
    tim: TImage;
    vrim: TImage;
    Image5: TImage;
    Edit2: TEdit;
    pivotaltracking: TPanel;
    Panel135: TPanel;
    i9: TImage;
    Label266: TLabel;
    Shape25: TShape;
    Panel141: TPanel;
    Image3: TImage;
    Label5: TLabel;
    Label240: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label6: TLabel;
    Label241: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    Edit3: TEdit;
    trackingresult: TPanel;
    Panel142: TPanel;
    i10: TImage;
    Label258: TLabel;
    Panel143: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Image1: TImage;
    Image2: TImage;
    pointoftracking: TPanel;
    Panel144: TPanel;
    i11: TImage;
    Label259: TLabel;
    Panel145: TPanel;
    SpeedButton1: TSpeedButton;
    Shape26: TShape;
    Label232: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Shape27: TShape;
    Shape28: TShape;
    Label233: TLabel;
    Label234: TLabel;
    F78: TPanel;
    Panel146: TPanel;
    i12: TImage;
    Label260: TLabel;
    Panel147: TPanel;
    GradProgress1: TGradProgress;
    ModeofTracking: TPanel;
    Panel148: TPanel;
    i13: TImage;
    Label261: TLabel;
    Panel149: TPanel;
    SpeedButton33: TSpeedButton;
    SpeedButton42: TSpeedButton;
    Shape43: TShape;
    Shape44: TShape;
    RACSNo: TPanel;
    Panel150: TPanel;
    i14: TImage;
    Label262: TLabel;
    Panel151: TPanel;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Shape3: TShape;
    Shape8: TShape;
    Label224: TLabel;
    Label2: TLabel;
    Distance: TPanel;
    Panel152: TPanel;
    i15: TImage;
    Label263: TLabel;
    Panel153: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Shape4: TShape;
    Label229: TLabel;
    Shape5: TShape;
    Label228: TLabel;
    selectaxialTVD: TPanel;
    Panel154: TPanel;
    i16: TImage;
    Label264: TLabel;
    Panel155: TPanel;
    TVD2: TSpeedButton;
    TVD3: TSpeedButton;
    Shape6: TShape;
    Label230: TLabel;
    Shape7: TShape;
    Label231: TLabel;
    TVDmod: TPanel;
    Panel156: TPanel;
    i17: TImage;
    Label265: TLabel;
    Panel157: TPanel;
    SpeedButton10: TSpeedButton;
    Shape19: TShape;
    Label267: TLabel;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Shape14: TShape;
    Shape15: TShape;
    Label236: TLabel;
    Label237: TLabel;
    SysConf: TPanel;
    Panel158: TPanel;
    i18: TImage;
    Label235: TLabel;
    Panel159: TPanel;
    Panel21: TPanel;
    MB: TSpeedButton;
    M1: TSpeedButton;
    M3: TSpeedButton;
    Panel22: TPanel;
    Panel23: TPanel;
    t112: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    Splitter9: TSplitter;
    Splitter10: TSplitter;
    Splitter11: TSplitter;
    Splitter12: TSplitter;
    Splitter13: TSplitter;
    Splitter14: TSplitter;
    ImageBase: TImage;
    ImageConf1: TImage;
    ImageConf2: TImage;
    t1: TLabel;
    t2: TLabel;
    t3: TLabel;
    Splitter15: TSplitter;
    t4: TLabel;
    t5: TLabel;
    t6: TLabel;
    t7: TLabel;
    t8: TLabel;
    t9: TLabel;
    Air: TPanel;
    Panel120: TPanel;
    i19: TImage;
    Label7: TLabel;
    Panel160: TPanel;
    Label192: TLabel;
    ComboBox1: TComboBox;
    Label189: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    GA: TPanel;
    Panel161: TPanel;
    i20: TImage;
    Label269: TLabel;
    Panel162: TPanel;
    Label238: TLabel;
    Label239: TLabel;
    MaskEdit1: TMaskEdit;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Shape9: TShape;
    SpeedButton16: TSpeedButton;
    Shape16: TShape;
    Label248: TLabel;
    SpeedButton17: TSpeedButton;
    Shape17: TShape;
    Label250: TLabel;
    BA: TPanel;
    Panel163: TPanel;
    i21: TImage;
    Label270: TLabel;
    Panel164: TPanel;
    Label242: TLabel;
    Label243: TLabel;
    MaskEdit2: TMaskEdit;
    SpeedButton15: TSpeedButton;
    P112: TMyPanel;
    Label4: TLabel;
    P112Exh: TMyPanel;
    P112_Port1: TMyPanel;
    P112_Port2: TMyPanel;
    P112_Port3: TMyPanel;
    P112_Port8: TMyPanel;
    P112_Port7: TMyPanel;
    P112_Port5: TMyPanel;
    P112_Port4: TMyPanel;
    P112_Port6: TMyPanel;
    P113: TMyPanel;
    Label8: TLabel;
    P113Exh: TMyPanel;
    P113_Port4: TMyPanel;
    P113_Port5: TMyPanel;
    P113_Port7: TMyPanel;
    P113_Port8: TMyPanel;
    P113_Port6: TMyPanel;
    P113_Port1: TMyPanel;
    P113_Port2: TMyPanel;
    P113_Port3: TMyPanel;
    p114: TMyPanel;
    Label11: TLabel;
    P114_Lan4: TMyPanel;
    P114_Lan6: TMyPanel;
    P114_Lan8: TMyPanel;
    P114_Lan10: TMyPanel;
    P114_Lan14: TMyPanel;
    P114_Lan16: TMyPanel;
    P114_Lan3: TMyPanel;
    P114_Lan15: TMyPanel;
    P114_Lan11: TMyPanel;
    P114_Lan13: TMyPanel;
    P114_Lan1: TMyPanel;
    P114_Lan5: TMyPanel;
    P114_Lan7: TMyPanel;
    P114_Lan9: TMyPanel;
    P114_Lan12: TMyPanel;
    P114_Lan2: TMyPanel;
    P115: TMyPanel;
    Label18: TLabel;
    P115_Lan13: TMyPanel;
    P115_Lan11: TMyPanel;
    P115_Lan15: TMyPanel;
    P115_Lan1: TMyPanel;
    P115_Lan7: TMyPanel;
    P115_Lan9: TMyPanel;
    P115_Lan2: TMyPanel;
    P115_Lan4: TMyPanel;
    P115_Lan6: TMyPanel;
    P115_Lan8: TMyPanel;
    P115_Lan10: TMyPanel;
    P115_Lan12: TMyPanel;
    P115_Lan14: TMyPanel;
    P115_Lan16: TMyPanel;
    P115_Lan5: TMyPanel;
    P115_Lan3: TMyPanel;
    Telem: TMyPanel;
    Label12: TLabel;
    p141: TMyPanel;
    p140: TMyPanel;
    Label16: TLabel;
    p102: TMyPanel;
    p102_LAN1: TMyPanel;
    p102_LAN2: TMyPanel;
    P102_X9: TMyPanel;
    P101: TMyPanel;
    p101_LAN2: TMyPanel;
    P101_X10: TMyPanel;
    p101_LAN1: TMyPanel;
    P103: TMyPanel;
    p103_LAN1: TMyPanel;
    p103_LAN2: TMyPanel;
    P116: TMyPanel;
    p116_LAN1: TMyPanel;
    p116_LAN2: TMyPanel;
    Label23: TLabel;
    Label17: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    P117: TMyPanel;
    Label50: TLabel;
    p117Exh: TMyPanel;
    P119: TMyPanel;
    Label49: TLabel;
    p119Exh: TMyPanel;
    p118: TMyPanel;
    Label19: TLabel;
    p118Exh: TMyPanel;
    P120: TMyPanel;
    Label20: TLabel;
    p120_LAN2: TMyPanel;
    Luna: TMyPanel;
    p138: TMyPanel;
    p139: TMyPanel;
    Label51: TLabel;
    Label53: TLabel;
    PRLK: TMyPanel;
    p145: TMyPanel;
    p146: TMyPanel;
    Px20: TMyPanel;
    Px17: TMyPanel;
    Px19: TMyPanel;
    Px18: TMyPanel;
    Px10: TMyPanel;
    p126: TMyPanel;
    P126_Exh: TMyPanel;
    Label91: TLabel;
    p128: TMyPanel;
    Label69: TLabel;
    P128_Exh: TMyPanel;
    p129: TMyPanel;
    Label92: TLabel;
    P129_Exh: TMyPanel;
    p127: TMyPanel;
    Label107: TLabel;
    P127_Exh: TMyPanel;
    P130: TMyPanel;
    Label110: TLabel;
    P130_Exh: TMyPanel;
    P131: TMyPanel;
    Label111: TLabel;
    P131_Exh: TMyPanel;
    P125: TMyPanel;
    Label112: TLabel;
    P125_Exh: TMyPanel;
    P123: TMyPanel;
    Label113: TLabel;
    P123_Exh: TMyPanel;
    P124: TMyPanel;
    Label66: TLabel;
    P124_Exh: TMyPanel;
    p111: TMyPanel;
    p111_Ch1: TMyPanel;
    Label108: TLabel;
    Label116: TLabel;
    p111_Ch2: TMyPanel;
    p111_Ch3: TMyPanel;
    p111_Ch4: TMyPanel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    P121: TMyPanel;
    Label62: TLabel;
    Label63: TLabel;
    p121_Ch1: TMyPanel;
    Label97: TLabel;
    p121_Ch2: TMyPanel;
    Label98: TLabel;
    p121_Ch3: TMyPanel;
    Label114: TLabel;
    p121_Ch4: TMyPanel;
    Label115: TLabel;
    Px13: TMyPanel;
    Px14: TMyPanel;
    Px15: TMyPanel;
    Px16: TMyPanel;
    P109: TMyPanel;
    P109_X1: TMyPanel;
    Label67: TLabel;
    P110: TMyPanel;
    Label68: TLabel;
    P110_X1: TMyPanel;
    P108: TMyPanel;
    Label99: TLabel;
    P108_X1: TMyPanel;
    P107: TMyPanel;
    Label100: TLabel;
    P107_X1: TMyPanel;
    P134: TMyPanel;
    Label35: TLabel;
    Label37: TLabel;
    P135: TMyPanel;
    Label45: TLabel;
    Label101: TLabel;
    P132: TMyPanel;
    Label21: TLabel;
    Label22: TLabel;
    P136: TMyPanel;
    Label54: TLabel;
    Label55: TLabel;
    P137: TMyPanel;
    Label56: TLabel;
    Label57: TLabel;
    P133: TMyPanel;
    Label58: TLabel;
    Label59: TLabel;
    P208: TMyPanel;
    Label60: TLabel;
    p208_X1: TMyPanel;
    P209: TMyPanel;
    Label24: TLabel;
    P209_X1: TMyPanel;
    P207: TMyPanel;
    Label31: TLabel;
    P207_X1: TMyPanel;
    P210: TMyPanel;
    Label26: TLabel;
    P210_X1: TMyPanel;
    MyPanel1: TMyPanel;
    MyPanel2: TMyPanel;
    MyPanel3: TMyPanel;
    MyPanel4: TMyPanel;
    P223: TMyPanel;
    P223_S1: TMyPanel;
    P223_S2: TMyPanel;
    P223_S3: TMyPanel;
    P223_S4: TMyPanel;
    P224: TMyPanel;
    P224_S1: TMyPanel;
    P224_S2: TMyPanel;
    P224_S3: TMyPanel;
    P224_S4: TMyPanel;
    P226: TMyPanel;
    P226_Ch1: TMyPanel;
    Label25: TLabel;
    Label34: TLabel;
    MyPanel7: TMyPanel;
    MyPanel8: TMyPanel;
    MyPanel9: TMyPanel;
    P226_Ch2: TMyPanel;
    MyPanel11: TMyPanel;
    MyPanel12: TMyPanel;
    MyPanel13: TMyPanel;
    P226_Ch3: TMyPanel;
    MyPanel15: TMyPanel;
    MyPanel16: TMyPanel;
    MyPanel17: TMyPanel;
    P226_Ch4: TMyPanel;
    MyPanel19: TMyPanel;
    MyPanel20: TMyPanel;
    MyPanel21: TMyPanel;
    P227: TMyPanel;
    Label30: TLabel;
    Label38: TLabel;
    P227_Ch1: TMyPanel;
    MyPanel10: TMyPanel;
    MyPanel14: TMyPanel;
    MyPanel18: TMyPanel;
    P227_Ch2: TMyPanel;
    MyPanel23: TMyPanel;
    MyPanel24: TMyPanel;
    MyPanel25: TMyPanel;
    P227_Ch3: TMyPanel;
    MyPanel27: TMyPanel;
    MyPanel28: TMyPanel;
    MyPanel29: TMyPanel;
    P227_Ch4: TMyPanel;
    MyPanel31: TMyPanel;
    MyPanel32: TMyPanel;
    MyPanel33: TMyPanel;
    P229: TMyPanel;
    Label27: TLabel;
    Label39: TLabel;
    P229_Ch1: TMyPanel;
    MyPanel22: TMyPanel;
    MyPanel26: TMyPanel;
    MyPanel30: TMyPanel;
    P229_Ch2: TMyPanel;
    MyPanel35: TMyPanel;
    MyPanel36: TMyPanel;
    MyPanel37: TMyPanel;
    P229_Ch3: TMyPanel;
    MyPanel39: TMyPanel;
    MyPanel40: TMyPanel;
    MyPanel41: TMyPanel;
    P229_Ch4: TMyPanel;
    MyPanel43: TMyPanel;
    MyPanel44: TMyPanel;
    MyPanel45: TMyPanel;
    P228: TMyPanel;
    Label33: TLabel;
    Label46: TLabel;
    P228_Ch4: TMyPanel;
    MyPanel34: TMyPanel;
    MyPanel38: TMyPanel;
    MyPanel42: TMyPanel;
    P228_Ch3: TMyPanel;
    MyPanel47: TMyPanel;
    MyPanel48: TMyPanel;
    MyPanel49: TMyPanel;
    P228_Ch2: TMyPanel;
    MyPanel51: TMyPanel;
    MyPanel52: TMyPanel;
    MyPanel53: TMyPanel;
    P228_Ch1: TMyPanel;
    MyPanel55: TMyPanel;
    MyPanel56: TMyPanel;
    MyPanel57: TMyPanel;
    P225: TMyPanel;
    P225_2: TMyPanel;
    P225_3: TMyPanel;
    P225_1: TMyPanel;
    Label32: TLabel;
    Label61: TLabel;
    P230: TMyPanel;
    Label36: TLabel;
    Label102: TLabel;
    P230_In1: TMyPanel;
    P230_In2: TMyPanel;
    P230_In3: TMyPanel;
    P230_In4: TMyPanel;
    P230_In5: TMyPanel;
    P230_In9: TMyPanel;
    P230_In11: TMyPanel;
    P230_In13: TMyPanel;
    P230_In15: TMyPanel;
    P230_Out1: TMyPanel;
    P230_Out3: TMyPanel;
    P230_Out5: TMyPanel;
    P230_Out7: TMyPanel;
    I7401_1: TImage;
    P231: TMyPanel;
    Label28: TLabel;
    Label121: TLabel;
    P231_In1: TMyPanel;
    P231_In2: TMyPanel;
    P231_In3: TMyPanel;
    P231_In4: TMyPanel;
    P231_In5: TMyPanel;
    P231_In9: TMyPanel;
    P231_In11: TMyPanel;
    P231_In13: TMyPanel;
    P231_In15: TMyPanel;
    P231_Out1: TMyPanel;
    P231_Out3: TMyPanel;
    P231_Out5: TMyPanel;
    P231_Out7: TMyPanel;
    I7401_2: TImage;
    Px12: TMyPanel;
    Px8: TMyPanel;
    Px11: TMyPanel;
    MyPanel5: TMyPanel;
    Label29: TLabel;
    MyPanel6: TMyPanel;
    MyPanel46: TMyPanel;
    Label122: TLabel;
    MyPanel50: TMyPanel;
    MyPanel54: TMyPanel;
    Label123: TLabel;
    MyPanel58: TMyPanel;
    Px1: TMyPanel;
    Px2: TMyPanel;
    Px3: TMyPanel;
    Px4: TMyPanel;
    Px5: TMyPanel;
    Px6: TMyPanel;
    Px7: TMyPanel;
    Px9: TMyPanel;
    P202: TMyPanel;
    Label41: TLabel;
    p202_X5: TMyPanel;
    p202_x6: TMyPanel;
    P201: TMyPanel;
    Label42: TLabel;
    p201_X5: TMyPanel;
    p201_x6: TMyPanel;
    P203: TMyPanel;
    Label3: TLabel;
    p203_X5: TMyPanel;
    p203_X6: TMyPanel;
    P216: TMyPanel;
    Label44: TLabel;
    p216_X5: TMyPanel;
    p216_X6: TMyPanel;
    SH: TMyPanel;
    SH_X2: TMyPanel;
    Label47: TLabel;
    SH_X4: TMyPanel;
    SH_X3: TMyPanel;
    P2421_X8: TMyPanel;
    P2421_X9: TMyPanel;
    P2421_X21: TMyPanel;
    P2421_X22: TMyPanel;
    P2421_X23: TMyPanel;
    P2421_X13: TMyPanel;
    P2421_X14: TMyPanel;
    P2421_X1: TMyPanel;
    P2421_X3: TMyPanel;
    P2421_X2: TMyPanel;
    P2421_X17: TMyPanel;
    P2421_X20: TMyPanel;
    P2421_X19: TMyPanel;
    P2421_X18: TMyPanel;
    P2421_X4: TMyPanel;
    P2421_X6: TMyPanel;
    P2421_X5: TMyPanel;
    p317: TMyPanel;
    Label1: TLabel;
    P317_X5: TMyPanel;
    P317_X1: TMyPanel;
    P317_X4: TMyPanel;
    P317_X3: TMyPanel;
    P317_X2: TMyPanel;
    Label124: TLabel;
    p319: TMyPanel;
    Label14: TLabel;
    Label94: TLabel;
    p319_X5: TMyPanel;
    p319_X1: TMyPanel;
    p319_X4: TMyPanel;
    p319_X3: TMyPanel;
    p319_X2: TMyPanel;
    p318: TMyPanel;
    Label52: TLabel;
    Label96: TLabel;
    p318_X5: TMyPanel;
    p318_X1: TMyPanel;
    p318_X4: TMyPanel;
    p318_X3: TMyPanel;
    p318_X2: TMyPanel;
    P312: TMyPanel;
    Label15: TLabel;
    Label95: TLabel;
    p312_x12: TMyPanel;
    p314: TMyPanel;
    Label64: TLabel;
    Label103: TLabel;
    p314_x2: TMyPanel;
    p344: TMyPanel;
    Label70: TLabel;
    Label72: TLabel;
    P344_x2: TMyPanel;
    p313: TMyPanel;
    Label73: TLabel;
    Label74: TLabel;
    p313_x12: TMyPanel;
    p315: TMyPanel;
    Label65: TLabel;
    Label104: TLabel;
    p315_x2: TMyPanel;
    p301: TMyPanel;
    Label71: TLabel;
    MyPanel60: TMyPanel;
    Label105: TLabel;
    p301_X3: TMyPanel;
    P303: TMyPanel;
    Label79: TLabel;
    Label106: TLabel;
    P303_X2: TMyPanel;
    P303_X3: TMyPanel;
    p316: TMyPanel;
    Label86: TLabel;
    Label109: TLabel;
    MyPanel61: TMyPanel;
    p304_x3: TMyPanel;
    p302: TMyPanel;
    Label125: TLabel;
    Label126: TLabel;
    MyPanel62: TMyPanel;
    p302_X3: TMyPanel;
    p320: TMyPanel;
    Label127: TLabel;
    Label128: TLabel;
    p320_X2: TMyPanel;
    BC5_A19: TMyPanel;
    Label129: TLabel;
    Label130: TLabel;
    BC5_A19_X1: TMyPanel;
    BC5_A21: TMyPanel;
    Label133: TLabel;
    Label134: TLabel;
    BC5_A21_X1: TMyPanel;
    BC8_A34: TMyPanel;
    Label135: TLabel;
    Label136: TLabel;
    BC8_A34_X1: TMyPanel;
    BC8_A6: TMyPanel;
    Label137: TLabel;
    Label138: TLabel;
    BC8_A6_X1: TMyPanel;
    BC8_A7: TMyPanel;
    Label139: TLabel;
    Label140: TLabel;
    BC8_A7_X1: TMyPanel;
    BC8_A9: TMyPanel;
    Label141: TLabel;
    Label142: TLabel;
    BC8_A9_X1: TMyPanel;
    Panel3: TPanel;
    Image6: TImage;
    Label222: TLabel;
    iL3: TImage;
    Label223: TLabel;
    AC: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label143: TLabel;
    x22: TMyPanel;
    x21: TMyPanel;
    x13: TMyPanel;
    x14: TMyPanel;
    x15: TMyPanel;
    x16: TMyPanel;
    P308: TMyPanel;
    Label144: TLabel;
    MyPanel63: TMyPanel;
    P309: TMyPanel;
    Label145: TLabel;
    MyPanel65: TMyPanel;
    P307: TMyPanel;
    Label146: TLabel;
    MyPanel67: TMyPanel;
    P310: TMyPanel;
    Label148: TLabel;
    MyPanel69: TMyPanel;
    p334: TMyPanel;
    Label149: TLabel;
    p334_1: TMyPanel;
    p334_2: TMyPanel;
    p334_3: TMyPanel;
    p335: TMyPanel;
    Label153: TLabel;
    p335_1: TMyPanel;
    p335_2: TMyPanel;
    p335_3: TMyPanel;
    p332: TMyPanel;
    Label154: TLabel;
    p332_1: TMyPanel;
    p332_2: TMyPanel;
    p332_3: TMyPanel;
    p336: TMyPanel;
    Label155: TLabel;
    p336_1: TMyPanel;
    p336_2: TMyPanel;
    p336_3: TMyPanel;
    p337: TMyPanel;
    Label156: TLabel;
    p337_1: TMyPanel;
    p337_2: TMyPanel;
    p337_3: TMyPanel;
    p333: TMyPanel;
    Label160: TLabel;
    p333_1: TMyPanel;
    p333_2: TMyPanel;
    p333_3: TMyPanel;
    i36FB: TEdit;
    i36DC: TEdit;
    i37FB: TEdit;
    i37DC: TEdit;
    i33DC: TEdit;
    i34FB: TEdit;
    i34DC: TEdit;
    i35FB: TEdit;
    i35DC: TEdit;
    i32DC: TEdit;
    WSLServer1: TIdUDPServer;
    WSLServer2: TIdUDPServer;
    SH1: TSpeedButton;
    devSH: TShape;
    Panel5: TPanel;
    Panel6: TPanel;
    Image4: TImage;
    Label161: TLabel;
    Panel7: TPanel;
    CMC: TSpeedButton;
    procedure CMCClick(Sender: TObject);
    procedure WSLServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure button1Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TelemTTimer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Lp1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Lp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sp1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sp1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sp17Click(Sender: TObject);
    procedure trClick(Sender: TObject);
    procedure AnswerWaitTimerTimer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure UDPCommandServerUDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SynchroTimeTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure sp40Click(Sender: TObject);
    procedure TVD3Click(Sender: TObject);
    procedure TVD2Click(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure MBClick(Sender: TObject);
    procedure sp45Click(Sender: TObject);
    procedure sp38Click(Sender: TObject);
    procedure TS1Show(Sender: TObject);
    procedure Sp25Click(Sender: TObject);
    procedure Sp24Click(Sender: TObject);
    procedure Sp23Click(Sender: TObject);
    procedure Sp31Click(Sender: TObject);
    procedure Sp30Click(Sender: TObject);
    procedure Sp29Click(Sender: TObject);
    procedure Sp27Click(Sender: TObject);
    procedure Sp28Click(Sender: TObject);
    procedure Sp26Click(Sender: TObject);
    procedure Sp21Click(Sender: TObject);
    procedure Sp11Click(Sender: TObject);
    procedure Sp19Click(Sender: TObject);
    procedure Sp18Click(Sender: TObject);
    procedure Sp15Click(Sender: TObject);
    procedure Sp14Click(Sender: TObject);
    procedure Sp13Click(Sender: TObject);
    procedure Sp12Click(Sender: TObject);
    procedure Sp22Click(Sender: TObject);
    procedure Sp20Click(Sender: TObject);
    procedure Sp16Click(Sender: TObject);
    procedure Sp7Click(Sender: TObject);
    procedure VRDServerExecute(AContext: TIdContext);
    procedure UDPServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure FormActivate(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure TextTimerTimer(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure FilterGraph1GraphComplete(sender: TObject; Result: HRESULT;
      Renderer: IBaseFilter);
    procedure SpeedButton56Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Buttont1Click(Sender: TObject);
    procedure VideoWindow1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure VideoWindow1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure Button10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure Sp9Click(Sender: TObject);
    procedure Sp10Click(Sender: TObject);
    procedure Sp8Click(Sender: TObject);
    procedure Sp3Click(Sender: TObject);
    procedure Sp2Click(Sender: TObject);
    procedure Sp1Click(Sender: TObject);
    procedure StartFilterGraph;
    function  PlayFilterGraph(FileName:string):boolean;
    function  iSetVideoFormat(FramesPerSecond,FrameWidth,FrameHeight,viGde: Integer):Integer;
    procedure Point_Brush;
    procedure SetControl(HostTP:word);
    procedure SendEscortMode;
    procedure MTKPaint;
    procedure GlobalException(sender: Tobject; e: exception);
    procedure ServMsg(var Msg: TMessage); message WM_NOTIFY_MSG;
    procedure ServMsu(var Msg: TMessage); message WM_NOTIFY_MSU;
    procedure ServMsl(var Msg: TMessage); message WM_NOTIFY_MSL;
    procedure ServTVD(var Msg: TMessage); message WM_NOTIFY_TVD;
    procedure EmptyClick (Sender:TObject);
    procedure Garland;
    procedure KeyAnaliz;
    procedure StartLadoga;
    procedure StartRec;
    procedure StopRec;
    function  GraphPrepare:boolean;
    procedure PlayStart(LF:string);
    procedure WheelUp;
    procedure WheelDown;
    procedure WheelLeft;
    procedure WheelRight;
    procedure CreateProtocol;
    procedure AddCommand3(NumbCom: integer;D_ID:integer);
  private
    id1, id2, id3, id4,id5,id6,id7,id8,id9,id10,id11,id12,id13,id14,id15,id16,id18,
    id19,id20,id21,id22,id23,id24,id25,mDown,mUp,mLeft,mRight,idsl,idsr,idsu,idsd : Integer;
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    procedure MyUpdate;
    procedure ArmState;
  end;

var
  NMain: TNMain;
  CaptureFilter:  IBaseFilter         =nil;
  AudioFilter:    IbaseFilter         =nil;
  VideoFilter:    IBaseFilter         =nil;
  CSC1:           IBaseFilter         =nil;
  CSC2:           IBaseFilter         =nil;
  ISampleGrabb:   ISampleGrabber      =nil;
  SoundRender:    IBaseFilter         =nil;
  SmartTee:       IBaseFilter         =nil;
  VideoEncoder:   IBaseFilter         =nil;
  SmartTee2:      IBaseFilter         =nil;
  smartTee3:      IBaseFilter         =nil;
  multiplexer:    IBaseFilter         =nil;
  Writer:         IFileSinkFilter     =nil;
  AVIDecompressor:IBaseFilter         =nil;
  TimeStampFilter:IBaseFilter         =nil;
  VideoWindow1   :IBaseFilter         =nil;
  ExternalRenderV:IBaseFilter         =nil;
  ExternalRenderA:IBaseFilter         =nil;
  VideoDecoder1  :IBaseFilter         =nil;
  VideoDecoder2  :IBaseFilter         =nil;
  RefClock:IReferenceClock;
  CaptureGraphBuilder2: ICaptureGraphBuilder2;
  GraphBuilder:   IGraphBuilder;
  MediaType:_AMMediaType;
  pvi:PvideoInfoHeader;
  BWidth, BHeight,MBitCount:integer;
  FastIn:TFastDib;
  FastOut32,FastOut48,FastOut64,FastOut24,FastOut16:TFastDib;
  FastTExt:TFastDib;
  EventAlgorithm:TEvent;
  EventWC1:TEvent;
  EventWC2:TEvent;
  EventWS1:TEvent;
  EventWS2:TEvent;
  hAlgorithm:TAlgorithm;
  hDataCalc:TDataCalc;
  hWC1:TWSC;
  hWC2:TWSC;
  hQuestion:TQuestion;
  hUPS: Array [17..19] of TGetUPS;
  SOPR,SOPR1:TBitmap;
  hPing:TPing;
  hReadCom:TreadCPort;
  Monitoring:TMonitoring;
  WaitEvent : TNewWaitEvent;
  hLadogaAnaliz :TLadogaAnaliz;

const

  CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
  CLSID_ColorSpaceConverter:TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';
  CLSID_FfdshowVideoEncoder:TGUID = '{4DB2B5D9-4556-4340-B189-AD20110D953F}';
  CLSID_AVIDecompressor:TGUID = '{CF49D4E0-1115-11CE-B03A-0020AF0BA770}';
  CLSID_TimeStampFilter:TGUID='{69B239FC-8AF1-4D94-B4E2-A25C87EA2DAB}';
  CLSID_VR:TGUID = '{B87BEB7B-8D29-423F-AE4D-6582C10175AC}';//{70E102B0-5556-11CE-97C0-00AA0055595A}';
  CLSID_ER:TGUID = '{CEB13CC8-3591-45A5-BA0F-20E9A1D72F76}';
  CLSID_VideoDecoder:TGUID = '{04FE9017-F873-410E-871E-AB91661A4EF7}';
  CLSID_Capture_Video:TGUID = '{44A8B5C7-13B6-4211-BD40-35B629D9E6DF}';
  CLSID_Capture_Audio:TGUID = '{AAA22F7E-5AA0-49D9-8C8D-B52B1AA92EB7}';
  CLSID_Render_Video :TGUID = '{CEB13CC8-3591-45A5-BA0F-20E9A1D72F76}';
  CLSID_Render_Audio :TGUID = '{19FA8CC3-56CE-46AB-825D-5CE1A39B137A}';

implementation

uses UPS, ARM, VRD, KU, TM2404, TM2410,UnitDM,EM5402,EM2437,EM7401,EM5401,EM3401,NoExh,TM2320,
     Luna,Rezistor,TM2409,Telem,Protocol,HreadEvent,ListPreview;

{$R *.dfm}

procedure TNMain.CreateProtocol;
var str:String;
begin
  //имя протокола
  NameProtocol.nN           :=0;
  NameProtocol.nStartDate   :=now;
  NameProtocol.nGlidepath  :=Alpha;
  case Axial of
  8:   Str:='2';
  10:  Str:='3';
  end;
  case SysConfig of
  0:   NameProtocol.nKUList:=' C  1  '+Str+'  4 ';
  1:   NameProtocol.nKUList:=' C     '+Str+'  4 ';
  2:   NameProtocol.nKUList:=' C  1  '+' '+'  4 ';
  3:   NameProtocol.nKUList:=' C  1  '+Str+'    ';
  end;
  NameProtocol.nOperator    :=Operator_ID;
  //присвоим номер новому протоколу
  str:='Select Isnull(MAX(Protocol_ID),0)+1 as max from Protocol';
  DM.Protocol.Close;
  DM.Protocol.SQL.Clear;
  DM.Protocol.SQL.Add(str);
  DM.Protocol.Open;
  Protocol_ID:=DM.Protocol.FieldByName('MAX').Value;
  //запишем заголовок протокола
  DM.SetTitle.Close;
  DM.SetTitle.ParamByName('Protocol_ID').Value:=Protocol_ID;
  DM.SetTitle.ParamByName('StartDate').Value:=NameProtocol.nStartDate;
  DM.SetTitle.ParamByName('Glidepath').Value:=NameProtocol.nGlidepath;
  DM.SetTitle.ParamByName('KUList').Value:=NameProtocol.nKUList;
  DM.SetTitle.ParamByName('Operator').Value:=NameProtocol.nOperator;
  DM.SetTitle.ExecSQL;
  DM.SetTitle.Close;
  str:='UPDATE Protocol SET Type='''+Trim(ComboBox1.Text)+''', Number='+Trim(Edit1.Text)+' WHERE Protocol_ID='+IntToStr(Protocol_ID);
  DM.QDin.SQL.Clear;
  DM.QDin.SQL.Add(str);
  DM.QDin.ExecSQL;
  DM.QDin.Close;
  CountProtocol:=0;
  //проверка потока
  if not Assigned(hDataCalc) then
  begin
    hDataCalc:=TDataCalc.Create(True);
    hDataCalc.Priority:=tpLowest;
    hDataCalc.FreeOnTerminate:=False;
    hDataCalc.Resume;
  end;
end;

procedure TNMain.CMCClick(Sender: TObject);
begin
  Application.CreateForm(TMS,MS);
  MS.ShowModal;
end;

procedure TNMain.ComboBox1Change(Sender: TObject);
begin
  Aircraft:=ComboBox1.ItemIndex;
  //точка пересечения глиссады фары с ПУ
  //введено для расчёта цветовых зон для фары
  Koor[6].X:=Koor[5].X;
  Koor[6].Y:=Koor[5].Y;
  Koor[6].Z:=Koor[5].Z-LASet[Aircraft].ZE+LASet[Aircraft].ZF;
end;

procedure TNMain.Edit1Change(Sender: TObject);
var s:string;
    i:integer;
begin
  s:=Edit1.Text;
  if TRIM(s)='' then
  begin
    AirNumb:=0;
    Edit1.Color:=clYellow;
    exit;
  end;
  i:=StrToIntDef(s,-1);
  if i=-1 then
  begin
    Edit1.Text:='';
    AirNumb:=0;
    Edit1.Color:=clYellow;
    exit;
  end;
  if (i<0) then
  begin
    Edit1.Text:='';
    AirNumb:=0;
    Edit1.Color:=clYellow;
    exit;
  end;
  if (i>$1E61)  then
  begin
    Edit1.Text:=COPY(S,1,Length(s)-1);
    AirNumb:=StrToInt(Edit1.Text);
    Edit1.Color:=clWhite;
    Application.MessageBox('Inadmissible format.'+#10#13+' Aircraft number should be from 0 to 7777.','Warning',MB_DEFBUTTON2+MB_ICONWARNING);
    exit;
  end;
  AirNumb:=i;
  Edit1.Color:=clWhite;
end;

procedure TNMain.EmptyClick(Sender: TObject);
var ikl:integer;
begin
  ikl:=5;
end;

procedure TNMain.Garland;
  procedure SmartDeviceStateByName(PanelName:string;State:TState);
  var Panel:TMyPanel;
  begin
    Panel:=NMain.FindComponent(PanelName) as TMyPanel;
    if Panel=nil then exit;
    if Panel.DeviceState<>State then Panel.DeviceState:=State;
  end;
  procedure SmartDeviceState(Panel:TMyPanel;State:TState);
  begin
    if Panel.DeviceState<>State then Panel.DeviceState:=State;
  end;
  function CheckMyState(StateByte:byte):TState;
  begin
    Result:=dsGray;
    case StateByte of
      0 : Result:=dsRed;
      1 : Result:=dsGreen;
      2 : Result:=dsWhite;
      3 : Result:=dsYellow;
      5 : Result:=dsGray;
    end;
  end;
var mArrStateDevice:array [1..DevCount] of TArrStateDevice;
    i,j:integer;
    mColor:TColor;
    mColor1,mColor2:TColor;
    CH:TSwitch;
    CG:TGateways;
    DataExh:byte;
    mEM5402:TEM5402;
    b,d:byte;
    cr:TCross;
    x1,x2,y1,y2:integer;
    PS:array [1..4] of word;
    PT:array [1..4] of word;
    TIm:TImage;
    flag:boolean;
    State:TState;
    str:string;
begin
  if fl_STOP then exit;
  mColor:=Color_W;
  cs_ArrStateDevice.Enter;
  for i:=1 to DevCount do mArrStateDevice[i]:=ArrStateDevice[i];
  cs_ArrStateDevice.Leave;
  case PC.ActivePageIndex of
  0://Desktop of CWS
    begin
      for i:=1 to DevCount do
      begin
        case mArrStateDevice[i].ResultState of
            0 : mColor:=Color_R;
            1 : mColor:=Color_G;
            2 : mColor:=Color_W;
            3 : mColor:=Color_Y;
        end;
        if NMain.FindComponent('dev'+IntToStr(i))<>nil then
          TShape(NMain.FindComponent('dev'+IntToStr(i))).Brush.Color:=mColor;
      end;
      mColor:=Color_G;
      case TM2404i of
        0 : mColor:=Color_R;
        1 : mColor:=Color_G;
        2 : mColor:=Color_W;
        3 : mColor:=Color_Y;
      end;
      dev22.Brush.Color:=mColor;
      mColor:=Color_G;
      case MTK201i of
        0 : mColor:=Color_R;
        1 : mColor:=Color_G;
        2 : mColor:=Color_W;
        3 : mColor:=Color_Y;
      end;
      Dev0.Brush.Color:=mColor;
      i:=0;
      if TUPS(ArrDevice[17]).DataExh<>0 then
      if TUPS(ArrDevice[17]).Params[2]>0 then  Inc(i);
      if TUPS(ArrDevice[18]).DataExh<>0 then
      if TUPS(ArrDevice[18]).Params[2]>0 then  Inc(i);
      if TUPS(ArrDevice[19]).DataExh<>0 then
      if TUPS(ArrDevice[19]).Params[2]>0 then  Inc(i);
      case i of
      0:    devSH.Brush.Color:=Color_R;
      1,2:  devSH.Brush.Color:=Color_Y;
      3:    devSH.Brush.Color:=Color_G;
      end;
    end;
  1://System of data exchange
  begin
    for i:=1 to DevCount do
    case i of
      1,2,3,16:
        begin
          State:=dsWhite;
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+100),State);
          cs_ArrDevice[i].Enter;
            if (TARM(ArrDevice[i]).DataExh<>0) and (TARM(ArrDevice[i]).LAN[1].State) then State:=dsGreen else State:=dsRed;
          cs_ArrDevice[i].Leave;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_LAN1',State);
          cs_ArrDevice[i].Enter;
             if (TARM(ArrDevice[i]).DataExh<>0) and (TARM(ArrDevice[i]).LAN[2].State)then State:=dsGreen else State:=dsRed;
          cs_ArrDevice[i].Leave;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_LAN2',State);
        end;
      45,46:
      if sp45.Enabled then
      begin
        State:=CheckMyState(mArrStateDevice[i].ResultState);
        SmartDeviceStateByName('p1'+IntToStr(i),State);
      end;
      38,39:
      if sp38.Enabled then
      begin
        State:=CheckMyState(mArrStateDevice[i].ResultState);
        SmartDeviceStateByName('p1'+IntToStr(i),State);
      end;
      40,41:
      if sp40.Enabled then
      begin
        State:=CheckMyState(mArrStateDevice[i].ResultState);
        SmartDeviceStateByName('p1'+IntToStr(i),State);
      end;
      25:
      begin
        State:=CheckMyState(mArrStateDevice[i].ExhState);
        SmartDeviceState(p125_Exh,State);
        State:=CheckMyState(mArrStateDevice[i].ResultState);
        SmartDeviceState(p125,State);
      end;
      7..10:
        begin
          State:=CheckMyState(mArrStateDevice[i].ExhState);
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_X1',State);
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+100),State);
        end;
      11,21:
        begin
          cs_ArrDevice[i].Enter;
          mEm5402:=TEM5402((ArrDevice[i]));
          cs_ArrDevice[i].Leave;
          if mEM5402.Use1 then State:=CheckMyState(mEM5402.ch1)
                          else State:=dsGray;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Ch1',State);
          if mEM5402.Use2 then State:=CheckMyState(mEM5402.ch2)
                          else State:=dsGray;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Ch2',State);
          if mEM5402.Use3 then State:=CheckMyState(mEM5402.ch3)
                          else State:=dsGray;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Ch3',State);
          if mEM5402.Use4 then State:=CheckMyState(mEM5402.ch4)
                          else State:=dsGray;
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Ch4',State);
        end;
      12,13:
        begin
          cs_ArrDevice[i].Enter;
          CG:=TEM2409(ArrDevice[i]).Channel;
               DataExh:=TEM2409(ArrDevice[i]).DataExh;
          cs_ArrDevice[i].Leave;
          for j:=1 to 8 do
          begin
            State:=CheckMyState(CG[j]);
            SmartDeviceStateByName('p'+IntToStr(i+100)+'_Port'+IntToStr(j),State);
          end;
          State:=CheckMyState(DataExh);
          SmartDeviceStateByName('p'+IntToStr(i+100)+'Exh',State);
        end;
      14,15:
        begin
          cs_ArrDevice[i].Enter;
          CH:=TEM2410(ArrDevice[i]).Channel;
          cs_ArrDevice[i].Leave;
          for j:=1 to 16 do
          begin
            State:=CheckMyState(CH[j]);
            SmartDeviceStateByName('p'+IntToStr(i+100)+'_LAN'+IntToStr(j),State);
          end;
        end;
      23..24:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+100),State);
          DataExh:=TM2404State.Work[i];
          State:=CheckMyState(DataExh);
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Exh',State);
        end;
      32..37:
        begin
           State:=CheckMyState(mArrStateDevice[i].ResultState);
           SmartDeviceStateByName('p'+IntToStr(i+100),State);
        end;
      26..31:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+100),State);
          State:=CheckMyState(mArrStateDevice[i].ExhState);
          SmartDeviceStateByName('p'+IntToStr(i+100)+'_Exh',State);
        end;
      17..19:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+100),State);
          cs_ArrDevice[i].Enter;
          DataExh:=TUPS(ArrDevice[i]).DataExh;
          cs_ArrDevice[i].Leave;
          State:=CheckMyState(DataExh);
          SmartDeviceStateByName('p'+IntToStr(i+100)+'Exh',State);
        end;
    end;
  SmartDeviceState(px13,p111_ch1.DeviceState);
  SmartDeviceState(px14,p111_ch2.DeviceState);
  SmartDeviceState(px15,p121_ch3.DeviceState);
  SmartDeviceState(px16,p121_ch4.DeviceState);
  SmartDeviceState(p120_LAN2,p114_Lan9.DeviceState);
  SmartDeviceState(p102_x9,p141.DeviceState);
  SmartDeviceState(p101_x10,p140.DeviceState);
  SmartDeviceState(px20,p112_port5.DeviceState);
  SmartDeviceState(px17,p112_Port4.DeviceState);
  SmartDeviceState(px19,p112_port6.DeviceState);
  SmartDeviceState(px10,p113_port5.DeviceState);
  SmartDeviceState(px18,p113_port4.DeviceState);
  end;
  2://Distribution system of video
    begin
      for i:=1 to DevCount do
      case i of
      1..3,16:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+200),State);
          begin
            cs_ArrDevice[i].Enter;
            if TARM(ArrDevice[i]).VideoTDV then State:=dsGreen else State:=dsRed;
            cs_ArrDevice[i].Leave;
          end;
          SmartDeviceStateByName('p'+IntToStr(i+200)+'_X5',State);
          SmartDeviceStateByName('p'+IntToStr(i+200)+'_X6',State);
        end;
      7..10:
        begin
          if mArrStateDevice[i].ExhState=0 then  flag:=false else flag:=true;
          if flag then State:=CheckMyState(mArrStateDevice[i].ResultState)
                  else State:=dsRed;
          SmartDeviceStateByName('p'+IntToStr(i+200),State);
          if flag then
          begin
            cs_ArrDevice[i].Enter;
            if TKU(ArrDevice[i]).SSP then State:=dsGreen else State:=dsRed;
            cs_ArrDevice[i].Leave;
          end else State:=dsRed;
          SmartDeviceStateByName('p'+IntToStr(i+200)+'_X1',State);
        end;
      25:
        begin
          if mArrStateDevice[i].ExhState=0 then  flag:=false else flag:=true;
          if flag then State:=CheckMyState(mArrStateDevice[i].ResultState)
                  else State:=dsRed;
          SmartDeviceState(p225,State);
          if flag then
          begin
            cs_ArrDevice[i].Enter;
                b:=TEM3401(ArrDevice[i]).SignY1;
                d:=TEM3401(ArrDevice[i]).SignY2;
            cs_ArrDevice[i].Leave;
          end else
          begin
            b:=0;
            d:=0;
          end;
          if b=1 then  State:=dsGreen else State:=dsRed;
          SmartDeviceState(p225_2,State);
          if d=1 then State:=dsGreen else State:=dsRed;
          SmartDeviceState(p225_3,State);
        end;
      30..31:
        begin
          if mArrStateDevice[i].ExhState=0 then  flag:=false else flag:=true;
          if flag then State:=CheckMyState(mArrStateDevice[i].ResultState)
                  else State:=dsRed;
          SmartDeviceStateByName('p'+IntToStr(i+200),State);
          begin
            cs_ArrDevice[i].Enter;
                b      :=TEM7401(ArrDevice[i]).VMSVS;
                Cr     :=TEM7401(ArrDevice[i]).Cross;
                DataExh:=TEM7401(ArrDevice[i]).DataExh;
            cs_ArrDevice[i].Leave;
            if DataExh=1 then
              if b and $40 = $40 then  State:=dsGreen else State:=dsRed else State:=dsRed;
            SmartDeviceStateByName('p'+IntToStr(i+200)+'_Out7',State);
            if DataExh=1 then
              if b and $10 = $10 then  State:=dsGreen else State:=dsRed else State:=dsRed;
            SmartDeviceStateByName('p'+IntToStr(i+200)+'_Out5',State);
            if DataExh=1 then
              if b and $04 = $04 then  State:=dsGreen else State:=dsRed else State:=dsRed;
            SmartDeviceStateByName('p'+IntToStr(i+200)+'_Out3',State);
            if DataExh=1 then
              if b and $01 = $01 then  State:=dsGreen else State:=dsRed else State:=dsRed;
            SmartDeviceStateByName('p'+IntToStr(i+200)+'_Out1',State);
          end;
          if i=30 then TIm:=i7401_1;
          if i=31 then TIm:=i7401_2;
          with TIm.Canvas do
          begin
            Pen.Color:=clBlack;
            Brush.Color:=clWhite;
            FillRect(TIm.ClientRect);
            Pen.Width:=2;
            Rectangle(2,2,TIm.Width,TIm.Height);
            for j:=1 to 4 do
            begin
               b:=(cr[j*2-1] and $0F)+1;
               d:=((cr[j*2-1] and $F0) shr 4) +1;
               if (not (b in [1..16])) or (not (d in [1..8])) then continue;
               x1:=0;
               x2:=i7401_1.Width;
               case b of
                 1..4,5,9,11,13,15: y1:=TPanel(NMain.FindComponent('p2'+IntToStr(i)+'_In'+IntToStr(b))).Top-TIm.Top+15;
                  6,10,12,14,16: y1:=TPanel(NMain.FindComponent('p2'+IntToStr(i)+'_In'+IntToStr(b-1))).Top-TIm.Top+15;
                 7,8: continue;
               end;
               case d of
                 1,3,5,7: y2:=TPanel(NMain.FindComponent('p2'+IntToStr(i)+'_Out'+IntToStr(d))).Top-TIm.Top+15;
                 2,4,6,8: y2:=TPanel(NMain.FindComponent('p2'+IntToStr(i)+'_Out'+IntToStr(d-1))).Top-TIm.Top+15;
               end;
               MoveTo(x1,y1);
               LineTo(x2,y2);
            end;
          end;
        end;
      26..29:
        begin
          if mArrStateDevice[i].ExhState=0 then  flag:=false else flag:=true;
          if flag then State:=CheckMyState(mArrStateDevice[i].ResultState)
                  else State:=dsRed;
          SmartDeviceStateByName('p'+IntToStr(i+200),State);
          if flag then
          begin
            cs_ArrDevice[i].Enter;
               b:=TEM2437(ArrDevice[i]).MabVs;
            cs_ArrDevice[i].Leave;
          end else b:=0;
          case i of
          26,27:
            begin
              if b and $01 = $01 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch1',State);
              if b and $08 = $08 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch2',State);
              if b and $10 = $10 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch3',State);
              if b and $80 = $80 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch4',State);
            end;
          28:
            begin
              if b and $02 = $02 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch1',State);
            end;
          29:
            begin
              if b and $20 = $20 then State:=dsGreen else State:=dsRed;
              SmartDeviceStateByName('p'+IntToStr(i+200)+'_Ch3',State);
            end;
          end;
        end;
      23..24:
        begin
           if mArrStateDevice[i].ExhState=0 then flag:=false else flag:=true;
           State:=CheckMyState(mArrStateDevice[i].ResultState);
           SmartDeviceStateByName('p'+IntToStr(i+200),State);
           if  flag then
           begin
             cs_ArrDevice[i].Enter;
                 b:=TEm5401(ArrDevice[i]).IfBSync;
             cs_ArrDevice[i].Leave;
           end else b:=0;
           if b and $08 = $08 then State:=dsGreen else State:=dsRed;
           SmartDeviceStateByName('p'+IntToStr(i+200)+'_S1',State);
           if b and $04 = $04 then State:=dsGreen else State:=dsRed;
           SmartDeviceStateByName('p'+IntToStr(i+200)+'_S2',State);
           if b and $02 = $02 then State:=dsGreen else State:=dsRed;
           SmartDeviceStateByName('p'+IntToStr(i+200)+'_S3',State);
           if b and $01 = $01 then State:=dsGreen else State:=dsRed;
           SmartDeviceStateByName('p'+IntToStr(i+200)+'_S4',State);
        end;
      end;
      SmartDeviceState(px1,p202_x5.DeviceState);
      SmartDeviceState(px2,p202_x6.DeviceState);
      SmartDeviceState(px3,p201_x5.DeviceState);
      SmartDeviceState(px4,p201_x6.DeviceState);
      SmartDeviceState(px5,p203_x5.DeviceState);
      SmartDeviceState(px6,p203_x6.DeviceState);
      SmartDeviceState(px7,p216_x5.DeviceState);
      SmartDeviceState(px9,p216_x6.DeviceState);
    end;
  3://System of power supplies
    begin
      for i:=1 to DevCount do
      case i of
        23,24:
          begin
            cs_ArrDevice[i].Enter;
                  PS[1]:=TEM5401(ArrDevice[i]).UPS1;
                  PS[2]:=TEM5401(ArrDevice[i]).UPS2;
                  PT[1]:=TEM5401(ArrDevice[i]).UPT1;
                  PT[2]:=TEM5401(ArrDevice[i]).UPT2;
            cs_ArrDevice[i].Leave;
            if PS[1]<PT[1] then mColor:=Color_R else mColor:=Color_G;
            i32DC.Font.Color:=MColor;
            i32DC.Text:='  '+FloatToStrF(PS[1]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[1]*0.2,ffFixed,4,1);
            if PS[2]<PT[2] then mColor:=Color_R else mColor:=Color_G;
            i33DC.Font.Color:=MColor;
            i33DC.Text:='  '+FloatToStrF(PS[2]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[2]*0.2,ffFixed,4,1);
          end;
        26:
          begin
            cs_ArrDevice[i].Enter;
                PS[1]:=TEM2437(ArrDevice[i]).UPS11;
                PS[2]:=TEM2437(ArrDevice[i]).UPS12;
                PS[3]:=TEM2437(ArrDevice[i]).UPS21;
                PS[4]:=TEM2437(ArrDevice[i]).UPS22;
                PT[1]:=TEM2437(ArrDevice[i]).UPT11;
                PT[2]:=TEM2437(ArrDevice[i]).UPT12;
                PT[3]:=TEM2437(ArrDevice[i]).UPT21;
                PT[4]:=TEM2437(ArrDevice[i]).UPT22;
                b:=TEM2437(ArrDevice[i]).UPSS;
            cs_ArrDevice[i].Leave;
            if b and $01 = $01 then D2.Visible:=false else D2.Visible:=true;
            if b and $02 = $02 then D4.Visible:=false else D4.Visible:=true;
            if PS[1]<PT[1] then mColor:=Color_R else mColor:=Color_G;
            i34DC.Font.Color:=mColor;
            i34DC.Text:='  '+FloatToStrF(PS[1]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[1]*0.2,ffFixed,4,1);
            if PS[2]<PT[2] then mColor:=Color_R else mColor:=Color_G;
            i34FB.Font.Color:=mColor;
            i34FB.Text:='  '+FloatToStrF(PS[2]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[2]*0.2,ffFixed,4,1);
            if PS[3]<PT[3] then mColor:=Color_R else mColor:=Color_G;
            i35DC.Font.Color:=mColor;
            i35DC.Text:='  '+FloatToStrF(PS[3]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[3]*0.2,ffFixed,4,1);
            if PS[4]<PT[4] then mColor:=Color_R else mColor:=Color_G;
            i35FB.Font.Color:=mColor;
            i35FB.Text:='  '+FloatToStrF(PS[4]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[4]*0.2,ffFixed,4,1);
          end;
        27:
          begin
            cs_ArrDevice[i].Enter;
                PS[1]:=TEM2437(ArrDevice[i]).UPS11;
                PS[2]:=TEM2437(ArrDevice[i]).UPS12;
                PS[3]:=TEM2437(ArrDevice[i]).UPS21;
                PS[4]:=TEM2437(ArrDevice[i]).UPS22;
                PT[1]:=TEM2437(ArrDevice[i]).UPT11;
                PT[2]:=TEM2437(ArrDevice[i]).UPT12;
                PT[3]:=TEM2437(ArrDevice[i]).UPT21;
                PT[4]:=TEM2437(ArrDevice[i]).UPT22;
                b:=TEM2437(ArrDevice[i]).UPSS;
            cs_ArrDevice[i].Leave;
            if b and $01 = $01 then D1.Visible:=false else D1.Visible:=true;
            if b and $02 = $02 then D3.Visible:=false else D3.Visible:=true;
            if PS[1]<PT[1] then mColor:=Color_R else mColor:=Color_G;
            i36DC.Font.Color:=mColor;
            i36DC.Text:='  '+FloatToStrF(PS[1]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[1]*0.2,ffFixed,4,1);
            if PS[2]<PT[2] then mColor:=Color_R else mColor:=Color_G;
            i36FB.Font.Color:=mColor;
            i36FB.Text:='  '+FloatToStrF(PS[2]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[2]*0.2,ffFixed,4,1);
            if PS[3]<PT[3] then mColor:=Color_R else mColor:=Color_G;
            i37DC.Font.Color:=mColor;
            i37DC.Text:='  '+FloatToStrF(PS[3]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[3]*0.2,ffFixed,4,1);
            if PS[4]<PT[4] then mColor:=Color_R else mColor:=Color_G;
            i37FB.Font.Color:=mColor;
            i37FB.Text:='  '+FloatToStrF(PS[4]*0.2,ffFixed,4,1)+'/'+FloatToStrF(PT[4]*0.2,ffFIxed,4,1);
          end;
        32..37:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+300),State);
        end;
        7..10:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+300),State);
        end;
      1..3,
      17..20,
      12..16:
        begin
          State:=CheckMyState(mArrStateDevice[i].ResultState);
          SmartDeviceStateByName('p'+IntToStr(i+300),State);
        end;
      end;
      i:=0;
      if TUPS(ArrDevice[17]).DataExh<>0 then
      if TUPS(ArrDevice[17]).Params[2]>0 then  Inc(i);
      if TUPS(ArrDevice[18]).DataExh<>0 then
      if TUPS(ArrDevice[18]).Params[2]>0 then  Inc(i);
      if TUPS(ArrDevice[19]).DataExh<>0 then
      if TUPS(ArrDevice[19]).Params[2]>0 then  Inc(i);
      case i of
      0:    State:=dsRed;
      1,2:  State:=dsYellow;
      3:    State:=dsGreen;
      end;
      SmartDeviceState(SH,State);
    end;
  end;
end;

procedure TNMain.ServMsl(var Msg: TMessage);
var  mMSO    : TMSO;
     Day,Month,Year:Word;
     mDTL:TDateTime;
begin
  if fl_STOP then exit;  
  cs_Ladoga.Enter;
  try  mMSO:=MSO;
  finally cs_Ladoga.Leave;  end;
  MS1[2,19]:= 1.0*(MSO[2,24] shl 1 + MSO[2,25]/32768.0)/86400.0;
  Day:=mMSO[2,26] shr 11;
  Month:=(mMSO[2,26]-(Day shl 11)) shr 7;
  Year:=2000 + mMSO[2,26]-(Day shl 11)-(Month shl 7);
  if (Year<>2000)AND(Month<>0)AND(Day<>0) then MS1[2,20]:=EncodeDate(Year,Month,Day);
  mDTL:=TimeOf(MS1[2,19])+DateOf(MS1[2,20]);
  if HOST_TP=1 then
  begin
    {cs_ArrDevice[40].Enter;
    try   TTel(ArrDevice[40]).DT:=mDTL;
          TTel(ArrDevice[40]).TimeSt:=1;
    finally cs_ArrDevice[40].Leave; end; }
    if SynchroTime.Tag=555 then
    begin
      SynchroTime.Enabled:=true;
      SynchroTime.Tag:=0;
    end;

  end;
  if HOST_TP=2 then
  begin
   { cs_ArrDevice[41].Enter;
    try  LeftTel.tr:=mDTL;
         LeftTel.tg:=1;
    finally cs_ArrDevice[41].Leave; end; }
  end;
  TelemT.Enabled:=false;
  TelemT.Enabled:=true;
end;

procedure TNMain.ServMsu(var Msg: TMessage);
begin
  case Msg.WParam of
  5: Garland;
  end;
end;

procedure TNMain.ServMsg(var Msg: TMessage);
var x1,x2,x3:word;
begin
  if fl_STOP then exit;  
  if (Msg.WParam<>111) and (Msg.WParam<>222) then  exit;
  if EscortMode=IntToStr(Msg.LParam) then exit;
  EscortMode:=IntToStr(Msg.LParam);
  x1:=Msg.LParam div 100;
  x2:=Msg.LParam div 10 - x1*10;
  x3:=Msg.LParam - x1*100-x2*10;
  if x1=2 then fl_IndependentEscort:=true else fl_IndependentEscort:=false;
  if not fl_IndependentEscort then
  begin
    AlgNum:=x2;
    AutoSopr:=x3;
    Point_Brush;
    Shape43.Brush.Color:=Color_G;
    Shape44.Brush.Color:=Color_S;
    SpeedButton1.Enabled:=false;
    SpeedButton2.Enabled:=false;
    SpeedButton4.Enabled:=false;
  end else
  begin
    Shape43.Brush.Color:=Color_S;
    Shape44.Brush.Color:=Color_G;
    SpeedButton1.Enabled:=true;
    SpeedButton2.Enabled:=true;
    SpeedButton4.Enabled:=true;
  end;
end;

procedure TNMain.GlobalException(sender: Tobject; e: exception);
begin
 { i:=WSAGetLastError;
  if i=WSAECONNRESET then begin Str:='Connection reset by peer'; exit; end; //связь оборвана
  if i=WSAEHOSTUNREACH then begin Str:='No route to host'; exit; end;//нет хоста
  ShowMessage('GLEx1  '+IntToStr(i));
  ShowMEssage('GLEx2  '+e.Message);}
end;

procedure TNMain.SendEscortMode;
var x1,x2,x3:integer;
begin
   if fl_Stop then EXIT;
   if (Host_TP=2) or (HOST_TP=3) then exit;
   if fl_IndependentEscort then x1:=2 else x1:=1;
   x2:=AlgNum;
   x3:=AutoSopr;
   EscortMode:=IntToStr(x1)+IntToStr(x2)+IntToStr(x3);
end;

procedure TNMain.Point_Brush;
begin
  // начало/конец записи протокола
  if Host_TP=1 then
  case AutoSopr of
  0:    //сохранение протокола в базу данных, остановка расчёта DataCalc
        if fl_Protocol then
        begin
          fl_Protocol:=false;
        end;
  1,2:  //создание протокола сопровождения, начало расчёта DataCalc
        if not fl_Protocol then
        begin
          fl_rprotocol:=true;
        end;
  end;
  if (AutoSopr=0) or (AutoSopr=2) then
  begin
    slr:=0;
    sud:=0;
    Label240.Caption:='';
    label241.Caption:='';
  end;
  // вывод режима сопровождения на форму
  case AutoSopr of
    0:  Edit3.Text:='No';
    1:  Edit3.Text:='Auto';
    2:  Edit3.Text:='Manual';
  end;  
  // если протокол уже начат, запретить редактирование его заголовка
  case AutoSopr of
    0:   begin
           ComboBox1.Enabled:=true;
           Edit1.Enabled:=true;
           SpeedButton13.Enabled:=true;
           SpeedButton16.Enabled:=true;
           SpeedButton17.Enabled:=true;
           Label248.Enabled:=true;
           Label250.Enabled:=true;
           MaskEdit1.Enabled:=true;
           MaskEdit2.Enabled:=true;
           RadioButton1.Checked:=true;
           SpeedButton15.Enabled:=true;
           SpeedButton14.Enabled:=true;
         end;
    1,2: begin
           ComboBox1.Enabled:=false;
           Edit1.Enabled:=false;
           SpeedButton13.Enabled:=false;
           MaskEdit1.Enabled:=false;
           MaskEdit2.Enabled:=false;
           SpeedButton16.Enabled:=false;
           SpeedButton17.Enabled:=false;
           Label248.Enabled:=false;
           Label250.Enabled:=false;
           RadioButton2.Checked:=true;
           SpeedButton15.Enabled:=false;
           SpeedButton14.Enabled:=false;
         end;
  end;
  //раскрасить режим сопровождения на форме
  case AlgNum of
    0:begin  Shape26.Brush.Color:=Color_S;  Shape27.Brush.Color:=Color_S;  Shape28.Brush.Color:=Color_S; end;
    1:begin  Shape26.Brush.Color:=Color_G;  Shape27.Brush.Color:=Color_S;  Shape28.Brush.Color:=Color_S; end;
    2:begin  Shape27.Brush.Color:=Color_G;  Shape26.Brush.Color:=Color_S;  Shape28.Brush.Color:=Color_S; end;
    3:begin  Shape28.Brush.Color:=Color_G;  Shape26.Brush.Color:=Color_S;  Shape27.Brush.Color:=Color_S; end;
  end;
  // в видео окне дублируется инфо о смене режима сопровождения
  fl_ChangeOfMode:=true;
  // место вывода инфо о новом режиме сопровождения в видеоокне
  if viy<100 then TextTimer.Tag:=1 else TextTimer.Tag:=2;
  // время вывода инфо о смене режима сопровождения в видеоокне
  if TextTimer.Enabled then TextTimer.Enabled:=false;
  TextTimer.Enabled:=true;
end;

procedure TNMain.RadioButton1Click(Sender: TObject);
var Command:cardinal;
begin
  if Host_TP<>1 then exit;
  if fl_VRD=0 then exit;
  if Aircraft=-1 then Aircraft:=255;
  if Edit1.Text='' then Edit1.Text:='0';
  Command:=(StrToInt(Edit1.Text) shl 16) + (Aircraft shl 8) +1;
  if UDPCommandServer.Active then
  try UDPCOmmandServer.SendBuffer(IP_Broadcast,UDPCommandServer.DefaultPort,ToBytes(Command)) except ShowMEssage('1'); end;
  AnswerWaitTimer.Interval:=2000;
  AnswerWaitTimer.Tag:=333;
  AnswerWaitTimer.Enabled:=true;
end;
procedure TNMain.RadioButton2Click(Sender: TObject);
var Command:Cardinal;
begin
  if Host_TP<>1 then exit;
  if fl_VRD=1 then  exit;
  if Aircraft=-1 then Aircraft:=255;
  if Edit1.Text='' then Edit1.Text:='0';
  Command:=(StrToInt(Edit1.Text) shl 16)  + (Aircraft shl 8) + 0;
  if UDPCommandServer.Active then
  try UDPCOmmandServer.SendBuffer(IP_Broadcast,UDPCommandServer.DefaultPort,ToBytes(Command)) except end;
  AnswerWaitTimer.Interval:=2000;
  AnswerWaitTimer.Tag:=333;
  AnswerWaitTimer.Enabled:=true;
end;

procedure TNMain.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    0: Edit1.ReadOnly:=true;
    1: begin Edit1.ReadOnly:=false;  Edit1.Text:=''; Edit1Change(self); end;
  end;
end;

procedure TNMain.MyUpdate;
var x,y,i:integer;
    StrMove:string;
begin
  if fl_STOP then exit;
  Label240.Caption:='oX:='+IntToStr(Vix)+' s:='+IntToStr(slr);
  Label241.Caption:='oY:='+IntToStr(Viy)+' s:='+IntToStr(sud);
  vix:=vix+slr;
  viy:=viy+sud;
  cs_Auto.Enter;try x:=ViX;y:=ViY;finally cs_Auto.Leave; end;
  Label5.Caption:='X:='+IntToStr(ViX);
  Label6.Caption:='Y:='+IntToStr(ViY);
  Image3.Canvas.Lock;
  case sizebm of
  16:  FastOut16.Stretch(Image3.Canvas.Handle,0,0,Image3.Width,Image3.Height);
  24:  FastOut24.Stretch(Image3.Canvas.Handle,0,0,Image3.Width,Image3.Height);
  32:  FastOut32.Stretch(Image3.Canvas.Handle,0,0,Image3.Width,Image3.Height);
  48:  FastOut48.Stretch(Image3.Canvas.Handle,0,0,Image3.Width,Image3.Height);
  64:  FastOut64.Stretch(Image3.Canvas.Handle,0,0,Image3.Width,Image3.Height);
  end;
  Image3.Canvas.Unlock;
  Image3.Refresh;
  if sizebm<>sizebm_ then
  begin
    sizebm:=sizebm_;
    div_2:=sizebm shr 1;
    div_5:=sizebm div 5;
    div_8:=(sizebm*sizebm) shr 3;
    div_32:=(sizebm*sizebm) shr 5;
  end;
  if AlgSopr=0 then Label260.Caption:='F7';
  if AlgSopr=1 then Label260.Caption:='F8';
  case AlgSopr of
  0:  case AlgNum of
        1: begin Label260.Caption:='F7'; GradProgress1.Position:=0;  GradProgress1.Enabled:=false; end;
        2: begin
             Label260.Caption:='F7';
             GradProgress1.Enabled:=true;
             case AlgFilter of
             1:  GradProgress1.Position:=20;
             2:  GradProgress1.Position:=40;
             3:  GradProgress1.Position:=60;
             4:  GradProgress1.Position:=80;
             5:  GradProgress1.Position:=100;
             end;
        end;
        3: begin Label260.Caption:='F7'; GradProgress1.Position:=0; GradProgress1.Enabled:=false; end;
      end;
  1:  begin
        Label260.Caption:='F8';
        GradProgress1.Enabled:=true;
        case AlgFilter of
          1:  GradProgress1.Position:=20;
          2:  GradProgress1.Position:=40;
          3:  GradProgress1.Position:=60;
          4:  GradProgress1.Position:=80;
          5:  GradProgress1.Position:=100;
        end;
      end;
  end;
  fl_Video:=false;
  fl_EscortResult[2]:=false; fl_EscortResult[3]:=false;
  inc(VideoCount);
  if (Host_TP=2) or (Host_TP=3) then
  begin
    EscortResult[HOST_TP].Host:=Host_TP;
    EscortResult[HOST_TP].Mouse.X:=x;
    EscortResult[HOST_TP].Mouse.Y:=y;
    EscortResult[HOST_TP].Bmp:=SOPRGrey;
    EscortResult[HOST_TP].BmpSize:=sizebm;
    inc(UDPSendCounter[HOST_TP]);
    EscortResult[HOST_TP].SetNumber:=UDPSendCounter[HOST_TP];
    cs_ArrDevice[39].Enter;
    try for i:=1 to 8 do EscortResult[HOST_TP].Luna[i]:=LeftLU[i];
    finally cs_ArrDevice[39].Leave; end;
    cs_ArrDevice[46].Enter;
    try for i:=1 to 9 do EscortResult[HOST_TP].Rez[i]:=LeftRz[i];
    finally cs_ArrDevice[46].Leave; end;
    {cs_ArrDevice[41].Enter;
    try EscortResult[HOST_TP].Tel.tr:=LeftTel.tr;
        EscortResult[HOST_TP].Tel.tg:=LeftTel.tg;
    finally cs_ArrDevice[41].Leave; end; }
      EscortResult[HOST_TP].SMS.HOST:=TempSMS.HOST;
      EscortResult[HOST_TP].SMS.HDDCount:=TempSMS.HDDCount;
      EscortResult[HOST_TP].SMS.HDDEnum:=TempSMS.HDDEnum;
      EscortResult[HOST_TP].SMS.LanCount:=TempSMS.LanCount;
      EscortResult[HOST_TP].SMS.LanEnum:=TempSMS.LanEnum;
      EscortResult[HOST_TP].SMS.Video:=TempSMS.Video;
    setLength(StrMove,SizeOf(EscortResult[HOST_TP]));
    move(EscortResult[HOST_TP], StrMove[1],sizeof(EscortResult[HOST_TP]));
    hWC2.mdata:=StrMove;  hWC1.mdata:=StrMove;
    if HOST_TP=2 then
    begin
    if Assigned(hWC1) then  EventWC1.SetEvent;
    if Assigned(hWC2) then  EventWC2.SetEvent;
    end;
    if HOST_TP=3 then
    begin
      if Assigned(hWC2) then  EventWC2.SetEvent;
      if Assigned(hWC1) then  EventWC1.SetEvent;
    end;
  end;
  if HOST_TP=1 then
  begin
    MP[1].X:=vix;
    MP[1].Y:=viy;
  end;
end;

procedure TNMain.AddCommand3(NumbCom: integer;D_ID:integer);
var command:TMass;
    pms:^Tmass;
begin
  //комманда о смене режима проходит на все камеры
  //сама комманда
  command[1]:=HI(ComDev[D_ID].cAdress);
  command[2]:=LO(ComDev[D_ID].cAdress);
  command[3]:=$17;
  command[4]:=Command_TM2220[NumbCom].cCommand;
  command[5]:=$ff-(command[1]+command[2]+command[3]+command[4])+1;
  //структура для записи в TList
  New(pms);
  pms^[1]:=D_ID;                   //Device_ID
  pms^[2]:=ComDev[D_ID].cCom_ID;   //Com_ID;
  pms^[3]:=5;                   //размер комманды
  pms^[4]:=NumbCom;             //номер команды
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=command[1];
  pms^[8]:=command[2];
  pms^[9]:=command[3];
  pms^[10]:=command[4];
  pms^[11]:=command[5];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

// сообщения от горячих клавиш
procedure TNMain.WMHotKey(var Msg: TWMHotKey);
var i,j:integer;
var s1,s2:integer;
    stt:string;
begin
  if fl_STOP then exit;
  if Msg.HotKey=mUp then
  begin
    WheelUp;
  end;
  if Msg.HotKey=mDown then
  begin
    WheelDown;
  end;
  if Msg.HotKey=mLeft then
  begin
    WheelLeft;
  end;
  if Msg.HotKey=mRight then
  begin
    WheelRight;
  end;
  if Msg.HotKey = id7 then
  begin
    AlgSopr:=0;
  end;
  if Msg.HotKey = id8 then
  begin
    AlgSopr:=1;
  end;
  if Msg.HotKey = idsl then
    if AutoSopr=1 then
    if slr>=-4 then slr:=slr-1;
  if Msg.HotKey = idsr then
    if AutoSopr=1 then
    if slr<=4 then slr:=slr+1;
  if Msg.HotKey = idsu then
    if AutoSopr=1 then
    if sud>=-4 then sud:=sud-1;
  if Msg.HotKey = idsd then
    if AutoSopr=1 then
    if sud<=4 then sud:=sud+1; 
  if (not fl_IndependentEscort) then
  if ((Host_TP=2) or (Host_TP=3)) then exit;
  if Msg.HotKey = id1 then
  begin
    AlgNum:=1;
    Point_Brush;
    SendEscortMode;
  end;
  if Msg.HotKey = id2 then
  begin
    AlgNum:=2;
    Point_Brush;
    SendEscortMode;
  end;
  if Msg.HotKey = id3 then
  begin
    AlgNum:=3;
    Point_Brush;
    SendEscortMode;
  end;
  if Msg.HotKey = id4 then
  begin
    AutoSopr:=0;
    Point_Brush;
    SendEscortMode;
  end;
  if Msg.HotKey = id5 then
  begin
    TVD2.Click;
  end;
  if Msg.HotKey = id6 then
  begin
    TVD3.Click;
  end;
  if Msg.HotKey = id9 then
  begin
    for j:=22 to 25 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clLime;
    Shape14.Brush.Color:=clBtnFace;
    Shape15.Brush.Color:=clBtnFace;
  end;
  if Msg.HotKey = id10 then
  begin
    for j:=26 to 29 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clBtnFace;
    Shape14.Brush.Color:=clLime;
    Shape15.Brush.Color:=clBtnFace;
  end;
  if Msg.HotKey = id11 then
  begin
    for j:=30 to 33 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clBtnFace;
    Shape14.Brush.Color:=clBtnFace;
    Shape15.Brush.Color:=clLime;
  end;
  // СТАРТ ПРОТОКОЛА ++++++++++++++++++++++++++++++++++++++++++++++++++
  if Msg.HotKey = id16 then
  begin
    if fl_rprotocol then
    begin
      CreateProtocol;
      fl_Protocol:=true;
      fl_rprotocol:=false;
    end;
  end;
  if Msg.HotKey = id12 then
  begin
    //дальность от радара
    Track:=1;
    Shape5.Brush.Color:=Color_G;
    Shape4.Brush.Color:=clSilver;
  end;
  if Msg.HotKey = id13 then
  begin
    //дальность по тВ
    Track:=0;
    Shape4.Brush.Color:=Color_G;
    Shape5.Brush.Color:=clSilver;
  end;

  // режим компенсации качки++++++++++++++++++++++++++++++++++++++++++
  if Msg.HotKey = id24 then
  begin
    if not SpeedButton16.Enabled then exit;
    if flag_PC then
    begin
      flag_PC:=false;
      Shape16.Brush.Color:=clSilver;
      SpeedButton17.Enabled:=true;
    end else
    begin
      flag_PC:=true;
      SpeedButton17.Enabled:=false;
      Shape16.Brush.Color:=clLime;
    end;
  end;
  // режим компенсации качки++++++++++++++++++++++++++++++++++++++++++
  if Msg.HotKey = id25 then
  begin
  if not SpeedButton17.Enabled then exit;
  if flag_PR then
  begin
    flag_PR:=false;
    Shape17.Brush.Color:=clSilver;
    SpeedButton16.Enabled:=true;
  end else
  begin
    flag_PR:=true;
    Shape17.Brush.Color:=clLime;
    SpeedButton16.Enabled:=false;
  end;
  end;
// увеличить угол глиссады на 1 минуту++++++++++++++++++++++++++++++
  if Msg.HotKey = id18 then
  begin
    if AutoSopr<>0 then exit;
    S1:=StrToInt(MaskEdit1.Text[1]);
    S2:=StrToInt(MaskEdit1.Text[3])*10+StrToInt(MaskEdit1.Text[4]);
    if (S1=9) and (S2=59) then exit;
    if S2=59 then
    begin
      S2:=0;
      INC(S1);
    end else INC(S2);
    stt:=IntToStr(S1)+Chr($B0);
    if S2<10 then
    begin
      Stt:=Stt+'0'+IntToStr(S2)+Chr($27);
    end else
    begin
      Stt:=Stt+IntToStr(S2 div 10)+IntToStr(S2 - (S2 div 10)*10)+Chr($27);
    end;
    MaskEdit1.Text:=Stt;
    SpeedButton13Click(self);
  end;
  //увеличить угол бетта на 1 минуту==================================
  if Msg.HotKey = id21 then
  begin
    if AutoSopr<>0 then exit;
    S1:=StrToInt(MaskEdit2.Text[1]);
    S2:=StrToInt(MaskEdit2.Text[3])*10+StrToInt(MaskEdit2.Text[4]);
    if (S1=9) and (S2=59) then exit;
    if S2=59 then
    begin
      S2:=0;
      INC(S1);
    end else INC(S2);
    stt:=IntToStr(S1)+Chr($B0);
    if S2<10 then
    begin
      Stt:=Stt+'0'+IntToStr(S2)+Chr($27);
    end else
    begin
      Stt:=Stt+IntToStr(S2 div 10)+IntToStr(S2 - (S2 div 10)*10)+Chr($27);
    end;
    MaskEdit2.Text:=Stt;
    SpeedButton15Click(self);
  end;
  // уменьшить угол глиссады на 1 минуту++++++++++++++++++++++++++++++
  if Msg.HotKey = id19 then
  begin
    if AutoSopr<>0 then exit;
    S1:=StrToInt(MaskEdit1.Text[1]);
    S2:=StrToInt(MaskEdit1.Text[3])*10+StrToInt(MaskEdit1.Text[4]);
    if (S1=0) and (S2=0) then exit;
    if S2=0 then
    begin
      S2:=59;
      DEC(S1);
    end else DEC(S2);
    stt:=IntToStr(S1)+Chr($B0);
    if S2<10 then
    begin
      Stt:=Stt+'0'+IntToStr(S2)+Chr($27);
    end else
    begin
      Stt:=Stt+IntToStr(S2 div 10)+IntToStr(S2 - (S2 div 10)*10)+Chr($27);
    end;
    MaskEdit1.Text:=Stt;
    SpeedButton13Click(self);
  end;
  // уменьшить угол бетта на 1 минуту++++++++++++++++++++++++++++++
  if Msg.HotKey = id20 then
  begin
    if AutoSopr<>0 then exit;
    S1:=StrToInt(MaskEdit2.Text[1]);
    S2:=StrToInt(MaskEdit2.Text[3])*10+StrToInt(MaskEdit2.Text[4]);
    if (S1=0) and (S2=0) then exit;
    if S2=0 then
    begin
      S2:=59;
      DEC(S1);
    end else DEC(S2);
    stt:=IntToStr(S1)+Chr($B0);
    if S2<10 then
    begin
      Stt:=Stt+'0'+IntToStr(S2)+Chr($27);
    end else
    begin
      Stt:=Stt+IntToStr(S2 div 10)+IntToStr(S2 - (S2 div 10)*10)+Chr($27);
    end;
    MaskEdit2.Text:=Stt;
    SpeedButton15Click(self);
  end;
  if Msg.HotKey = id14 then
  begin
    SpeedButton8.Click;
  end;
  if Msg.HotKey = id15 then
  begin
    SpeedButton9.Click;
  end;
end;

procedure TNMain.WSLServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var TempLad:TLadoga;
    nm:integer;
    miniWSLLadogaCounter:int64;
begin
  if HOST_TP<>1 then exit;
  if Stop then Exit;
  if length(AData)= sizeof(TLadoga)+sizeof(int64) then
  begin
    move(AData[0],miniWSLLadogaCounter,sizeof(int64));
    if miniWSLLadogaCounter=WSLLadogaCounter then exit;
    WSLLadogaCounter:=miniWSLLadogaCounter;
    move(AData[0+SizeOf(int64)],TempLad,SizeOF(TLadoga));
    if HOST_TP=1 then
    begin
      hLadogaAnaliz.LAD_BY_WSL:=TempLad.Central;
      cs_Ladoga.Enter;
      try
        Ladoga[2]:=TempLad;
      finally
        cs_Ladoga.Leave;
      end;
    end;
  end;
end;

procedure TNMain.PCChange(Sender: TObject);
begin
  if PC.ActivePageIndex=3 then
  begin
    fl_NP:=true;
    TypeNP:=155;
  end else
  begin
    fl_NP:=false;
    TypeNP:=0;
  end;
  Garland;
end;

function TNMain.PlayFilterGraph(FileName: string):boolean;
var hr:Hresult;
    SourceFile:IBaseFilter;
    RefClock:IReferenceClock;
    i:integer;
    ffd:IBaseFilter;
    lPinList: TPinList;
    pms:^Tmass;
begin
if HOST_TP=1 then
begin
  Result:=false;
  Panel1.Visible:=true;
  FilterGraph1.Stop;
    if Assigned(CaptureFilter) then begin
    lPinList:= TPinList.Create(CaptureFilter);
    for i := 0 to lPinList.Count - 1 do
      lPinList[i].Disconnect;
    end;
  CaptureFilter:=nil;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active:=true;
  hr := CoCreateInstance(CLSID_Render_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, ExternalRenderV);
  if FAILED(hr) then begin
    Application.MessageBox('Video board "DeckLink Intensity Pro" not detected.','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(ExternalRenderV, 'ExternalRenderV');
  if FAILED(hr) then begin
    Application.MessageBox('Error connect ExternalRenderV','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_Render_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, ExternalRenderA);
  if FAILED(hr) then begin
    Application.MessageBox('Audio board "DeckLink Intensity Pro" not detected.','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(ExternalRenderA, 'ExternalRenderA');
  if FAILED(hr) then begin
    Application.MessageBox('Error connect ExternalRenderA','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  Panel2.Caption:='Training mode';
  fl_Training:=true;
  hr:=(FilterGraph1 as IGraphBuilder).AddSourceFilter(StringToOleStr(FileName), '', SourceFile);
  if FAILED(hr) then begin
    Application.MessageBox('Error load SourceFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
    Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, ffd);
  if FAILED(hr) then begin
    Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(ffd, 'VideoFilter');
  if FAILED(hr) then begin
    Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(CSC1, 'CSC1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(SmartTee, 'SmartTee');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(SmartTee2, 'SmartTee2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoDecoder1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(VideoDecoder1, 'VideoDecoder1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoDecoder2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(VideoDecoder2, 'VideoDecoder2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
 hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(VideoWindow1, 'VideoRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil, SourceFile as IBaseFilter,nil, SmartTee as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $12','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
    hr:=(FilterGraph1 as ICaptureGraphBuilder2).RenderStream(nil, @MEDIATYPE_Audio,  SourceFile as IBaseFilter,nil,SmartTee2 as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $6','Error audio system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  SmartTee as IBaseFilter,VideoDecoder1 as IBaseFilter, VideoFilter as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter,VideoWindow1 as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $3','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  SmartTee as IBaseFilter,VideoDecoder2 as IBaseFilter,ffd as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $4','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  ffd as IBaseFilter,nil,ExternalRenderV as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $5','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGraph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  SmartTee2 as IBaseFilter, nil, SoundRender as iBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $7','Error audio system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGraph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  SmartTee2 as IBaseFilter, nil, ExternalRenderA as iBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $8','Error audio system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(SoundRender as IMediaFilter).GetSyncSource(RefClock);
  hr:=(FilterGraph1 as IMediaFilter).SetSyncSource(RefClock);
  (FilterGraph1 as IFilterGraph).SetDefaultSyncSource;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow1 as IVideoWindow do
  begin
    put_Owner(Panel1.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(-10,0,1536,1152);
    put_Visible(true);
    put_MessageDrain(Panel1.Handle);
  end;
  if HOST_TP=1 then
  begin
   //добавить команду на переключение коммутатора для микшера-генератора
    New(pms);
    pms^[1]:=30;
    pms^[2]:=0;
    pms^[3]:=Command_EM7401[8].cComandCount;
    pms^[4]:=8;
    pms^[5]:=0;
    pms^[6]:=0;
    pms^[7]:=ComDev[30].cAdress;
    pms^[8]:=Command_EM7401[8].cComandCount-2;
    pms^[9]:=Command_EM7401[8].cCommand;
    pms^[10]:=0 shl 4 + 8;
    pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
    //поставить в очередь на выполнение
    cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  end;
  result:=true;
end else
begin
  Result:=false;
  Panel1.Visible:=true;
  FilterGraph1.Stop;
  FilterGraph1.ClearGraph;
  FilterGRaph1.Active:=true;
  hr:=(FilterGraph1 as IGraphBuilder).AddSourceFilter(StringToOleStr(FileName), '', SourceFile);
  if FAILED(hr) then begin
    Application.MessageBox('Error load SourceFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
    Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(CSC1, 'CSC1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VideoDecoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoDecoder1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGraph1 as IGraphBuilder).AddFilter(VideoDecoder1, 'VideoDecoder1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoDecoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(VideoWindow1, 'VideoRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil, SourceFile as IBaseFilter,VideoDecoder1 as IBaseFilter, VideoFilter as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $13','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  hr:=(FilterGRaph1 as ICaptureGraphBuilder2).RenderStream(nil, nil,  VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter,VideoWindow1 as IBaseFilter);
  if FAILED(hr) then begin
    Application.MessageBox('Error create FilterGraph $2','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Panel1.Visible:=false;
    exit;
  end;
  (FilterGraph1 as ICaptureGraphBuilder2).RenderStream(nil, @MEDIATYPE_Audio, SourceFile as IBaseFilter,nil,SoundRender as IBaseFilter);
  hr:=(SoundRender as IMediaFilter).GetSyncSource(RefClock);
  hr:=(FilterGraph1 as IMediaFilter).SetSyncSource(RefClock);
  (FilterGraph1 as IFilterGraph).SetDefaultSyncSource;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow1 as IVideoWindow do
  begin
    put_Owner(Panel1.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(-10,0,1536,1152);
    put_Visible(true);
    put_MessageDrain(Panel1.Handle);
  end;
  result:=true;
end;
end;

procedure TNMain.StartFilterGraph;
var i:integer;
    hr:HResult;
    lPinList:TPinList;
begin
  if fl_Training then begin Panel1.Visible:=false; exit;  end;
  FilterGraph1.Stop;
  Panel1.Visible:=true;
  FilterGraph1.ClearGraph;
  FilterGraph1.Active:=true;
  ExternalRenderV:=nil;
  ExternalRenderA:=nil;
  CaptureFilter:=nil;
  TimeStampFilter:=nil;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr := CoCreateInstance(CLSID_Capture_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Video board "DeckLink Intensity Pro" not detected.','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CaptureFilter, 'CaptureVideo');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CaptureVideo','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_Capture_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, AudioFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Audio board "DeckLink Intensity Pro" not detected.','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(AudioFilter, 'CaptureAudio');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CaptureAudio','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
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
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CSC1, 'CSC1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC1','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr:=GraphBuilder.AddFilter(VideoWindow1, 'VideoRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_SystemClock, nil, CLSCTX_INPROC, IID_IReferenceClock, RefClock);
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(nil, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,CSC1 as IBaseFilter);
    if FAILED(hr) then begin
    //olikke - здесь ошибка при выходе из режима тренировки
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      Panel1.Visible:=false;
      exit;
    end;
    hr:=RenderStream(nil, nil, CSC1 as IBaseFilter,SampleGrabber as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      Panel1.Visible:=false;
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      Panel1.Visible:=false;
      exit;
    end;
  end;
  CheckDSError((SoundRender as IMediaFilter).GetSyncSource(RefClock));
  CheckDSError((FilterGraph1 as IMediaFilter).SetSyncSource(RefClock));
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow1 as IVideoWindow do
  begin
    put_Owner(Panel1.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(-10,0,1536,1152);
    put_Visible(true);
    put_MessageDrain(Panel1.Handle);
  end;
  FilterGraph1.Play;
end;

procedure TNMain.TelemTTimer(Sender: TObject);
begin
  if (HOST_TP<>1) and (HOST_TP<>2) then
  begin
    TelemT.Enabled:=false;
    exit;
  end;
  if HOST_TP=1 then
  begin
    {cs_ArrDevice[40].Enter;
    try   TTel(ArrDevice[40]).TimeSt:=0;
    finally cs_ArrDevice[40].Leave; end; }
  end;
  if HOST_TP=2 then
  begin
   { cs_ArrDevice[41].Enter;
    try  LeftTel.tg:=0;
    finally cs_ArrDevice[41].Leave; end; }
  end;
end;

procedure TNMain.TextTimerTimer(Sender: TObject);
begin
  TextTimer.Enabled:=false;
  fl_ChangeOfMode:=false;
end;

procedure TNMain.trClick(Sender: TObject);
begin
  if tr.Caption='On' then
  begin
    tr.Caption:='Off';
    with Tim.Canvas do
    begin
      Brush.Color:=clSkyBlue;
      FillRect(Tim.ClientRect);
    end;
    Button8.Visible:=true;
    Button7.Visible:=true;
  end else
  begin
    tr.Caption:='On';
    with Tim.Canvas do
    begin
      Brush.Color:=clBtnFace;
      FillRect(Tim.ClientRect);
    end;
    Button7.Visible:=false;
    Button8.Visible:=false;
    if HOST_TP=1 then fl_Training:=false;
    if HOST_TP=1 then StartFilterGRaph;
  end;
end;

procedure TNMain.TS1Show(Sender: TObject);
begin
 // VideoWindow1.Visible:=true;
end;

procedure TNMain.PlayStart(LF:string);
begin
  if Host_TP<>1 then exit;
  Button7.Caption:='Stop training';
  Button8.Enabled:=false;
  Shape10.Brush.Color:=clRed;
  Shape11.Brush.Color:=clRed;
  Shape12.Brush.Color:=clRed;
  Panel37.Visible:=true;
  Label48.Caption:='State of video';
  if UDPCommandServer.Active then
  UDPCommandServer.Send(IP_BroadCast,UDPCommandServer.DefaultPort,LF);
  AnswerWaitTimer.Interval:=2000;
  AnswerWaitTimer.Tag:=555;
  AnswerWaitTimer.Enabled:=true;
end;

procedure TNMain.UDPCommandServerUDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
  var NumBort:cardinal;
      Writing:byte;
      Command:byte;
      str:String;
      Signaled:cardinal;
      i,k:integer;
      BData:TBytes;
      TimeStamp,TimeStamp2:int64;
      CountOfCommand:byte;
      ft:TStringList;
      sr: TSearchRec;
begin
  if fl_Stop then exit;
 if (HOST_TP=1) and (button8.Visible=false) then exit;
  CountOfCommand:=Length(AData);
  if CountOfCommand>8 then //имя файла для воспроизведения
  begin
    SetLength(str,CountOfCommand);
    Move(AData[0],str[1],CountOfCommand);
    if pos('c.avi',str)<>0 then

    Delete(Str,Pos('avi',Str)-2,5);
    case HOST_TP of
    1:Str:=Str+'c.avi';
    2:Str:=Str+'l.avi';
    3:Str:=Str+'r.avi';
    4:Str:=Str+'l.avi';
    end;
    if fl_Record then exit;
    fl_Record:=true;
    case HOST_TP of
         1:str:='D:\TrainingRecord_WSC\'+str;
         2:str:='D:\TrainingRecord_WSL\'+str;
         3:str:='D:\TrainingRecord_WSR\'+str;
         4:str:='D:\TrainingRecord_WSL\'+str;
         end;
    if not PlayFilterGraph(str) then
    begin
        StartFilterGraph;
        exit;
    end;
    //сообщение о полной готовности
    with ABinding do
    try SendTo(PeerIP,Port,ToBytes(HOST_TP));except end;
    exit;
  end;
  case CountOfCommand of
  1://приём сообщения от УВЗ о начале/конце записи
    begin
      Command:=AData[0];
      if Command=1 then
      begin
        fl_VRD:=1;
        RadioButton2.Checked:=true;
        vrim.Canvas.Brush.Color:=clLime;
        vrim.Canvas.FillRect(VRIM.ClientRect);
      end;
      if Command=0 then
      begin
        fl_VRD:=0;
        RadioButton1.Checked:=true;
        vrim.Canvas.Brush.Color:=clBtnFace;
        vrim.Canvas.FillRect(VRIM.ClientRect);
      end;
    end;
  2://приём сообщений от операторов о готовности графов (в т.ч. и своего)
    begin
      Command:=AData[0];
      case Command of
      1: begin TranReady[1]:=1;  Shape11.Brush.Color:=clLime; end;
      2: begin TranReady[2]:=1;  Shape10.Brush.Color:=clLime; end;
      3: begin TranReady[3]:=1;  Shape12.Brush.Color:=clLime; end;
      4: begin TranReady[2]:=1;  Shape10.Brush.Color:=clLime; end;
      end;
      Command:=TranReady[1]+TranReady[2]+TranReady[3];
      if Command=3 then
       begin
         TimeStamp:=$100000000+(DateTimeToTimeStamp(Now)).Time+1000;
         try UDPCOmmandServer.SendBuffer(IP_BroadCast,UDPCommandServer.DefaultPort,ToBytes(TimeStamp)) except end;
       end;
     end;

  4:  //приём комманд от центрального
    begin
     if (ABinding.PeerIP<>IP_SrvWSC1) and (ABinding.PeerIP<>IP_SrvWSC2) then exit;
     //подготовка графа к записи
       begin
         if fl_Record then exit;
         if AData[0]<>18 then exit;
         fl_Record:=true;
         //синхро
        // WinExec(PChar('net time \\'+ABinding.PeerIP+' /set /yes'),SW_HIDE);
         //создание активной директории заранее
         case HOST_TP of
         1:str:='_WSC';
         2:str:='_WSL';
         3:str:='_WSR';
         4:str:='_WSL'
         end;
         TranDir:= 'D:\TrainingRecord'+str;
         if not DirectoryExists(TranDir) then CreateDir(TranDir);
         TranDir:= 'D:\TrainingRecord'+str+'\'+FormatDateTime('dd_mm_yy',now);
         if not DirectoryExists(TranDir) then CreateDir(TranDir);
         //имя файла
         NumBort := AData[3] SHL 8 + AData[2];
         Aircraft:=AData[1];
         Str:=IntToStr(Aircraft);
        // if (Aircraft>=0) and (Aircraft<Length(LaSet)) then Str:=LASet[Aircraft].Name else Str:='UnknownType';
         TranName:=(TranDir+'\'+IntToStr(NumBort)+'_'+FormatDateTime('hhnnss',now)+'_'+str);
         case HOST_TP of
         1:Str:='_tc';
         2:Str:='_tl';
         3:Str:='_tr';
         4:Str:='_tl';
         end;
         TranName:=TranName+str+'.avi';
         //подготовка графа
         if not GraphPrepare then
         begin
           StartFilterGraph;
           exit;
         end;
         //сообщение о полной готовности
         with ABinding do
         try SendTo(PeerIP,Port,ToBytes(HOST_TP));except end;
       end;
    end;

    8: begin //приём комманд от центрального с TimeStamp
         case AData[4] of
         0:  //StopRecord/Play
           begin
             if not fl_Record then exit;
             {TimeStamp:=(AData[3] shl 24)+ AData[2] shl 16 + AData[1] shl 8 + AData[0];
             TimeStamp2:=((DateTimeToTimeStamp(Now)).Time);
             Signaled:=WaitForSingleObject(NeverUse,TimeStamp-TimeStamp2);
             if Signaled<>WAIT_OBJECT_0 then}
             begin
               FilterGraph1.Stop;
               fl_Record:=false;
               fl_Training:=false;
               if (HOST_TP=1) and fl_Training then Button7Click(self) else StartFilterGraph;
               if HOST_TP=1 then
               begin
                 TranReady[1]:=0;
                 TranReady[2]:=0;
                 TranReady[3]:=0;
               end;
             end;
           end;
         1:  //StartRecord/Play
           begin
             {TimeStamp:=(AData[3] shl 24)+ AData[2] shl 16 + AData[1] shl 8 + AData[0];
             TimeStamp2:=((DateTimeToTimeStamp(Now)).Time);
             Signaled:=WaitForSingleObject(NeverUse,TimeStamp-TimeStamp2);
             if Signaled<>WAIT_OBJECT_0 then  }
             FilterGraph1.Play;
           end;
         end;
       end;
    end

end;

function TNMain.GraphPrepare:boolean;
var hr:HResult;
    i:integer;
    nm:IMediaSample;
begin
  if fl_Training then begin Panel1.Visible:=false; exit;  end;
  Result:=false;
  FilterGraph1.Stop;
  ExternalRenderV:=nil;
  ExternalRenderA:=nil;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := true;
  GraphBuilder := (FilterGraph1 as IGraphBuilder);
  hr := CoCreateInstance(CLSID_Capture_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Video board "DeckLink Intensity Pro" not detected.','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CaptureFilter, 'CaptureVideo');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CaptureVideo','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_Capture_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, AudioFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Audio board "DeckLink Intensity Pro" not detected.','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(AudioFilter, 'CaptureAudio');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CaptureAudio','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowVideoEncoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(VideoEncoder, 'VideoEncoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_AVIDecompressor, nil, CLSCTX_INPROC, IID_IBaseFilter, AVIDecompressor);
  if FAILED(hr) then begin
     Application.MessageBox('Error load AVIDecompressor','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=GraphBuilder.AddFilter(AVIDecompressor, 'AVI Decompressor');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect AVIDecompressor','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=GraphBuilder.AddFilter(CSC1, 'CSC1');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
 hr := CoCreateInstance(CLSID_VR, nil, CLSCTX_INPROC_Server, IID_IBaseFilter, VideoWindow1);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  hr:=(FilterGRaph1 as IGraphBuilder).AddFilter(VideoWindow1, 'VideoRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     Panel1.Visible:=false;
     exit;
  end;
  FilterGraph1.QueryInterface(IID_ICaptureGraphBuilder2, CaptureGraphBuilder2);
  with FilterGraph1 as ICaptureGraphBuilder2 do
  begin
    hr:=SetOutputFileName(MEDIASUBTYPE_Avi, PWideChar(TranName), multiplexer, Writer);
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,CSC1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $14','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(@PIN_CATEGORY_Capture, nil, CaptureFilter as IBaseFilter,VideoEncoder as IBaseFilter,multiplexer);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil,CSC1 as IBaseFilter,SampleGrabber as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $3','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(@PIN_CATEGORY_Preview, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $4','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(@PIN_CATEGORY_Capture, @MEDIATYPE_Audio, AudioFilter as IBaseFilter, nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
  end;
  SampleGrabber.QueryInterface(IID_ISampleGrabber,ISampleGrabb);
  ISampleGrabb.GetConnectedMediaType(MediaType);
  pvi:=MediaType.pbFormat;
  BWidth:=pvi.bmiHeader.biWidth;
  BHeight:=pvi.bmiHeader.biHeight;
  MBitCount:=pvi.bmiHeader.biBitCount;
  with  VideoWindow1 as IVideoWindow do
  begin
    put_Owner(Panel1.Handle);
    put_WindowStyle(WS_CHILD);
    SetWindowPosition(-10,0,1536,1152);
    put_Visible(true);
    put_MessageDrain(Panel1.Handle);
  end;
  Result:=true;
end;

procedure TNMain.UDPServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var
     m,n:integer;
     RGBGrey:byte;
     HOST_SEND:word;
     sizeEsc:integer;
     stNow:int64;
     tempsize:word;
begin
  if fl_Stop then exit;
  if (Host_TP=1) or (Host_TP=4) then
  begin
    HOST_SEND:=0;
    if (ABinding.PeerIP=IP_SrvWSR1) or (ABinding.PeerIP=IP_SrvWSR2) then HOST_SEND:=3;
    if (ABinding.PeerIP=IP_SrvWSL1) or (ABinding.PeerIP=IP_SrvWSL2) then HOST_SEND:=2;
    if HOST_SEND=0 then exit;
    SizeEsc:=SizeOf(EscortResult[HOST_SEND]);
    FillChar(EscortResult[HOST_SEND],SizeEsc,0);
    Move(AData[0],EscortResult[HOST_SEND],SizeEsc);
    if UDPSendCounter[HOST_SEND]=EscortResult[HOST_SEND].SetNumber then exit;
    UDPSendCounter[HOST_SEND]:=EscortResult[HOST_SEND].SetNumber;
    tempsize:=EscortResult[HOST_SEND].BmpSize;
    SOPR1.Canvas.Lock;
    for m:=0 to tempsize-1 do
    for n:=0 to tempsize-1 do
    begin
        RGBGrey:=EscortResult[HOST_SEND].bmp[m,n];
        SOPR1.Canvas.Pixels[m,n]:=RGB(RGBGrey,RGBGrey,RGBGrey);
    end;
    SOPR1.Canvas.Unlock;
    if RadioGroup1.ItemIndex=0 then
    if ResCh=1 then
    if TResistor(ArrDevice[45]).NomLa<>AirNumb then
    begin
      AirNumb:=TResistor(ArrDevice[45]).NomLa;
      Edit1.Text:=IntToStr(AirNumb);
    end;
    case EscortResult[HOST_SEND].Host of
      2: begin
           SOPR1.Canvas.Lock;
           Image1.Canvas.Lock;
           Image1.Canvas.CopyRect(Image1.ClientRect,SOPR1.Canvas,Rect(0,0,tempsize-1,tempsize-1));
           Image1.Canvas.Unlock;
           SOPR1.Canvas.Unlock;
           cs_ArrDevice[39].Enter;
           try TLuna(ArrDevice[39]).Work:=EscortResult[HOST_SEND].Luna[1];
               TLuna(ArrDevice[39]).AlphaST:=EscortResult[HOST_SEND].Luna[2]*Rcl;
               TLuna(ArrDevice[39]).AlphaGL:=EscortResult[HOST_SEND].Luna[3]*Rcl;
               TLuna(ArrDevice[39]).ErrorST:=EscortResult[HOST_SEND].Luna[4]*Rcl;
               TLuna(ArrDevice[39]).PsiShip:=EscortResult[HOST_SEND].Luna[5]*Rcl;
               TLuna(ArrDevice[39]).Betta:=EscortResult[HOST_SEND].Luna[6]*Rcl;
               TLuna(ArrDevice[39]).ErrorB:=EscortResult[HOST_SEND].Luna[7]*Rcl;
               TLuna(ArrDevice[39]).TimeSt:=EscortResult[HOST_SEND].Luna[8];
           finally cs_ArrDevice[39].Leave; end;
           cs_ArrDevice[46].Enter;
           try TResistor(ArrDevice[46]).Accomp:=(EscortResult[HOST_SEND].Rez[1] and $200) shr 9;
               TResistor(ArrDevice[46]).NPrlk:=(EscortResult[HOST_SEND].Rez[1] and $1800) shr 11;
               TResistor(ArrDevice[46]).LandPoint:=(EscortResult[HOST_SEND].Rez[1] and $E000) shr 13;
               TResistor(ArrDevice[46]).NomLa:=EscortResult[HOST_SEND].Rez[2] and $1FFF;
               TResistor(ArrDevice[46]).Distanse:=EscortResult[HOST_SEND].Rez[3];
               TResistor(ArrDevice[46]).Corse:=EscortResult[HOST_SEND].Rez[4]*Rcl/2;
               TResistor(ArrDevice[46]).Altitude:=EscortResult[HOST_SEND].Rez[5]*Rcl/2;
               TResistor(ArrDevice[46]).SpeedLA:=EscortResult[HOST_SEND].Rez[6]*Rcs;
               TResistor(ArrDevice[46]).SpeedVr:=EscortResult[HOST_SEND].Rez[7]*Rcs;
               TResistor(ArrDevice[46]).Glissad:=EscortResult[HOST_SEND].Rez[8]*Rcl/2;
               TResistor(ArrDevice[46]).TimeSt:=EscortResult[HOST_SEND].Rez[9];
               if RadioGroup1.ItemIndex=0 then
               if ResCh=2 then
               if TResistor(ArrDevice[46]).NomLa<>AirNumb then
               begin
                 AirNumb:=TResistor(ArrDevice[46]).NomLa;
                 Edit1.Text:=IntToStr(AirNumb);
               end;
           finally cs_ArrDevice[46].Leave; end;
          { cs_ArrDevice[41].Enter;
           try  TTel(ArrDevice[41]).DT:=EscortResult[HOST_SEND].Tel.tr;
                TTel(ArrDevice[41]).TimeSt:=EscortResult[HOST_SEND].Tel.tg;
           finally cs_ArrDevice[41].Leave;  end;     }
           MP[2]:=EscortResult[HOST_SEND].Mouse;
           cs_ArrDevice[2].Enter;
           try TARM(ArrDevice[2]).HDDCount:=EscortResult[HOST_SEND].SMS.HDDCount;
             TARM(ArrDevice[2]).LanCount  :=EscortResult[HOST_SEND].SMS.LanCount;
             TARM(ArrDevice[2]).HDD       :=EscortResult[HOST_SEND].SMS.HDDEnum;
             TARM(ArrDevice[2]).Lan       :=EscortResult[HOST_SEND].SMS.LanEnum;
             TARM(ArrDevice[2]).aType     :=EscortResult[HOST_SEND].SMS.HOST;
             TARM(ArrDevice[2]).SyncTime  :=now;
             TARM(ArrDevice[2]).VideoTDV  :=EscortResult[HOST_SEND].SMS.Video;
           finally cs_ArrDevice[2].Leave; end;
         end;
      3: begin
           SOPR1.Canvas.Lock;
           Image2.Canvas.Lock;
           Image2.Canvas.CopyRect(Image2.ClientRect,SOPR1.Canvas,Rect(0,0,tempsize-1,tempsize-1));
           Image2.Canvas.Unlock;
           SOPR1.Canvas.Unlock;
           MP[3]:=EscortResult[HOST_SEND].Mouse;
           cs_ArrDevice[3].Enter;
           try TARM(ArrDevice[3]).HDDCount:=EscortResult[HOST_SEND].SMS.HDDCount;
             TARM(ArrDevice[3]).LanCount  :=EscortResult[HOST_SEND].SMS.LanCount;
             TARM(ArrDevice[3]).HDD       :=EscortResult[HOST_SEND].SMS.HDDEnum;
             TARM(ArrDevice[3]).Lan       :=EscortResult[HOST_SEND].SMS.LanEnum;
             TARM(ArrDevice[3]).aType     :=EscortResult[HOST_SEND].SMS.HOST;
             TARM(ArrDevice[3]).SyncTime  :=now;
             TARM(ArrDevice[3]).VideoTDV  :=EscortResult[HOST_SEND].SMS.Video;
           finally cs_ArrDevice[3].Leave; end;
         end;
    end;
    with ABinding do
    try SendTo(PeerIP,PeerPort,ToBytes(EscortMode));except ShowMessage('SendExcept'); end;
  end;
end;

procedure TNMain.VideoWindow1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Assigned(hAlgorithm) then
  begin
    hAlgorithm.Terminate;
    hAlgorithm:=nil;
  end;
  cs_Auto.Enter; try ViX:=Round(x/1536*720); ViY:=y div 2; finally cs_Auto.Leave; end;
  if (fl_IndependentEscort) or ((Host_TP=1) or (Host_TP=4)) then
  begin
    if Button = mbLeft  then AutoSopr:=1;
    if Button = mbRight then AutoSopr:=2;
    if AlgNum=0 then AlgNum:=1;
    Point_Brush;
    SendEscortMode;
  end;
  if not Assigned(hAlgorithm) then
  begin
    hAlgorithm:=TAlgorithm.Create(True);
    hAlgorithm.Priority:=tpLowest;
    hAlgorithm.FreeOnTerminate:=False;
    hAlgorithm.Resume;
    EventAlgorithm.resetEvent;
  end;
  VideoCount:=0;
end;

procedure TNMain.VideoWindow1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FilterGraph1.Active=false then  exit;
  if AutoSopr=2 then
  begin
    cs_Auto.Enter; try ViX:=Round(x/1536*720); ViY:=y div 2; finally cs_Auto.Leave; end;
  end;
end;

function TNMain.iSetVideoFormat(FramesPerSecond,FrameWidth,FrameHeight,viGde: Integer):Integer;
var
  iamStrConf: IAMStreamConfig;
  pmt: PAMMediaType;
  hr: HRESULT;
begin
  iamStrConf := nil;
  pmt := nil;
  hr:=1;
  try
    if(viGde = 0) then
      hr := (FilterGraph1 as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_CAPTURE, @MEDIATYPE_Video, CaptureFilter as IBaseFilter, IID_IAMStreamConfig, iamStrConf)
    else
      if(viGde = 1) then
        hr := (FilterGraph1 as ICaptureGraphBuilder2).FindInterface(@PIN_CATEGORY_PREVIEW, @MEDIATYPE_Video, CaptureFilter as IBaseFilter, IID_IAMStreamConfig, iamStrConf);

    if (hr <> s_ok) then
    begin
      Result:=1; Exit;
    end;
    if (not Assigned(iamStrConf)) then
    begin
      iamStrConf:=nil;
      Result:=1;
      Exit;
    end;
    iamStrConf.GetFormat(pmt);
    if not Assigned(pmt) then
    begin
      iamStrConf:=nil;
      Result:=1;
      Exit;
    end;
    if pmt.cbFormat <> sizeOf(TVideoInfoHeader) then
    begin
      iamStrConf := nil;
      Result:=1;
      DeleteMediaType(pmt);
      Exit;
    end;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biWidth := FrameWidth;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biHeight := FrameHeight;
    PVideoInfoHeader(pmt^.pbFormat)^.bmiHeader.biBitCount:= 16;
    PVIDEOINFOHEADER(pmt^.pbFormat)^.AvgTimePerFrame := 10000000 div framesPerSecond;
    with PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader do
      pmt^.lSampleSize := ((biWidth + 3) and (not (3))) * biHeight * biBitCount shr 3;
            PVIDEOINFOHEADER(pmt^.pbFormat)^.bmiHeader.biSizeImage := pmt^.lSampleSize;
    hr := iamStrConf.SetFormat(pmt^);
    if(hr <> s_ok) then
    begin
      Result:=1;
      iamStrConf := nil;
      if Assigned(pmt) then DeleteMediaType(pmt);
      Exit;
    end;
    Result := 0;
  except on E : Exception do
    begin
      Result:=1;
    end;
  end;
  iamStrConf := nil;
  if Assigned(pmt) then DeleteMediaType(pmt);
end;

procedure TNMain.AnswerWaitTimerTimer(Sender: TObject);
begin
  AnswerWaitTimer.Enabled:=false;
  case AnswerWaitTimer.Tag of
    555: //синхронное воспроизведение/запись стереопары
      begin
        if TranReady[1]+TranReady[2]+TranReady[3]=3 then exit;
        FillChar(TranReady,SizeOf(TranReady),0);
        if Button7.Enabled then
        Button7.Click
        else Button8.Click;
      end;
    333: //включение/выключение УВЗ
      case fl_VRD of
        0: RadioButton1.Checked:=true;
        1: RadioButton2.Checked:=true;
      end;
  end;
end;

procedure TNMain.ArmState;
var count:integer;
    FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    LAN_1,LAN_2,LAN_3,LAN_4,LAN_5,LAN_6,LAN_7:boolean;
    i:integer;
begin
  if fl_Stop then exit;
  LAN_1:=hPing.LAN_1;
  LAN_2:=hPing.LAN_2;
  LAN_3:=hPing.LAN_3;
  LAN_4:=hPing.LAN_4;
  LAN_5:=hPing.LAN_5;
  LAN_6:=hPing.LAN_6;
  LAN_7:=hPing.LAN_7;  
  // обновление информации о состоянии жёстких дисков
  for count:= 1 to HDDCount do
  begin
     GetDiskFreeSpaceEx(PChar(HDDEnum[Count].HDD_NAME+':\'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
      HDDEnum[Count].TotalSpace:=TotalSize/1024/1024;//в метрах
      HDDEnum[Count].FreeSpace:=FreeSize/1024/1024;
  end;
  //обновление информации о состоянии своей сети
  begin
    LanEnum[1].State:=LAN_1;
    LanEnum[2].State:=LAN_2;
  end;
  if HOST_TP=1 then
  begin
    DEVICE_ID:=1;
    cs_ArrDevice[DEVICE_ID].Enter;
    try TARM(ArrDevice[DEVICE_ID]).HDDCount:=HDDCount;
        TARM(ArrDevice[DEVICE_ID]).HDD     :=HDDEnum;
        TARM(ArrDevice[DEVICE_ID]).LanCount:=LanCount;
        TARM(ArrDevice[DEVICE_ID]).LAN     :=LANEnum;
        TARM(ArrDevice[DEVICE_ID]).aType   :=HOST_TP;
        TARM(ArrDevice[DEVICE_ID]).SyncTime:=now;
        TARM(ArrDevice[DEVICE_ID]).VideoTDV:=fl_VideoEsc;
    finally cs_ArrDevice[DEVICE_ID].Leave;  end;
    fl_VideoEsc:=false;
    if fm_ARM <> nil then if fm_ARM.Visible then
      PostMessage(Fm_ARM.Handle,WM_NOTIFY_MSA,DEVICE_ID,0);
    cs_ArrDevice[12].Enter;
    try if LAN_5 then TEM2409(ArrDevice[12]).DataExh:=1 else TEM2409(ArrDevice[12]).DataExh:=0;
    finally cs_ArrDevice[12].Leave;  end;
    cs_ArrStateDevice.Enter;
    try if LAN_5 then ArrStateDevice[11].ExhState:=1 else ArrStateDevice[11].ExhState:=0;
        if LAN_6 then ArrStateDevice[21].ExhState:=1 else ArrStateDevice[21].ExhState:=0;
        if LAN_7 then ArrStateDevice[20].ExhState:=1 else ArrStateDevice[20].ExhState:=0;
    finally cs_ArrStateDevice.Leave;   end;
    cs_ArrDevice[13].Enter;
    try if LAN_6 then TEM2409(ArrDevice[13]).DataExh:=1 else TEM2409(ArrDevice[13]).DataExh:=0;
    finally cs_ArrDevice[13].Leave;  end;
    for i in [17..19] do
    begin
      if (i=17) and (not LAN_1) then continue;
      if (i=18) and (not LAN_2) then continue;
      if (i=19) and (not LAN_1) then continue;
      if not hUPS[i].State then
      begin
        hUPS[i]:=nil;
        hUPS[i]:=TGetUPS.Create(True);
        hUPS[i].Priority:=tpLowest;
        hUPS[i].FreeOnTerminate:=True;
        hUPS[i].FEvent:=UPSEvent[i];
        case i of
         17: hUPS[i].IP:= IP_2411_1;
         18: hUPS[i].IP:= IP_2411_2;
         19: hUPS[i].IP:= IP_2411_3;
        end;
        hUPS[i].Device_ID:=i;
        hUPS[i].Resume;
      end;
      UPSEvent[i].SetEvent;
    end;
    exit;
  end;
   //проверка связи
  if ((not LAN_3) and (not LAN_4))
  or ((not LAN_1) and (not LAN_2))
  or ((not LAN_1) and (not LAN_4))
  or ((not LAN_2) and (not LAN_3)) then
  begin
    fl_CenralNoConnect:=true;
    fl_IndependentEscort:=true;
  end;
  
  if (HOST_TP=2) or (HOST_TP=3) then
  begin
    TempSMS.HOST:=HOST_TP;
    TempSMS.HDDCount:=HDDCount;
    TempSMS.HDDEnum:=HDDEnum;
    TempSMS.LanCount:=LanCount;
    TempSMS.LanEnum:=LanEnum;
    TempSMS.Video:=fl_VideoEsc;
    if fl_Synchro then
    begin
      fl_Synchro:=false;
      if (LAN_1) and (LAN_3) then WinExec(PChar('net time \\'+IP_SrvWSC1+' /set /yes'),SW_HIDE) else
      if (LAN_2) and (LAN_4) then WinExec(PChar('net time \\'+IP_SrvWSC2+' /set /yes'),SW_HIDE);
    end;
  end;
  fl_VideoEsc:=false;
end;

procedure TNMain.Button10Click(Sender: TObject);
begin
  Close;
end;

procedure TNMain.button1Click(Sender: TObject);
begin
sizebm_:=16;
end;

procedure TNMain.Buttont1Click(Sender: TObject);
begin
    if (not fl_IndependentEscort) then
    if ((Host_TP=2) or (Host_TP=3)) then exit;
    AlgNum:=1;
    Point_Brush;
    SendEscortMode;
end;

procedure TNMain.Button2Click(Sender: TObject);
begin
    if (not fl_IndependentEscort) then
    if ((Host_TP=2) or (Host_TP=3)) then exit;
    AlgNum:=2;
    Point_Brush;
    SendEscortMode;
end;

procedure TNMain.Button3Click(Sender: TObject);
begin
    if (not fl_IndependentEscort) then
    if ((Host_TP=2) or (Host_TP=3)) then exit;
    AlgNum:=3;
    Point_Brush;
    SendEscortMode;
end;

procedure TNMain.Button7Click(Sender: TObject);
var Command:cardinal;
    sr:TSearchRec;
    str:string;
begin
  if Button7.Caption='Start training' then
  begin
    Application.CreateForm(TLP,LP);
    LP.ShowModal;
  end else
  begin
    Button7.Caption:='Start training';
    Button8.Enabled:=true;
    Panel37.Visible:=false;
    StopRec;
  end;
end;

procedure TNMain.Button8Click(Sender: TObject);
begin
  if Button8.Caption='Start record' then
  begin
    Button8.Caption:='Stop record';
    Button7.Enabled:=false;
    Shape10.Brush.Color:=clRed;
    Shape11.Brush.Color:=clRed;
    Shape12.Brush.Color:=clRed;
    Panel37.Visible:=true;
    Label48.Caption:='State of record';
    StartRec;
  end else
  begin
    Button8.Caption:='Start record';
    Button7.Enabled:=true;
    Panel37.Visible:=false;
    StopRec;
  end;
end;

procedure TNMain.StartRec;
var Command:cardinal;
    b:byte;
    d:smallint;
begin
  if Host_TP<>1 then exit;
  b:=Aircraft;
  if Edit1.Text='' then Edit1.Text:='0';
  d:=StrToInt(Edit1.Text);
  Command:=(d shl 16) + (b shl 8) +18;
  if UDPCommandServer.Active then
  try UDPCOmmandServer.SendBuffer(IP_BroadCast,UDPCommandServer.DefaultPort,ToBytes(Command)) except ShowMEssage('Server No Active'); end;
  AnswerWaitTimer.Interval:=2000;
  AnswerWaitTimer.Tag:=555;
  AnswerWaitTimer.Enabled:=true;
end;

procedure TNMain.StopRec;
var Command:int64;
begin
  if Host_TP<>1 then exit;
  Command:=0;
  Command:=(DateTimeToTimeStamp(Now)).Time+500;
  if UDPCommandServer.Active then
  try UDPCOmmandServer.SendBuffer(IP_BroadCast,UDPCommandServer.DefaultPort,ToBytes(Command)) except end;
end;

procedure TNMain.FilterGraph1GraphComplete(sender: TObject; Result: HRESULT;
  Renderer: IBaseFilter);
var i:integer;
    str:String;
    hr:Hresult;
    lPinList: TPinList;
    pms:^Tmass;
begin
  fl_Record:=false;
  Button7.Caption:='Start training';
  if fl_Training then Button8.Enabled:=false else Button8.Enabled:=true;
  Panel37.Visible:=false;
  if HOST_TP=1 then
  begin
    TranReady[1]:=0;
    TranReady[2]:=0;
    TranReady[3]:=0;
  end;
  if HOST_TP=1 then
  begin
   //добавить команду на переключение коммутатора для микшера-генератора
    New(pms);
    pms^[1]:=30;
    pms^[2]:=0;
    pms^[3]:=Command_EM7401[8].cComandCount;
    pms^[4]:=8;
    pms^[5]:=0;
    pms^[6]:=0;
    pms^[7]:=ComDev[30].cAdress;
    pms^[8]:=Command_EM7401[8].cComandCount-2;
    pms^[9]:=Command_EM7401[8].cCommand;
    case Axial of
    8:  pms^[10]:=0 shl 4 + 0;
    10: pms^[10]:=0 shl 4 + 3;
    end;
    pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
    //поставить в очередь на выполнение
    cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  end;
  FilterGraph1.Stop;
  Panel1.Visible:=false;
  if (HOST_TP=1) and fl_Training then Button7.Click else StartFilterGraph;
end;

procedure TNMain.FormActivate(Sender: TObject);
var c,cv,i,j:integer;
    flag:boolean;
    CC:char;
    FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    IP_1,IP_2:String;
    SwithTable:String[16];
    CR:TCross;
    x1,x2,y1,y2:integer;
    Reg:TRegistry;
    Key:String;
    ol:integer;
    Query:string;
    MyINI:TINIFile;
    Section:string;
begin
  SysUtils.ShortDateFormat:='dd.mm.yyyy';
  if HOST_TP=1 then
  begin
    AirNumb:=StrToInt(Edit1.Text);
  end;
  with DM.FilterParam_F7 do
  begin
    ParamByName('Filter_ID').Value:=1;
    Open;
    RBL_1:=DM.FilterParam_F7RBL.Value;
    RWH_1:=DM.FilterParam_F7RWH.Value;
    Close;
    ParamByName('Filter_ID').Value:=2;
    Open;
    RBL_2:=DM.FilterParam_F7RBL.Value;
    RWH_2:=DM.FilterParam_F7RWH.Value;
    Close;
    ParamByName('Filter_ID').Value:=3;
    Open;
    RBL_3:=DM.FilterParam_F7RBL.Value;
    RWH_3:=DM.FilterParam_F7RWH.Value;
    Close;
    ParamByName('Filter_ID').Value:=4;
    Open;
    RBL_4:=DM.FilterParam_F7RBL.Value;
    RWH_4:=DM.FilterParam_F7RWH.Value;
    Close;
    ParamByName('Filter_ID').Value:=5;
    Open;
    RBL_5:=DM.FilterParam_F7RBL.Value;
    RWH_5:=DM.FilterParam_F7RWH.Value;
    Close;
  end;
  begin
    DM.MetricConst.Open;
    try Mile:=DM.MetricConstMile.AsFloat except Mile:=1852; end;
    try Foot:=DM.MetricConstFoot.AsFloat except Foot:=0.3048;   end;
    DM.MetricConst.Close;
  end;
  MyINI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) + '\Operators.ini');
  Section:='MeasuringMode';
  if MyINI.ReadBool(Section,'Distance',true)            then MK1:=1 else  MK1:=mile;
  if MyINI.ReadBool(Section,'HorizontalDeviation',true) then MK2:=1 else  MK2:=foot;
  if MyINI.ReadBool(Section,'VerticalDeviation',true)   then MK3:=1 else  MK3:=foot;
  if MyINI.ReadBool(Section,'ASPD',true)                then MK4:=1 else  MK4:=1000/mile;
  if MyINI.ReadBool(Section,'VSPD',true)                then MK5:=1 else  MK5:=1/(60*foot);
  if MyINI.ReadBool(Section,'SPD',true)                 then MK6:=1 else  MK6:=1000/mile;
  MyINI.Free;
  with DM.Miscellaneous do
  begin
    ParamByName('Parameter').Value:='SI';
    Open;
    SI:=DM.MiscellaneousValue.Value;
    Close;
    ParamByName('Parameter').Value:='ShowCHART';
    Open;
    vCHART:=DM.MiscellaneousValue.Value;
    Close;
    ParamByName('Parameter').Value:='ListProtocol';
    Open;
    fl_ListProtocol:=DM.MiscellaneousValue.Value;
    Close;
  end;
  if fl_ListProtocol then
  begin
    if not DirectoryExists('Protocol') then CreateDir('Protocol');
    List2404:=TStringList.Create;
    ListKU  :=TStringList.Create;
  end;
  begin
    DM.Distance.Open;
    try GlobalMaxDistance:=DM.DistanceMaxDistance.AsInteger except GlobalMaxDistance:=5000; end;
  //  if not SI then  GlobalMaxDistance:=GlobalMaxDistance/mile;
    try GlobalMinDistance:=DM.DistanceMinDistance.AsInteger except GlobalMinDistance:=500;  end;
 //   if not SI then  GlobalMinDistance:=GlobalMinDistance/mile;
    DM.Distance.Close;
  end;
  with DM.FilterParam_F8 do
  begin
    ParamByName('Filter_ID').Value:=1;
    Open;
    MaxP_1:=DM.FilterParam_F8Threshold.Value;
    Close;
    ParamByName('Filter_ID').Value:=2;
    Open;
    MaxP_2:=DM.FilterParam_F8Threshold.Value;
    Close;
    ParamByName('Filter_ID').Value:=3;
    Open;
    MaxP_3:=DM.FilterParam_F8Threshold.Value;
    Close;
    ParamByName('Filter_ID').Value:=4;
    Open;
    MaxP_4:=DM.FilterParam_F8Threshold.Value;
    Close;
    ParamByName('Filter_ID').Value:=5;
    Open;
    MaxP_5:=DM.FilterParam_F8Threshold.Value;
    Close;
  end;
  fl_Video:=false;
  fl_VideoEsc:=false;
  div_2:=sizebm shr 1;
  div_5:=sizebm div 5;
  div_8:=(sizebm*sizebm) shr 3;
  div_32:=(sizebm*sizebm) shr 5;
  begin
    DM.HostList.ParamByName('Device_ID').Value:=1;
    DM.HostList.Open;
    IP_SrvWSC1:=DM.HostListIP1.Value;
    IP_SrvWSC2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=2;
    DM.HostList.Open;
    IP_SrvWSL1:=DM.HostListIP1.Value;
    IP_SrvWSL2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=3;
    DM.HostList.Open;
    IP_SrvWSR1:=DM.HostListIP1.Value;
    IP_SrvWSR2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=16;
    DM.HostList.Open;
    IP_SrvVRD1:=DM.HostListIP1.Value;
    IP_SrvVRD2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=12;
    DM.HostList.Open;
    IP_2409_1:=DM.HostListIP1.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=13;
    DM.HostList.Open;
    IP_2409_2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=20;
    DM.HostList.Open;
    IP_Printer:=DM.HostListIP1.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=17;
    DM.HostList.Open;
    IP_2411_1:=DM.HostListIP1.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=18;
    DM.HostList.Open;
    IP_2411_2:=DM.HostListIP2.Value;
    DM.HostList.Close;
    DM.HostList.ParamByName('Device_ID').Value:=19;
    DM.HostList.Open;
    IP_2411_3:=DM.HostListIP1.Value;
    DM.HostList.Close;
  end;
  if HOST_TP=1 then
  begin
    //olikke!!!!!
    WSLServer1.Active:=true;
    WSLServer2.Active:=true;
    L101.Caption:=IP_SrvWSL1;
    L105.Caption:=IP_SrvWSL2;
    L102.Caption:=IP_SrvWSC1;
    L106.Caption:=IP_SrvWSC2;
    L103.Caption:=IP_SrvWSR1;
    L107.Caption:=IP_SrvWSR2;
    L104.Caption:=IP_SrvVRD1;
    L108.Caption:=IP_SrvVRD2;
    L109.Caption:=IP_Printer;
    L112.Caption:=IP_2409_1;
    L114.Caption:=IP_2409_2;
    L110.Caption:=IP_2411_1;
    L111.Caption:=IP_2411_3;
    L113.Caption:=IP_2411_2;
  end;
  WinExec(PChar('net time \\'+IP_SrvWSC1+' /set /yes'),SW_HIDE);
  EventWC1:=TEvent.Create(nil,false,false,'');
  EventWC2:=TEvent.Create(nil,false,false,'');
  if (Host_TP=2) or (Host_TP=3) then
  begin
    hWC1:=TWSC.Create(True);
    hWC1.Priority:=tpLowest;
    hWC1.FreeOnTerminate:=False;
    hWC1.IP_Srv:=IP_SrvWSC1;
    hWC1.Port:=4000;
    hWC1.WS:='111';
    hWC1.Resume;

    hWC2:=TWSC.Create(True);
    hWC2.Priority:=tpLowest;
    hWC2.FreeOnTerminate:=False;
    hWC2.IP_Srv:=IP_SrvWSC2;
    hWC2.Port:=4100;
    hWC2.WS:='222';
    hWC2.Resume;
  end else
  begin
    try UDPServer1.Active:=true;
    except  end;
    try UDPServer2.Active:=true;
    except   end;
  end;
  try UDPCommandServer.Active:=true;
   except end;
  EventWS1:=TEvent.Create(nil,false,false,'');
  EventWS2:=TEvent.Create(nil,false,false,'');
  if (Host_TP=1)  then  VRDServer.Active:=true;
  if HOST_TP=1 then
  begin
    with Image1.Canvas do
    begin
      Brush.Color:=clBlack;
      FillRect(Image1.ClientRect);
    end;
    with Image2.Canvas do
    begin
      Brush.Color:=clBlack;
      FillRect(Image2.ClientRect);
    end;
  end;
  with Image3.Canvas do
  begin
    Brush.Color:=clBlack;
    FillRect(Image3.ClientRect);
  end;
  FastIn:=TFastDib.Create;
  FastOut16:=TFastDib.Create;
  FastOut16.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\16_16.bmp');
  FastOut24:=TFastDib.Create;
  FastOut24.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\24_24.bmp');
  FastOut32:=TFastDib.Create;
  FastOut32.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\32_32.bmp');
  FastOut48:=TFastDib.Create;
  FastOut48.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\48_48.bmp');
  FastOut64:=TFastDib.Create;
  FastOut64.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\64_64.bmp');
  FastText:=TFastDib.Create;
  FastText.LoadFromFile(ExtractFilePath(ParamStr(0)) +'\Text.bmp');
  FastText.SetFont('Arial',-14);
  FastText.SetTextColor(clWhite);
  FastText.SetTransparent(true);
  FastText.SetBkColor(clBlack);
  cs_Auto   := TCriticalSection.Create;
  for i:= 1 to DevCount do
  cs_ArrDevice[i]:=TCriticalSection.Create;
  cs_ComState:=TCriticalSection.Create;
  cs_ArrStateDevice:=TCriticalSection.Create;
  id1  := GlobalAddAtom('id1'); RegisterHotKey(Handle,id1 ,0,vk_F2);     //Силует
  id2  := GlobalAddAtom('id2'); RegisterHotKey(Handle,id2 ,0,vk_F3);     //Фара
  id3  := GlobalAddAtom('id3'); RegisterHotKey(Handle,id3 ,0,vk_F4);     //Гак
  id4  := GlobalAddAtom('id4'); RegisterHotKey(Handle,id4 ,0,vk_Escape); //сброс сопровождения
  id5  := GlobalAddAtom('id5'); RegisterHotKey(Handle,id5 ,0,vk_F5);     //ку2
  id6  := GlobalAddAtom('id6'); RegisterHotKey(Handle,id6 ,0,vk_F6);     //ку3
  id7  := GlobalAddAtom('id7'); RegisterHotKey(Handle,id7 ,0,vk_F7);     //алгоритм иванова
  id8  := GlobalAddAtom('id8'); RegisterHotKey(Handle,id8 ,0,vk_F8);     //адаптивный порог
  id9  := GlobalAddAtom('id9'); RegisterHotKey(Handle,id9 ,0,vk_F9);     //режим камер 1
  id10 := GlobalAddAtom('id10'); RegisterHotKey(Handle,id10 ,0,vk_F10); //режим камер 2
  id11 := GlobalAddAtom('id11'); RegisterHotKey(Handle,id11 ,0,vk_F11); //режим камер 3
  id12 := GlobalAddAtom('id12'); RegisterHotKey(Handle,id12 ,mod_Control,ord('R'));     //дальность от радара
  id13 := GlobalAddAtom('id13'); RegisterHotKey(Handle,id13 ,mod_Control,ord('T'));     //дальность от ТВ камер
  id14 := GlobalAddAtom('id14'); RegisterHotKey(Handle,id14 ,mod_ALT,ord('1'));         //ПРЛК 1
  id15 := GlobalAddAtom('id15'); RegisterHotKey(Handle,id15 ,mod_ALT,ord('2'));         //ПРЛК 2
  id16 := GlobalAddAtom('id16'); RegisterHotKey(Handle,id16 ,mod_ALT,ord('3'));         //старт протокола
  id18 :=GlobalAddAtom ('id18'); RegisterHotKey(Handle,id18 ,MOD_ALT,vk_Up);     //увеличить угол глиссады на 1 минуту
  id19 :=GlobalAddAtom ('id19'); RegisterHotKey(Handle,id19 ,MOD_ALT,vk_Down);   //уменьшить угол глиссады на 1 минуту
  id20 :=GlobalAddAtom ('id20'); RegisterHotKey(Handle,id20 ,MOD_ALT,vk_Left);   //уменьшить угол Betta на 1 минуту
  id21 :=GlobalAddAtom ('id21'); RegisterHotKey(Handle,id21 ,MOD_ALT,vk_Right);  //увеличить угол Betta на 1 минуту
  id24 :=GlobalAddAtom ('id24'); RegisterHotKey(Handle,id24 ,MOD_ALT,ord('4'));  //режим компесации качки  по Луне
  id25 :=GlobalAddAtom ('id25'); RegisterHotKey(Handle,id25 ,MOD_ALT,ord('5'));  //режим компенсации качки по ПРЛК
  mUp  :=GlobalAddAtom ('idUp'); RegisterHotKey(Handle,mUp,0,vk_Up);
  mDown:=GlobalAddAtom ('idDw'); RegisterHotKey(Handle,mDown,0,vk_Down);
  mLeft:=GlobalAddAtom ('idLf'); RegisterHotKey(Handle,mLeft,0,vk_Left);
  mRight:=GlobalAddAtom('idRg'); RegisterHotKey(Handle,mRight,0,vk_Right);
  idsl:=GlobalAddAtom ('idsl'); RegisterHotKey(Handle,idsl,MOD_Control,vk_Left);
  idsr:=GlobalAddAtom ('idsr'); RegisterHotKey(Handle,idsr,MOD_Control,vk_Right);
  idsu:=GlobalAddAtom ('idsu'); RegisterHotKey(Handle,idsu,MOD_Control,vk_Up);
  idsd:=GlobalAddAtom ('idsd'); RegisterHotKey(Handle,idsd,MOD_Control,vk_Down);
  EventAlgorithm:=TEvent.Create(nil,false,false,'');
  hAlgorithm:=TAlgorithm.Create(True);
  hAlgorithm.Priority:=tpLowest;
  hAlgorithm.FreeOnTerminate:=False;
  hAlgorithm.Resume;
  SOPR:=TBitmap.Create;  SOPR.PixelFormat:=pf8bit;  SOPR.SetSize(64,64);
  SOPR1:=TBitmap.Create; SOPR1.PixelFormat:=pf8bit; SOPR1.SetSize(64,64);
  begin
    //изначально все устройства неопрошены
    for i:=1 to DevCount do
    begin
      ArrStateDevice[i].ResultState:=0;
      ArrStateDevice[i].TotalQuery:=0;
      ArrStateDevice[i].PositiveQuery:=0;
      ArrStateDevice[i].ExhState:=0;
    end;
    for i:=1 to DevCount do
    case i of
      1:   begin   ArrDevice[i]:=TARM.Create;       end;
      2:   begin   ArrDevice[i]:=TARM.Create;       TARM(ArrDevice[i]).DataExh:=1;  end;
      3:   begin   ArrDevice[i]:=TARM.Create;       end;
      7:   begin   ArrDevice[i]:=TKU.Create;   TKU(ArrDevice[i]).DataExh:=0;     end;
      8:   begin   ArrDevice[i]:=TKU.Create;   TKU(ArrDevice[i]).DataExh:=0;     end;
      9:   begin   ArrDevice[i]:=TKU.Create;   TKU(ArrDevice[i]).DataExh:=0;     end;
      10:  begin   ArrDevice[i]:=TKU.Create;   TKU(ArrDevice[i]).DataExh:=0;     end;
      11:  begin   ArrDevice[i]:=TEM5402.Create;    end;
      21:  begin   ArrDevice[i]:=TEM5402.Create;    end;
      12:  begin   ArrDevice[i]:=TEM2409.Create;    end;
      13:  begin   ArrDevice[i]:=TEM2409.Create;    end;
      14:  begin   ArrDevice[i]:=TEM2410.Create;    end;
      15:  begin   ArrDevice[i]:=TEM2410.Create;    end;
      16:  begin   ArrDevice[i]:=TARM.Create;       end;
      17:  begin   ArrDevice[i]:=TUPS.Create;  TUPS(ArrDevice[i]).State:=2;     end;
      18:  begin   ArrDevice[i]:=TUPS.Create;  TUPS(ArrDevice[i]).State:=2;     end;
      19:  begin   ArrDevice[i]:=TUPS.Create;  TUPS(ArrDevice[i]).State:=2;     end;
      23,24:
           begin
             ArrDevice[i]:=TEM5401.Create;
             with (ArrDevice[i] as TEM5401) do
             begin
               DM.EM5401Param.ParamByName('Device_ID').Value:=i;
               DM.EM5401Param.Open;
               SerNum:=DM.EM5401ParamSerial_Numb.Value;
               UPT1:=DM.EM5401ParamFTP1.Value;
               UPT2:=DM.EM5401ParamFTP2.Value;
              // IfBSync:=255;
              // IfBTst:=255;
               DataExh:=1;
               DM.EM5401Param.Close;
             end;
           end;
      25:  begin ArrDevice[i]:=TEM3401.Create;  end;
      26..29:
           begin
             ArrDevice[i]:=TEM2437.Create;
             with (ArrDevice[i] as TEM2437) do
             begin
               DM.EM2437Param.ParamByName('Device_ID').Value:=i;
               DM.EM2437Param.Open;
               SerNum:=DM.EM2437ParamSerial_Numb.Value;
               UPSS:=DM.EM2437ParamPSS.Value;
               Gain1:=DM.EM2437ParamGain1.Value;
               Gain2:=DM.EM2437ParamGain2.Value;
               Gain3:=DM.EM2437ParamGain3.Value;
               Gain4:=DM.EM2437ParamGain4.Value;
               Equal1:=DM.EM2437ParamEqual1.Value;
               Equal2:=DM.EM2437ParamEqual2.Value;
               Equal3:=DM.EM2437ParamEqual3.Value;
               Equal4:=DM.EM2437ParamEqual4.Value;
               UPT11:=DM.EM2437ParamPT11.Value;
               UPT12:=DM.EM2437ParamPT12.Value;
               UPT21:=DM.EM2437ParamPT21.Value;
               UPT22:=DM.EM2437ParamPT22.Value;
               DataExh:=1;
               MabVs:=255;
               DM.EM2437Param.Close;
             end;
           end;
      30..31:
           begin
             ArrDevice[i]:=TEM7401.Create;
             with (ArrDevice[i] as TEM7401) do
             begin
               DM.EM7401Param.ParamByName('Device_ID').Value:=i;
               DM.EM7401Param.Open;
               SerNum:=DM.EM7401ParamSerial_Numb.Value;
               SwithTable:=DM.EM7401ParamSwithTable.Value;
               FillChar(cr,SizeOf(cr),0);
               for j:=1 to 8 do
               if (StrToHEX(SwithTable[j*2-1])<>-1) and (StrToHEX(SwithTable[j*2])<>-1) then
                 cr[j]:= StrToHEX(SwithTable[j*2-1]) SHL 4 + StrToHEX(SwithTable[j*2])
               else  cr[j]:=0;
               Cross:=cr;
               VMSVS:=$FF;
               DataExh:=1;
               DM.EM7401Param.Close;
             end;
           end;
      38..39:
        begin
          ArrDevice[i]:=TLuna.Create;
          TLuna(ArrDevice[i]).TimeST:=0;
        end;
      45..46:
        begin
          ArrDevice[i]:=TResistor.Create;
        end;
      40..41:
        begin
         ArrStateDevice[i].ResultState:=2;
        end;
    end;
  end;
  HDDCount:=0;
  // получение списка активного оборудования
  for cc in ['A' .. 'Z'] do
    if GetDriveType(PChar(cc+':\'))=DRIVE_FIXED then
    begin
      inc(HDDCount);
      GetDiskFreeSpaceEx(PChar(cc+':\'),
                         FreeBytesAvailableToCaller,
                         Totalsize,
                        @FreeSize);
      HDDEnum[HDDCount].HDD_NAME:=cc;
      HDDEnum[HDDCount].TotalSpace:=TotalSize/1024/1024;//в метрах
      HDDEnum[HDDCount].FreeSpace:=FreeSize/1024/1024;
    end;
  case HOST_TP of
  1: begin IP_1:=IP_SrvWSC1; IP_2:=IP_SrvWSC2;  end;
  2: begin IP_1:=IP_SrvWSL1; IP_2:=IP_SrvWSL2;  end;
  3: begin IP_1:=IP_SrvWSR1; IP_2:=IP_SrvWSR2;  end;
  4: begin IP_1:=IP_SrvWSL1; IP_2:=IP_SrvWSL2;  end;
  end;
  LANCount:=2;
  LanEnum[1].LanIP:=IP_1;
  LanEnum[1].State:=true;
  LanEnum[2].LanIP:=IP_2;
  LanEnum[2].State:=true;
  if HOST_TP=1 then
  begin
    TARM(ArrDevice[1]).LanCount:=LanCount;
    TARM(ArrDevice[1]).HDDCount:=HDDCount;
    TARM(ArrDevice[1]).LAN     :=LanEnum;
    TARM(ArrDevice[1]).HDD     :=HDDEnum;
    TARM(ArrDevice[1]).SyncTime:=now;
    TARM(ArrDevice[1]).aType   :=1;
  end;
  //ping своей сети в потоке
  if HOST_TP=1 then
  begin
    hPing:=TPing.Create(True);
    hPing.Priority:=tpLowest;
    hPing.FreeOnTerminate:=False;
    hPing.IP_1:=IP_SrvWSC1;
    hPing.IP_2:=IP_SrvWSC2;
    hPing.IP_3:=IP_SrvVRD1;
    hPing.IP_4:=IP_SrvVRD2;
    hPing.IP_5:=IP_2409_1;
    hPing.IP_6:=IP_2409_2;
    hPing.IP_7:=IP_Printer;
    hPing.Resume;
  end else
  begin
    hPing:=TPing.Create(True);
    hPing.Priority:=tpLowest;
    hPing.FreeOnTerminate:=False;
    hPing.IP_1:=IP_1;
    hPing.IP_2:=IP_2;
    hPing.IP_3:=IP_SrvWSC1;
    hPing.IP_4:=IP_SrvWSC2;
    hPing.IP_5:='';
    hPing.IP_6:='';
    hPing.IP_7:='';
    hPing.Resume;
  end;
 //if HOST_TP=1 then
 begin
 DM.MTK.Connected:=true;
 DM.ComPort.Open;
 While not DM.ComPort.Eof do
 begin
   c:=DM.ComPortComPort.Value;
   ComList[c].cCom:=DM.ComPortComPort.Value;
   case DM.ComPortBaudRate.Value of
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
   case DM.ComPortByteSize.Value of
     5: ComList[c].cByteSize:=bs5;
     6: ComList[c].cByteSize:=bs6;
     7: ComList[c].cByteSize:=bs7;
     8: ComList[c].cByteSize:=bs8;
   end;
   ComList[c].cEnableDTR:=DM.ComPortEnableDTR.Value;
   ComList[c].cEnableRTS:=DM.ComPortEnableRTS.Value;
   case DM.ComPortParity.Value of
     0: ComList[c].cParity:=ptNONE;
     1: ComList[c].cParity:=ptODD;
     2: ComList[c].cParity:=ptEVEN;
     3: ComList[c].cParity:=ptMARK;
     4: ComList[c].cParity:=ptSPACE;
   end;
   case DM.ComPortStopBits.Value of
     1: ComList[c].cStopBits:=sb1BITS;
    15: ComList[c].cStopBits:=sb1HALFBITS;
     2: ComList[c].cStopBits:=sb2BITS;
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
 Query:='Select Umin1,Umin2,Umax1,Umax2,Tmin1,Tmin2,Tmax1,Tmax2,Nmin,Nmax,H1,H2 from TM2220Param';
 DM.QDin.Close;
 DM.QDin.SQL.Clear;
 DM.QDin.SQL.Add(Query);
 DM.QDin.Open;
 with KUConst do
 begin
   Umin1:=DM.QDin.FieldByName('Umin1').AsFloat;
   Umin2:=DM.QDin.FieldByName('Umin2').AsFloat;
   Umax1:=DM.QDin.FieldByName('Umax1').AsFloat;
   Umax2:=DM.QDin.FieldByName('Umax2').AsFloat;
   Tmin1:=DM.QDin.FieldByName('Tmin1').AsFloat;
   Tmin2:=DM.QDin.FieldByName('Tmin2').AsFloat;
   Tmax1:=DM.QDin.FieldByName('Tmax1').AsFloat;
   Tmax2:=DM.QDin.FieldByName('Tmax2').AsFloat;
   Nmin :=DM.QDin.FieldByName('Nmin').AsFloat;
   Nmax :=DM.QDin.FieldByName('Nmax').AsFloat;
   H1   :=DM.QDin.FieldByName('H1').AsFloat;
   H2   :=DM.QDin.FieldByName('H2').AsFloat;
   if (Tmin1<>Tmax1) and (Tmin1<>0) and (Tmax1<>0)  then fl_T1:=true else fl_T1:=false;
   if (Tmin2<>Tmax2) and (Tmin2<>0) and (Tmax2<>0) and (Tmin2<Tmin1) and (Tmax2>Tmax1) then fl_T2:=true else fl_T2:=false;
   if (Umin1<>Umax1) and (Umin1<>0) and (Umax1<>0)  then fl_U1:=true else fl_U1:=false;
   if (Umin2<>Umax2) and (Umin2<>0) and (Umax2<>0)  then fl_U2:=true else fl_U2:=false;
   if H1>0 then fl_H1:=true;
   if (H2>0) and (H2>H1) then fl_H2:=true;
   if (Nmin<>0) and (Nmax<>0) and (Nmax>Nmin) then fl_N:=true else fl_N:=false;
   
 end;
 DM.QDin.Close;
 DM.Command_5401.Open;
 while not DM.Command_5401.Eof do
 begin
   c:=DM.Command_5401Command_ID.Value;
   if not(c in [1..10]) then break;
   Command_EM5401[c].cCOM_ID     :=DM.Command_5401Command_ID.Value;
   Command_EM5401[c].cCommand    :=DM.Command_5401Command.Value;
   Command_EM5401[c].cComment    :=DM.Command_5401Comment_Eng.Value;
   Command_EM5401[c].cComandCount:=DM.Command_5401Command_Count.Value;
   Command_EM5401[c].cAnswerCount:=DM.Command_5401Answer_Count.Value;
   DM.Command_5401.Next;
 end;
 DM.Command_5401.Close;
 DM.Command_2437.Open;
 while not DM.Command_2437.Eof do
 begin
   c:=DM.Command_2437Command_ID.Value;
   if not(c in [1..20]) then break;
   Command_EM2437[c].cCOM_ID      :=DM.Command_2437Command_ID.Value;
   Command_EM2437[c].cCommand     :=DM.Command_2437Command.Value;
   Command_EM2437[c].cComment     :=DM.Command_2437Comment_Eng.Value;
   Command_EM2437[c].cComandCount :=DM.Command_2437Command_Count.Value;
   Command_EM2437[c].cAnswerCount :=DM.Command_2437Answer_Count.Value;
   DM.Command_2437.Next;
 end;
 DM.Command_2437.Close;
 DM.Command_7401.Open;
 while not DM.Command_7401.Eof do
 begin
   c:=DM.Command_7401Command_ID.Value;
   if not(c in [1..10]) then break;
   Command_EM7401[c].cCOM_ID     :=DM.Command_7401Command_ID.Value;
   Command_EM7401[c].cCommand    :=DM.Command_7401Command.Value;
   Command_EM7401[c].cComment    :=DM.Command_7401Comment_Eng.Value;
   Command_EM7401[c].cComandCount:=DM.Command_7401Command_Count.Value;
   Command_EM7401[c].cAnswerCount:=DM.Command_7401Answer_Count.Value;
   DM.Command_7401.Next;
 end;
 DM.Command_7401.Close;
 DM.ComDev.Open;
 while not DM.ComDev.Eof do
 begin
   c:=DM.ComDevDevice_ID.Value;
   ComDev[c].cDEV_ID  :=c;
   ComDev[c].cCom_ID  :=DM.ComDevComPort.Value;
   ComDev[c].cAdress  :=DM.ComDevAdress.Value;
   ComDev[c].cDev_Name:=DM.ComDevDeviceName.Value;
   DM.ComDev.Next;
 end;
 DM.ComDev.Close;
 DM.KUSetup.Open;
 while not DM.KUSetup.Eof do
 begin
   c:=DM.KUSetupDevice_ID.Value;
   if (c in [7..10]) then
   begin
     koor[c].X    :=DM.KUSetupX.Value;
     koor[c].Y    :=DM.KUSetupY.Value;
     koor[c].Z    :=DM.KUSetupZ.Value;
     koor[c].Az   :=DM.KUSetupAz.Value;
     koor[c].Um   :=DM.KUSetupUm.Value;
     koor[c].UsY  :=DM.KUSetupUsY.Value;
     koor[c].AhxY :=DM.KUSetupAhxY.Value;
     koor[c].UsC  :=DM.KUSetupUsC.Value;
     koor[c].AhxC :=DM.KUSetupAhxC.Value;
     koor[c].Focus:=DM.KUSetupFocus.Value;
     koor[c].Rx   :=DM.KUSetupRx.Value;
     koor[c].Ry   :=DM.KUSetupRy.Value;
     koor[c].Kx   :=DM.KUSetupKx.Value;
     koor[c].Ky   :=DM.KUSetupKy.Value;
     if koor[c].Kx<>0 then koor[c].RxKx:=koor[c].Rx/koor[c].Kx
       else koor[c].RxKx:=0;
     if koor[c].Ky<>0 then koor[c].RyKy:=koor[c].Ry/koor[c].Ky
       else koor[c].RyKy:=0;
     koor[c].X0   :=DM.KUSetupX0.Value;
     koor[c].Y0   :=DM.KUSetupY0.Value;
     koor[c].Alf  :=DM.KUSetupAlf.Value/grad;
     koor[c].Xi   :=DM.KUSetupXi.Value/grad;
     koor[c].Om   :=DM.KUSetupOm.Value/grad;
     cs_ArrDevice[c].Enter;
     try TKU(ArrDevice[c]).bUsY :=DM.KUSetupUsY.Value;
         TKU(ArrDevice[c]).bAhxY:=DM.KUSetupAhxY.Value;
         TKU(ArrDevice[c]).bUsC :=DM.KUSetupUsC.Value;
         TKU(ArrDevice[c]).bAhxC:=DM.KUSetupAhxC.Value;
     finally cs_ArrDevice[c].Leave; end;
   end;
   if (c in[38,39,45..47]) then
   begin
     case c of
     38:     cv:=1;  //OLS
     45:     cv:=2;  //PRLK1
     46:     cv:=3;  //PRLK2
     47:     cv:=4;  //RTP
     39:     cv:=5;  //ТП ОСП
     48:     cv:=11; //Цетральный пост гиромодуля
     //      cv:=6   //ТП фары
     end;
     koor[cv].X  :=DM.KUSetupX.Value;
     koor[cv].Y  :=DM.KUSetupY.Value;
     koor[cv].Z  :=DM.KUSetupZ.Value;
     koor[cv].Az :=DM.KUSetupAz.Value;
     koor[cv].Um :=DM.KUSetupUm.Value;
   end;
   DM.KUSetup.Next;
 end;
 Azl          :=koor[7].Az;
 DM.LASetup.Open;
 cv:=0;
 while not DM.LASetup.Eof do
 begin
   Inc(cv);
   DM.LASetup.Next;
 end;
 SetLength(LASet,cv);
 DM.LASetup.First;
 c:=0;
 while (not DM.LASetup.Eof) and (c<cv) do
 begin
   LASet[c].LA_ID :=DM.LASetupLA_ID.Value;
   LASet[c].Name  :=DM.LASetupmName.Value;
   LASet[c].XE    :=DM.LASetupXE.Value;
   LASet[c].YE    :=DM.LASetupYE.Value;
   LASet[c].ZE    :=DM.LASetupZE.Value;
   LASet[c].XG    :=DM.LASetupXG.Value;
   LASet[c].YG    :=DM.LASetupYG.Value;
   LASet[c].ZG    :=DM.LASetupZG.Value;
   LASet[c].XF    :=DM.LASetupXF.Value;
   LASet[c].YF    :=DM.LASetupYF.Value;
   LASet[c].ZF    :=DM.LASetupZF.Value;
   Inc(c);
   DM.LASetup.Next;   
 end;
 DM.LASetup.Close;
 Aircraft:=-1;
 ComboBox1.Items.Clear;
 for cv:=0 to c-1 do
 begin
   ComboBox1.Items.Add(LASet[cv].Name);
   if LASet[cv].Name='MiG-29' then
   begin
     ComboBox1.Text:=LASet[cv].Name;
     Aircraft:=cv;
   end;
 end;
 //точка пересечения глиссады фары с ПУ
 //введено для расчёта цветовых зон для фары
 Koor[6].X:=Koor[5].X;
 Koor[6].Y:=Koor[5].Y;
 Koor[6].Z:=Koor[5].Z-LASet[Aircraft].ZE+LASet[Aircraft].ZF;
 DM.MTK.Connected:=false;
 end;
 //olikke!!
 StartFilterGraph;
 SetControl(HOST_TP);
 FilterGraph1.Tag:=0;//Tag=0 - видео с камеры, Tag=1 -проигрывание из файла
 if HOST_TP<>1 then SynchroTime.Enabled:=true;
 if HOST_TP=1 then
 for i in [11,21] do
 begin
   TEM5402(ArrDevice[i]).use1:=false;
   TEM5402(ArrDevice[i]).use2:=false;
   TEM5402(ArrDevice[i]).use3:=false;
   TEM5402(ArrDevice[i]).use4:=false;
   //Device_ID = COM_ID для разветвителей
   for ol in [7..10] do
   if COMDev[ol].cCom_ID=ComDev[i].cCom_ID then
     case LO(COMDev[ol].cAdress) of
     1: begin TEM5402(ArrDevice[i]).use1:=true;
              TEM5402(ArrDevice[i]).Ch1:=0;
              TEM5402(ArrDevice[i]).TQ1:=0;
              TEM5402(ArrDevice[i]).PQ1:=0;
              TEM5402(ArrDevice[i]).Dev1:=COMDev[ol].cDEV_ID;
        end;
     2: begin TEM5402(ArrDevice[i]).use2:=true;
              TEM5402(ArrDevice[i]).Ch2:=0;
              TEM5402(ArrDevice[i]).TQ2:=0;
              TEM5402(ArrDevice[i]).PQ2:=0;
              TEM5402(ArrDevice[i]).Dev2:=COMDev[ol].cDEV_ID;
        end;
     3: begin TEM5402(ArrDevice[i]).use3:=true;
              TEM5402(ArrDevice[i]).Ch3:=0;
              TEM5402(ArrDevice[i]).TQ3:=0;
              TEM5402(ArrDevice[i]).PQ3:=0;
              TEM5402(ArrDevice[i]).Dev3:=COMDev[ol].cDEV_ID;
        end;
     4: begin TEM5402(ArrDevice[i]).use4:=true;
              TEM5402(ArrDevice[i]).Ch4:=0;
              TEM5402(ArrDevice[i]).TQ4:=0;
              TEM5402(ArrDevice[i]).PQ4:=0;
              TEM5402(ArrDevice[i]).Dev4:=COMDev[ol].cDEV_ID;
        end;
     end;
 end;
 cs_External:=TCriticalSection.Create;
 cs_2404:=TCriticalSection.Create;
 cs_Ladoga:=TCriticalSection.Create;
 cs_MiniLadoga  :=TCriticalSection.Create;
 cs_MedLadoga   :=TCriticalSection.Create;
 CommandList:=TList.Create;
 QuestionList:=TList.Create;
 ExternalList:=TList.Create;
 if HOST_TP=1 then
 begin
    hQuestion:=TQuestion.Create(True);
    hQuestion.Priority:=tpLowest;
    hQuestion.FreeOnTerminate:=False;
    hQuestion.Resume;
 end;
 if HOST_TP=1 then
 for i in [17..19] do
 begin
   hUPS[i]:=TGetUPS.Create(True);
   hUPS[i].Priority:=tpLowest;
   hUPS[i].FreeOnTerminate:=True;
   UPSEvent[i]:=TEvent.Create(nil,false,false,'');
   hUPS[i].FEvent:=UPSEvent[i];
   case i of
   17: hUPS[i].IP:= IP_2411_1;
   18: hUPS[i].IP:= IP_2411_2;
   19: hUPS[i].IP:= IP_2411_3;
   end;
   hUPS[i].Device_ID:=i;
   hUPS[i].Resume; 
 end;
 if (HOST_TP=1) or (HOST_TP=2) then
 begin
   //OLS
   flag:=false;
   DM.ExternalConn.ParamByName('Dev_Type').VALUE:=1;
   DM.ExternalConn.Open;
   if DM.ExternalConnName.Value='OLS' then
      flag:=DM.ExternalConnInclude.Value;
   DM.ExternalConn.Close;
   if flag then ExternalDevice.OLS:=1
   else begin
     sp38.Enabled:=false;
     sp38.Font.Color:=clGray;
     Luna.Visible:=false;
     dev38.Visible:=false;
     dev39.Visible:=false;
     ExternalDevice.OLS:=0;
   end;
   flag:=false;
   DM.ExternalConn.ParamByName('Dev_Type').VALUE:=2;
   DM.ExternalConn.Open;
   if DM.ExternalConnName.Value='Telemetric sys' then
      flag:=DM.ExternalConnInclude.Value;
   DM.ExternalConn.Close;
   if (HOST_TP=1) or (HOST_TP=2) then
   if flag  then
   begin
     PortList:=TList.Create;
     INIT;
     StartLadoga;
     ExternalDevice.Telem:=1;
   end else
   begin
     sp40.Enabled:=false;
     sp40.Font.Color:=clGray;
     Telem.Visible:=false;
     dev40.Visible:=false;
     dev41.Visible:=false;
     ExternalDevice.Telem:=0;
   end;
   flag:=false;
   DM.ExternalConn.ParamByName('Dev_Type').VALUE:=3;
   DM.ExternalConn.Open;
   if DM.ExternalConnName.Value='PRLK' then
      flag:=DM.ExternalConnInclude.Value;
   DM.ExternalConn.Close;
   if flag then ExternalDevice.PRLK:=1
   else begin
     sp45.Enabled:=false;
     sp45.Font.Color:=clGray;
     PRLK.Visible:=false;
     dev45.Visible:=false;
     dev46.Visible:=false;
     SpeedButton6.Enabled:=false;
     SpeedButton8.Enabled:=false;
     SpeedButton9.Enabled:=false;
     Shape3.Brush.Color:=clSilver;
     RadioGroup1.ItemIndex:=1;
     RadioGroup1.Enabled:=false;
     ExternalDevice.PRLK:=0;
   end;
   if (ExternalDevice.PRLK<>0) or (ExternalDevice.OLS<>0)then
   begin
     //Открытие Сом Портов
     if hReadCom=nil then
     begin
       hReadCom:=TReadCPort.Create(True); //Создаем поток
       hReadCom.Priority:=tpLowest;      //Приоритет потока низкий  tpHigher
       hReadCom.FreeOnTerminate:=True;
     end;
     //Запуск обмена с Резистором и Луной
     if hReadCom<>nil then hReadCom.Resume;
   end;
 end;
 NeverUse:= CreateEvent(nil,FALSE,FALSE,NIL);
 if HOST_TP=1 then MTKPaint;
  //накстройи ffdshow
  Reg:=TRegistry.Create;
     try
       Reg.RootKey := HKEY_CURRENT_USER;
       Key := 'Software\GNU\ffdshow_enc';
       if Reg.OpenKey(Key, True) then
       begin
         Reg.WriteInteger('CodecId',400);        //XViD
         Reg.WriteInteger('Fourcc',1145656920);  //XVid
         Reg.WriteInteger('Mode',1);             //not Average bitrate
         Reg.WriteInteger('Bitrate1000',10000);  //Bitrate
         Reg.WriteInteger('Gray',0);             //No Gray
         Reg.WriteInteger('Interlacing',0);      //No Interlace
         Reg.WriteInteger('Max_key_interval',27);//Max I Frame (default)
         Reg.WriteInteger('Min_key_interval',1); //Min I Frame (default)
         Reg.CloseKey;
       end;
     finally
     Reg.Free;
     end;
  if HOST_TP=1 then
  begin
    hDataCalc:=TDataCalc.Create(True);
    hDataCalc.Priority:=tpLowest;
    hDataCalc.FreeOnTerminate:=False;
    hDataCalc.Resume;
  end;
  TelemT.Enabled:=true;
  if HOST_TP=1 then
  begin
    Monitoring:=TMonitoring.Create(true);
    Monitoring.FreeOnTerminate:=false;
    Monitoring.Resume;
  end;
end;

procedure TNMain.StartLadoga;
var awVTMK4InBuf :Array[0..1]of Word;
    awVTMK4OutBuf:Array[0..1]of Word;
    cbVTMK4Ret:DWord;
    PName,PortName:String;
begin
  FHandl:=0;
  hEvent:=0;
  PName:='\\.\TMK1553BDevice';
  if Host_TP=1 then NumChanel:=1 else NumChanel:=0;
  begin
    PortName:=PName+IntToStr(NumChanel);
    FHandl := CreateFile(PChar(PortName),
                         GENERIC_READ or GENERIC_WRITE,
                         0,nil,OPEN_EXISTING,FILE_FLAG_OVERLAPPED,0);
    if FHandl <> INVALID_HANDLE_VALUE then
    begin
      if not DeviceIoControl(FHandl,IOCTL_TMK_GetVersion,@awVTMK4InBuf,0,
                             @awVTMK4OutBuf,2,cbVTMK4Ret,NIL) then
      begin
        ShowMessage('Error of load of driver!');
        CloseHandle(FHandl);hEvent:=0;FHandl:=0;EXIT;
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
          hEvent:=0; FHandl:=0;
          EXIT;
        end;
      end;
      awVTMK4InBuf[0]:=NumChanel;
      if not DeviceIoControl(FHandl,IOCTL_TMK_tmkconfig,@awVTMK4InBuf,2,
                             @awVTMK4OutBuf,2,cbVTMK4Ret,NIL) then
      begin
        ShowMessage('Error of configuration!');
        CloseHandle(FHandl);
        hEvent:=0;
        FHandl:=0;
      end;
    end else FHandl:=0;
  end;
  if FHandl <> 0 then
  begin
    awVTMK4InBuf[0]:=NumChanel;
    DeviceIoControl(FHandl,IOCTL_TMK_tmkselect,@awVTMK4InBuf,2,
                    @awVTMK4OutBuf,2,cbVTMK4Ret,NIL);
    tmkdefevent(FHandl,hEvent,TRUE);
    rtreset(FHandl);
    rtdefaddress(FHandl,$03);
    SumSend:=0;
    WaitEvent:=TNewWaitEvent.Create(True);
    WaitEvent.FreeOnTerminate:=false;
    WaitEvent.Priority:=tpNormal;
    WaitEvent.Resume;
  end  else
    Application.MessageBox('The pay of  TE1-PCI2 is not identified!','TE1-PCI2 Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
end;

procedure TNMain.SynchroTimeTimer(Sender: TObject);
var t1,t2:byte;
    DD:TDateTime;
    vsys:_SYSTEMTIME;
    yHour,yMin,ySec,yMSec,yYear,yMonth,yDay:Word;

begin
  if HOST_TP<>1 then
  begin
    fl_Synchro:=true;
    exit;
  end;
  if ExternalDevice.Telem=0 then exit;
  cs_Ladoga.Enter;
  try  t1:=Ladoga[1].Central.laDataExh;
       DD:=Ladoga[1].Central.laDTL;
  finally cs_Ladoga.Leave; end;
  if t1=0 then
  begin
    cs_Ladoga.Enter;
    try t2:=Ladoga[2].Central.laDataExh;
        DD:=Ladoga[2].Central.laDTL;
    finally cs_Ladoga.Leave;  end;
  end;
  if (t1=0) and (t2=0) then
  begin
    SynchroTime.Tag:=555;
    SynchroTime.Enabled:=false;
    exit;
  end;
  DecodeTime(DD,yHour,yMin,ySec,yMSec);
  DecodeDate(DD,yYear,yMonth,yDay);
  vsys.wHour:=yHour;
  vsys.wMinute:=yMin;
  vsys.wSecond:=ySec;
  vsys.wMilliseconds:=yMSec;
  vsys.wYear:=yYear;
  vsys.wMonth:=yMonth;
  vsys.wDay:=yDay;
  SetSystemTime( vsys );
end;

procedure TNMain.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
    MyINI:TINIFile;
    section:string;
begin
  MyINI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) + '\Operators.ini');
  Section:='MeasuringMode';
  MyINI.WriteBool(Section,'Distance',MK1=1.00);
  MyINI.WriteBool(Section,'HorizontalDeviation',MK2=1.00);
  MyINI.WriteBool(Section,'VerticalDeviation',MK3=1.00);
  MyINI.WriteBool(Section,'ASPD',MK4=1.00);
  MyINI.WriteBool(Section,'VSPD',MK5=1.00);
  MyINI.WriteBool(Section,'SPD',MK6=1.00);
  MyINI.Free;
  if Assigned(Monitoring) then begin Monitoring.Terminate; Monitoring.WaitFor; Monitoring:=nil; end;
  Cursor:=crHourGlass;
  CloseHandle(NeverUse);
  if Assigned(hQuestion) then
  begin
    hQuestion.Terminate;
    sleep(2000);
  end;
  for i:= 17 to 19 do
  if Assigned(hUPS[i]) then
  begin
    if hUPS[i]=nil then continue;
    hUPS[i].Terminate;
    UPSEvent[i].SetEvent;
    Sleep(10);
    hUPS[i]:=nil;
  end;
  if Assigned(hAlgorithm) then begin hAlgorithm.Terminate; hAlgorithm:=nil;end;
  sleep(200);
  if Assigned(FilterGraph1) then
  begin
    FilterGraph1.Stop;
    FilterGraph1.Active:=False;
  end;
  FastIn.Destroy;
  FastOut16.Destroy;
  FastOut24.Destroy;
  FastOut32.Destroy;
  FastOut48.Destroy;
  FastOut64.Destroy;
  FastText.Destroy;
  UnRegisterHotKey(Handle, id1);
  UnRegisterHotKey(Handle, id2);
  UnRegisterHotKey(Handle, id3);
  UnRegisterHotKey(Handle, id4);
  UnRegisterHotKey(Handle, id5);
  UnRegisterHotKey(Handle, id6);
  UnRegisterHotKey(Handle, id7);
  UnRegisterHotKey(Handle, id8);
  UnRegisterHotKey(Handle, id9);
  UnRegisterHotKey(Handle, id10);
  UnRegisterHotKey(Handle, id11);
  UnRegisterHotKey(Handle, id12);
  UnRegisterHotKey(Handle, id13);
  UnRegisterHotKey(Handle, id14);
  UnRegisterHotKey(Handle, id15);
  UnRegisterHotKey(Handle, id16);
  UnRegisterHotKey(Handle, id18);
  UnRegisterHotKey(Handle, id19);
  UnRegisterHotKey(Handle, id20);
  UnRegisterHotKey(Handle, id21);
  UnRegisterHotKey(Handle, id24);
  UnRegisterHotKey(Handle, id25);
  if (HOST_TP=2) or (HOST_TP=3) then
  begin
    UnRegisterHotKey(Handle, id22);
    UnRegisterHotKey(Handle, id23);
  end;
  UnRegisterHotKey(Handle, mUp);
  UnRegisterHotKey(Handle, mDown);
  UnRegisterHotKey(Handle, mLeft);
  UnRegisterHotKey(Handle, mRight);
  UnRegisterHotKey(Handle, idsl);
  UnRegisterHotKey(Handle, idsr);
  UnRegisterHotKey(Handle, idsu);
  UnRegisterHotKey(Handle, idsd);
  EventAlgorithm.Free;
  if Assigned(hDataCalc) then begin hDataCalc.Terminate; hDataCalc.WaitFor; hDataCalc:=nil; end;
  if Assigned(hWC1) then begin hWC1.Terminate; EventWC1.SetEvent; hWC1.WaitFor; EventWC1.Free; hWC1:=nil; end;
  if Assigned(hWC2) then begin hWC2.Terminate; EventWC2.SetEvent; hWC2.WaitFor; EventWC2.Free; hWC2:=nil; end;
  if Assigned(hPing) then begin hPing.Terminate; hPing.WaitFor; hPing:=nil; end;
  if UDPServer1.Active then try UDPServer1.Active:=false except end;
  if UDPServer2.Active then try UDPServer2.Active:=false except end;
  if VRDServer.Active then try VRDServer.Active:=false except end;
  if UDPCommandServer.Active then try UDPCommandServer.Active:=false except end;
  SOPR.Free;
  SOPR1.Free;
  cs_Auto.Free;
  cs_ArrStateDevice.Free;
  cs_MiniLadoga.Free;
  cs_MedLadoga.Free;
  {for i:= 1 to DevCount do
  try cs_ArrDevice[i].Free;
  except end;}
  cs_ComState.Free;
  CloseHandle(h5401);
  CloseHandle(h2220);
  cs_Ladoga.Free;
  Cursor:=crDefault;
  if fl_ListProtocol then
  begin
    List2404.SaveToFile(ExtractFilePath(ParamStr(0)) +'Protocol\2404 '+FormatDateTime('yyyy_mm_dd hh_nn_ss',Now)+'.txt');
    List2404.Free;
    ListKU.SaveToFile(ExtractFilePath(ParamStr(0)) +'Protocol\KU '+FormatDateTime('yyyy_mm_dd hh_nn_ss',Now)+'.txt');
    ListKU.Free;
  end;
end;

procedure TNMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i:integer;
begin
  fl_STOP:=true;
  AutoSopr:=0;
  AlgNum:=0;
  Point_Brush;
  SendEscortMode;
  SynchroTime.Enabled:=false;
  try
  if PortList<>nil then
    begin
      Stop:=True;
      if PortList.Count > 0 then
      for i:=0 to PortList.Count-1 do
        begin
        FHandl:=Integer(PortList.Items[i]);
        tmkdone(FHandl,0);
        CloseHandle(FHandl);
      end;
      if hEvent<>0 then begin CloseHandle(hEvent); hEvent:=0; end;
      if WaitEvent<>nil then WaitEvent.Free;
      PortList.Clear;
    end;
  except
  end;
  if Assigned(hReadCom) then hReadCom.Terminate;
end;

procedure TNMain.FormCreate(Sender: TObject);
var i:integer;
begin
 Application.OnException:=GlobalException;
 h5401:= CreateEvent(@sa4Event,FALSE,FALSE,NIL);
 h2220:= CreateEvent(@sa4Event,FALSE,FALSE,NIL);
 MaskEdit1.EditMask:='0'+Chr($B0)+ '00'+Chr($27)+';1;_';
 MaskEdit1.Text:='4'+Chr($B0)+'00'+Chr($27);
 st_Alpha:=('4'+chr($B0)+'00'+chr($27));
 MaskEdit2.EditMask:='0'+Chr($B0)+ '00'+Chr($27)+';1;_';
 MaskEdit2.Text:='0'+Chr($B0)+'00'+Chr($27);
 st_Betta:=('0'+chr($B0)+'00'+chr($27));
 aBetta:=0;
 MaskEdit1.Font.Color:=clBlack;
 MaskEdit2.Font.Color:=clBlack;
 Label238.Caption:='Alt+';
 Label239.Caption:=chr($AD)+#10#13+chr($AF);
 Label242.Caption:='Alt+';
 Label243.Caption:=chr($AE)+#10#13+chr($AC);
 Label244.Caption:='Ctrl+';
 Label247.Caption:=chr($AD)+#10#13+chr($AF);
 Label246.Caption:='Ctrl+';
 Label245.Caption:=chr($AE)+#10#13+chr($AC);
 for i:=1 to 21 do
 if NMain.FindComponent('i'+IntToStr(i))<>nil then
 with (NMain.FindComponent('i'+IntToStr(i)) as TImage).Canvas do
 begin
   Brush.Color:=clMedGray;
   FillRect((NMain.FindComponent('i'+IntToStr(i)) as TImage).ClientRect);
 end;
 Image4.Canvas.Brush.Color:=clMedGray;
 Image4.Canvas.FillRect(Image4.ClientRect);
 Image5.Canvas.Brush.Color:=clBlack;
 Image5.Canvas.FillRect(Image5.ClientRect);
end;

procedure TNMain.VRDServerExecute(AContext: TIdContext);
var MemStr:TMemoryStream;
begin
  //центральный оператор
  if (Host_TP=1) or (Host_TP=4) then
  begin
    MemStr:=TMemoryStream.Create;
    MemStr.SetSize(SizeOf(vSMS));
    MemStr.Position:=0;
    AContext.Connection.IOHandler.ReadStream(MemStr,SizeOf(vSMS),false);
    MemStr.Position:=0;
    MemStr.ReadBuffer(vSMS,SizeOf(vSMS));
    MemStr.Free;
  end;
  cs_ArrDevice[16].Enter;
  try TARM(ArrDevice[16]).HDDCount:=vSMS.HDDCount;
      TARM(ArrDevice[16]).LanCount:=vSMS.LanCount;
      TARM(ArrDevice[16]).HDD     :=vSMS.HDDEnum;
      TARM(ArrDevice[16]).Lan     :=vSMS.LanEnum;
      TARM(ArrDevice[16]).aType   :=vSMS.HOST;
      TARM(ArrDevice[16]).SyncTime:=now;
      TARM(ArrDevice[16]).VideoTDV:=vSMS.Video;
  finally cs_ArrDevice[16].Leave; end;
  if fl_VRD<>vSMS.fl_VRD then
  case vSMS.fl_VRD of
    0: begin fl_VRD:=0; RadioButton1.Checked:=true; end;
    1: begin fl_VRD:=1; RadioButton2.Checked:=true; end;
  end;
  case fl_VRD of
    0: Edit2.Text:='                STOP';
    1: Edit2.Text:='Size :'+FloattostrF(vSMS.Size/1024/1024,ffFixed,6,2)+' Mb.';
  end;
  if fm_VRD <> nil then if fm_VRD.Visible then
      PostMessage(Fm_VRD.Handle,WM_NOTIFY_MSA,16,0);
end;

procedure TNMain.SetControl(HostTP: Word);
begin
  if HostTP=1 then Caption:='Work Station of Pivotal Operator';
  if HostTP=2 then Caption:='Work Station of Left Operator';
  if HostTP=3 then Caption:='Work Station of Right Operator';
  if (HostTP=2) or (HostTP=3) then
  begin
    RacsNo.Visible:=false;
    TVDMod.Visible:=false;
    SysConf.Visible:=false;
    GroupBox27.Enabled:=true;
    TRMode.Enabled:=true;
    GroupBox35.Visible:=false;
    trackingresult.Visible:=false;
    Distance.Visible:=false;
    selectaxialTVD.Visible:=false;
    Panel21.Visible:=false;
    Air.Visible:=false;
    GA.Visible:=false;
    BA.Visible:=false;
    VR.Visible:=false;
    TrMode.Visible:=false;
    SpeedButton33.OnClick:=EmptyClick;
    SpeedButton33.Enabled:=false;
    SpeedButton42.OnClick:=EmptyClick;
    SpeedButton42.Enabled:=false;
    SpeedButton1.Enabled:=false;
    SpeedButton2.Enabled:=false;
    SpeedButton4.Enabled:=false;
    SH1.Visible:=false;
    pointOfTracking.Top:=pivotaltracking.Top+pivotaltracking.Height+15;
    TS3.Visible:=false;
    TS4.Visible:=false;
    TS5.Visible:=false;
    F78.Top:=pointOfTracking.Top;
    Panel26.Visible:=true;
    Panel26.Top:=0;
    devSH.Visible:=false;
    ModeOfTracking.Top:=pointOfTracking.Top+pointOfTracking.Height+15;
    if HOST_TP=2 then  Label266.Caption:='Left tracking';
    if HOST_TP=3 then  Label266.Caption:='Right tracking';
    TS3.Visible:=false;
    TS4.Visible:=false;
    TS5.Visible:=false;
    id22:=GlobalAddAtom ('id22'); RegisterHotKey(Handle,id22,MOD_SHIFT,vk_Up);
    id23:=GlobalAddAtom ('id23'); RegisterHotKey(Handle,id23,MOD_SHIFT,vk_Down);
  end;
  if HOST_TP=1 then MB.Click;
end;

procedure TNMain.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  WheelLeft;
end;

procedure TNMain.WheelLeft;
begin
  if sizebm=24 then sizebm_:=16;
  if sizebm=32 then sizebm_:=24;
  if sizebm=48 then sizebm_:=32;
  if sizebm=64 then sizebm_:=48;
  VideoCount:=0;
  TimeGrabber:=0;
end;

procedure TNMain.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  WheelRight;
end;

procedure TNMain.WheelRight;
begin
  if sizebm=48 then sizebm_:=64;
  if sizebm=32 then sizebm_:=48;
  if sizebm=24 then sizebm_:=32;
  if sizebm=16 then sizebm_:=24;
  VideoCount:=0;
  TimeGrabber:=0;
end;

procedure TNMain.WheelUp;
begin
  fl_Change:=1;
end;

procedure TNMain.WheelDown;
begin
  fl_Change:=2;
end;

procedure TNMain.FormShow(Sender: TObject);
begin
   if HOST_TP=1 then PasswordDlg.ShowModal;
end;

procedure TNMain.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var  a,b,c,d,e,f,g,h,m,n:integer;
     pc: TFColor;
     RGBGrey:byte;
     BLackCount:integer; //кол-во абсолютно чёрных пикселей
     Y1:PLine32;
     ss1,ss2,ss3:string;
     MemoryDC:hdc;
     tt:int64;
     x,y:integer;
begin
try
  fl_Video:=true;
  //olikke - подумать о sud - вылет в верхнем правом угле.
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  if viy>BHeight-div_2-1  then viy:=BHeight-div_2;
  if vix>BWidth-div_2-1   then vix:=BWidth-div_2;
  if viy<=div_2+1  then viy:=div_2+1;
  if vix<=div_2+1  then vix:=div_2+1;
  MinVI:=255;
  MaxVI:=0;
  d:=0;
  BlackCount:=0;
  cs_Auto.Enter;
  try
    for n:=(viy-div_2) to (viy+div_2-1) do
    begin
      c:=0;
      for m := (vix-div_2) to (vix+div_2-1) do
      begin
        pc:=FastIn.GetPixel(BHeight-n,m);
        RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
        if RGBGrey=0 then Inc(BlackCount);
        if MinVI > RGBGrey then MinVI := RGBGrey;
        if MaxVI < RGBGrey then MaxVI := RGBGrey;
        SoprGrey[c,d]:=RGBGrey;
        if (n=viy+sud) or (m=vix+slr) then  pc:=tfLime;
        case sizebm of
        16:  FastOut16.SetPixel(15-d,c,pc);
        24:  FastOut24.SetPixel(23-d,c,pc);
        32:  FastOut32.SetPixel(31-d,c,pc);
        48:  FastOut48.SetPixel(47-d,c,pc);
        64:  FastOut64.SetPixel(63-d,c,pc);
        end;
        inc(c);
      end;
      inc(d);
    end;
  finally
    cs_Auto.Leave;
  end;
  if BlackCount= SQR(sizebm)*0.99 then begin Edit3.Text:='No Video'; fl_VideoEsc:=false; exit; end else fl_VideoEsc:=true;
  //KeyAnaliz;
  if not Assigned(hAlgorithm) then  exit;
  if AutoSopr=2 then
  begin
    if ViY>=div_2   then  a:=ViY-div_2   else   a:=0;
    if ViX>=div_2   then  b:=ViX-div_2   else   b:=0;
    if ViY>=div_5   then  c:=ViY-div_5   else   c:=0;
    if ViX>=div_5   then  d:=ViX-div_5   else   d:=0;

    if ViY<=BHeight-div_5-1  then  e:=ViY+div_5  else   e:=BHeight-1;
    if ViY<=BHeight-div_2-1  then  f:=ViY+div_2  else   f:=BHeight-1;
    if ViX<=BWidth-div_5-1   then  g:=ViX+div_5  else   g:=BWidth-1;
    if ViX<=BWidth-div_2-1   then  h:=ViX+div_2  else   h:=BWidth-1;

    Line(FastIn, ViX, a,   ViX, c,   tfLime);
    Line(FastIn, ViX, e,   ViX, f,   tfLime);
    Line(FastIn, b,   Viy, d,   ViY, tfLime);
    Line(FastIn, g,   Viy, h,   ViY, tfLime);
  end;

  if AutoSopr=1 then
  begin
    if ViX<=BWidth-div_2-1       then a:=ViX+div_2+slr   else  a:=BWidth-1;
    if ViX<=BWidth-div_5-1       then b:=ViX+div_5+slr   else  b:=BWidth-1;
    if ViY<=BHeight-div_2-1-sud  then c:=ViY+div_2+sud   else  c:=BHeight-1;
    if ViY<=BHeight-div_5-1-sud  then d:=ViY+div_5+sud   else  d:=BHeight-1;

    if ViX>=div_2       then e:=ViX-div_2+slr   else  e:=0;
    if ViX>=div_5       then f:=ViX-div_5+slr   else  f:=0;
    if ViY>=div_2   then g:=ViY-div_2+sud   else  g:=0;
    if ViY>=div_5   then h:=ViY-div_5+sud   else  h:=0;
    if g<0 then g:=0;
    if h<0 then h:=0;
    if e<0 then e:=0;
    if f<0 then f:=0;
    

    Line(FastIn,e,g,e,h,tfLime);
    Line(FastIn,e,g,f,g,tfLime);
    Line(FastIn,a,g,a,h,tfLime);
    Line(FastIn,a,g,b,g,tfLime);
    Line(FastIn,a,d,a,c,tfLime);
    Line(FastIn,a,c,b,c,tfLime);
    Line(FastIn,e,c,e,d,tfLime);
    Line(FastIn,e,c,f,c,tfLime);
  end;
 // if fl_ChangeOfMode then
  begin
    case AutoSopr of
      0:  ss2:=ChangeOfMode[3];
      1:  ss2:=ChangeOfMode[1];
      2:  ss2:=ChangeOfMode[2];
    end;
    case AlgNum of
      //0:  ss3:=ChangeOfMode[3];
      1:  ss3:=ChangeOfMode[4];
      2:  ss3:=ChangeOfMode[5];
      3:  ss3:=ChangeOfMode[6];
    end;
    FastText.Clear(tfBlack);
    FastText.TextOut(0,0,ss2+ss3);
    FastIn.CopyRect(FastText,294,558,474,576,0,0);
   { case TextTimer.Tag of
    0:  FastIn.CopyRect(FastText,294,40,474,80,0,0);
    1:  FastIn.CopyRect(FastText,294,510,474,550,0,0);
    2:  FastIn.CopyRect(FastText,294,40,474,80,0,0);
    end; }
  end;
finally
  if Assigned(hAlgorithm) then EventAlgorithm.SetEvent
end;
end;

procedure TnMain.KeyAnaliz;
var k1,k2:Integer;
begin
  K1 := GetAsyncKeyState(VK_CONTROL);
  K2 := GetAsyncKeyState(VK_SHIFT);
 //Автомат  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (K1=-32767)OR(K1=1) then
  begin
    if Assigned(hAlgorithm) then
    begin
      hAlgorithm.Terminate;
      hAlgorithm:=nil;
    end;
    if (fl_IndependentEscort) or ((Host_TP=1) or (Host_TP=4)) then
    begin
      AutoSopr:=1;
      if AlgNum=0 then AlgNum:=1;
      Point_Brush;
      SendEscortMode;
    end;
    if not Assigned(hAlgorithm) then
    begin
      hAlgorithm:=TAlgorithm.Create(True);
      hAlgorithm.Priority:=tpLowest;
      hAlgorithm.FreeOnTerminate:=False;
      hAlgorithm.Resume;
      EventAlgorithm.resetEvent;
    end;
    VideoCount:=0;
  end;
  //Ручное  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  if (K2=-32767)OR(K2=1) then
  begin
    if Assigned(hAlgorithm) then
    begin
      hAlgorithm.Terminate;
      hAlgorithm:=nil;
    end;
    if (fl_IndependentEscort) or ((Host_TP=1) or (Host_TP=4)) then
    begin
      AutoSopr:=2;
      if AlgNum=0 then AlgNum:=1;
      Point_Brush;
      SendEscortMode;
    end;
    if not Assigned(hAlgorithm) then
    begin
      hAlgorithm:=TAlgorithm.Create(True);
      hAlgorithm.Priority:=tpLowest;
      hAlgorithm.FreeOnTerminate:=False;
      hAlgorithm.Resume;
      EventAlgorithm.resetEvent;
    end;
    VideoCount:=0;
  end;
end;

procedure TNMain.Lp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var str:string;
begin
  str:=(Sender as TLabel).Name;
  Delete(str,1,2);
  if NMain.FindComponent('sp'+str)<>nil then
  begin
    TPanel(NMain.FindComponent('sp'+str)).BevelInner:=bvNone;
    TPanel(NMain.FindComponent('sp'+str)).BevelOuter:=bvLowered;
  end;
end;

procedure TNMain.Lp1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var str:string;
begin
  str:=(Sender as TLabel).Name;
  Delete(str,1,2);
  if NMain.FindComponent('sp'+str)<>nil then
  begin
    TPanel(NMain.FindComponent('sp'+str)).BevelInner:=bvRaised;
    TPanel(NMain.FindComponent('sp'+str)).BevelOuter:=bvRaised;
  end;
end;

procedure TNMain.SpeedButton10Click(Sender: TObject);
var i,j:integer;
begin
    for j:=22 to 25 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clLime;
    Shape14.Brush.Color:=clBtnFace;
    Shape15.Brush.Color:=clBtnFace;
end;

procedure TNMain.SpeedButton11Click(Sender: TObject);
var i,j:integer;
begin
    for j:=26 to 29 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clBtnFace;
    Shape14.Brush.Color:=clLime;
    Shape15.Brush.Color:=clBtnFace;
end;

procedure TNMain.SpeedButton12Click(Sender: TObject);
var i,j:integer;
begin
    for j:=30 to 33 do
    for i:= 7 to 10 do
    AddCommand3(j,i);
    Shape19.Brush.Color:=clBtnFace;
    Shape14.Brush.Color:=clBtnFace;
    Shape15.Brush.Color:=clLime;
end;

procedure TNMain.SpeedButton13Click(Sender: TObject);
var S1,S2:integer;
begin
  if StrToIntDef(MaskEdit1.Text[1],-10)=-10 then exit;
  if StrToIntDef(MaskEdit1.Text[3],-10)=-10 then exit;
  if StrToIntDef(MaskEdit1.Text[4],-10)=-10 then exit;
  S1:=StrToInt(MaskEdit1.Text[1]);
  S2:=StrToInt(MaskEdit1.Text[3])*10+StrToInt(MaskEdit1.Text[4]);
  if S2>=60 then  exit;
  st_Alpha:=MaskEdit1.Text[1]+chr($B0)+MaskEdit1.Text[3]+MaskEdit1.Text[4]+chr($27);
  Alpha:=S1+S2/60;
  MaskEdit1.Font.Color:=clWindowText;
end;

procedure TNMain.SpeedButton14Click(Sender: TObject);
begin
  if  flag_night then
  begin
    flag_night:=false;
    Shape9.Brush.Color:=clSilver;
  end else
  begin
    flag_night:=true;
    Shape9.Brush.Color:=clLime;
  end;
end;

procedure TNMain.SpeedButton16Click(Sender: TObject);
begin
  if not SpeedButton16.Enabled then exit;
  if flag_PC then
  begin
    flag_PC:=false;
    Shape16.Brush.Color:=clSilver;
    SpeedButton17.Enabled:=true;
  end else
  begin
    flag_PC:=true;
    SpeedButton17.Enabled:=false;
    Shape16.Brush.Color:=clLime;
  end;
end;

procedure TNMain.SpeedButton17Click(Sender: TObject);
begin
  if not SpeedButton17.Enabled then exit;
  if flag_PR then
  begin
    flag_PR:=false;
    Shape17.Brush.Color:=clSilver;
    SpeedButton16.Enabled:=true;
  end else
  begin
    flag_PR:=true;
    Shape17.Brush.Color:=clLime;
    SpeedButton16.Enabled:=false;
  end;
end;

procedure TNMain.SpeedButton15Click(Sender: TObject);
var S1,S2:integer;
begin
  if StrToIntDef(MaskEdit2.Text[1],-10)=-10 then exit;
  if StrToIntDef(MaskEdit2.Text[3],-10)=-10 then exit;
  if StrToIntDef(MaskEdit2.Text[4],-10)=-10 then exit;
  S1:=StrToInt(MaskEdit2.Text[1]);
  S2:=StrToInt(MaskEdit2.Text[3])*10+StrToInt(MaskEdit2.Text[4]);
  if S2>=60 then  exit;
  st_Betta:=MaskEdit2.Text[1]+chr($B0)+MaskEdit2.Text[3]+MaskEdit2.Text[4]+chr($27);
  aBetta:=S1+S2/60;
  MaskEdit2.Font.Color:=clWindowText;
end;

procedure TNMain.SpeedButton18Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='WS of Left Operator TM-2322-2 (A9)';
  fm_ARM.Device_ID:=2;
  fm_ARM.ARM:=TARM(ArrDevice[2]);
  fm_ARM.ShowModal;
end;

procedure TNMain.SpeedButton19Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='WS of Right Operator TM-2322-2 (A10)';
  fm_ARM.Device_ID:=3;
  fm_ARM.ARM:=TARM(ArrDevice[3]);
  fm_ARM.ShowModal;
end;

procedure TNMain.SpeedButton33Click(Sender: TObject);
begin
  fl_IndependentEscort:=false;
  SendEscortMode;
  Shape43.Brush.Color:=Color_G;
  Shape44.Brush.Color:=Color_S;
  Point_Brush;
end;

procedure TNMain.SpeedButton3Click(Sender: TObject);
var   res:boolean;
begin
  if not OpenDialog1.Execute then  exit;
  res:=PlayFilterGraph(ExtractFileName(OpenDialog1.FileName));
  if res then FilterGRaph1.Play;
end;

procedure TNMain.Sp18Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_UPS,fm_UPS);
  fm_UPS.Caption:='UPS TM-2411-1 (A5/A8)';
  fm_UPS.Device_ID:=18;
  fm_UPS.ShowModal;
end;

procedure TNMain.Sp19Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_UPS,fm_UPS);
  fm_UPS.Caption:='UPS TM-2411-1 (A5/A9)';
  fm_UPS.Device_ID:=19;
  fm_UPS.ShowModal;
end;

procedure TNMain.Sp1Click(Sender: TObject);
var Ex:byte;
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='WS of Pivotal Operator TM-2322-2 (A7)';
  fm_ARM.Device_ID:=1;
  fm_ARM.ARM:=TARM(ArrDevice[1]);
  fm_ARM.ShowModal;
end;

procedure TNMain.sp1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TPanel).BevelInner:=bvNone;
  (Sender as TPanel).BevelOuter:=bvLowered;
end;

procedure TNMain.sp1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TPanel).BevelInner:=bvRaised;
  (Sender as TPanel).BevelOuter:=bvRaised;
end;

procedure TNMain.Sp20Click(Sender: TObject);
var str:string;
    MStr:string;
    Fstr:string;
    OLDSeparator:char;
begin
  Application.CreateForm(Tfm2320,fm2320);
  if not SI then
  begin
    if mile=0 then exit;
    OLDSeparator:=SysUtils.DecimalSeparator;
    SysUtils.DecimalSeparator:='.';
    MStr:=FloatToStrF(mile,ffFixed,10,6);
    FStr:=FloatToStrF(foot,ffFixed,10,6);
    Str:='Select Protocol_ID,N as num,Drl,Dnrl,Dntv,LRrl,LRtv,UDrl,UDtv,DTime,Tracking,'
        +'CAST(CAST(Drl/' +Mstr+' as decimal(10,3)) as Char(12)) as fDrl,'
        +'CAST(CAST(Dnrl/'+Mstr+' as decimal(10,3)) as Char(12)) as fDnrl,'
        +'CAST(CAST(LRrl/'+Fstr+' as decimal(10,1)) as Char(12)) as fLRrl,'
        +'CAST(CAST(UDrl/'+Fstr+' as decimal(10,1)) as Char(12)) as fUDrl,'
        +'CAST(CAST(Dntv/'+Mstr+' as decimal(10,3)) as Char(12)) as fDntv,'
        +'CAST(CAST(LRtv/'+Fstr+' as decimal(10,1)) as Char(12)) as fLRtv,'
        +'CAST(CAST(UDtv/'+Fstr+' as decimal(10,1)) as Char(12)) as fUDtv,'
        +'CONVERT(Char,DTime,114) as fDTime,'
        +'CONVERT(Char,Tracking,114) as fTracking,'
        +'(select MAX(N) from ProtocolDate where Protocol_ID = :Protocol_ID) as NumMAX '
        +'from ProtocolDate '
        +'where Protocol_ID = :Protocol_ID '
        +'order by N ';
    SysUtils.DecimalSeparator:=OldSeparator;
    fm2320.QData.SQL.Clear;
    fm2320.QData.SQL.Add(str);
  end;
  fm2320.QProtocol.Open;
  fm2320.ShowModal;
end;

procedure TNMain.Sp21Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5402,fm5402);
  fm5402.Caption:='RS-485 Channel Splitter EM-5402 (A5/A6/A17)';
  fm5402.Device_ID:=21;
  fm5402.ShowModal;
end;

procedure TNMain.Sp22Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_TM_2404,fm_TM_2404);
  fm_TM_2404.ShowModal;
end;

procedure TNMain.Sp26Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A7)';
  fm2437.Device_ID:=26;
  fm2437.ShowModal;
end;

procedure TNMain.Sp27Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A8)';
  fm2437.Device_ID:=27;
  fm2437.ShowModal;
end;

procedure TNMain.Sp28Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A9)';
  fm2437.Device_ID:=28;
  fm2437.ShowModal;
end;

procedure TNMain.Sp29Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2437,fm2437);
  fm2437.Caption:='Matching Unit EM-2437 (A5/A6/A10)';
  fm2437.Device_ID:=29;
  fm2437.ShowModal;
end;

procedure TNMain.Sp2Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='WS of Left Operator TM-2322-1 (A14)';
  fm_ARM.Device_ID:=2;
  fm_ARM.ARM:=TARM(ArrDevice[2]);
  fm_ARM.ShowModal;
end;

procedure TNMain.Sp30Click(Sender: TObject);
begin
  Application.CreateForm(Tfm7401,fm7401);
  fm7401.Caption:='Video Matrix Switch EM-7401 (A5/A6/A12)';
  fm7401.Device_ID:=30;
  fm7401.ShowModal;
end;

procedure TNMain.Sp31Click(Sender: TObject);
begin
  Application.CreateForm(Tfm7401,fm7401);
  fm7401.Caption:='Video Matrix Switch EM-7401 (A5/A6/A13)';
  fm7401.Device_ID:=31;
  fm7401.ShowModal;
end;

procedure TNMain.sp38Click(Sender: TObject);
begin
  Application.CreateForm(TOLS,OLS);
  OLS.ShowModal;
end;

procedure TNMain.Sp3Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='WS of Right Operator TM-2322-1 (A15)';
  fm_ARM.Device_ID:=3;
  fm_ARM.ARM:=TARM(ArrDevice[3]);
  fm_ARM.ShowModal;
end;

procedure TNMain.sp40Click(Sender: TObject);
begin
  Application.CreateForm(TTelemetric,Telemetric);
  Telemetric.ShowModal;
end;

procedure TNMain.sp45Click(Sender: TObject);
begin
  Application.CreateForm(TRACS,RACS);
  RACS.ShowModal;
end;

procedure TNMain.Sp7Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_KU,fm_KU);
  fm_KU.Device_ID:=7;
  fm_KU.Caption:='TVD1 (Left) TM-2220-1 (A1)';
  fm_KU.ShowModal;
end;

procedure TNMain.Sp9Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_KU,fm_KU);
  fm_KU.Device_ID:=9;
  fm_KU.Caption:='TVD4 (Right) TM-2220-1 A(4)';
  fm_KU.ShowModal;
end;

procedure TNMain.Sp10Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_KU,fm_KU);
  fm_KU.Device_ID:=10;
  fm_KU.Caption:='TVD3 (Axial2) TM-2220-1 (A3)';
  fm_KU.ShowModal;
end;

procedure TNMain.Sp11Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5402,fm5402);
  fm5402.Caption:='RS-485 Channel Splitter EM-5402 (A5/A6/A16)';
  fm5402.Device_ID:=11;
  fm5402.ShowModal;
end;

procedure TNMain.Sp23Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5401,fm5401);
  fm5401.Caption:='Interface Unit EM-5401 (A5/A6/A14)';
  fm5401.Device_ID:=23;
  fm5401.ShowModal;
end;

procedure TNMain.Sp24Click(Sender: TObject);
begin
  Application.CreateForm(Tfm5401,fm5401);
  fm5401.Caption:='Interface Unit EM-5401 (A5/A6/A15)';
  fm5401.Device_ID:=24;
  fm5401.ShowModal;
end;

procedure TNMain.Sp25Click(Sender: TObject);
begin
  Application.CreateForm(Tfm3401,fm3401);
  fm3401.Caption:='Mixer-Generator EM-3401 (A5/A6/A11)';
  fm3401.Device_ID:=25;
  fm3401.ShowModal;
end;

procedure TNMain.Sp12Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2409,fm2409);
  fm2409.Caption:='Gateways Module TM-2409-1 (A5/A4)';
  fm2409.Device_ID:=12;
  fm2409.ShowModal;
end;

procedure TNMain.Sp13Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2409,fm2409);
  fm2409.Caption:='Gateways Module TM-2409-1 (A5/A5)';
  fm2409.Device_ID:=13;
  fm2409.ShowModal;
end;

procedure TNMain.Sp14Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2410,fm2410);
  fm2410.Caption:='Network Switch TM-2410 (A5/A2)';
  fm2410.Device_ID:=14;
  fm2410.ShowModal;
end;

procedure TNMain.Sp15Click(Sender: TObject);
begin
  Application.CreateForm(Tfm2410,fm2410);
  fm2410.Caption:='Network Switch TM-2410 (A5/A3)';
  fm2410.Device_ID:=15;
  fm2410.ShowModal;
end;

procedure TNMain.Sp16Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_ARM,fm_ARM);
  fm_ARM.Caption:='Videorecording Device TM-2408-1 (A8)';
  fm_ARM.Device_ID:=16;
  fm_ARM.ARM:=TARM(ArrDevice[16]);
  fm_ARM.ShowModal;
end;

procedure TNMain.Sp17Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_UPS,fm_UPS);
  fm_UPS.Caption:='UPS TM-2411-1 (A5/A7)';
  fm_UPS.Device_ID:=17;
  fm_UPS.ShowModal;
end;

procedure TNMain.Sp8Click(Sender: TObject);
begin
  Application.CreateForm(Tfm_KU,fm_KU);
  fm_KU.Device_ID:=8;
  fm_KU.Caption:='TVD2 (Axial1) TM-2220-1 (A2)';
  fm_KU.ShowModal;
end;

procedure TNMain.SpeedButton42Click(Sender: TObject);
begin
  fl_IndependentEscort:=true;
  SendEscortMode;
  Shape43.Brush.Color:=Color_S;
  Shape44.Brush.Color:=Color_G;
  Point_Brush;
end;

procedure TNMain.SpeedButton56Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then exit;
  Panel1.Visible:=true;
 // VideoWindow1.Visible:=true;
  PlayFilterGraph(ExtractFileName(OpenDialog1.FileName));
  FilterGRaph1.Tag:=1;
end;

procedure TNMain.SpeedButton57Click(Sender: TObject);
begin
  FilterGRaph1.Stop;
  StartFilterGraph;
  FilterGraph1.Tag:=0;
end;

procedure TNMain.SpeedButton5Click(Sender: TObject);
begin
  Track:=0;
  Shape4.Brush.Color:=Color_G;
  Shape5.Brush.Color:=clSilver;
end;

procedure TNMain.SpeedButton6Click(Sender: TObject);
begin
  Track:=1;
  Shape5.Brush.Color:=Color_G;
  Shape4.Brush.Color:=clSilver;
end;

procedure TNMain.SpeedButton7Click(Sender: TObject);
begin
if GraphPrepare then FilterGraph1.Play;

end;

procedure TNMain.SpeedButton8Click(Sender: TObject);
begin
  RESCh:=1;
  Shape3.Brush.Color:=Color_G;
  Shape8.Brush.Color:=Color_S;
end;

procedure TNMain.SpeedButton9Click(Sender: TObject);
begin
  RESCh:=2;
  Shape8.Brush.Color:=Color_G;
  Shape3.Brush.Color:=Color_S;
end;

procedure TNMain.TVD2Click(Sender: TObject);
var pms:^Tmass;
begin
  //добавить команду на переключение коммутатора для центрального оператора
  New(pms);
  pms^[1]:=30;
  pms^[2]:=0;
  pms^[3]:=Command_EM7401[8].cComandCount;
  pms^[4]:=8;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[30].cAdress;
  pms^[8]:=Command_EM7401[8].cComandCount-2;
  pms^[9]:=Command_EM7401[8].cCommand;
  pms^[10]:=2 shl 4 + 0;
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  //добавить команду на переключение коммутатора для микшера-генератора
  New(pms);
  pms^[1]:=30;
  pms^[2]:=0;
  pms^[3]:=Command_EM7401[8].cComandCount;
  pms^[4]:=8;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[30].cAdress;
  pms^[8]:=Command_EM7401[8].cComandCount-2;
  pms^[9]:=Command_EM7401[8].cCommand;
  pms^[10]:=0 shl 4 + 0;
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

procedure TNMain.ServTVD(var Msg: TMessage);
var mIn,mOut:byte;
    cr:TCross;
begin
  mIn:=Msg.WParam;
  mOut:=Msg.LParam;
  if mOut<>2 then exit;
  if mIn=1 then
  begin
    cs_ArrDevice[30].Enter; try cr:=TEM7401((ArrDevice[30])).cross; finally cs_ArrDevice[30].Leave; end;
    mIn:=cr[3] and $0F;
  end;  
  case mIn of
  //переключение TVD2
  0: begin
       Shape6.Brush.Color:=Color_G;
       Shape7.Brush.Color:=clGray;
       t2.Caption:='TVD2';
       t5.Caption:='TVD2';
       t8.Caption:='TVD2';
       Axial:=8;
     end;
  //переключение TVD3
  3: begin
       Shape6.Brush.Color:=clGray;
       Shape7.Brush.Color:=Color_G;
       t2.Caption:='TVD3';
       t5.Caption:='TVD3';
       t8.Caption:='TVD3';
       Axial:=10;
     end;
  end;
end;

procedure TNMain.TVD3Click(Sender: TObject);
var pms:^Tmass;
begin
  //добавить команду на переключение коммутатора для центрального оператора
  New(pms);
  pms^[1]:=30;
  pms^[2]:=0;
  pms^[3]:=Command_EM7401[8].cComandCount;
  pms^[4]:=8;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[30].cAdress;
  pms^[8]:=Command_EM7401[8].cComandCount-2;
  pms^[9]:=Command_EM7401[8].cCommand;
  pms^[10]:=2 shl 4 + 3;
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
  //добавить команду на переключение коммутатора для микшера-генератора
  New(pms);
  pms^[1]:=30;
  pms^[2]:=0;
  pms^[3]:=Command_EM7401[8].cComandCount;
  pms^[4]:=8;
  pms^[5]:=0;
  pms^[6]:=0;
  pms^[7]:=ComDev[30].cAdress;
  pms^[8]:=Command_EM7401[8].cComandCount-2;
  pms^[9]:=Command_EM7401[8].cCommand;
  pms^[10]:=0 shl 4 + 3;
  pms^[11]:=pms^[7]+pms^[8]+pms^[9]+pms^[10];
  //поставить в очередь на выполнение
  cs_External.Enter; try ExternalList.Add(pms) finally cs_External.Leave; end;
end;

procedure TNMain.M1Click(Sender: TObject);
begin
  with ImageBase.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageBase.ClientRect);
  end;
  with ImageConf1.Canvas do
  begin
    Brush.Color:=Color_G;
    FillRect(ImageConf1.ClientRect);
  end;
  with ImageConf2.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageConf2.ClientRect);
  end;
  SysConfig:=1;
  if koor[9].Y>koor[Axial].Y then BaseCalc(9,Axial)
  else  BaseCalc(Axial,9);
end;

procedure TNMain.M2Click(Sender: TObject);
var i:integer;
begin
  for i:=1 to 6 do
  TPanel(NMain.FindComponent('t'+IntToStr(i))).Color:=clBtnFace;
  for i:=7 to 9 do
  TPanel(NMain.FindComponent('t'+IntToStr(i))).Color:=Color_G;
  for i:=10 to 12 do
  TPanel(NMain.FindComponent('t'+IntToStr(i))).Color:=clBtnFace;
  SysConfig:=2;
  if koor[9].Y>koor[7].Y then BaseCalc(9,7)
  else  BaseCalc(7,9);
end;

procedure TNMain.M3Click(Sender: TObject);
begin
  with ImageBase.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageBase.ClientRect);
  end;
  with ImageConf1.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageConf1.ClientRect);
  end;
  with ImageConf2.Canvas do
  begin
    Brush.Color:=Color_G;
    FillRect(ImageConf2.ClientRect);
  end;
  SysConfig:=3;
  if koor[Axial].Y>koor[7].Y then BaseCalc(Axial,7)
  else  BaseCalc(7,Axial);
end;

procedure TNMain.MaskEdit1Change(Sender: TObject);
begin
  MaskEdit1.Font.Color:=Color_R;
end;

procedure TNMain.MaskEdit2Change(Sender: TObject);
begin
  MaskEdit2.Font.Color:=Color_R;
end;

procedure TNMain.MBClick(Sender: TObject);
begin
  with ImageBase.Canvas do
  begin
    Brush.Color:=Color_G;
    FillRect(ImageBase.ClientRect);
  end;
  with ImageConf1.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageConf1.ClientRect);
  end;
  with ImageConf2.Canvas do
  begin
    Brush.Color:=clBtnFace;
    FillRect(ImageConf2.ClientRect);
  end;
  SysConfig:=0;
  if koor[9].Y>koor[7].Y then BaseCalc(9,7)
  else  BaseCalc(7,9);
end;

procedure TNMain.MTKPaint;
procedure Arrow(x0,y0:integer;direction:byte;TC:TColor;Im:TImage);
var TP:Array [1..3] of TPoint;
    k1,k2,k3,k4:integer;
begin
  //direction =1 <
  //direction =2 >
  //direction =3 /\
  //direction =4 \/
  case direction of
  1:begin k1:=8; k2:=8; k3:=5; k4:=-5; end;
  2:begin k1:=-8; k2:=-8; k3:=5; k4:=-5; end;
  3:begin k1:=5; k2:=-5; k3:=8; k4:=8; end;
  4:begin k1:=5; k2:=-5; k3:=-8; k4:=-8; end;
  end;
  TP[2].X:=x0;
  TP[2].Y:=y0;
  TP[1].X:=x0+k1;
  TP[3].X:=x0+k2;
  TP[1].Y:=y0+k3;
  TP[3].Y:=y0+k4;
  with IM.Canvas do
  begin
    Pen.Color:=TC;
    Pen.Width:=2;
    Polyline(TP);
  end;
end;
var x1,x2,y1,y2:integer;
    i:integer;
begin
  Shape1.Brush.Color:=Color_B;
  Shape2.Brush.Color:=Color_B;
  Label131.Color:=Color_B;
  Label132.Color:=Color_B;
  for i:=1 to 70 do
     if NMain.FindComponent('L'+IntToStr(100+i))<>nil then
            TLabel(NMain.FindComponent('L'+IntToStr(100+i))).Color:=Color_B;
  with iL3.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iL3.ClientRect);
    Pen.Width:=3;
    x1:=0;
    x2:=30;
    Pen.Color:=clBlack;
    y1:=10;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clBlue;
    y1:=40;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clPurple;
    y1:=70;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clGreen;
    y1:=100;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;
  with iL2.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iL2.ClientRect);
    Pen.Width:=3;
    x1:=0;
    x2:=30;
    Pen.Color:=clBlack;
    y1:=10;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clBlue;
    y1:=40;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clGreen;
    y1:=70;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clPurple;
    y1:=100;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;
  with iL1.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iL1.ClientRect);
    Pen.Width:=3;
    x1:=0;
    x2:=30;
    Pen.Color:=clBlack;
    y1:=10;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clBlue;
    y1:=40;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clGreen;
    y1:=70;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clOlive;
    y1:=100;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    Pen.Color:=clPurple;
    y1:=130;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;
  with iMTK.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iMTK.ClientRect);
    Pen.Width:=6;
    //шина
    Pen.Color:=clBlue;
    y1:=p123.Top+p123.Height;
    y2:=p123.Top+p123.Height+30;
    x1:=p123.Left+Round(p123.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p124.Top+p124.Height;
    y2:=p124.Top+p124.Height+30;
    x1:=p124.Left+Round(p123.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    x1:=p126.Left+Round(p126.Width/2);
    x2:=p127.Left+Round(p127.Width/2);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    //подключения к шине
    Pen.Width:=3;
    y1:=p126.Top+p126.Height+30+2;
    y2:=p126.Top+p126.Height;
    x1:=p126.Left+Round(p126.Width/2)-1;
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p128.Top+p128.Height+30;
    y2:=p128.Top+p128.Height;
    x1:=p128.Left+Round(p128.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p130.Top+p130.Height+30;
    y2:=p130.Top+p130.Height;
    x1:=p130.Left+Round(p130.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p131.Top+p131.Height+30;
    y2:=p131.Top+p131.Height;
    x1:=p131.Left+Round(p131.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p129.Top+p129.Height+30;
    y2:=p129.Top+p129.Height;
    x1:=p129.Left+Round(p129.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p127.Top+p127.Height+30+2;
    y2:=p127.Top+p127.Height;
    x1:=p127.Left+Round(p127.Width/2)+1;
    MoveTo(x1,y1);
    LineTo(x1,y2);

    //бпи  4
    Pen.Color:=clPurple;
    y1:=p126.Top;
    y2:=p126.Top-10;
    x1:=p126.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p135.Left+Round(p135.Width/2);
    LineTo(x2,y2);
    y1:=p135.Top;
    LineTo(x2,y1);

    //бри 3
    Pen.Color:=clPurple;
    y1:=p126.Top;
    y2:=p126.Top-20;
    x1:=p126.Left+p126.Width-20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p134.Left+Round(p134.Width/2);
    LineTo(x2,y2);
    y1:=p134.Top;
    LineTo(x2,y1);

    //бпи 6
    Pen.Color:=clPurple;
    y1:=p127.Top;
    y2:=p127.Top-20;
    x1:=p127.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p137.Left+Round(p137.Width/2);
    LineTo(x2,y2);
    y1:=p137.Top;
    LineTo(x2,y1);

    //бри 5
    y1:=p127.Top;
    y2:=p127.Top-10;
    x1:=p127.Left+p127.Width-20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p136.Left+Round(p136.Width/2);
    LineTo(x2,y2);
    y1:=p136.Top;
    LineTo(x2,y1);

    //бпи 1
    Pen.Color:=clPurple;
    y1:=p123.Top+p123.Height;
    y2:=y1+60;
    x1:=p123.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p124.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p132.Left+p132.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p132.Left+p132.Width div 2;
    x2:=p124.Left+20;
    y1:=p123.Top+p123.Height+60;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    //бпи 2
    Pen.Color:=clPurple;
    y1:=p123.Top+p123.Height;
    y2:=y1+60;
    y2:=y1+45;
    x1:=p123.Left+p123.Width-20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p124.Left+p124.Width-20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p133.Left+p133.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p133.Left+p133.Width div 2;
    x2:=p123.Left+p123.Width-20;
    y1:=p123.Top+p123.Height+45;
    MoveTo(x1,y1);
    LineTo(x2,y1);
  end;

  with iMTK.Canvas do
  begin
    Pen.Color:=clWhite;
    Pen.Width:=3;
    x1:=p102.Left+Round(p102.Width/2);
    y1:=0;
    y2:=p125.Top-120;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    y1:=p133.Top+p133.Height+110;
    y2:=iMTK.Height;
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p125.Top-120;
    x1:=p134.Left-20;
    x2:=p137.Left+p137.Width+20;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y2:=p133.Top+p133.Height+110;
    LineTo(x2,y2);

    x1:=p134.Left-20;
    LineTo(x1,y2);

    y1:=p125.Top-120;
    LineTo(x1,y1);

    Pen.Color:=clBlack;
    Pen.Style:=psSolid;
    y1:=p114.Top+p114_Lan1.Top+Round(p114_Lan1.Height/2);
    x1:=p102.Left;
    x2:=p114.Left+p114.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan3.Top+Round(p114_Lan3.Height/2);
    x1:=p101.Left;
    x2:=p114.Left+p114.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan5.Top+Round(p114_Lan5.Height/2);
    x1:=p103.Left;
    x2:=p114.Left+p114.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan7.Top+Round(p114_Lan7.Height/2);
    x1:=p116.Left;
    x2:=p114.Left+p114.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p115.Top+p115_Lan1.Top+Round(p115_Lan1.Height/2);
    x1:=p102.Left+p102.Width;
    x2:=p115.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p115.Top+p115_Lan3.Top+Round(p115_Lan3.Height/2);
    x1:=p101.Left+p101.Width;
    x2:=p115.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p115.Top+p115_Lan5.Top+Round(p115_Lan5.Height/2);
    x1:=p103.Left+p103.Width;
    x2:=p115.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p115.Top+p115_Lan7.Top+Round(p115_Lan7.Height/2);
    x1:=p116.Left+p116.Width;
    x2:=p115.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan4.Top+Round(p114_Lan4.Height/2);
    x1:=p117.Left+p117.Width;
    x2:=p114.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan6.Top+Round(p114_Lan6.Height/2);
    x1:=p119.Left+p119.Width;
    x2:=p114.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p114.Top+p114_Lan8.Top+Round(p114_Lan8.Height/2);
    x1:=p112.Left+p112Exh.Left+Round(P112Exh.Width/2);
    x2:=p114.Left;
    MoveTo(x2,y1);
    LineTo(x1,y1);

    y2:=p112.Top;
    LineTo(x1,y2);

    y1:=p115.Top+p115_Lan4.Top+Round(p115_Lan4.Height/2);
    x1:=p118.Left;
    x2:=p115.Left+p115.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p120.Top+Round(p120.Height/2);
    x1:=p120.Left;
    x2:=p114.Left;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p115.Top+p115_Lan8.Top+Round(p115_Lan8.Height/2);
    x1:=p113.Left+p113Exh.Left+Round(p113Exh.Width/2);
    x2:=p115.Left+p115.Width;
    MoveTo(x2,y1);
    LineTo(x1,y1);

    y2:=p113.Top;
    LineTo(x1,y2);
    Pen.Color:=clBlue;
    y1:=p112.Top+p112.Height;
    y2:=p111.Top;
    x1:=p112.Left+P112_Port5.Left+Round(P112_Port5.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p113.Top+p113.Height;
    y2:=p121.Top;
    x1:=p113.Left+P113_Port5.Left+Round(P113_Port5.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p113.Top+p113.Height;
    y2:=p124.Top-50;
    x1:=p113.Left+P113_Port4.Left+Round(P113_Port4.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    x2:=p124.Left+Round(p124.Width/2);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y1:=p124.Top;
    MoveTo(x2,y2);
    LineTo(x2,y1);

    y1:=p112.Top+p112.Height;
    y2:=P123.Top-40;
    x1:=p112.Left+P112_Port4.Left+Round(P112_Port4.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    x2:=p123.Left+Round(p123.Width/2);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y1:=p123.Top;
    MoveTo(x2,y2);
    LineTo(x2,y1);


    y1:=p112.Top+p112.Height;
    y2:=P125.Top-60;
    x1:=p112.Left+P112_Port6.Left+Round(P112_Port6.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    x2:=p125.Left+Round(p125.Width/2);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y1:=p125.Top;
    MoveTo(x2,y2);
    LineTo(x2,y1);

    x1:=p111.Left+p111_Ch1.Left+Round(p111_Ch1.Width/2);
    y1:=p111.Top+p111.Height;
    y2:=p108.Top+Round(p108.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p108.Left+p108.Width;
    LineTo(x2,y2);

    x1:=p111.Left+p111_Ch2.Left+Round(p111_Ch2.Width/2);
    y1:=p111.Top+p111.Height;
    y2:=p109.Top+Round(p109.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p109.Left;
    LineTo(x2,y2);

    x1:=p121.Left+p121_Ch3.Left+Round(p121_Ch3.Width/2);
    y1:=p121.Top+p121.Height;
    y2:=p107.Top+Round(p107.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p107.Left+p107.Width;
    LineTo(x2,y2);

    x1:=p121.Left+p121_Ch4.Left+Round(p121_Ch4.Width/2);
    y1:=p121.Top+p121.Height;
    y2:=p110.Top+Round(p110.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p110.Left;
    LineTo(x2,y2);

    if Luna.Visible then
    begin
      x1:=p112.Left+p112_Port7.Left+p112_Port7.Width div 2;
      y1:=p112.Top+p112.Height;
      y2:=Luna.Top+Luna.Height div 2;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=Luna.Left;
      LineTo(x2,y2);

      x1:=p113.Left+p113_Port7.Left+p113_port7.Width div 2;
      y1:=p113.Top+p113.Height;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=Luna.Left+Luna.Width;
      LineTo(x2,y2);

      Pen.Color:=clOlive;
      x1:=p125.Left+p125.Width div 2-10;
      y1:=p125.Top+p125.Height;
      y2:=y1+80;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=p123.Left+p123.Width div 2+20;
      LineTo(x2,y2);
      LineTo(x2,y1);
      x1:=p125.Left+p125.Width div 2+10;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=p124.Left+p124.Width div 2-20;
      LineTo(x2,y2);
      LineTo(x2,y1);
    end;

    if PRLK.Visible then
    begin
      Pen.Color:=clBlue;
      x1:=p112.Left+p112_Port8.Left+p112_Port8.Width div 2;
      y1:=p112.Top+p112.Height;
      y2:=PRLK.Top+PRLK.Height div 2;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=PRLK.Left;
      LineTo(x2,y2);

      x1:=p113.Left+p113_Port8.Left+p113_port8.Width div 2;
      y1:=p113.Top+p113.Height;
      MoveTo(x1,y1);
      LineTo(x1,y2);
      x2:=PRLK.Left+PRLK.Width;
      LineTo(x2,y2);
    end;

    if Telem.Visible then
    begin
      Pen.Color:=clGreen;
      x1:=p102.Left;
      x2:=x1-30;
      y1:=p102.Top+p102_x9.Top+p102_x9.Height div 2;
      MoveTo(x1,y1);
      LineTo(x2,y1);
      y2:=Telem.Top+Telem.Height div 2;
      LineTo(x2,y2);
      x1:=Telem.Left;
      LineTo(x1,y2);

      x1:=p101.Left+p101.Width;
      x2:=x1+30;
      y1:=p101.Top+p101_x10.Top+p101_x10.Height div 2;
      MoveTo(x1,y1);
      LineTo(x2,y1);
      y2:=Telem.Top+Telem.Height div 2;
      LineTo(x2,y2);
      x1:=Telem.Left+Telem.Width;
      LineTo(x1,y2);
    end else
    begin
      p102_X9.Visible:=false;
      p101_X10.Visible:=false;
    end;
  end;

  with iMedia.Canvas do
  begin
  //видео - черный
  //ССП - Тёмно-синий
  //звук - зелёный
    Brush.Color:=Color_B;
    FillRect(iMedia.ClientRect);
    Pen.Color:=Color_W;
    Pen.Width:=1;
    Rectangle(225,40,1650,1000);

    Pen.Color:=clBlack;
    Pen.Width:=3;

    x1:=p208.Left+p208.Width;
    x2:=p226.Left;
    y1:=p208.Top+Round(p208.Height/2)+2;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    x1:=p209.Left+p209.Width;
    x2:=p226.Left;
    y1:=p209.Top+Round(p209.Height/2)-2;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    x1:=p207.Left+p207.Width;
    x2:=p227.Left;
    y1:=p207.Top+Round(p207.Height/2)+2;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    x1:=p210.Left+p210.Width;
    x2:=p227.Left;
    y1:=p210.Top+Round(p210.Height/2)-2;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    Pen.Color:=clBlue;

    x1:=p226.Left+p226.Width;
    x2:=x1+20;
    y1:=p226.Top+p226_Ch2.Top+33;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p226.Top-20;
    LineTo(x2,y2);
    x1:=p226.Left-20;
    LineTo(x1,y2);
    y1:=p208.Top+Round(p208.Height/2)-2;
    LineTo(x1,y1);
    x2:=p208.Left+p208.Width;
    LineTo(x2,y1);

    x1:=p226.Left+p226.Width;
    x2:=x1+20;
    y1:=p226.Top+p226_Ch4.Top+33;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p226.Top+p226.Height+20;
    LineTo(x2,y2);
    x1:=p226.Left-20;
    LineTo(x1,y2);
    y1:=p209.Top+Round(p209.Height/2)+2;
    LineTo(x1,y1);
    x2:=p209.Left+p209.Width;
    LineTo(x2,y1);

    x1:=p227.Left+p227.Width;
    x2:=x1+20;
    y1:=p227.Top+p227_Ch2.Top+33;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p227.Top-20;
    LineTo(x2,y2);
    x1:=p227.Left-20;
    LineTo(x1,y2);
    y1:=p207.Top+Round(p207.Height/2)-2;
    LineTo(x1,y1);
    x2:=p207.Left+p207.Width;
    LineTo(x2,y1);

    x1:=p227.Left+p227.Width;
    x2:=x1+20;
    y1:=p227.Top+p227_Ch4.Top+33;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p227.Top+p227.Height+20;
    LineTo(x2,y2);
    x1:=p227.Left-20;
    LineTo(x1,y2);
    y1:=p210.Top+Round(p210.Height/2)+2;
    LineTo(x1,y1);
    x2:=p210.Left+p210.Width;
    LineTo(x2,y1);

    Pen.Color:=clBlack;

    x1:=p226.Left+p226.Width;
    x2:=x1+80;
    y1:=p226.Top+p226_Ch1.Top+11;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p226.Top+p226_Ch3.Top+11;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    x1:=p227.Left+p227.Width;
    x2:=x1+80;
    y1:=p227.Top+p227_Ch1.Top+11;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=p227.Top+p227_Ch3.Top+11;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    Pen.Width:=6;
    Pen.Color:=clBlack;

    y1:=p227.Top+p227_Ch3.Top+10;
    y2:=p230.Top;
    MoveTo(x2,y1);
    LineTo(x2,y2);
    x1:=p230.Left-70;
    LineTo(x1,y2);
    y1:=p230.Top+p230_In4.Top+Round(p230_In4.Height/2)-1;
    LineTo(x1,y1);

    y1:=p231.Top+5;
    x1:=p227.Left+p227.Width+80;
    x2:=p231.Left-70;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p231.Top+p231_In4.Top+Round(p231_In4.Height/2)-1;
    LineTo(x2,y2);

    Pen.Width:=3;

    x1:=p230.Left-70;
    x2:=p230.Left;
    y1:=p230.Top+p230_In1.Top+Round(p230_In1.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In2.Top+Round(p230_In2.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In3.Top+Round(p230_In3.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In4.Top+Round(p230_In4.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x1:=p231.Left-70;
    x2:=p231.Left;
    y1:=p231.Top+p231_In1.Top+Round(p231_In1.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In2.Top+Round(p231_In2.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In3.Top+Round(p231_In3.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In4.Top+Round(p231_In4.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);

    Pen.Color:=clPurple;

    x1:=p230.Left+p230.Width;
    x2:=x1+50;
    y1:=p230.Top+p230_Out1.Top+Round(p230_Out1.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p230.Top-40;
    LineTo(x2,y2);
    x1:=p225.Left-50;
    LineTo(x1,y2);
    y1:=p225.Top+p225_1.Top+Round(p225_1.Height/2);
    LineTo(x1,y1);
    x2:=p225.Left;
    LineTo(x2,y1);

    y1:=p225.Top+p225_2.Top+Round(p225_2.Height/2);
    x1:=p225.Left+p225.Width;
    x2:=x1+130;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p230.Top+p230_In5.Top+Round(p230_In5.Height/2);
    LineTo(x2,y2);
    x1:=p230.Left;
    LineTo(x1,y2);

    y1:=p225.Top+p225_3.Top+Round(p225_3.Height/2);
    x1:=p225.Left+p225.Width;
    x2:=x1+130;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p231.Top+p231_In5.Top+Round(p231_In5.Height/2);
    LineTo(x2,y2);
    x1:=p231.Left;
    LineTo(x1,y2);

    Pen.Width:=6;
    Pen.Color:=clPurple;

    x1:=p225.Left+p225.Width+165;
    y1:=p230.Top+p230_In9.Top+Round(p230_In9.Height/2)+1;
    y2:=px2.Top-80;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=px2.Left+Round(px2.Width/2)+1;
    LineTo(x2,y2);
    x2:=px9.Left+Round(px9.Width/2)-1;
    MoveTo(x1,y2);
    LineTo(x2,y2);
    Pen.Width:=3;
    y1:=px2.Top;
    y2:=px2.Top-80;
    x1:=px2.Left+Round(px2.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px9.Left+Round(px9.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px6.Left+Round(px6.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px4.Left+Round(px4.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    Pen.Width:=3;

    x1:=p230.Left;
    x2:=p225.Left+p225.Width+165;
    y1:=p230.Top+p230_In9.Top+Round(p230_In9.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In11.Top+Round(p230_In11.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In13.Top+Round(p230_In13.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_In15.Top+Round(p230_In15.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x1:=p231.Left;
    x2:=p225.Left+p225.Width+165;
    y1:=p231.Top+p231_In9.Top+Round(p231_In9.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In11.Top+Round(p231_In11.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In13.Top+Round(p231_In13.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_In15.Top+Round(p231_In15.Height/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);

    Pen.Color:=clBlue;
    Pen.Width:=6;

    x1:=p223.Left+p223_S1.Left+21;
    x2:=p223.Left+p223.Width+19;
    y1:=p224.Top-Round((p224.Top-p223.Top-p223.Height)/2);
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p226.Top+p226_Ch2.Top+21;
    y2:=p227.Top+p227_Ch4.Top+19;
    MoveTo(x2,y2);
    LineTo(x2,y1);

    Pen.Width:=3;

    x1:=p226.Left;
    y1:=p226.Top+p226_Ch2.Top+20;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    y1:=p226.Top+p226_Ch4.Top+20;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    y1:=p227.Top+p227_Ch2.Top+20;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    y1:=p227.Top+p227_Ch4.Top+20;
    MoveTo(x2,y1);
    LineTo(x1,y1);

    y1:=p223.Top+p223.Height;
    y2:=p224.Top;
    x1:=p223.Left+p223_S1.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p223.Left+p223_S2.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p223.Left+p223_S3.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p223.Left+p223_S4.Left+20;
    MoveTo(x1,y1);
    LineTo(x1,y2);

    Pen.Color:=clPurple;
    x1:=p230.Left+p230.Width;
    x2:=x1+80;
    y1:=p230.Top+p230_Out7.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x1:=y1;
    y1:=p228.Top+p228_Ch1.Top+20;
    y2:=p228.Top+p228_Ch2.Top+20;
    Pen.Color:=clBlack;
    LineTo(x2,y1);
    MoveTo(x2,x1);
    Pen.Color:=clGreen;
    LineTo(x2,y2);
    x1:=p228.Left;
    MoveTo(x2,y2);
    LineTo(x1,y2);
    Pen.Color:=clBlack;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    Pen.Color:=clPurple;
    x1:=p231.Left+p231.Width;
    x2:=x1+80;
    y1:=p231.Top+p231_Out7.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x1:=y1;
    y1:=p229.Top+p229_Ch3.Top+20;
    y2:=p229.Top+p229_Ch4.Top+20;
    Pen.Color:=clGreen;
    LineTo(x2,y2);
    MoveTo(x2,x1);
    Pen.Color:=clBlack;
    LineTo(x2,y1);
    x1:=p229.Left;
    MoveTo(x2,y2);
    Pen.Color:=clGreen;
    LineTo(x1,y2);
    MoveTo(x2,y1);
    Pen.Color:=clBlack;
    LineTo(x1,y1);


    x1:=p228.Left+p228.Width;
    x2:=x1+20;
    y1:=p228.Top+p228_Ch1.Top+33;
    Pen.Color:=clBlack;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p228.Top+p228_Ch2.Top+33;
    Pen.Color:=clGreen;
    MoveTo(x1,y2);
    LineTo(x2,y2);
    x1:=(y2+y1) div 2;
    LineTo(x2,x1);
    Pen.Color:=clBlack;
    LineTo(x2,y1);
    Pen.Color:=clPurple;
    x1:=px12.Left+px12.Width+150;
    y1:=px12.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);


    x1:=p229.Left+p229.Width;
    x2:=x1+20;
    y1:=p229.Top+p229_Ch3.Top+33;
    Pen.Color:=clBlack;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y2:=p229.Top+p229_Ch4.Top+33;
    Pen.Color:=clGreen;
    MoveTo(x1,y2);
    LineTo(x2,y2);
    x1:=(y2+y1) div 2;
    LineTo(x2,x1);
    Pen.Color:=clBlack;
    LineTo(x2,y1);
    Pen.Color:=clPurple;
    x1:=px11.Left+px11.Width+150;
    y1:=px11.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    Pen.Width:=6;

    x1:=p230.Left+p230.Width;
    x2:=x1+50;
    y1:=p230.Top+p230_Out3.Top+16;
    y2:=px3.Top-40;
    MoveTo(x2,y1);
    LineTo(x2,y2);
    x1:=px1.Left+Round(px1.Width/2)+1;
    LineTo(x1,y2);

    Pen.Width:=3;
    x1:=p230.Left+p230.Width;
    x2:=x1+50;
    y1:=p230.Top+p230_Out3.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p230.Top+p230_Out5.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_Out3.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    y1:=p231.Top+p231_Out5.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=px3.Top;
    y2:=y1-40;
    x1:=px3.Left+Round(px3.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px7.Left+Round(px7.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px5.Left+Round(px5.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=px1.Left+Round(px1.Width/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);

    Pen.Color:=clPurple;
    Pen.Width:=3;
    x1:=p231.Left+p231.Width;
    x2:=x1+550;
    y1:=p231.Top+p231_Out1.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    //LWS
    x1:=px1.Left+Round(px1.Width/2);
    y1:=px1.Top+px1.Height;
    y2:=p202.Top+Round(p202.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p202.Left;
    LineTo(x2,y2);
    x1:=px2.Left+Round(px2.Width/2);
    y1:=px2.Top+px2.Height;
    y2:=p202.Top+Round(p202.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p202.Left+p202.Width;
    LineTo(x2,y2);

    //RWS
    x1:=px5.Left+Round(px5.Width/2);
    y1:=px5.Top+px5.Height;
    y2:=p203.Top+Round(p203.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p203.Left;
    LineTo(x2,y2);
    x1:=px6.Left+Round(px6.Width/2);
    y1:=px6.Top+px6.Height;
    y2:=p203.Top+Round(p203.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p203.Left+p203.Width;
    LineTo(x2,y2);

    //CWS
    x1:=px3.Left+Round(px3.Width/2);
    y1:=px3.Top+px3.Height;
    y2:=p201.Top+Round(p201.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p201.Left;
    LineTo(x2,y2);
    x1:=px4.Left+Round(px4.Width/2);
    y1:=px4.Top+px4.Height;
    y2:=p201.Top+Round(p201.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p201.Left+p201.Width;
    LineTo(x2,y2);

    //VRD
    x1:=px7.Left+Round(px7.Width/2);
    y1:=px7.Top+px7.Height;
    y2:=p216.Top+Round(p216.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p216.Left;
    LineTo(x2,y2);
    x1:=px9.Left+Round(px9.Width/2);
    y1:=px9.Top+px9.Height;
    y2:=p216.Top+Round(p216.Height/2);
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x2:=p216.Left+p216.Width;
    LineTo(x2,y2);

  end;
  with i7401_1.Canvas do
  begin
    Brush.Color:=Color_W;
    FillRect(i7401_1.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    Rectangle(2,2,i7401_1.Width,i7401_1.Height);
    x1:=0;
    x2:=i7401_1.Width;
    y1:=p230_In1.Top-i7401_1.Top+15;
    y2:=p230_Out1.Top-i7401_1.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p230_In1.Top-i7401_1.Top+15;
    y2:=p230_Out3.Top-i7401_1.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p230_In5.Top-i7401_1.Top+15;
    y2:=p230_Out5.Top-i7401_1.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p230_In2.Top-i7401_1.Top+15;
    y2:=p230_Out7.Top-i7401_1.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
  end;
  with i7401_2.Canvas do
  begin
    Brush.Color:=Color_W;
    FillRect(i7401_2.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    Rectangle(2,2,i7401_2.Width,i7401_2.Height);
    x1:=0;
    x2:=i7401_2.Width;
    y1:=p231_In3.Top-i7401_2.Top+15;
    y2:=p231_Out3.Top-i7401_2.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p231_In1.Top-i7401_2.Top+15;
    y2:=p231_Out1.Top-i7401_2.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p231_In5.Top-i7401_2.Top+15;
    y2:=p231_Out5.Top-i7401_2.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
    y1:=p231_In2.Top-i7401_2.Top+15;
    y2:=p231_Out7.Top-i7401_2.Top+15;
    MoveTo(x1,y1);
    LineTo(x2,y2);
  end;
  Arrow(300,180,2,clBlack,iMedia);
  Arrow(300,275,2,clBlack,iMedia);
  Arrow(300,635,2,clBlack,iMedia);
  Arrow(300,720,2,clBlack,iMedia);
  Arrow(280,180,1,clBlue,iMedia);
  Arrow(280,275,1,clBlue,iMedia);
  Arrow(280,635,1,clBlue,iMedia);
  Arrow(280,720,1,clBlue,iMedia);
  Arrow(1590,415,2,clPurple,iMedia);
  Arrow(1590,542,2,clPurple,iMedia);
  Arrow(1590,765,2,clPurple,iMedia);
  Arrow(270,942,4,clPurple,iMedia);
  Arrow(610,942,4,clPurple,iMedia);
  Arrow(950,942,4,clPurple,iMedia);
  Arrow(1290,942,4,clPurple,iMedia);
  Arrow(570,934,3,clPurple,iMedia);
  Arrow(910,934,3,clPurple,iMedia);
  Arrow(1250,934,3,clPurple,iMedia);
  Arrow(1590,934,3,clPurple,iMedia);

  with iPower.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iPower.ClientRect);
    with image6.Canvas do
    begin
      Brush.Color:=Color_B;
      FillRect(image6.ClientRect);
    end;
    Pen.Width:=1;
    Pen.Color:=Color_W;
    Rectangle(50,20,1200,460);

    Pen.Color:=clBlue;
    Pen.Width:=3;
    y1:=SH.Top;
    y2:=p2421.Top+p2421.Height;
    x1:=SH.Left+SH_x2.Left+SH_x2.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=SH.Left+SH_x3.Left+SH_x3.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=SH.Left+SH_x4.Left+SH_x4.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);

    y1:=p2421.Top;
    y2:=p317.Top+p317_x1.Top+p317_x1.Height div 2;
    x1:=p2421.Left+p2421_x8.Left+p2421_x8.Width div 2;
    x2:=p317.Left;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    LineTo(x2,y2);
    x1:=x2+p317.Width;
    x2:=p2421.Left+p2421_x9.Left+p2421_x9.Width div 2;
    MoveTo(x1,y2);
    Pen.Color:=clBlack;
    LineTo(x2,y2);
    LineTo(x2,y1);
    Pen.Color:=clBlue;

    y1:=p2421.Top;
    y2:=p318.Top+p318_x1.Top+p318_x1.Height div 2;
    x1:=p2421.Left+p2421_x13.Left+p2421_x13.Width div 2;
    x2:=p318.Left;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    LineTo(x2,y2);
    x1:=x2+p318.Width;
    x2:=p2421.Left+p2421_x14.Left+p2421_x14.Width div 2;
    MoveTo(x1,y2);
    Pen.Color:=clBlack;
    LineTo(x2,y2);
    LineTo(x2,y1);
    Pen.Color:=clBlue;

    y1:=p2421.Top;
    y2:=p319.Top+p319_x1.Top+p319_x1.Height div 2;
    x1:=p2421.Left+p2421_x22.Left+p2421_x22.Width div 2;
    x2:=p319.Left;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    LineTo(x2,y2);
    x1:=x2+p319.Width;
    x2:=p2421.Left+p2421_x23.Left+p2421_x23.Width div 2;
    MoveTo(x1,y2);
    Pen.Color:=clBlack;
    LineTo(x2,y2);
    LineTo(x2,y1);

    Pen.Color:=clBlack;
    y1:=p317.Top+p317_x4.Top+p317_x4.Height div 2;
    y2:=p312.Top+p312_x12.Top+p312_x12.Height div 2;
    x1:=p317.Left+p317.Width;
    x2:=x1+20;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);

    y1:=p317.Top+p317_x3.Top+p317_x3.Height div 2;
    y2:=p314.Top+p314_x2.Top+p314_x2.Height div 2;
    x1:=p317.Left+p317.Width;
    x2:=x1+45;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);

    y1:=p318.Top+p318_x4.Top+p318_x4.Height div 2;
    y2:=p313.Top+p313_x12.Top+p313_x12.Height div 2;
    x1:=p318.Left+p318.Width;
    x2:=x1+20;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);

    y1:=p318.Top+p318_x3.Top+p318_x3.Height div 2;
    y2:=p315.Top+p315_x2.Top+p315_x2.Height div 2;
    x1:=p318.Left+p318.Width;
    x2:=x1+45;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);

    Pen.Color:=clBlue;
    y1:=p2421.Top;
    y2:=p344.Top+p344.Height;
    x1:=p344.Left+p344_x2.Left+p344_x2.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlack;

    y1:=p317.Top+p317_x5.Top+p317_x5.Height div 2;
    x1:=p317.Left;
    x2:=x1-20;
    y2:=PCB1.Top+PCB1.Height-23;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);

    y1:=p318.Top+p318_x5.Top+p318_x5.Height div 2;
    x1:=p318.Left;
    x2:=x1-20;
    y2:=x22.Top-10;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    LineTo(x2,y2);
    x1:=PCB2.Left-20;
    LineTo(x1,y2);
    y2:=PCB2.Top+PCB2.Height-23;
    LineTo(x1,y2);
    x2:=PCB2.Left;
    LineTo(x2,y2);

    y1:=p334.Top+p334_1.Top+p334_1.Height div 2;
    x1:=p334.Left;
    x2:=PCB1.Left+PCB1.Width;
    MoveTo(x1,y1);
    LineTo(x2+30,y1);
    y2:=PCB1.Top+68;
    LineTo(x2+30,y2);
    LIneTo(x2,y2);

    y1:=PCB1.Top+PCB1.Height-57;
    y2:=p335.Top+p335_1.Top+p335_1.Height div 2;
    MoveTo(x2,y1);
    LineTo(x2+55,y1);
    LineTo(x2+55,y2);
    LineTo(x1,y2);

    y1:=PCB1.Top+PCB1.Height-23;
    y2:=p332.Top+p332_1.Top+p332_1.Height div 2;
    MoveTo(x2,y1);
    LineTo(x2+25,y1);
    LineTo(x2+25,y2);
    LineTo(x1,y2);

    y1:=p333.Top+p333_1.Top+p333_1.Height div 2;
    x1:=p333.Left;
    x2:=PCB2.Left+PCB2.Width;
    MoveTo(x1,y1);
    LineTo(x2,y1);

    y1:=PCB2.Top+PCB2.Height-57;
    y2:=p337.Top+p337_1.Top+p337_1.Height div 2;
    MoveTo(x2,y1);
    LineTo(x2+55,y1);
    LineTo(x2+55,y2);
    LineTo(x1,y2);

    y1:=PCB2.Top+PCB2.Height-91;
    y2:=p336.Top+p336_1.Top+p336_1.Height div 2;
    MoveTo(x2,y1);
    LineTo(x2+25,y1);
    LineTo(x2+25,y2);
    LineTo(x1,y2);
  end;

  with iPower.Canvas do
  begin
    Pen.Color:=clPurple;
    //TVD4
    y1:=i35FB.Top+i35FB.Height div 2;
    y2:=i35DC.Top+i35DC.Height div 2;
    x1:=p335.Left+p335.Width;
    x2:=i35FB.Left+i35FB.Width+50;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y1:=p334.Top-25;
    LineTo(x2,y1);
    x1:=x14.Left-50;
    LineTo(x1,y1);
    y2:=x14.Top+x14.Height div 2;
    LineTo(x1,y2);
    x1:=p309.Left;
    LineTo(x1,y2);

    //TVD2
    y1:=i34FB.Top+i34FB.Height div 2;
    y2:=i34DC.Top+i34DC.Height div 2;
    x1:=p334.Left+p334.Width;
    x2:=i34FB.Left+i34FB.Width+20;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y1:=p334.Top-50;
    LineTo(x2,y1);
    x1:=x13.Left-20;
    LineTo(x1,y1);
    y2:=x13.Top+x13.Height div 2;
    LineTo(x1,y2);
    x1:=p308.Left;
    LineTo(x1,y2);

    //TVD1
    y1:=i36FB.Top+i36FB.Height div 2;
    y2:=i36DC.Top+i36DC.Height div 2;
    x1:=p336.Left+p336.Width;
    x2:=i36FB.Left+i36FB.Width+70;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);
    MoveTo(x2,y1);
    y2:=x15.Top+x15.Height div 2;
    LineTo(x2,y2);
    x1:=p307.Left;
    LineTo(x1,y2);

    //TVD3
    y1:=i37FB.Top+i37FB.Height div 2;
    y2:=i37DC.Top+i37DC.Height div 2;
    x1:=p337.Left+p337.Width;
    x2:=i37FB.Left+i37FB.Width+45;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);
    MoveTo(x2,y1);
    y2:=x16.Top+x16.Height div 2;
    LineTo(x2,y2);
    x1:=p310.Left;
    LineTo(x1,y2); 

    //BUS
    y1:=i32DC.Top+i32DC.Height div 2 - 25;
    y2:=i32DC.Top+i32DC.Height div 2;
    x1:=p332.Left+p332.Width;
    x2:=i32DC.Left+i32DC.Width+20;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y2:=PCB1.Top+PCB1.Height+35;
    MoveTo(x2,y1);
    LineTo(x2,y2);

    y1:=i33DC.Top+i33DC.Height div 2 - 25;
    y2:=i33DC.Top+i33DC.Height div 2;
    x1:=p333.Left+p333.Width;
    x2:=i33DC.Left+i33DC.Width+20;

    MoveTo(x1,y1);
    LineTo(x2,y1);
    MoveTo(x1,y2);
    LineTo(x2,y2);

    y2:=PCB2.Top+PCB2.Height+35;
    MoveTo(x2,y1);
    LineTo(x2,y2);

    Pen.Width:=5;
    x1:=p334.Left+p334.Width;
    x2:=p337.Left+p337.Width+190;
    MoveTo(x1,y2);
    LineTo(x2,y2);
    Pen.Width:=3;

    Label147.Color:=Color_B;
    Label150.Color:=Color_B;
    Label151.Color:=Color_B;
    Label152.Color:=Color_B;
  end;

  with iPower.Canvas do
  begin
    Label157.Color:=Color_B;
    Label158.Color:=Color_B;
    Label159.Color:=Color_B;
    label180.Color:=Color_B;
    Pen.Color:=Color_W;
    Pen.Width:=1;
    Rectangle(1480,420,1860,540);
    Rectangle(1480,560,1860,760);
    Rectangle(1480,780,1860,890);
    Rectangle(970,815,1290,925);
    Pen.Color:=ClBlack;
    Pen.Width:=3;
    //WSR
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x5.Left+p2421_x5.Width div 2+2;
    x2:=p303.Left-120;
    y2:=p303.Top+p303_x3.Top+p303_x3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+15);
    LineTo(x2,y1+15);
    LineTo(x2,y2);
    x1:=BC8_A34.Left;
    LineTo(x1,y2);
    //WSP
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x18.Left+p2421_x18.Width div 2+2;
    x2:=p301.Left-100;
    y2:=p301.Top+p301_x3.Top+p301_x3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+30);
    LineTo(x2,y1+30);
    LineTo(x2,y2);
    x1:=BC8_A6.Left;
    LineTo(x1,y2);
    //VRD
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x19.Left+p2421_x19.Width div 2+2;
    x2:=p316.Left-80;
    y2:=p316.Top+p304_x3.Top+p304_x3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+45);
    LineTo(x2,y1+45);
    LineTo(x2,y2);
    x1:=BC8_A7.Left;
    LineTo(x1,y2);
    //WSL
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x2.Left+p2421_x2.Width div 2+2;
    x2:=p302.Left-60;
    y2:=p302.Top+p302_x3.Top+p302_x3.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+60);
    LineTo(x2,y1+60);
    LineTo(x2,y2);
    x1:=BC8_A9.Left;
    LineTo(x1,y2);
    //A21
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x6.Left+p2421_x6.Width div 2+2;
    x2:=BC5_A21.Left+BC5_A21.Width div 2;
    y2:=BC5_A21.Top+BC5_A21_X1.Top+BC5_A21_X1.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+80);
    LineTo(x2,y1+80);
    LineTo(x2,y2);
    x1:=BC5_A21.Left;
    LineTo(x1,y2);
    //A19
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x3.Left+p2421_x3.Width div 2+2;
    x2:=BC5_A19.Left+BC5_A19.Width div 2;
    y2:=BC5_A19.Top+BC5_A19_X1.Top+BC5_A19_X1.Height div 2;
    MoveTo(x1,y1);
    LineTo(x1,y1+102);
    LineTo(x2,y1+102);
    LineTo(x2,y2);
    x1:=BC5_A19.Left;
    LineTo(x1,y2);
    //Printer
    Pen.Color:=clBlue;
    y1:=p2421.Top+p2421.Height;
    x1:=p2421.Left+p2421_x20.Left+p2421_x20.Width div 2+2;
    x2:=p320.Left+p320_X2.Left+p320_X2.Width div 2;
    y2:=p320.Top;
    MoveTo(x1,y1);
    LineTo(x1,y1+120);
    LineTo(x2,y1+120);
    LineTo(x2,y2);
  end;

  with i2421.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(i2421.ClientRect);
    Label75.Color:=Color_B;
    Label197.Color:=Color_B;
    Label89.Color:=Color_B;
    Label90.Color:=Color_B;
    Label93.Color:=Color_B;
    Pen.Color:=clWhite;
    Pen.Width:=1;
    y1:=0;
    y2:=i2421.Height;
    x1:=p2421_X4.Left-(p2421_X4.Left-p2421_X18.Left-p2421_X18.Width) div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    x1:=p2421_X17.Left-(p2421_X17.Left-p2421_X2.Left-p2421_X2.Width) div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlue;
    Pen.Width:=3;
    x1:=p2421_x1.Left+ p2421_x1.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlack;
    x1:=p2421_x2.Left+ p2421_x2.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlue;
    x1:=p2421_x4.Left+ p2421_x4.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlack;
    x1:=p2421_x5.Left+ p2421_x5.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlue;
    x1:=p2421_x17.Left+ p2421_x17.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlue;
    x1:=p2421_x20.Left+ p2421_x20.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    Pen.Color:=clBlack;
    x1:=p2421_x18.Left+ p2421_x18.Width div 2;
    MoveTo(x1,y1);
    LineTo(x1,y2);
    //ключ 1
    y1:=p2421.Height div 2;
    y2:=p2421_x3.Top+35;
    x1:=p2421_x3.Left+p2421_x3.Width div 2;
    x2:=x1+(p2421_x2.Left-p2421_x3.Left) div 2 -3;
    MoveTo(x1,y2);
    LineTo(x1,y1);
    LineTo(x2,y1);
    y2:=y1-5;
    MoveTo(x2,y2);
    LineTo(x2+6,y1);
    x1:=p2421_x2.Left+p2421_x2.Width div 2;
    LineTo(x1,y1);
    //ключ 2
    y1:=p2421.Height div 2;
    y2:=p2421_x6.Top+35;
    x1:=p2421_x6.Left+p2421_x6.Width div 2;
    x2:=x1+(p2421_x5.Left-p2421_x6.Left) div 2 -3;
    MoveTo(x1,y2);
    LineTo(x1,y1);
    LineTo(x2,y1);
    y2:=y1-5;
    MoveTo(x2,y2);
    LineTo(x2+6,y1);
    x1:=p2421_x5.Left+p2421_x5.Width div 2;
    LineTo(x1,y1);
    //
    Pen.Color:=clBlue;
    y1:=p2421.Height div 2;
    x1:=p2421_x17.Left+p2421_x17.Width div 2;
    x2:=p2421_x20.Left+p2421_x20.Width div 2;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    //
    Pen.Color:=clBlack;
    y1:=p2421.Height div 2;
    y2:=p2421_x19.Top+35;
    x1:=p2421_x19.Left+p2421_x19.Width div 2;
    x2:=p2421_x18.Left+p2421_x18.Width div 2;
    MoveTo(x1,y2);
    LineTo(x1,y1);
    LineTo(x2,y1);
  end;

  with D2.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(D2.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=0;
    x2:=D2.Width;
    y1:=0;
    y2:=D2.Height-1;
    MoveTo(x1,y2);
    LineTo(x2,y1);
  end;

  with D4.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(D4.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=0;
    x2:=D4.Width;
    y1:=0;
    y2:=D4.Height-1;
    MoveTo(x1,y2);
    LineTo(x2,y1);
  end;

  with iPCB1.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iPCB1.ClientRect);
    Label13.Color:=Color_B;
    Label76.Color:=Color_B;
    Label76.Top:=D2.Top+D2.Height-Label76.Height-3;
    Label77.Color:=Color_B;
    Label77.Top:=D4.Top+D4.Height-Label77.Height-3;
    Label78.Color:=Color_B;
    Label78.Top:=iPCB1.Height-20-Label78.Height;
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=iPCB1.Width;
    x2:=0;
    y1:=iPCB1.Height-20;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x2:=30;
    y2:=D2.Top+D2.Height-3;
    MoveTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);
    y2:=D4.Top+D4.Height-3;
    MoveTo(x2,y2);
    LineTo(x1,y2);
    x2:=10;
    x1:=D2.Left+D2.Width div 2;
    y1:=D2.Top-16;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    LineTo(x1,y1+11);
    Arrow(x1,y1+13,4,clBlack,iPCB1);
    x2:=10;
    x1:=D4.Left+D4.Width div 2;
    y1:=D4.Top-16;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    LineTo(x1,y1+11);
    Arrow(x1,y1+13,4,clBlack,iPCB1);
    Label80.Color:=Color_B;
    Label80.Top:=D2.Top-15;
    Label81.Color:=Color_B;
    Label81.Top:=D4.Top-15;
  end;

  with D1.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(D1.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=0;
    x2:=D1.Width;
    y1:=0;
    y2:=D1.Height-1;
    MoveTo(x1,y2);
    LineTo(x2,y1);
  end;

  with D3.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(D3.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=0;
    x2:=D3.Width;
    y1:=0;
    y2:=D3.Height-1;
    MoveTo(x1,y2);
    LineTo(x2,y1);
  end;

  with iPCB2.Canvas do
  begin
    Brush.Color:=Color_B;
    FillRect(iPCB2.ClientRect);
    Label82.Color:=Color_B;
    Label83.Color:=Color_B;
    Label83.Top:=D1.Top+D1.Height-Label83.Height-3;
    Label84.Color:=Color_B;
    Label84.Top:=D3.Top+D3.Height-Label84.Height-3;
    Label85.Color:=Color_B;
    Label85.Top:=iPCB2.Height-20-Label85.Height;
    Pen.Color:=clBlack;
    Pen.Width:=2;
    x1:=iPCB2.Width;
    x2:=0;
    y1:=iPCB2.Height-20;
    MoveTo(x1,y1);
    LineTo(x2,y1);
    x2:=30;
    y2:=D1.Top+D1.Height-3;
    MoveTo(x2,y1);
    LineTo(x2,y2);
    LineTo(x1,y2);
    y2:=D3.Top+D3.Height-3;
    MoveTo(x2,y2);
    LineTo(x1,y2);
    x2:=10;
    x1:=D1.Left+D1.Width div 2;
    y1:=D1.Top-16;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    LineTo(x1,y1+11);
    Arrow(x1,y1+13,4,clBlack,iPCB2);
    x2:=10;
    x1:=D3.Left+D3.Width div 2;
    y1:=D3.Top-16;
    MoveTo(x2,y1);
    LineTo(x1,y1);
    LineTo(x1,y1+11);
    Arrow(x1,y1+13,4,clBlack,iPCB2);
    Label87.Color:=Color_B;
    Label87.Top:=D1.Top-15;
    Label88.Color:=Color_B;
    Label88.Top:=D3.Top-15;
  end;
end;

end.


