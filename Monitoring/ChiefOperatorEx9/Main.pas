unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,  MyPanel,DSUtil, UNdegroundForm,
  Dialogs, ComCtrls, XPMan, ExtCtrls, StdCtrls, DSPack, XiButton, Buttons, XiPanel,winsock,SyncObjs,
  Global,fmARM,fm7302,fm7210,fm2410,fm2411,fm2437,fm5401,fm3401,fm5402,VRDSource,fm2407,fm2408,fmLanding,ContainerLanding,
  Manager_EM7302,Client_EM7212,BDRecord,Client_EM5401,Container_EM5401,Container_TM2409,Container_TM2220,Container_TM2408,Container_TM2407,
  Container_EM7210,Container_TM2410,Container_EM7302,Container_TM2322,Client_EM5402,Client_TM2411,Container_TM2411,Container_EM2437,Client_EM3401,
  IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,idGlobal,idSockethandle,FastDib,DirectShow9,activeX,FullState,Graph;

type
  TFMain = class(TForm)
    XPManif: TXPManifest;
    GarlandTimer: TTimer;
    UDPServer1: TIdUDPServer;
    UDPServer2: TIdUDPServer;
    FilterGraph1: TFilterGraph;
    SampleGrabber: TSampleGrabber;
    LandingServer1: TIdUDPServer;
    LandingServer2: TIdUDPServer;
    PageControl: TPageControl;
    WorkTable: TTabSheet;
    Control: TPanel;
    WSCPanel: TPanel;
    Panel3: TPanel;
    i1: TImage;
    Label3: TLabel;
    Panel4: TPanel;
    Panel6: TPanel;
    KUPanel: TPanel;
    Panel16: TPanel;
    i4: TImage;
    Label4: TLabel;
    Panel17: TPanel;
    MPanel: TPanel;
    Panel25: TPanel;
    i5: TImage;
    Label25: TLabel;
    Panel26: TPanel;
    MainState: TPanel;
    Panel19: TPanel;
    i8: TImage;
    Label13: TLabel;
    Panel20: TPanel;
    Video: TPanel;
    i9: TImage;
    Management: TPanel;
    Videorecorder: TPanel;
    Panel13: TPanel;
    i3: TImage;
    Label10: TLabel;
    Monitoring: TPanel;
    Panel11: TPanel;
    i2: TImage;
    Label7: TLabel;
    Panel15: TPanel;
    PostPanel: TPanel;
    Panel37: TPanel;
    i6: TImage;
    Label77: TLabel;
    Panel38: TPanel;
    WSCRecord: TPanel;
    Panel8: TPanel;
    i11: TImage;
    Label18: TLabel;
    DataExch: TTabSheet;
    ide: TImage;
    Splitter157: TSplitter;
    Splitter158: TSplitter;
    Splitter161: TSplitter;
    Splitter163: TSplitter;
    Splitter178: TSplitter;
    Splitter179: TSplitter;
    Splitter180: TSplitter;
    Splitter181: TSplitter;
    Splitter183: TSplitter;
    Splitter184: TSplitter;
    Splitter185: TSplitter;
    Splitter187: TSplitter;
    Splitter188: TSplitter;
    Splitter189: TSplitter;
    Splitter190: TSplitter;
    Splitter191: TSplitter;
    Splitter192: TSplitter;
    Splitter193: TSplitter;
    Splitter194: TSplitter;
    Splitter195: TSplitter;
    eps1: TSplitter;
    eps2: TSplitter;
    eps3: TSplitter;
    eps4: TSplitter;
    eps5: TSplitter;
    eps6: TSplitter;
    eps7: TSplitter;
    eps8: TSplitter;
    eps9: TSplitter;
    els10: TSplitter;
    els7: TSplitter;
    els8: TSplitter;
    els9: TSplitter;
    els1: TSplitter;
    els6: TSplitter;
    els5: TSplitter;
    els4: TSplitter;
    els2: TSplitter;
    els3: TSplitter;
    els12: TSplitter;
    els11: TSplitter;
    eks1: TSplitter;
    eks2: TSplitter;
    eks3: TSplitter;
    eks4: TSplitter;
    Splitter221: TSplitter;
    eks5: TSplitter;
    eks7: TSplitter;
    Splitter222: TSplitter;
    Splitter226: TSplitter;
    Splitter227: TSplitter;
    Splitter228: TSplitter;
    Splitter229: TSplitter;
    ek4: TMyPanel;
    ek4de: TMyPanel;
    ek2: TMyPanel;
    ek2de: TMyPanel;
    ep2: TMyPanel;
    epx2: TMyPanel;
    ep3: TMyPanel;
    epx3: TMyPanel;
    ep4: TMyPanel;
    epx4: TMyPanel;
    ep5: TMyPanel;
    epx5: TMyPanel;
    ep6: TMyPanel;
    epx6: TMyPanel;
    ep7: TMyPanel;
    epx7: TMyPanel;
    et24092: TMyPanel;
    ui: TMyPanel;
    uu: TMyPanel;
    y: TMyPanel;
    et24092_com5: TMyPanel;
    et24092_de: TMyPanel;
    et24092_com8: TMyPanel;
    et24092_com6: TMyPanel;
    et24092_com7: TMyPanel;
    et24091: TMyPanel;
    et24091_com4: TMyPanel;
    et24091_com7: TMyPanel;
    et24091_com1: TMyPanel;
    et24091_com2: TMyPanel;
    et24091_com3: TMyPanel;
    et24091_de: TMyPanel;
    et24101: TMyPanel;
    et241012: TMyPanel;
    et2410112: TMyPanel;
    et2410114: TMyPanel;
    et2410116: TMyPanel;
    et241014: TMyPanel;
    et241016: TMyPanel;
    et241011: TMyPanel;
    et241013: TMyPanel;
    et2410111: TMyPanel;
    et241018: TMyPanel;
    et241015: TMyPanel;
    MyPanel196: TMyPanel;
    MyPanel197: TMyPanel;
    MyPanel198: TMyPanel;
    et24093: TMyPanel;
    et24093_com1: TMyPanel;
    et24093_de: TMyPanel;
    et24093_com2: TMyPanel;
    et24093_com7: TMyPanel;
    et24093_com4: TMyPanel;
    et72121: TMyPanel;
    et72121_x15: TMyPanel;
    et72121_x1: TMyPanel;
    et72121_x2: TMyPanel;
    et72121_x3: TMyPanel;
    et72121_x4: TMyPanel;
    et72121_x5: TMyPanel;
    et72121_x6: TMyPanel;
    et72121_x7: TMyPanel;
    et72121_x8: TMyPanel;
    et72121_x9: TMyPanel;
    et72121_x10: TMyPanel;
    et72121_x11: TMyPanel;
    et72121_x12: TMyPanel;
    et72121_x16: TMyPanel;
    et72121_x17: TMyPanel;
    et24102: TMyPanel;
    MyPanel191: TMyPanel;
    et241021: TMyPanel;
    et241023: TMyPanel;
    MyPanel199: TMyPanel;
    MyPanel200: TMyPanel;
    et241025: TMyPanel;
    et241026: TMyPanel;
    MyPanel203: TMyPanel;
    MyPanel204: TMyPanel;
    MyPanel205: TMyPanel;
    et2410214: TMyPanel;
    MyPanel216: TMyPanel;
    et2410212: TMyPanel;
    et241022: TMyPanel;
    et73021: TMyPanel;
    et73021_de: TMyPanel;
    et73021_com: TMyPanel;
    et72122: TMyPanel;
    et72122_x16: TMyPanel;
    et72122_x15: TMyPanel;
    et72122_x17: TMyPanel;
    et72122_x1: TMyPanel;
    et72122_x2: TMyPanel;
    et72122_x3: TMyPanel;
    et72122_x4: TMyPanel;
    et72122_x5: TMyPanel;
    et72122_x6: TMyPanel;
    et72122_x7: TMyPanel;
    et72122_x8: TMyPanel;
    et72122_x9: TMyPanel;
    et72122_x10: TMyPanel;
    et72122_x11: TMyPanel;
    et72122_x12: TMyPanel;
    ep1: TMyPanel;
    epx1: TMyPanel;
    et2322: TMyPanel;
    p: TMyPanel;
    MyPanel751: TMyPanel;
    et23221: TMyPanel;
    et23223: TMyPanel;
    et23222: TMyPanel;
    et23224: TMyPanel;
    et2408: TMyPanel;
    MyPanel753: TMyPanel;
    MyPanel754: TMyPanel;
    et24081: TMyPanel;
    et24083: TMyPanel;
    et24082: TMyPanel;
    et24084: TMyPanel;
    etLanding: TMyPanel;
    MyPanel756: TMyPanel;
    et7303: TMyPanel;
    et7303_de: TMyPanel;
    et73022: TMyPanel;
    et73022_com: TMyPanel;
    et73022_de: TMyPanel;
    ep8: TMyPanel;
    epx8: TMyPanel;
    el12: TMyPanel;
    elx12: TMyPanel;
    el11: TMyPanel;
    elx11: TMyPanel;
    el10: TMyPanel;
    elx10: TMyPanel;
    el9: TMyPanel;
    elx9: TMyPanel;
    el8: TMyPanel;
    elx8: TMyPanel;
    el7: TMyPanel;
    elx7: TMyPanel;
    el6: TMyPanel;
    elx6: TMyPanel;
    el5: TMyPanel;
    elx5: TMyPanel;
    el4: TMyPanel;
    elx4: TMyPanel;
    el3: TMyPanel;
    elx3: TMyPanel;
    el2: TMyPanel;
    elx2: TMyPanel;
    el1: TMyPanel;
    elx1: TMyPanel;
    ep9: TMyPanel;
    epx9: TMyPanel;
    et54021: TMyPanel;
    et540211: TMyPanel;
    et540212: TMyPanel;
    et540213: TMyPanel;
    et540214: TMyPanel;
    ek3: TMyPanel;
    ek3de: TMyPanel;
    ek1: TMyPanel;
    ek1de: TMyPanel;
    ek5: TMyPanel;
    ek5de: TMyPanel;
    ek7: TMyPanel;
    ek7de: TMyPanel;
    et24111: TMyPanel;
    MyPanel226: TMyPanel;
    et24111de: TMyPanel;
    et24112: TMyPanel;
    MyPanel229: TMyPanel;
    et24112de: TMyPanel;
    et24113: TMyPanel;
    MyPanel232: TMyPanel;
    et24113de: TMyPanel;
    et24114: TMyPanel;
    et24114de: TMyPanel;
    MyPanel193: TMyPanel;
    et24115: TMyPanel;
    et24115de: TMyPanel;
    MyPanel236: TMyPanel;
    et5401: TMyPanel;
    et3401: TMyPanel;
    et24374: TMyPanel;
    et24374de: TMyPanel;
    et24092_com72: TMyPanel;
    et24092_com82: TMyPanel;
    et54022: TMyPanel;
    et540221: TMyPanel;
    et540222: TMyPanel;
    et540223: TMyPanel;
    et540224: TMyPanel;
    ep10: TMyPanel;
    epx10: TMyPanel;
    ep11: TMyPanel;
    epx11: TMyPanel;
    ep12: TMyPanel;
    epx12: TMyPanel;
    eps10: TSplitter;
    eps12: TSplitter;
    eps11: TSplitter;
    et24092_com62: TMyPanel;
    ek6: TMyPanel;
    ek6de: TMyPanel;
    ek8: TMyPanel;
    ek8de: TMyPanel;
    eks8: TSplitter;
    et24114l: TLabel;
    et5401internal: TMyPanel;
    et24373: TMyPanel;
    et24373de: TMyPanel;
    et24372: TMyPanel;
    et24372de: TMyPanel;
    et24371: TMyPanel;
    et24371de: TMyPanel;
    Splitter196: TSplitter;
    Splitter201: TSplitter;
    Splitter364: TSplitter;
    Splitter225: TSplitter;
    Label99: TLabel;
    Splitter365: TSplitter;
    Splitter366: TSplitter;
    Splitter367: TSplitter;
    Splitter368: TSplitter;
    ek1d: TMyPanel;
    ek2d: TMyPanel;
    ek3d: TMyPanel;
    ek4d: TMyPanel;
    ek5d: TMyPanel;
    ek6d: TMyPanel;
    ek7d: TMyPanel;
    ek8d: TMyPanel;
    Splitter369: TSplitter;
    Splitter370: TSplitter;
    Splitter371: TSplitter;
    Splitter372: TSplitter;
    et24092_com52: TMyPanel;
    et24115l: TLabel;
    et24111l: TLabel;
    et24112l: TLabel;
    et24113l: TLabel;
    VideoSys: TTabSheet;
    vt73021: TMyPanel;
    Label61: TLabel;
    Panel1: TPanel;
    vk2404_v0: TMyPanel;
    vk5_v0: TMyPanel;
    vk8_v0: TMyPanel;
    vk4_v0: TMyPanel;
    vk2_v0: TMyPanel;
    vk1_v0: TMyPanel;
    vk3_v0: TMyPanel;
    vk7_v0: TMyPanel;
    vk6_v0: TMyPanel;
    vt24371: TMyPanel;
    vt243711: TMyPanel;
    vt243712: TMyPanel;
    vt243713: TMyPanel;
    vt243714: TMyPanel;
    vt7402: TMyPanel;
    vt3401: TMyPanel;
    MyPanel56: TMyPanel;
    MyPanel57: TMyPanel;
    MyPanel58: TMyPanel;
    MyPanel60: TMyPanel;
    MyPanel61: TMyPanel;
    MyPanel62: TMyPanel;
    MyPanel63: TMyPanel;
    MyPanel64: TMyPanel;
    MyPanel65: TMyPanel;
    L32: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label26: TLabel;
    l24371: TLabel;
    MyPanel66: TMyPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    Splitter9: TSplitter;
    Panel49: TPanel;
    Splitter208: TSplitter;
    Splitter207: TSplitter;
    Splitter209: TSplitter;
    Splitter210: TSplitter;
    Splitter211: TSplitter;
    Splitter212: TSplitter;
    Splitter213: TSplitter;
    Splitter214: TSplitter;
    i12: TImage;
    Splitter215: TSplitter;
    vt34012: TMyPanel;
    Label63: TLabel;
    vt34011: TMyPanel;
    Label64: TLabel;
    vp1: TMyPanel;
    vpx1: TMyPanel;
    vp2: TMyPanel;
    vpx2: TMyPanel;
    vp3: TMyPanel;
    vpx3: TMyPanel;
    vp4: TMyPanel;
    vpx4: TMyPanel;
    vp5: TMyPanel;
    vpx5: TMyPanel;
    vp6: TMyPanel;
    vpx6: TMyPanel;
    vp7: TMyPanel;
    vpx7: TMyPanel;
    vp8: TMyPanel;
    vpx8: TMyPanel;
    vp9: TMyPanel;
    vpx9: TMyPanel;
    vb1: TMyPanel;
    vbx1: TMyPanel;
    vb2: TMyPanel;
    vbx2: TMyPanel;
    vb3: TMyPanel;
    vbx3: TMyPanel;
    vb4: TMyPanel;
    vbx4: TMyPanel;
    vb5: TMyPanel;
    vbx5: TMyPanel;
    vb6: TMyPanel;
    vbx6: TMyPanel;
    vb7: TMyPanel;
    vbx7: TMyPanel;
    vb8: TMyPanel;
    vbx8: TMyPanel;
    vb9: TMyPanel;
    vbx9: TMyPanel;
    vb10: TMyPanel;
    vbx10: TMyPanel;
    vb12: TMyPanel;
    vbx12: TMyPanel;
    vb11: TMyPanel;
    vbx11: TMyPanel;
    vt24372: TMyPanel;
    l24372: TLabel;
    vt243721: TMyPanel;
    Label31: TLabel;
    vt243722: TMyPanel;
    Label40: TLabel;
    vt243723: TMyPanel;
    Label41: TLabel;
    vt243724: TMyPanel;
    Label42: TLabel;
    vt24373: TMyPanel;
    l24373: TLabel;
    vt243731: TMyPanel;
    Label45: TLabel;
    vt243732: TMyPanel;
    Label46: TLabel;
    vt243733: TMyPanel;
    Label47: TLabel;
    vt243734: TMyPanel;
    Label48: TLabel;
    vt24374: TMyPanel;
    l24374: TLabel;
    vt243741: TMyPanel;
    Label50: TLabel;
    vt243742: TMyPanel;
    Label52: TLabel;
    vt243743: TMyPanel;
    Label60: TLabel;
    vt243744: TMyPanel;
    Label62: TLabel;
    Splitter4: TSplitter;
    Panel7: TPanel;
    Splitter10: TSplitter;
    Splitter11: TSplitter;
    Splitter12: TSplitter;
    Splitter13: TSplitter;
    Splitter14: TSplitter;
    Splitter15: TSplitter;
    Panel10: TPanel;
    Splitter16: TSplitter;
    Splitter17: TSplitter;
    Splitter39: TSplitter;
    Splitter43: TSplitter;
    Splitter44: TSplitter;
    Splitter45: TSplitter;
    Panel12: TPanel;
    Splitter46: TSplitter;
    Splitter47: TSplitter;
    Splitter48: TSplitter;
    Splitter49: TSplitter;
    Splitter50: TSplitter;
    Splitter51: TSplitter;
    Panel23: TPanel;
    Splitter52: TSplitter;
    Splitter53: TSplitter;
    Splitter54: TSplitter;
    Splitter55: TSplitter;
    Splitter56: TSplitter;
    Splitter57: TSplitter;
    Panel45: TPanel;
    Splitter58: TSplitter;
    Splitter59: TSplitter;
    Splitter60: TSplitter;
    Splitter61: TSplitter;
    Splitter62: TSplitter;
    Splitter63: TSplitter;
    Panel46: TPanel;
    Splitter64: TSplitter;
    Splitter65: TSplitter;
    Splitter66: TSplitter;
    Splitter67: TSplitter;
    Splitter68: TSplitter;
    Splitter69: TSplitter;
    Panel47: TPanel;
    Splitter70: TSplitter;
    Splitter71: TSplitter;
    Splitter186: TSplitter;
    Splitter197: TSplitter;
    Splitter198: TSplitter;
    Splitter199: TSplitter;
    Panel48: TPanel;
    Splitter200: TSplitter;
    Splitter202: TSplitter;
    Splitter203: TSplitter;
    Splitter204: TSplitter;
    Splitter205: TSplitter;
    Splitter206: TSplitter;
    i14: TImage;
    i15: TImage;
    i16: TImage;
    i17: TImage;
    i18: TImage;
    i19: TImage;
    i20: TImage;
    i21: TImage;
    l3401: TLabel;
    in1: TMyPanel;
    in2: TMyPanel;
    in3: TMyPanel;
    in4: TMyPanel;
    in5: TMyPanel;
    in6: TMyPanel;
    in7: TMyPanel;
    in8: TMyPanel;
    in9: TMyPanel;
    in10: TMyPanel;
    in11: TMyPanel;
    in12: TMyPanel;
    in13: TMyPanel;
    in14: TMyPanel;
    in15: TMyPanel;
    in16: TMyPanel;
    out1: TMyPanel;
    out2: TMyPanel;
    out3: TMyPanel;
    out4: TMyPanel;
    out5: TMyPanel;
    out6: TMyPanel;
    out7: TMyPanel;
    out8: TMyPanel;
    out9: TMyPanel;
    out10: TMyPanel;
    out11: TMyPanel;
    out12: TMyPanel;
    out13: TMyPanel;
    out14: TMyPanel;
    out15: TMyPanel;
    out16: TMyPanel;
    vt73022: TMyPanel;
    Label28: TLabel;
    out17: TMyPanel;
    out18: TMyPanel;
    out19: TMyPanel;
    out20: TMyPanel;
    out21: TMyPanel;
    out22: TMyPanel;
    out23: TMyPanel;
    out24: TMyPanel;
    out25: TMyPanel;
    out26: TMyPanel;
    out27: TMyPanel;
    out28: TMyPanel;
    out29: TMyPanel;
    out30: TMyPanel;
    out31: TMyPanel;
    out32: TMyPanel;
    in17: TMyPanel;
    in18: TMyPanel;
    in19: TMyPanel;
    in20: TMyPanel;
    in21: TMyPanel;
    in22: TMyPanel;
    in23: TMyPanel;
    in24: TMyPanel;
    in25: TMyPanel;
    in26: TMyPanel;
    in27: TMyPanel;
    in28: TMyPanel;
    in29: TMyPanel;
    in30: TMyPanel;
    in31: TMyPanel;
    in32: TMyPanel;
    vt7305: TMyPanel;
    MyPanel233: TMyPanel;
    MyPanel234: TMyPanel;
    MyPanel235: TMyPanel;
    MyPanel237: TMyPanel;
    MyPanel239: TMyPanel;
    MyPanel241: TMyPanel;
    MyPanel250: TMyPanel;
    MyPanel259: TMyPanel;
    MyPanel268: TMyPanel;
    MyPanel294: TMyPanel;
    MyPanel295: TMyPanel;
    MyPanel296: TMyPanel;
    vt72131: TMyPanel;
    MyPanel298: TMyPanel;
    MyPanel299: TMyPanel;
    MyPanel301: TMyPanel;
    MyPanel305: TMyPanel;
    MyPanel300: TMyPanel;
    MyPanel302: TMyPanel;
    MyPanel303: TMyPanel;
    MyPanel304: TMyPanel;
    MyPanel306: TMyPanel;
    MyPanel307: TMyPanel;
    MyPanel308: TMyPanel;
    MyPanel309: TMyPanel;
    vt72132: TMyPanel;
    MyPanel311: TMyPanel;
    MyPanel312: TMyPanel;
    MyPanel313: TMyPanel;
    MyPanel314: TMyPanel;
    MyPanel315: TMyPanel;
    MyPanel316: TMyPanel;
    MyPanel317: TMyPanel;
    MyPanel318: TMyPanel;
    MyPanel319: TMyPanel;
    MyPanel320: TMyPanel;
    MyPanel321: TMyPanel;
    MyPanel322: TMyPanel;
    vt72133: TMyPanel;
    MyPanel324: TMyPanel;
    MyPanel325: TMyPanel;
    MyPanel326: TMyPanel;
    MyPanel327: TMyPanel;
    MyPanel328: TMyPanel;
    MyPanel329: TMyPanel;
    MyPanel330: TMyPanel;
    MyPanel331: TMyPanel;
    MyPanel332: TMyPanel;
    MyPanel333: TMyPanel;
    MyPanel334: TMyPanel;
    MyPanel335: TMyPanel;
    MyPanel336: TMyPanel;
    MyPanel337: TMyPanel;
    MyPanel338: TMyPanel;
    MyPanel339: TMyPanel;
    MyPanel340: TMyPanel;
    MyPanel341: TMyPanel;
    MyPanel342: TMyPanel;
    MyPanel343: TMyPanel;
    MyPanel344: TMyPanel;
    MyPanel345: TMyPanel;
    MyPanel346: TMyPanel;
    MyPanel347: TMyPanel;
    vt2322: TMyPanel;
    vt2322ve: TMyPanel;
    vt2408: TMyPanel;
    vt2408ve: TMyPanel;
    Splitter216: TSplitter;
    Splitter217: TSplitter;
    Splitter218: TSplitter;
    Splitter219: TSplitter;
    Splitter220: TSplitter;
    Splitter223: TSplitter;
    Splitter224: TSplitter;
    Splitter230: TSplitter;
    Splitter231: TSplitter;
    Splitter232: TSplitter;
    Splitter233: TSplitter;
    Splitter234: TSplitter;
    Splitter235: TSplitter;
    Splitter236: TSplitter;
    Splitter237: TSplitter;
    Splitter238: TSplitter;
    Splitter239: TSplitter;
    Splitter240: TSplitter;
    Splitter241: TSplitter;
    Splitter242: TSplitter;
    Splitter243: TSplitter;
    Splitter244: TSplitter;
    Splitter245: TSplitter;
    Splitter246: TSplitter;
    Splitter247: TSplitter;
    Splitter248: TSplitter;
    Splitter249: TSplitter;
    Splitter250: TSplitter;
    Splitter251: TSplitter;
    Splitter253: TSplitter;
    Splitter254: TSplitter;
    Splitter255: TSplitter;
    Splitter256: TSplitter;
    Splitter257: TSplitter;
    Splitter258: TSplitter;
    Splitter259: TSplitter;
    Splitter260: TSplitter;
    Splitter252: TSplitter;
    vps1: TSplitter;
    vps2: TSplitter;
    vps3: TSplitter;
    vps4: TSplitter;
    vps5: TSplitter;
    vps6: TSplitter;
    vps7: TSplitter;
    vps8: TSplitter;
    vps9: TSplitter;
    vps10: TSplitter;
    vps11: TSplitter;
    Splitter273: TSplitter;
    Splitter274: TSplitter;
    Splitter275: TSplitter;
    Splitter276: TSplitter;
    Splitter277: TSplitter;
    Splitter278: TSplitter;
    Splitter279: TSplitter;
    Splitter280: TSplitter;
    Splitter281: TSplitter;
    Splitter282: TSplitter;
    Splitter283: TSplitter;
    Splitter284: TSplitter;
    vps12: TSplitter;
    Splitter285: TSplitter;
    Splitter286: TSplitter;
    vbs12: TSplitter;
    vbs11: TSplitter;
    vbs10: TSplitter;
    vbs9: TSplitter;
    vbs8: TSplitter;
    vbs7: TSplitter;
    vbs6: TSplitter;
    vbs5: TSplitter;
    vbs4: TSplitter;
    vbs3: TSplitter;
    vbs2: TSplitter;
    vbs1: TSplitter;
    Splitter299: TSplitter;
    vp10: TMyPanel;
    vpx10: TMyPanel;
    vp11: TMyPanel;
    vpx11: TMyPanel;
    vp12: TMyPanel;
    vpx12: TMyPanel;
    vt2404: TMyPanel;
    vk2404_v: TMyPanel;
    vk5: TMyPanel;
    vk5_v: TMyPanel;
    vk2: TMyPanel;
    vk4_v: TMyPanel;
    vk3: TMyPanel;
    vk2_v: TMyPanel;
    vk1: TMyPanel;
    vk1_v: TMyPanel;
    vk4: TMyPanel;
    vk3_v: TMyPanel;
    vk6: TMyPanel;
    vk6_v: TMyPanel;
    vk8: TMyPanel;
    vk8_v: TMyPanel;
    vk7: TMyPanel;
    vk7_v: TMyPanel;
    l2404: TLabel;
    l5: TLabel;
    l8: TLabel;
    l2: TLabel;
    l3: TLabel;
    l1: TLabel;
    l4: TLabel;
    l7: TLabel;
    l6: TLabel;
    Splitter18: TSplitter;
    vks5: TSplitter;
    vks8: TSplitter;
    vks4: TSplitter;
    vks2: TSplitter;
    vks1: TSplitter;
    vks3: TSplitter;
    vks7: TSplitter;
    vks6: TSplitter;
    l7402: TLabel;
    i13: TImage;
    Panel50: TPanel;
    Label1: TLabel;
    Panel51: TPanel;
    vl51: TLabel;
    Panel52: TPanel;
    vl81: TLabel;
    Panel53: TPanel;
    vl21: TLabel;
    Panel54: TPanel;
    vl31: TLabel;
    Panel55: TPanel;
    vl11: TLabel;
    Panel56: TPanel;
    vl41: TLabel;
    Panel57: TPanel;
    vl71: TLabel;
    Panel58: TPanel;
    vl61: TLabel;
    Label5: TLabel;
    iVS: TImage;
    Panel69: TPanel;
    Label29: TLabel;
    Panel70: TPanel;
    Label30: TLabel;
    eks6: TSplitter;
    Splitter20: TSplitter;
    Splitter21: TSplitter;
    Splitter22: TSplitter;
    Splitter23: TSplitter;
    Splitter24: TSplitter;
    Splitter25: TSplitter;
    Panel71: TPanel;
    Label6: TLabel;
    Panel72: TPanel;
    Label8: TLabel;
    Panel73: TPanel;
    vl13: TLabel;
    Panel74: TPanel;
    vl23: TLabel;
    Panel75: TPanel;
    vl33: TLabel;
    Panel76: TPanel;
    vl43: TLabel;
    Panel77: TPanel;
    vl53: TLabel;
    Panel78: TPanel;
    Label32: TLabel;
    Panel79: TPanel;
    Label33: TLabel;
    Panel80: TPanel;
    vl83: TLabel;
    i23: TImage;
    i24: TImage;
    i25: TImage;
    i26: TImage;
    i27: TImage;
    i28: TImage;
    i29: TImage;
    i30: TImage;
    i31: TImage;
    i32: TImage;
    Panel59: TPanel;
    Label2: TLabel;
    Panel60: TPanel;
    vl52: TLabel;
    Panel61: TPanel;
    vl82: TLabel;
    Panel62: TPanel;
    vl22: TLabel;
    Panel63: TPanel;
    vl32: TLabel;
    Panel64: TPanel;
    ttt: TLabel;
    Panel65: TPanel;
    vl12: TLabel;
    Panel66: TPanel;
    vl42: TLabel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel81: TPanel;
    Panel83: TPanel;
    i33: TImage;
    vl34: TLabel;
    i34: TImage;
    i35: TImage;
    i36: TImage;
    vl44: TLabel;
    vl24: TLabel;
    vl14: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    vl15: TLabel;
    vl25: TLabel;
    vl35: TLabel;
    vl45: TLabel;
    vl55: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    vl85: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    vl16: TLabel;
    vl26: TLabel;
    vl36: TLabel;
    vl46: TLabel;
    vl56: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    vl86: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Splitter19: TSplitter;
    Splitter26: TSplitter;
    MyPanel1: TMyPanel;
    Splitter27: TSplitter;
    Splitter28: TSplitter;
    Splitter29: TSplitter;
    i01: TImage;
    i02: TImage;
    Panel2: TPanel;
    VideoWindow1: TVideoWindow;
    Image1: TImage;
    ButtonVideo: TMyPanel;
    Label16: TLabel;
    ButtonDataExh: TMyPanel;
    ButtonMain: TMyPanel;
    Label19: TLabel;
    Label21: TLabel;
    pd: TImage;
    pv: TImage;
    pm: TImage;
    i37: TImage;
    NPanel: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    t24102: TMyPanel;
    t24093: TMyPanel;
    t72122: TMyPanel;
    t73022: TMyPanel;
    i10: TImage;
    Label17: TLabel;
    t24111_2: TMyPanel;
    t24112_2: TMyPanel;
    s24102: TShape;
    s24093: TShape;
    s72122: TShape;
    s73022: TShape;
    s24114: TShape;
    s24115: TShape;
    t2407: TMyPanel;
    s2407: TShape;
    t24101: TMyPanel;
    s2410: TShape;
    t24091: TMyPanel;
    s24091: TShape;
    t24092: TMyPanel;
    s24092: TShape;
    t72121: TMyPanel;
    s7212: TShape;
    t73021: TMyPanel;
    s7302: TShape;
    t24111: TMyPanel;
    s24111: TShape;
    t24112: TMyPanel;
    s24112: TShape;
    t24113: TMyPanel;
    s24113: TShape;
    kb1: TMyPanel;
    kb2: TMyPanel;
    ks1: TShape;
    ks2: TShape;
    KB3: TMyPanel;
    ks3: TShape;
    KB4: TMyPanel;
    ks4: TShape;
    KB5: TMyPanel;
    KB6: TMyPanel;
    ks5: TShape;
    ks6: TShape;
    KB7: TMyPanel;
    KB8: TMyPanel;
    ks7: TShape;
    ks8: TShape;
    t2322: TMyPanel;
    s2322: TShape;
    t2408: TMyPanel;
    s2408: TShape;
    MyPanel2: TMyPanel;
    Shape1: TShape;
    ls: TMyPanel;
    Shape3: TShape;
    MyPanel3: TMyPanel;
    Shape2: TShape;
    Label22: TLabel;
    i38: TImage;
    ch1: TMyPanel;
    ch2: TMyPanel;
    ch3: TMyPanel;
    ch4: TMyPanel;
    ch5: TMyPanel;
    ch6: TMyPanel;
    ch7: TMyPanel;
    ch8: TMyPanel;
    ch9: TMyPanel;
    pb1: TMyPanel;
    ps1: TShape;
    pb2: TMyPanel;
    ps2: TShape;
    pb3: TMyPanel;
    ps3: TShape;
    pb4: TMyPanel;
    ps4: TShape;
    pb5: TMyPanel;
    ps5: TShape;
    pb6: TMyPanel;
    ps6: TShape;
    pb7: TMyPanel;
    ps7: TShape;
    pb8: TMyPanel;
    ps8: TShape;
    pb9: TMyPanel;
    ps9: TShape;
    pb10: TMyPanel;
    ps10: TShape;
    pb11: TMyPanel;
    ps11: TShape;
    pb12: TMyPanel;
    ps12: TShape;
    pb13: TMyPanel;
    ps13: TShape;
    pb14: TMyPanel;
    ps14: TShape;
    pv1: TMyPanel;
    ps15: TShape;
    pv2: TMyPanel;
    ps16: TShape;
    pv3: TMyPanel;
    ps17: TShape;
    pv4: TMyPanel;
    ps18: TShape;
    pv5: TMyPanel;
    ps19: TShape;
    pv6: TMyPanel;
    ps20: TShape;
    pv7: TMyPanel;
    ps21: TShape;
    pv8: TMyPanel;
    ps22: TShape;
    pv9: TMyPanel;
    ps23: TShape;
    pv10: TMyPanel;
    ps24: TShape;
    pv11: TMyPanel;
    ps25: TShape;
    pv12: TMyPanel;
    ps26: TShape;
    pv13: TMyPanel;
    ps27: TShape;
    pv14: TMyPanel;
    ps28: TShape;
    WSCRecorderPanel: TMyPanel;
    WSCStop: TMyPanel;
    WSCStart: TMyPanel;
    Label20: TLabel;
    Edit2: TEdit;
    VideoRecorderPanel: TMyPanel;
    VRDStop: TMyPanel;
    VRDStart: TMyPanel;
    Label11: TLabel;
    Edit1: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    ch10: TMyPanel;
    procedure ButtonMainClick(Sender: TObject);
    procedure ButtonDataExhClick(Sender: TObject);
    procedure ButtonVideoClick(Sender: TObject);
    procedure t24112_2Click(Sender: TObject);
    procedure t24111_2Click(Sender: TObject);
    procedure t24113Click(Sender: TObject);
    procedure t24111Click(Sender: TObject);
    procedure t73022Click(Sender: TObject);
    procedure et73022Click(Sender: TObject);
    procedure ek1Click(Sender: TObject);
    procedure t24102Click(Sender: TObject);
    procedure et5401Click(Sender: TObject);
    procedure et24113Click(Sender: TObject);
    procedure et24112Click(Sender: TObject);
    procedure et24111Click(Sender: TObject);
    procedure et24114Click(Sender: TObject);
    procedure t24093Click(Sender: TObject);
    procedure et24373Click(Sender: TObject);
    procedure et24372Click(Sender: TObject);
    procedure et24371Click(Sender: TObject);
    procedure et72121Click(Sender: TObject);
    procedure t72122Click(Sender: TObject);
    procedure ek2Click(Sender: TObject);
    procedure VRDStopClick(Sender: TObject);
    procedure VRDStartClick(Sender: TObject);
    procedure LandingServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure LSClick(Sender: TObject);
    procedure WSCStopClick(Sender: TObject);
    procedure WSCStartClick(Sender: TObject);
    procedure SampleGrabberBuffer(sender: TObject; SampleTime: Double;
      pBuffer: Pointer; BufferLen: Integer);
    procedure et2408Click(Sender: TObject);
    procedure UDPServer1UDPRead(Sender: TObject; AData: TBytes;
      ABinding: TIdSocketHandle);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure et24115Click(Sender: TObject);
    procedure t2407Click(Sender: TObject);
    procedure in1Click(Sender: TObject);
    procedure out1Click(Sender: TObject);
    procedure et72021Click(Sender: TObject);
    procedure et54022Click(Sender: TObject);
    procedure et54021Click(Sender: TObject);
    procedure GarlandTimerTimer(Sender: TObject);
    procedure et3401Click(Sender: TObject);
    procedure et24374Click(Sender: TObject);
    procedure et2322Click(Sender: TObject);
    procedure et7212Click(Sender: TObject);
    procedure et73021Click(Sender: TObject);
    procedure t24112Click(Sender: TObject);
    procedure t24092Click(Sender: TObject);
    procedure t24091Click(Sender: TObject);
    procedure t24101Click(Sender: TObject);
    procedure ep1Click(Sender: TObject);
    procedure pb1Click(Sender: TObject);
    procedure kb1Click(Sender: TObject);
    procedure t72121Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure t73021Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DataExchangePaint;
    procedure VideoSystemPaint;
    procedure MainPagePaint;
    procedure AllClientStart;
    procedure AllClientStop;
    procedure Garland;
    procedure ServMsd(var Msg: TMessage); message WM_NOTIFY_MAIN;
    procedure ServGr (var Msg: TMessage); message WM_NOTIFY_Graph;
    procedure ChangeMonitoring(Source:byte);
    procedure RepaintTable;
    procedure PaintCommutation(DestNumb:byte);
    procedure ChangeCommutation(SourceNumb:byte);
    procedure ActivateServer;
    procedure ChangeSourceVRD(Source:byte);
    procedure StartFilterGraph;
    procedure RecordFilterGraph;
    procedure ActivateMonitoring(vis:boolean);
    function  NameWithoutTab(str:string):string;
    procedure ChangeButton;
  private
    LastWSCSource:byte;
    LastDestin   :byte;
    LastSource   :byte;
    Commutation  :T25;
    LastVRDNumb  :int64;
    FastIn       :TFastDib;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;
  RefClock:IReferenceClock;
  CaptureFilter:IBaseFilter   = nil;
  AudioFilter  :IBaseFilter   = nil;
  VideoFilter  :IBaseFilter   = nil;
  SoundRender  :IBaseFilter   = nil;
  ISampleGrabb :ISampleGrabber= nil;
  ClockInFilter:IBaseFilter   = nil;
  SmartTee     :IBaseFilter   = nil;
  SmartTee2    :IBaseFilter   = nil;
  VideoEncoder :IBaseFilter   = nil;
  CSC          :IBaseFilter   = nil;
  MediaType    :_AMMediaType;
  pvi          :PvideoInfoHeader;
  FastIn       :TFastDib;
  dir          :string;
  FileName     :WideString;
  Multiplexer  :IBaseFilter;
  Writer       :IFileSinkFilter;
  BWidth, BHeight,MBitCount:integer;
  DickSize     :TLargeInteger;
  SourceName   :string        = 'UNKNOWN';

  const
  CLSID_FfdshowRawVideoFilter: TGUID = '{0B390488-D80F-4A68-8408-48DC199F0E97}';
  CLSID_Decklink_SDI_Video   : TGUID = '{44A8B5C7-13B6-4211-BD40-35B629D9E6DF}';//'{CE3FF814-04C1-4827-9F18-426203E9B1B3}';
  CLSID_Decklink_SDI_Audio   : TGUID = '{AAA22F7E-5AA0-49D9-8C8D-B52B1AA92EB7}';//'{1BCC3EF4-724F-4A45-B61D-8D4BBF32C5BF}';
  CLSID_ClockInFilter        : TGUID = '{7D7606FC-DF86-41E8-9067-CB6304C0AD1B}';
  CLSID_FfdshowVideoEncoder  : TGUID = '{4DB2B5D9-4556-4340-B189-AD20110D953F}';
  CLSID_ColorSpaceConverter  : TGUID = '{1643E180-90F5-11CE-97D5-00AA0055595A}';

implementation

uses BD, fm7212;

{$R *.dfm}

procedure TfMain.ChangeButton;
var p,p1,p2:TImage;
begin
  case PageControl.ActivePageIndex of
    0:  begin p:=pm; p1:=pd; p2:=pv; end;
    1:  begin p:=pd; p1:=pm; p2:=pv; end;
    2:  begin p:=pv; p1:=pd; p2:=pm; end;
  end;
  with p.Canvas do
  begin
    Brush.Color:=$00DAE0DE;
    Fillrect(p.ClientRect);
  end;
  with p1.Canvas do
  begin
    Brush.Color:=clMedGray;
    Fillrect(p1.ClientRect);
  end;
  with p2.Canvas do
  begin
    Brush.Color:=clMedGray;
    Fillrect(p2.ClientRect);
  end;
end;

function TfMain.NameWithoutTab(str: string):string;
var i:integer;
begin
  result:=str[1];
  for i:=2 to Length(str)-1 do
    if ((str[i]<>#10) and  (str[i+1]<>#13)) and
       ((str[i]<>#13) and  (str[i-1]<>#10)) then
        result:=result+str[i] else result:=result+' ';
  result:=result+str[Length(str)];
end;

procedure TfMain.RecordFilterGraph;
var hr:HResult;
begin
  FilterGraph1.Stop;
  WSCStart.DeviceState:=dsBlue;
  WSCStart.Enabled:=false;
  WSCStop.DeviceState:=dsGray;
  WSCStop.Enabled:=true;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  FilterGraph1.Active := true;
  CaptureFilter:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureFilter, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect "DeckLink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  AudioFilter:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, AudioFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(AudioFilter, 'DeckLink AudioCapture');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_ClockInFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, ClockInFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load ClockInFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(ClockInFilter, 'ClockInFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect ClockInFilter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee, 'SmartTee');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_InfTee, nil, CLSCTX_INPROC, IID_IBaseFilter, SmartTee2);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SmartTee2, 'SmartTee2');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SmartTee2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowVideoEncoder, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoEncoder);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoEncoder, 'VideoEncoder');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoEncoder','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_ColorSpaceConverter, nil, CLSCTX_INPROC, IID_IBaseFilter, CSC);
  if FAILED(hr) then begin
     Application.MessageBox('Error load CSC','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(CSC, 'CSC');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect CSC','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=SetOutputFileName(MEDIASUBTYPE_Avi, PWideChar(FileName), multiplexer, Writer);


    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,SmartTee as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SmartTee as IBaseFilter,nil,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,CSC as IBaseFilter,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $3','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;

    hr:=RenderStream(nil, nil, SmartTee as IBaseFilter,ClockInFilter as IBaseFilter,VideoEncoder as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $4','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, VideoEncoder as IBaseFilter,nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $5','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;


    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SmartTee2 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $6','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee2 as IBaseFilter, nil,multiplexer as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $7','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
   hr:=RenderStream(nil, @MEDIATYPE_Audio, SmartTee2 as IBaseFilter, nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $8','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  FilterGraph1.Play;
end;

procedure TfMain.StartFilterGraph;
var
  hr     :HResult;
begin
//HKEY_CURRENT_USER\Software\GNU\ffdshow_raw\default
  FilterGraph1.Stop;
  WSCStart.DeviceState:=dsGray;
  WSCStart.Enabled:=true;
  WSCStop.DeviceState:=dsBlue;
  WSCStop.Enabled:=false;
  FilterGraph1.ClearGraph;
  FilterGraph1.Mode:=gmCapture;
  FilterGraph1.Active := false;
  FilterGraph1.Active := true;
  CaptureFilter:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Video, nil, CLSCTX_INPROC, IID_IBaseFilter, CaptureFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(CaptureFilter, 'DeckLink Video Capture');
 if(hr <> s_ok) then
  begin
    Application.MessageBox('Error connect "DeckLink SDI" video filter','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  AudioFilter:=nil;
  hr := CoCreateInstance(CLSID_Decklink_SDI_Audio, nil, CLSCTX_INPROC, IID_IBaseFilter, AudioFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as  IGraphBuilder).AddFilter(AudioFilter, 'DeckLink AudioCapture');
  if(hr <> s_ok) then
  begin
    Application.MessageBox('Error load "Decklink SDI" audio filter','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  hr := CoCreateInstance(CLSID_FfdshowRawVideoFilter, nil, CLSCTX_INPROC, IID_IBaseFilter, VideoFilter);
  if FAILED(hr) then begin
     Application.MessageBox('Error load VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(VideoFilter, 'VideoFilter');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect VideoFilter','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr := CoCreateInstance(CLSID_DSoundRender, nil, CLSCTX_INPROC, IID_IBaseFilter, SoundRender);
  if FAILED(hr) then begin
     Application.MessageBox('Error load SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  hr:=(FilterGraph1 as iGraphBuilder).AddFilter(SoundRender, 'SoundRender');
  if FAILED(hr) then begin
     Application.MessageBox('Error connect SoundRender','Error vision system',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
     exit;
  end;
  with FilterGraph1 as IcaptureGraphBuilder2 do
  begin
    hr:=RenderStream(@PIN_CATEGORY_Preview, nil, CaptureFilter as IBaseFilter,VideoFilter as IBaseFilter,SampleGrabber as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $1','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, nil, SampleGrabber as IBaseFilter,nil,VideoWindow1 as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error video',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
      exit;
    end;
    hr:=RenderStream(nil, @MEDIATYPE_Audio, AudioFilter as IBaseFilter,nil,SoundRender as IBaseFilter);
    if FAILED(hr) then begin
      Application.MessageBox('Error create FilterGraph $2','Error audio',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
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
  FilterGraph1.Play;
end;


procedure TfMain.ChangeCommutation(SourceNumb: Byte);
begin
  if not (SourceNumb in [1..16]) then exit;
  if LastSource=SourceNumb then exit;
 // mEM7302.ExternalCommand(TI,LastDestin,SourceNumb);
end;
procedure TfMain.PaintCommutation(DestNumb: Byte);
var Numb:byte;
    Button:TXiButton;
begin
  if not (DestNumb  in [1..16]) then exit;
  if DestNumb=LastDestin then exit;
  Button:=fMain.FindComponent('out'+IntToStr(DestNumb)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSky;
  Button:=fMain.FindComponent('out'+IntToStr(LastDestin)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSilver;
  LastDestin:=DestNumb;
  Numb:=Commutation[DestNumb-1]+1;
  if not (Numb in [1..16]) then exit;
  if LastSource=Numb then exit;
  Button:=fMain.FindComponent('in'+IntToStr(Numb)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSky;
  Button:=fMain.FindComponent('in'+IntToStr(LastSource)) as TXiButton;
  if Button<>nil then Button.ColorScheme:=csNeoSilver;
  LastSource:=Numb;
end;

procedure TfMain.RepaintTable;
var i,j:integer;
    y1,y2:integer;
    Button:TMyPanel;
begin
  //???? ??????? ???, ???? ???????????????? ?????? ????? ????, ? ?? ?????? ???
 { Commutation:=EM73021.TableOfCommutation;
  Commutation[0]:=Random(8);
  Commutation[1]:=Random(8);
  Commutation[2]:=Random(8);
  Commutation[3]:=Random(8);
  Commutation[4]:=Random(8);
  Commutation[5]:=Random(8);
  Commutation[6]:=Random(8);
  Commutation[7]:=Random(8);
  Commutation[8]:=Random(8);
  i01.Canvas.Lock;
  with i01.Canvas do
  begin
    Brush.Color:=vt73021.ColorGrad;
    FillRect(i01.ClientRect);
    Pen.Color:=clBlack;
    Pen.Width:=2;
    Pen.Style:=psSolid;
    for i:=0 to 15 do
    begin
      Button:=fMain.FindComponent('out'+IntToStr(i+1)) as TMyPanel;
      if Button=nil then continue;
      if not Button.Enabled then continue;
      y1:=Button.Top+Button.Height div 2 - i01.Top;
      j:=Commutation[i];
      Button:=fMain.FindComponent('in'+IntToStr(j+1)) as TMyPanel;
      if Button=nil then continue;
      y2:=Button.Top+Button.Height div 2 - i01.Top;
      MoveTo(in1.Left+In1.Width-2,y2);
      LineTo(out1.Left,y1);
      if LastDestin=i+1 then
      if LastSource<>j+1 then
      begin
        Button.ColorDark:=$00F0964D;
        Button:=fMain.FindComponent('in'+IntToStr(LastSource)) as TMyPanel;
        if Button<>nil then Button.ColorDark:=$00F0964D;
        LastSource:=j+1;
      end;  
    end;
  end;
  i01.Canvas.Unlock; }
end;

procedure TFMain.ChangeMonitoring(Source: Byte);
var Button:TMyPanel;
begin
  if LastWSCSource<>17 then
  begin
    Button:=fMain.FindComponent('ch'+IntToStr(LastWSCSource+1)) as TMyPanel;
    if Button<>nil then Button.DeviceState:=dsGray;
  end;
  Button:=fMain.FindComponent('ch'+IntToStr(Source+1)) as TMyPanel;
  if Button<>nil then Button.DeviceState:=dsBlue;
  if Source in [0..9] then SourceName:=FSN[Source]
                      else SourceName:='UNKNOWN';
  LastWSCSource:=Source;
end;

procedure TFMain.ChangeSourceVRD(Source: byte);
var str:string;
begin
  if Source in [3..10] then str:=bdKU[KUToport[Source-2]].Name+' ' else
  if Source=1 then str:='LANDING' else
  if Source=2 then str:='MULTISCREEN' else
                     str:='UNKNOWN';
  if UDPServer1.Active then
  try UDPServer1.Send(IP24081,UDPServer1.DefaultPort,str);
  except end;
  if UDPServer2.Active then
  try UDPServer2.Send(IP24082,UDPServer2.DefaultPort,str);
  except end;
end;

procedure TFMain.ActivateServer;
var str:string;
begin
  if not TM2322.Exh1 and not TM2322.Exh2 then
  Application.MessageBox('The network does not work'+#10#13+'Manual mode of device adjustment switch on','NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK) else
  begin
    if TM2322.Exh1 then UDPServer1.Active:=true
    else begin
      str:='The network card with IP "'+TM2322.IP1+'" does not work';
      Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    end;
    if TM2322.Exh2 then UDPServer2.Active:=true
    else begin
      str:='The network card with IP "'+TM2322.IP2+'" does not work';
      Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    end;
    if TM2322.Exh3 then LandingServer1.Active:=true
    else begin
      str:='The network card with IP "'+TM2322.IP3+'" does not work';
      Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    end;
    if TM2322.Exh4 then LandingServer2.Active:=true
    else begin
      str:='The network card with IP "'+TM2322.IP4+'" does not work';
      Application.MessageBox(PAnsiChar(str),'NETWORK Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    end;
  end;
end;

procedure TFMain.SampleGrabberBuffer(sender: TObject; SampleTime: Double;
  pBuffer: Pointer; BufferLen: Integer);
var BLackCount:integer; //???-?? ????????? ?????? ????????
    Scaling:integer;
    n,m:integer;
    pc: TFColor;
    RGBGrey:byte;
    AllCount:integer;
begin
  BlackCount:=0;
  Scaling:=4;
  AllCount:=0;
  FastIn.SetInterface(pBuffer,BWidth,BHeight,MBitCount,8,8,8);
  for n:=1 to (BWidth div Scaling)-1 do
    begin
      for m := 1 to (BHeight div Scaling)-1 do
      begin
        if (n>=576 div scaling) or (m>=768 div scaling) then continue;
        pc:=FastIn.GetPixel(n*Scaling,m*Scaling);
        RGBGrey:= Round(0.3*pc.r+0.59*pc.g+0.11*pc.b);
        if RGBGrey=0 then Inc(BlackCount);
        inc(AllCount);
      end;
    end;
  if BlackCount=AllCount then  TM2322.VideoExh:=false else TM2322.VideoExh:=true;
end;

procedure TFMain.ServGr(var Msg: TMessage);
var Nk:TFastDib;
    n:integer;
    GraphCS:TCriticalSection;
    Gr0:TGraph;
    i:TImage;
begin
  n:=Msg.WParam;
  if n=1 then
  begin
    GraphCS:=GraphCS1;
    Gr0:=Gr[1];
    i:=i01;
  end else if n=2 then
  begin
    GraphCS:=GraphCS2;
    Gr0:=Gr[2];
    i:=i02;
  end else exit;
  GraphCS.Enter;
  try
    Nk:=TFastDib.Create;
    Nk.Width:= i.Width;
    Nk.Height:=i.Height;
    Nk.MakeCopy(Gr0.ReadyImage,true);
    Nk.FreeHandle:=False;
    i.Picture.Bitmap.Handle:=Nk.Handle;
    Nk.Free;
    i.Refresh;
  finally
    GraphCS.Leave;
  end;
end;

procedure TFMain.ServMsd(var Msg: TMessage);
begin
  case Msg.WParam of
    0: ChangeMonitoring(Msg.LParam);
    1: ActivateServer;
    2: ChangeSourceVRD(Msg.LParam+1);
  end;
end;

procedure TFMain.Garland;
  procedure SmartDeviceState(Panel:TMyPanel;NewState:TState);
  begin
    //?????? ????????????? ?? ????????
    if Panel.DeviceState<>NewState then Panel.DeviceState:=NewState;
  end;
  procedure SmartDeviceStateByName(Name:string;NewState:TState);
    var Panel:TMyPanel;
  begin
    Panel:=fMain.FindComponent(Name) as TMyPanel;
    if Panel<>nil then
      if Panel.DeviceState<>NewState then
        Panel.DeviceState:=NewState;
  end;
var i,j     :integer;
    fComSt  :TComSt;
    fDataExh:TExch;
    DE      :boolean;
    VE      :boolean;
begin
  case PageControl.ActivePage.PageIndex of
    0:  begin
          s2407.Brush.Color :=TM2407.Color;
          s24091.Brush.Color:=TM2409[1].Color;
          s24092.Brush.Color:=TM2409[2].Color;
          s24093.Brush.Color:=TM2409[3].Color;
          s7212.Brush.Color :=EM72121.Color;
          s72122.Brush.Color:=EM72122.Color;
          s2410.Brush.Color :=TM24101.Color;
          s24102.Brush.Color:=TM24102.Color;
          s7302.Brush.Color :=EM7302[1].Color;
          s73022.Brush.Color:=EM7302[2].Color;
          s2322.Brush.Color :=TM2322.Color;
          if TM2322.VideoExh then
          begin
            SmartDeviceState(WSCRecorderPanel,dsGreen);
            WSCRecorderPanel.Enabled:=true;
          end else
          begin
            SmartDeviceState(WSCRecorderPanel,dsRed);
            WSCRecorderPanel.Enabled:=false;
          end;
          Shape3.Brush.Color:=Landing.Color;
          Shape2.Brush.Color:=MTKState.CCTVColor;
          Shape1.Brush.Color:=MTKState.FullColor;
          if TM2408.DataExh then begin
                                   s2408.Brush.Color :=TM2408.Color;
                                   if Edit1.Text=' VRD2 not available' then Edit1.Text:='';
                                   if VideoRecorderPanel.DeviceState=dsRed then  VideoRecorderPanel.DeviceState:=dsGray;
                                 end else
                                 begin
                                   s2408.Brush.Color :=_Red;
                                   VRDStop.Enabled   :=false;
                                   VRDStart.Enabled  :=false;
                                   SmartDeviceState(VideoRecorderPanel,dsRed);
                                   Edit1.Text:=' VRD2 not available'
                                 end;
          s24111.Brush.Color:=TM2411[1].Color;
          s24112.Brush.Color:=TM2411[2].Color;
          s24113.Brush.Color:=TM2411[3].Color;
          s24114.Brush.Color:=TM2411[4].Color;
          s24115.Brush.Color:=TM2411[5].Color;
          for i:=1 to 8 do
            if bdKU[i].Use then
              if fMain.FindComponent('ks'+IntToStr(i))<>nil then
                TShape(fMain.FindComponent('ks'+IntToStr(i))).Brush.Color:=TM2220[i].Color;
          for i:=0 to 27 do
          if EM7210[i].Use then
          if fMain.FindComponent('ps'+IntToStr(i+1))<>nil then
            TShape(fMain.FindComponent('ps'+IntToStr(i+1))).Brush.Color:=EM7210[i].Color;
        end;
    1:  begin
          SmartDeviceState(etLanding,Landing.State);
          SmartDeviceState(et2322,TM2322.State);
          SmartDeviceState(et23221,TM2322.dsExh(1));
          SmartDeviceState(et23222,TM2322.dsExh(2));
          SmartDeviceState(et23223,TM2322.dsExh(3));
          SmartDeviceState(et23224,TM2322.dsExh(4));
          if TM2408.DataExh then
          begin
            SmartDeviceState(et2408,TM2408.State);
            SmartDeviceState(et24081,TM2408.dsExh(1));
            SmartDeviceState(et24082,TM2408.dsExh(2));
            SmartDeviceState(et24083,TM2408.dsExh(3));
            SmartDeviceState(et24084,TM2408.dsExh(4));
          end else
          begin
            SmartDeviceState(et2408,dsRed);
            SmartDeviceState(et24081,dsRed);
            SmartDeviceState(et24082,dsRed);
            SmartDeviceState(et24083,dsRed);
            SmartDeviceState(et24084,dsRed);
          end;
          SmartDeviceState(et24101,TM24101.State);
          fDataExh:=TM24101.Exch;
          for i:=1 to 16 do
          begin
            if i<>5 then
            SmartDeviceStateByName('et24101'+IntToStr(i),fDataExh[i]);
          end;
          SmartDeviceStateByName('et2410'+IntToStr(111),fDataExh[11]);
          SmartDeviceState(et24102,TM24102.State);
          fDataExh:=TM24102.Exch;
          for i:=1 to 16 do
          begin
            if i<>5 then
            SmartDeviceStateByName('et24102'+IntToStr(i),fDataExh[i]);
          end;
          SmartDeviceState(et7303_de,et241018.DeviceState);
          SmartDeviceState(et24111,TM2411[1].State);
          SmartDeviceState(et24112,TM2411[2].State);
          SmartDeviceState(et24113,TM2411[3].State);
          SmartDeviceState(et24114,TM2411[4].State);
          SmartDeviceState(et24115,TM2411[5].State);
          if TM2411[1].DataExh then SmartDeviceState(et24111de,dsGreen)
                               else SmartDeviceState(et24111de,dsRed);
          if TM2411[2].DataExh then SmartDeviceState(et24112de,dsGreen)
                               else SmartDeviceState(et24112de,dsRed);
          if TM2411[3].DataExh then SmartDeviceState(et24113de,dsGreen)
                               else SmartDeviceState(et24113de,dsRed);
          if TM2411[4].DataExh then SmartDeviceState(et24114de,dsGreen)
                               else SmartDeviceState(et24114de,dsRed);
          if TM2411[5].DataExh then SmartDeviceState(et24115de,dsGreen)
                               else SmartDeviceState(et24115de,dsRed);
          SmartDeviceState(et24092,TM2409[2].State);
          SmartDeviceState(et24091,TM2409[1].State);
          SmartDeviceState(et24093,TM2409[3].State);
          for j:=1 to 3 do
          begin
            fComSt:=TM2409[j].ComState;
            DE    :=TM2409[j].DataExh;
            for i:=1 to 8 do
            begin
              SmartDeviceStateByName('et2409'+IntToStr(j)+'_com'+IntToStr(i),fComSt[i]);
              SmartDeviceStateByName('et2409'+IntToStr(j)+'_com'+IntToStr(i)+'0',fComSt[i]);
            end;
            if DE then SmartDeviceStateByName('et2409'+IntToStr(j)+'_de',dsGreen)
                  else SmartDeviceStateByName('et2409'+IntToStr(j)+'_de',dsRed);
          end;
          SmartDeviceState(et72121,EM72121.State);
          for i:=0 to 13 do
          begin
            if EM7210[i].Use then
            begin
              DE   :=EM7210[i].DataExh;
              if DE then SmartDeviceStateByName('et72121_x'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('et72121_x'+IntToStr(i+1),dsRed);
              if DE then SmartDeviceStateByName('epx'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('epx'+IntToStr(i+1),dsRed);
              SmartDeviceStateByName('ep'+IntToStr(i+1),EM7210[i].State);
            end;
          end;
          SmartdeviceState(et72121_x15,et24091_com4.DeviceState);
          SmartDeviceState(et72121_x16,et24093_com7.DeviceState);
          SmartDeviceState(et72121_x17,et73021_com.DeviceState);
          SmartDeviceState(et72122,EM72122.State);
          for i:=0 to 13 do
          begin
            if EM7210[i+14].Use then
            begin
              DE   :=EM7210[i+14].DataExh;
              if DE then SmartDeviceStateByName('et72122_x'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('et72122_x'+IntToStr(i+1),dsRed);
              if DE then SmartDeviceStateByName('elx'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('elx'+IntToStr(i+1),dsRed);
              SmartDeviceStateByName('el'+IntToStr(i+1),EM7210[i+14].State);
            end;
          end;
          SmartDeviceState(et72122_x16,et24091_com7.DeviceState);
          SmartDeviceState(et72122_x17,et73022_com.DeviceState);
          SmartDeviceState(et72122_x15,et24093_com4.DeviceState);
          for i:=1 to 8 do
            if bdKU[KUtoPort [i]].Use then
            begin
              SmartDeviceStateByName('ek'+IntToStr(i),TM2220[KUtoPort [i]].State);
              SmartDeviceStateByName('ek'+IntToStr(i)+'de',TM2220[KUtoPort [i]].DEState);
              SmartDeviceStateByName('ek'+IntToStr(i)+'d', TM2220[KUtoPort [i]].DEState);
            end;
          SmartDeviceState(et3401 ,EM3401.State);
          SmartDeviceState(et5401 ,EM5401.State);
          SmartDeviceState(et5401internal,cEM5401.InternalState);
          SmartDeviceState(et24092_com52,et24092_com5.DeviceState);
          SmartDeviceState(et24092_com62,et24092_com6.DeviceState);
          SmartDeviceState(et24092_com72,et24092_com7.DeviceState);
          SmartDeviceState(et24092_com82,et24092_com8.DeviceState);
         // SmartDeviceState(et24091,TM2409[1].State);


          for i:=1 to 4 do
          begin
            SmartDeviceStateByName('et54021'+IntToStr(i),EM5402[1].ChannelState(i));
            SmartDeviceStateByName('et54022'+IntToStr(i),EM5402[2].ChannelState(i));
          end;
          SmartDeviceState(et54021,EM5402[1].State);
          SmartDeviceState(et54022,EM5402[2].State);
          SmartDeviceState(et73021,EM7302[1].State);
          if EM7302[1].DataExh then SmartDeviceState(et73021_de,dsGreen)
                               else SmartDeviceState(et73021_de,dsRed);
          if EM7302[1].ComState then SmartDeviceState(et73021_com,dsGreen)
                                else SmartDeviceState(et73021_com,dsRed);
          SmartDeviceState(et73022,EM7302[2].State);
          if EM7302[2].DataExh then SmartDeviceState(et73022_de,dsGreen)
                               else SmartDeviceState(et73022_de,dsRed);
          if EM7302[2].ComState then SmartDeviceState(et73022_com,dsGreen)
                                else SmartDeviceState(et73022_com,dsRed);


          for i:=1 to 4 do
          begin
            SmartDeviceStateByName('et2437'+IntToStr(i),EM2437[i].State);
            if EM2437[i].DataExh then SmartDeviceStateByName('et2437'+IntToStr(i)+'de',dsGreen)
                                 else SmartDeviceStateByName('et2437'+IntToStr(i)+'de',dsRed);
          end;
         { SmartDeviceState(et7302,EM7302.State);
          SmartDeviceState(et7302_x8,e7212_x17.DeviceState);
          SmartDeviceState(et7302_de,et24106.DeviceState); }


        end;
    2:  begin
           for i:=1 to 8 do
            if bdKU[i].Use then
            begin
              SmartDeviceStateByName('vk'+IntToStr(i),TM2220[i].State);
              SmartDeviceStateByName('vk'+IntToStr(i)+'_v', TM2220[i].SSPState);
              SmartDeviceStateByName('vk'+IntToStr(i)+'_v0',TM2220[i].SSPState);
            end;
          SmartDeviceState(vt3401,EM3401.State);
          SmartDeviceState(vt34011,EM3401.Channel1);
          SmartDeviceState(vt34012,EM3401.Channel2);
          SmartDeviceState(vt2322,TM2322.State);
          if TM2322.VideoExh then SmartDeviceState(vt2322ve,dsGreen)
                             else SmartDeviceState(vt2322ve,dsRed);
          if TM2408.DataExh then
          begin
            SmartDeviceState(vt2408,TM2408.State);
            if TM2408.Video then SmartDeviceState(vt2408ve,dsGreen)
                            else SmartDeviceState(vt2408ve,dsRed);
          end else
          begin
            SmartDeviceState(vt2408,dsRed);
            SmartDeviceState(vt2408ve,dsRed);
          end;
          SmartDeviceState(vt73021,EM7302[1].State);
          SmartDeviceState(vt73022,EM7302[2].State);
        //  RepaintTable;
          for i:=0 to 13 do
          begin
            if EM7210[i].Use then
            begin
              VE   :=EM7210[i].VideoExh;
              if VE then SmartDeviceStateByName('vpx'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('vpx'+IntToStr(i+1),dsRed);
              SmartDeviceStateByName('vp'+IntToStr(i+1),EM7210[i].State);
            end;
          end;     
          for i:=0 to 13 do
          begin
            if EM7210[i+14].Use then
            begin
              VE   :=EM7210[i+14].VideoExh;
              if VE then SmartDeviceStateByName('vbx'+IntToStr(i+1),dsGreen)
                    else SmartDeviceStateByName('vbx'+IntToStr(i+1),dsRed);
              SmartDeviceStateByName('vb'+IntToStr(i+1),EM7210[i+14].State);
            end;
          end;

          for i:=1 to 4 do
          begin
            SmartDeviceStateByName('vt2437'+IntToStr(i),EM2437[i].State);
            for j:=1 to 4 do
            begin
              case j of
                1: SmartDeviceStateByName('vt2437'+IntToStr(i)+IntToStr(j),EM2437[i].StateChannel1);
                2: SmartDeviceStateByName('vt2437'+IntToStr(i)+IntToStr(j),EM2437[i].StateChannel1);
                3: SmartDeviceStateByName('vt2437'+IntToStr(i)+IntToStr(j),EM2437[i].StateChannel3);
                4: SmartDeviceStateByName('vt2437'+IntToStr(i)+IntToStr(j),EM2437[i].StateChannel3);
              end;
            end;
          end;
        end;
  end;   
end;

procedure TFMain.GarlandTimerTimer(Sender: TObject);
var FreeBytesAvailableToCaller:TLargeInteger;
    TotalSize:TLargeInteger;
    FreeSize:TLargeInteger;
    FileSize:TLargeInteger;
begin
  if WSCStop.Enabled then
  begin
    GetDiskFreeSpaceEx(PChar('D:/'),
                       FreeBytesAvailableToCaller,
                       Totalsize,
                      @FreeSize);
    if DickSize=0 then begin DickSize:=FreeSize; FileSize:=0; end
                  else FileSize:=DickSize-FreeSize;
    Edit2.Text:='  SIZE : '+FloatToStrF(FileSize/1024/1024,ffFixed,12,2)+' Mb.';
  end else Edit2.Text:='';
  Garland;
end;

procedure TFMain.in1Click(Sender: TObject);
begin
  ChangeCommutation((Sender as TXiButton).Tag);
end;

procedure TFMain.FormActivate(Sender: TObject);
var i:integer;
begin
  for i:=1 to 38 do
  begin
    if fMain.FindComponent('i'+IntToStr(i))= nil then continue;
    with TImage(fMain.FindComponent('i'+IntToStr(i))).Canvas do
    begin
      if i=9 then Brush.Color:=clblack
             else Brush.Color:=clMedGray;
      FillRect(TImage(fMain.FindComponent('i'+IntToStr(i))).ClientRect);
    end;
  end;
  LastVRDNumb    :=0;
  FirstVRDMessage:=true;
  AllClientStart;
  MainPagePaint;
  DataExchangePaint;
  VideoSystemPaint;
  ButtonMainClick(self);
  GarlandTimer.Enabled:=true;
  Label22.Caption:='TM-2407'+#10#13+'(A28/A12)';
end;

procedure TFMain.MainPagePaint;
  procedure GiveMeNameE(Comp:TMyPanel;numb:TDeviceNameArr);
  begin
    Comp.TextPosition:=MyPanel.tpLeft;
    Comp.Caption :='       '+DeviceArr[numb].Name+' '+DeviceArr[numb].ShortSchemeName;
    Comp.Hint    :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.ShowHint:=true;
  end;
begin
  GiveMeNameE(t2322, d2322);
  GiveMeNameE(t2408, d2408);
  GiveMeNameE(t2407, d2407);
  GiveMeNameE(t24101, d24101);
  GiveMeNameE(t24091,d24091);
  GiveMeNameE(t24092,d24092);
  GiveMeNameE(t72121, d72121);
  GiveMeNameE(t73021, d73021);
  GiveMeNameE(t24111,d24111);
  GiveMeNameE(t24112,d24112);
  GiveMeNameE(t24113,d24113);
  GiveMeNameE(t24102,d24102);
  GiveMeNameE(t24093,d24093);
  GiveMeNameE(t72122, d72122);
  GiveMeNameE(t73022, d73022);
  GiveMeNameE(t24111_2,d24114);
  GiveMeNameE(t24112_2,d24115);
end;

procedure TFMain.ek1Click(Sender: TObject);
begin
  Und.Device  :=dku;
  Und.PostNumb:=(Sender as TMyPanel).Tag;
  Und.ShowModal;
end;

procedure TFMain.ek2Click(Sender: TObject);
begin
  Und.Tag:=1;
  Und.ShowModal;
end;

procedure TFMain.out1Click(Sender: TObject);
begin
  PaintCommutation((Sender as TXiButton).Tag);
end;

procedure TFMain.pb1Click(Sender: TObject);
begin
  Und.Device:=dzero;
  Und.PostNumb:=(Sender as TMyPanel).Tag;
  Und.ShowModal;
end;

procedure TFMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if UDPServer1.Active then try UDPServer1.Active:=false; except end;
  if UDPServer2.Active then try UDPServer2.Active:=false; except end;
  Write7212;
    if Assigned(FilterGraph1) then
  begin
    FilterGRaph1.Stop;
    FilterGraph1.Active:=False;
    FilterGraph1.Free;
  end;
  FastIn.Destroy;
  AllClientStop;
  StopEventGraph[1].Free;
  StopEventGraph[2].Free;
  cs_WSCPacket.Free;
   GraphCS1.Free;
  GraphCS2.Free;
end;

procedure TFMain.FormCreate(Sender: TObject);
var Wsa: TWSADATA;
begin
  cs_WSCPacket  :=TCriticalSection.Create;
  GraphCS1      :=TCriticalSection.Create;
  GraphCS2      :=TCriticalSection.Create;
  GraphBM1:=Graphics.TBitmap.Create;
  GraphBM1.Width :=i01.Width;
  GraphBM1.Height:=i01.Height;
  LastWSCSource := 17;
  LastDestin    := 255;
  LastSource    := 255;
  StopEvent73021 :=TEvent.Create(nil,false,false,'StopEvent73021');
  StopEvent73022 :=TEvent.Create(nil,false,false,'StopEvent73022');
  StopEvent72121 :=TEvent.Create(nil,false,false,'StopEvent72121');
  StopEvent72122 :=TEvent.Create(nil,false,false,'StopEvent72122');
  StopEvent5401 :=TEvent.Create(nil,false,false,'StopEvent5401');
  StopEvent24091:=TEvent.Create(nil,false,false,'StopEvent24091');
  StopEvent24092:=TEvent.Create(nil,false,false,'StopEvent24092');
  StopEvent24093:=TEvent.Create(nil,false,false,'StopEvent24093');
  StopEvent24101:=TEvent.Create(nil,false,false,'StopEvent24101');
  StopEvent24102:=TEvent.Create(nil,false,false,'StopEvent24102');
  StopEvent24101d:=TEvent.Create(nil,false,false,'StopEvent24101d');
  StopEvent24102d:=TEvent.Create(nil,false,false,'StopEvent24102d');
  StopEvent2322 :=TEvent.Create(nil,false,false,'StopEvent2322');
  StopEvent54021:=TEvent.Create(nil,false,false,'StopEvent54021');
  StopEvent54022:=TEvent.Create(nil,false,false,'StopEvent54022');
  StopEvent24111:=TEvent.Create(nil,false,false,'StopEvent24111');
  StopEvent24112:=TEvent.Create(nil,false,false,'StopEvent24112');
  StopEvent24113:=TEvent.Create(nil,false,false,'StopEvent24113');
  StopEvent24114:=TEvent.Create(nil,false,false,'StopEvent24114');
  StopEvent24115:=TEvent.Create(nil,false,false,'StopEvent24115');
  StopEvent3401 :=TEvent.Create(nil,false,false,'Stopevent3401');
  StopEventFull :=TEvent.Create(nil,false,false,'StopEventFull');
  StopEventGraph[1]:=TEvent.Create(nil,false,false,'StopEventGraph1');
  StopEventGraph[2]:=TEvent.Create(nil,false,false,'StopEventGraph2');
  if WSAStartUp($0101, Wsa)=SOCKET_ERROR then
  begin
    ShowMEssage('Winsock can"t be connected');
    exit;
  end;
  QueryPerformanceFrequency(GlobalFreq);
  if not ReadDataBase then
  begin
    Application.MessageBox('Error read file of database.'+#10#13+'App will be closed.','Fatal error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    Application.Terminate;
  end;
  FastIn:=TFastDib.Create;
  StartFilterGraph;
end;

procedure TFMain.AllClientStart;
begin
  mEM7302[1]:=TmEM7302.Create(IP73021,1,Handle,StopEvent73021);
  mEM7302[2]:=TmEM7302.Create(IP73022,2,Handle,StopEvent73022);
  EM72121   :=TEM7212.Create(StopEvent72121,1);
  EM72122   :=TEM7212.Create(StopEvent72122,2);
  cEM5401   :=TcEM5401.Create;
  EM5402[1] :=TEM5402.Create(StopEvent54021,1);
  EM5402[2] :=TEM5402.Create(StopEvent54022,2);
  cTM2411[1]:=TGetUPS.Create(IP24111,1,StopEvent24111);
  cTM2411[2]:=TGetUPS.Create(IP24112,2,StopEvent24112);
  cTM2411[3]:=TGetUPS.Create(IP24113,3,StopEvent24113);
  cTM2411[4]:=TGetUPS.Create(IP24114,4,StopEvent24114);
  cTM2411[5]:=TGetUPS.Create(IP24115,5,StopEvent24115);
  Landing   :=TLanding.Create;
  EM3401    :=TEM3401.Create(bdKU[KUtoPort[6]].Use,bdKU[KUtoPort[7]].Use);
  TM2322    :=TTM2322.Create(StopEvent2322,
                          IP23221,
                          IP23222,
                          IP23223,
                          IP23224);
  TM2408    :=TTM2408.Create;
  TM2409[1] :=TTM2409.Create(StopEvent24091,IP24091,
                          true,nil,d24111,
                          true,nil,d24112,
                          true,nil,d24113,
                          true, EM72121.COM1State,d72121,
                          false,nil,dzero,
                          false,nil,dzero,
                          true,EM72122.COM1State,d72122,
                          false,nil,dzero);
  TM2409[2] :=TTM2409.Create(StopEvent24092,IP24092,
                          false,nil,dzero,
                          false,nil,dzero,
                          false,nil,dzero,
                          false,nil,dzero,
                          true, EM5402[1].ComState,d54021,
                          true, EM5402[2].ComState,d54022,
                          true, EM3401.ComState,   d3401,
                          true,cEM5401.ComState,d5401);
  TM2409[3] :=TTM2409.Create(StopEvent24093,IP24093,
                          true,nil,d24114,
                          true,nil,d24115,
                          false,nil,dzero,
                          true, EM72122.COM2State,d72122,
                          false,nil,dzero,
                          false,nil,dzero,
                          true,EM72121.COM2State,d72121,
                          false,nil,dzero);
  TM24101   :=TTM2410.Create(StopEvent24101,1,
                  {1}       true,   TM2322.Exh1,       d2322,          IP23221,
                  {2}       true,   TM2409[1].DataExh, d24091,         IP24091,
                  {3}       true,   TM2408.Exh1,       d2408,          IP24081,
                  {4}       true,   TM2409[2].DataExh, d24092,         IP24092,
                  {5}       true,   nil,               d24102,         '',
                  {6}       true,   EM7302[1].DataExh, d73021,         IP73021,
                  {7}       false,  nil,               dzero,          '',
                  {8}       true,   nil,               d7303,          IP7303,
                  {9}       false,  nil,               dzero,          '',
                  {10}      false,  nil,               dzero,          '',
                  {11}      true,   Landing.DataExh,   dMTK1,          '',
                  {12}      true,   TM2411[1].DataExh, d24111,         IP24111,
                  {13}      false,  nil,               dzero,          '',
                  {14}      true,   TM2411[2].DataExh, d24112,         IP24112,
                  {15}      false,  nil,               dzero,          '',
                  {16}      true,   TM2411[3].DataExh, d24113,         IP24113);
  TM24101d  :=TTM2410.Create(StopEvent24101d,1,
                  {1}       true,   TM2322.Exh3,       d2322,          IP23223,
                  {2}       false,  nil,               dzero,          '',
                  {3}       true,   TM2408.Exh3,       d2408,          IP24083,
                  {4}       false,  nil,               dzero,          '',
                  {5}       false,  nil,               dzero,          '',
                  {6}       false,  nil,               dzero,          '',
                  {7}       false,  nil,               dzero,          '',
                  {8}       false,  nil,               dzero,          '',
                  {9}       false,  nil,               dzero,          '',
                  {10}      false,  nil,               dzero,          '',
                  {11}      false,  nil,               dzero,          '',
                  {12}      false,  nil,               dzero,          '',
                  {13}      false,  nil,               dzero,          '',
                  {14}      false,  nil,               dzero,          '',
                  {15}      false,  nil,               dzero,          '',
                  {16}      false,  nil,               dzero,          '');
  TM24102   :=TTM2410.Create(StopEvent24102,2,
                  {1}       true,   TM2322.Exh2,       d2322,          IP23222,
                  {2}       true,   TM2409[3].DataExh, d24093,         IP24093,
                  {3}       true,   TM2408.Exh2,       d2408,          IP24082,
                  {4}       false,  nil,               dzero,          '',
                  {5}       true,   nil,               d24101,         '',
                  {6}       true,   EM7302[2].DataExh, d73022,         IP73022,
                  {7}       false,  nil,               dzero,          '',
                  {8}       true,   nil,               d7303,          IP7303,
                  {9}       false,  nil,               dzero,          '',
                  {10}      false,  nil,               dzero,          '',
                  {11}      false,  nil,               dzero,          '',
                  {12}      true,   TM2411[4].DataExh, d24114,         IP24114,
                  {13}      false,  nil,               dzero,          '',
                  {14}      true,   TM2411[5].DataExh, d24115,         IP24115,
                  {15}      false,  nil,               dzero,          '',
                  {16}      false,  nil,               dzero,          '');
  TM24102d  :=TTM2410.Create(StopEvent24102d,2,
                  {1}       true,   TM2322.Exh4,       d2322,          IP23224,
                  {2}       false,  nil,               dzero,          '',
                  {3}       true,   TM2408.Exh4,       d2408,          IP24084,
                  {4}       false,  nil,               dzero,          '',
                  {5}       false,  nil,               dzero,          '',
                  {6}       false,  nil,               dzero,          '',
                  {7}       false,  nil,               dzero,          '',
                  {8}       false,  nil,               dzero,          '',
                  {9}       false,  nil,               dzero,          '',
                  {10}      false,  nil,               dzero,          '',
                  {11}      false,  nil,               dzero,          '',
                  {12}      false,  nil,               dzero,          '',
                  {13}      false,  nil,               dzero,          '',
                  {14}      false,  nil,               dzero,          '',
                  {15}      false,  nil,               dzero,          '',
                  {16}      false,  nil,               dzero,          '');
  TM2407   :=TTM2407.Create(EM2437[1].DeviceState,
                            EM2437[2].DeviceState,
                            EM2437[3].DeviceState,
                            EM2437[4].DeviceState,
                            EM5401.DeviceState,
                            EM5402[1].DeviceState,
                            EM5402[2].DeviceState,
                            EM5401.DeviceState);
  MTkState:=TFullState.Create;
end;

procedure TFMain.AllClientStop;
  procedure Stop(Thread:tThread;Event:TEvent);
  begin
    Thread.Terminate;
    Event.SetEvent;
    Thread.WaitFor;
    Thread:=nil;
    Event.Free;
  end;
begin
  Stop(MTKState,  StopEventFull);
  Stop(TM2322,    StopEvent2322);
  Stop(TM24101,   StopEvent24101);
  Stop(TM24101d,  StopEvent24101d);
  Stop(TM24102,   StopEvent24102);
  Stop(TM24102d,  StopEvent24102d);
  Stop(TM2409[1], StopEvent24091);
  Stop(TM2409[2], StopEvent24092);
  Stop(TM2409[3], StopEvent24093);
  Stop(cTM2411[1],StopEvent24111);
  Stop(cTM2411[2],StopEvent24112);
  Stop(cTM2411[3],StopEvent24113);
  Stop(cTM2411[4],StopEvent24114);
  Stop(cTM2411[5],StopEvent24115);
  Stop(EM5402[1], StopEvent54021);
  Stop(EM5402[2], StopEvent54022);
  Stop(EM3401,    StopEvent3401);
  Stop(mEM7302[1],StopEvent73021);
  Stop(mEM7302[2],StopEvent73022);
  Stop(EM72121,   StopEvent72121);
  Stop(EM72122,   StopEvent72122);
  Stop(cEM5401,   StopEvent5401);
  Landing.Free;
  TM2408.Free;

end;

procedure TFMain.ButtonDataExhClick(Sender: TObject);
begin
  PageControl.ActivePage:=DataExch;
  ChangeButton;
end;

procedure TFMain.ButtonMainClick(Sender: TObject);
begin
  PageControl.ActivePage:=WorkTable;
  ChangeButton;
end;

procedure TFMain.ButtonVideoClick(Sender: TObject);
begin
  PageControl.ActivePage:=VideoSys;
  ChangeButton;
end;

procedure TFMain.et72021Click(Sender: TObject);
begin
  mEM7302[1].ExternalCommand(TI,15,(Sender as TMyPanel).Tag);
end;

procedure TFMain.DataExchangePaint;
  procedure GiveMeName(Comp:TMyPanel;numb:TDeviceNameArr;shortName:boolean);
  begin
    if shortName then Comp.Caption :=DeviceArr[numb].Name+' '+DeviceArr[numb].ShortSchemeName
                 else Comp.Caption :=DeviceArr[numb].Name+' '+DeviceArr[numb].SchemeName;
    Comp.Hint    :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.ShowHint:=true;
  end;
  procedure GiveMeLabel(Comp:TLabel;numb:TDeviceNameArr);
  begin
    Comp.Caption :=DeviceArr[numb].Name+#10#13+DeviceArr[numb].SchemeName;
    ((Comp as TLabel).GetParentComponent as TMyPanel).Hint:=
                   DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    ((Comp as TLabel).GetParentComponent as TMyPanel).ShowHint:=true;
  end;
var i,j:integer;
begin
  GiveMeLabel(et24111l,d24111);
  GiveMeLabel(et24112l,d24112);
  GiveMeLabel(et24113l,d24113);
  GiveMeLabel(et24114l,d24114);
  GiveMeLabel(et24115l,d24115);
  with iDE.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(iDE.ClientRect);
  end;
  GiveMeName(et2322, d2322, false);
  GiveMeName(et2408, d2408, false);
  GiveMeName(et73021,d73021,false);
  GiveMeName(et73022,d73022,false);
  GiveMeName(et7303, d7303, false);
  GiveMeName(et24101,d24101, false);
  GiveMeName(et24102,d24102, false);
  GiveMeName(et24092,d24092,false);
  GiveMeName(et24091,d24091,false);
  GiveMeName(et24093,d24093,false);
  et23221.Hint   :='ip = '+IP23221;
  et23222.Hint   :='ip = '+IP23222;
  et23223.Hint   :='ip = '+IP23223;
  et23224.Hint   :='ip = '+IP23224;
  et24081.Hint   :='ip = '+IP24081;
  et24082.Hint   :='ip = '+IP24082;
  et24083.Hint   :='ip = '+IP24083;
  et24084.Hint   :='ip = '+IP24084;
  et73021_de.Hint:='ip = '+IP73021;
  et73022_de.Hint:='ip = '+IP73022;
  et7303_de.Hint :='ip = '+IP7303;
  et24111de.Hint :='ip = '+IP24111;
  et24112de.Hint :='ip = '+IP24112;
  et24113de.Hint :='ip = '+IP24113;
  et24114de.Hint :='ip = '+IP24114;
  et24115de.Hint :='ip = '+IP24115;
  et24092_de.Hint:='ip = '+IP24092;
  et24091_de.Hint:='ip = '+IP24091;
  et24093_de.Hint:='ip = '+IP24093;
  GiveMeName(et5401, d5401, true);
  GiveMeName(et3401, d3401, true);
  GiveMeName(et24371,d24371,true);
  GiveMeName(et24372,d24372,true);
  GiveMeName(et24373,d24373,true);
  GiveMeName(et24374,d24374,true);
  GiveMeName(et54021,d54021,true);
  GiveMeName(et54022,d54022,true);
  GiveMeLabel(label23,d72121);
  GiveMeLabel(label24,d72122);
end;

procedure TFMain.VideoSystemPaint;
  procedure GiveMeName(Comp:TMyPanel;Lab:TLabel;numb:TDeviceNameArr);
  var n:string;
  begin
    if numb=d2322 then n:='         ' else n:='';
    if Lab<>nil then
      Lab.Caption :=DeviceArr[numb].Name+DeviceArr[numb].ShortSchemeName
    else Comp.Caption:=n+DeviceArr[numb].Name+DeviceArr[numb].ShortSchemeName;
    Comp.Hint    :=DeviceArr[numb].FullName+#10#13+DeviceArr[numb].Name+DeviceArr[numb].SchemeName;
    Comp.ShowHint:=true;
  end;
begin
  with iVS.Canvas do
  begin
    Brush.Color:=clMedGray;
    FillRect(iVS.ClientRect);
  end;
  GiveMeName(vt24371,l24371,d24371);
  GiveMeName(vt24372,l24372,d24372);
  GiveMeName(vt24373,l24373,d24373);
  GiveMeName(vt24374,l24374,d24374);
  GiveMeName(vt3401, l3401, d3401);
  GiveMeName(vt7402, l7402, d7402);
  GiveMeName(vt2408, nil, d2408);
  GiveMeName(vt2322,nil,d2322);
  GiveMeName(vt73021, label61, d73021);
  GiveMeName(vt73022, label28, d73022);
  GiveMeName(vt7305, nil,d7305);
  GiveMeName(vt72131,nil,d72131);
  GiveMeName(vt72132,nil,d72132);
  GiveMeName(vt72133,nil,d72133);
end;

procedure TFMain.VRDStartClick(Sender: TObject);
begin
  Application.CreateForm(TfVRDS,fVRDS);
  fVRDs.LastSource:=17;
  fVRDS.ShowModal;
end;

procedure TFMain.VRDStopClick(Sender: TObject);
begin
  if UDPServer1.Active then
  try UDPServer1.SendBuffer(IP24081,UDPServer1.DefaultPort,ToBytes(0));
  except end;
  if UDPServer2.Active then
  try UDPServer2.SendBuffer(IP24082,UDPServer2.DefaultPort,ToBytes(0));
  except end;
end;

procedure TFMain.ActivateMonitoring(vis: Boolean);
var     i    :integer;
    BUTTON   :TMyPanel;
begin
  for i:=1 to 10 do
  begin
    BUTTON:=fMain.FindComponent('ch'+IntToStr(i)) as TMyPanel;
    if Button<>nil then Button.Enabled:=vis;
  end;
end;

procedure TFMain.WSCStartClick(Sender: TObject);
var fl_FOLDER:boolean;
begin
  //???????? ???????? ?????????? ???????
  dir := 'D:\'+FormatDateTime('dd_mm_yy',now);
  if not DirectoryExists(dir) then fl_Folder:=CreateDir(dir) else fl_Folder:=true;
  if not fl_FOLDER then
  begin
    Application.MessageBox('Not possible create folder for record','System Error',MB_DEFBUTTON2+MB_ICONERROR+MB_OK);
    exit;
  end;
  FileName:=(dir+'\'+SourceName+'_'+FormatDateTime('hhnnss',now)+'.avi');
  DickSize:=0;
  ActivateMonitoring(false);
  RecordFilterGraph;
end;

procedure TFMain.WSCStopClick(Sender: TObject);
begin
  ActivateMonitoring(true);
  StartFilterGraph;
end;

procedure TFMain.ep1Click(Sender: TObject);
begin
  Und.Device:=dzero;
  Und.PostNumb:=(Sender as TMyPanel).Tag;
  Und.ShowModal;
end;

procedure TFMain.et2322Click(Sender: TObject);
begin
  Und.Device:=d2322;
  Und.ShowModal;
end;

procedure TFMain.et2408Click(Sender: TObject);
begin
  Und.Device:=d2408;
  Und.ShowModal;
end;



procedure TFMain.et24111Click(Sender: TObject);
begin
  Und.Device:=d24111;
  Und.ShowModal;
end;

procedure TFMain.et24112Click(Sender: TObject);
begin
  Und.Device:=d24112;
  Und.ShowModal;
end;

procedure TFMain.et24113Click(Sender: TObject);
begin
  Und.Device:=d24113;
  Und.ShowModal;
end;

procedure TFMain.et24114Click(Sender: TObject);
begin
  Und.Device:=d24114;
  Und.ShowModal;
end;

procedure TFMain.et24115Click(Sender: TObject);
begin
  Und.Device:=d24115;
  Und.ShowModal;
end;

procedure TFMain.et24371Click(Sender: TObject);
begin
  Und.Device  :=d24371;
  Und.ShowModal;
end;

procedure TFMain.et24372Click(Sender: TObject);
begin
  Und.Device  :=d24372;
  Und.ShowModal;
end;

procedure TFMain.et24373Click(Sender: TObject);
begin
  Und.Device  :=d24373;
  Und.ShowModal;
end;

procedure TFMain.et24374Click(Sender: TObject);
begin
  Und.Device  :=d24374;
  Und.ShowModal;
end;

procedure TFMain.et3401Click(Sender: TObject);
begin
  Und.Device  :=d3401;
  Und.ShowModal;
end;

procedure TFMain.et5401Click(Sender: TObject);
begin
  Und.Device:=d5401;
  Und.ShowModal;
end;

procedure TFMain.et54021Click(Sender: TObject);
begin
  Und.Device  :=d54021;
  Und.ShowModal;
end;

procedure TFMain.et54022Click(Sender: TObject);
begin
  Und.Device  :=d54022;
  Und.ShowModal;
end;

procedure TFMain.et72121Click(Sender: TObject);
begin
//
end;

procedure TFMain.et7212Click(Sender: TObject);
begin
  Application.CreateForm(TfModulator,fModulator);
  fModulator.Caption:=NameWithoutTab((Sender as TMyPanel).Hint);
  fModulator.ShowModal;
end;

procedure TFMain.et73021Click(Sender: TObject);
begin
  Und.Device:=d73021;
  Und.ShowModal;
end;

procedure TFMain.et73022Click(Sender: TObject);
begin
  Und.Device:=d73022;
  Und.ShowModal;
end;

procedure TFMain.t72121Click(Sender: TObject);
begin
  Und.Device:=d72121;
  Und.ShowModal;
end;

procedure TFMain.t72122Click(Sender: TObject);
begin
  Und.Device:=d72122;
  Und.ShowModal;
end;

procedure TFMain.t73021Click(Sender: TObject);
begin
  Und.Device:=d73021;
  Und.ShowModal;
end;

procedure TFMain.t73022Click(Sender: TObject);
begin
  Und.Device:=d73022;
  Und.ShowModal;
end;

procedure TFMain.UDPServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
  procedure SmartDeviceState(Panel:TMyPanel;NewState:TState);
  begin
    //?????? ????????????? ?? ????????
    if Panel.DeviceState<>NewState then Panel.DeviceState:=NewState;
  end;
var CountOfCommand:byte;
    Command:int64;
begin
  if FirstVRDMessage then
  begin
    EM7302[1].FirstVRDMessage;
    FirstVRDMessage:=false;
  end;
  CountOfCommand:=Length(AData);
  case CountOfCommand of
    8:  begin
          Move(AData[0],Command,CountOfCommand);
          if Command=-1 then
          begin
            VRDStart.Enabled:=true;
            SmartDeviceState(VRDStart,dsGray);
            VRDStop.Enabled:=false;
            SmartDeviceState(VRDStop,dsBlue);
            Edit1.Text:='  STOP';
            SmartDeviceState(VideoRecorderPanel,dsGreen);
          end else
          if Command=-2 then
          begin
            VRDStart.Enabled:=false;
            SmartDeviceState(VRDStart,dsGray);
            VRDStop.Enabled :=false;
            SmartDeviceState(VRDStop,dsGray);
            Edit1.Text:='  PLAY';
            SmartDeviceState(VideoRecorderPanel,dsGray);
          end else
          begin
            VRDStart.Enabled:=false;
            SmartDeviceState(VRDStart,dsBlue);
            VRDStop.Enabled:=true;
            SmartDeviceState(VRDStop,dsGray);
            Edit1.Text:='  SIZE : '+FloatToStrF(Command/1024/1024,ffFixed,12,2)+' Mb.';
            SmartDeviceState(VideoRecorderPanel,dsGreen);
          end;
        end
    else
        if CountOfCommand=SizeOf(WSCPacket) then
        begin
          cs_WSCPacket.Enter;
          try
            Move(AData[0],WSCPacket,CountOfCommand);
            if LastVRDNumb<>WSCPacket.Numb then
            begin
              TM2408.NewPacketAnaliz;
              LastVRDNumb:=WSCPacket.Numb;
            end;
          finally
            cs_WSCPacket.Leave;
          end;
        end;
  end;
end;

procedure TFMain.t2407Click(Sender: TObject);
begin
  Und.Device:=d2407;
  Und.ShowModal;
end;

procedure TFMain.t24091Click(Sender: TObject);
begin
  Und.Device:=d24091;
  Und.ShowModal;
end;

procedure TFMain.t24092Click(Sender: TObject);
begin
  Und.Device:=d24092;
  Und.ShowModal;
end;

procedure TFMain.t24093Click(Sender: TObject);
begin
  Und.Device:=d24093;
  Und.ShowModal;
end;

procedure TFMain.t24101Click(Sender: TObject);
begin
  Und.Device:=d24101;
  Und.ShowModal;
end;

procedure TFMain.t24102Click(Sender: TObject);
begin
  Und.Device:=d24102;
  Und.ShowModal;
end;

procedure TFMain.t24111Click(Sender: TObject);
begin
  Und.Device:=d24111;
  Und.ShowModal;
end;

procedure TFMain.t24111_2Click(Sender: TObject);
begin
  Und.Device:=d24114;
  Und.ShowModal;
end;

procedure TFMain.t24112Click(Sender: TObject);
begin
  Und.Device:=d24112;
  Und.ShowModal;
end;

procedure TFMain.t24112_2Click(Sender: TObject);
begin
  Und.Device:=d24115;
  Und.ShowModal;
end;

procedure TFMain.t24113Click(Sender: TObject);
begin
  Und.Device:=d24113;
  Und.ShowModal;
end;

procedure TFMain.kb1Click(Sender: TObject);
begin
  Und.Device  :=dku;
  Und.PostNumb:=(Sender as TMyPanel).Tag;
  Und.ShowModal;
end;

procedure TFMain.LandingServer1UDPRead(Sender: TObject; AData: TBytes;
  ABinding: TIdSocketHandle);
var Packet1:TPacket;
begin
  if Length(AData)=sizeof(Packet1) then
  Move(AData[0],Packet1,sizeof(Packet1));
  Landing.NewPacket(Packet1);
end;

procedure TFMain.LSClick(Sender: TObject);
begin
  Und.Device:=dMTK1;
  Und.ShowModal;
end;

end.
