unit Global;

interface
uses Types,Messages,SyncObjs, Graphics, Math, sysutils, Classes,ComPortR,Windows,HreadEvent,FastDib;

const WM_NOTIFY_MSG = WM_USER + 123;
      WM_NOTIFY_MSD = WM_USER + 124;
      WM_NOTIFY_MSA = WM_USER + 125;
      WM_NOTIFY_MSU = WM_USER + 126;
      WM_NOTIFY_MSL = WM_USER + 127;
      WM_NOTIFY_TVD = WM_USER + 128;

const DevCount=50;//общее кол-во устройств
      ComCount=30;//общее кол-во COM
      
const Rcl = 360.0/32768.0;
      Rcs = 0.01;

const grad = 180/pi;

//параметры фильтров для сопровождения из базы
var
    slr:integer = 0;
    sud:integer = 0;
    LadogaLastWSP:byte=5;
    LadogaLastWSL:byte=5;
    Rbl_1:Word;    Rwh_1:Word;
    Rbl_2:Word;    Rwh_2:Word;
    Rbl_3:Word;    Rwh_3:Word;
    Rbl_4:Word;    Rwh_4:Word;
    Rbl_5:Word;    Rwh_5:Word;
    MaxP_1:integer;
    MaxP_2:integer;
    MaxP_3:integer;
    MaxP_4:integer;
    MaxP_5:integer;
    MK1   :double;
    MK2   :double;
    MK3   :double;
    MK4   :double;
    MK5   :double;
    MK6   :double;
    LunaCom:TComPortR;
    RezCom :TComPortR;
    ResRes:Cardinal = 0;
    LunRes:Cardinal = 0;
    OldRes:Cardinal = 0;
    OldLun:Cardinal = 0;
    LADOGA_NO_DATA:boolean = true;
    //признак учёта линейных смещений корабля в рассчётах
    flag_XYZ:boolean = false;
var
    //в ночное время линии луны рисуются по фаре
    flag_night:boolean=false;
    //Т.К. ПРЛК может одновременно вести несколько ЛА, переключение на ПРЛК1 или ПРЛК2 осуществляем вручную по команде РВП
    ResCh:byte=1;
    //угол глиссады в типе string - для более точного отображения в посадке
    st_Alpha:string;
    //the same for BettA angle
    st_Betta:string;
    //флаг начала протокола
    fl_protocol:boolean=false;
    //флаг готовности к протоколу
    fl_rprotocol:boolean=false;
    //размер базы
    Base:double;
    //угол наклона линии базы к линии посадки - не равен 90.
    Alfa_Base:single;
    //угол наклона  линии посадки к диаметральной плоскости аэродрома
    Azl:double=0;
    //глиссада
    Alpha:double=4;
    //системная конфигурация, Base = 0
    SysConfig:byte=0;
    //номер осевой камеры
    Axial:byte=8;
    //номер типа ЛА
    Aircraft:integer;
    //рачсчёт координат по 0 - ТВ, 1 - ПРЛК
    Track:byte = 0;
    //номер ЛА в отсутствие ПРЛК
    AirNumb:integer;
    //флаг смены фильтра сопровождения или адаптивного порога
    fl_Change:byte=0;
    //признак записи на УВЗ
    fl_VRD:byte=0;
    //имя центрального оператора
    Operator_ID:string;
    fl_STOP:boolean=false;
    GlobalMaxDistance:single;
    GlobalMinDistance:single;
    Mile:double;
    Foot:double;
    SI:boolean;
    vChart   :boolean;
    fl_Training:boolean=false;
    aBETTA:single=0;
    BettaCorrection:single;

var EReturn:SECURITY_ATTRIBUTES;
    h5401,h2220:Cardinal;
Type
  TProtocolLine  = record
     //номер записи
     pN:integer;
     //дальность от ПРЛК
     pDrl,
     //дальность наклонная от ПРЛК
     pDnrl,
     //дальность наклонная от ТВ
     pDntv,
     //отклонение боковое от ПРЛК
     pLRrl,
     //отклонение боковое от ТВ
     pLRtv,
     //отклонение вверх по ПРЛК
     pUDrl,
     //отклонение вверх по ТВ
     pUDtv     :double;
     //точка сопровождения
     pTracking :string[15];
     //время записи
     pTime     :TDateTime;
  end;

Type
  TName =record
     //номер протокол
     nN           :integer;
     //Время и дата начала протокола
     nStartDate   :TDateTime;
     //угол глиссады
     nGlidepath  :single;
     //список камер сопровождения
     nKUList      :string[20];
     //имя центрального оператора
     nOperator    :string[20];
  end;

var
    //номер текущего протокола
    Protocol_ID:int64;
    //заголовок протокола сопровождения
    NameProtocol :TName;
    //номер записи протокола
    CountProtocol:int64=0;
    //флаг включения режима компенсации качки  по Луне
    flag_PC:boolean  = false;
    //флаг включения режима компенсации качки по ПРЛК
    flag_PR:boolean  = false;

type
  TShipData = record
  fNPRLK:    byte;        //номер ПРЛК
  fAccomp:   byte;        //признак сопровождения ПРЛК
  fDist:     single;      //дальность до ЛА по ПРЛК
  fCourse:   single;      //угол курса ЛА по ПРЛК
  fAlt:      single;      //угол места ЛА по ПРЛК
  fNomLA:    word;        //номер борта ЛА
  fSpeedLA:  single;      //скорость ЛА по ПРЛК
  fSpeedVr:  single;      //скорость вертикальная ЛА по ПРЛК
  fTrack:    byte;        //дальность до ЛА от ПРЛК или МТК
  fGlissad:  single;      //угол глиссады
 // fAlgNum:   byte;        //признак сопровождения ЛА
  fKU:       byte;        //номера КУ  старший полубайт - номер осевой камеры, далее SysConfig
  fDate:     TDateTime;   //единое время по гринвичу
  fVRD:      byte;        //признак записи
  fErrorST:  single;      //ошибка стабилизации глиссады Луной
  fBettaOLS: single;      //угол Betta установленный Луной
  fDTP:      single;      //дальность ЛА - РТП
  fHv:       single;      //вертикальное отклонение ЛА
  fHg:       single;      //горизонтальное отклонение ЛА
  fGz:        integer;     //положение середины зелёной зоны ( в пикселях)
  fUpz,fDownZ: integer;     //положение зелёной зоны
  fUpY,fDownY: integer;     //положение жёлтой зоны
  fUpR,fDownR: integer;     //положение красной зоны
  re,lu,te : boolean;     //присутствие трёх систем
  fx,fy    : integer;     //положение маркера сопровождения для ЛА
  fflag:     boolean;     //флаг (временный) рисовать дальность или нет
  fPCVisible:boolean;     //признак компенсации качки Луной мигает, пока нет среднег значения
  fLadErr   :boolean;     //нет данных от Ладоги - ошибка осреднённого положения
  fPC       :boolean;     //флаг компенсации качки Луной
  fPCH      :boolean;     //флаг компенсации качки по горизонту
  fAlphaST  : single;     //угол БУО в режиме стабилизации глиссады  Луной
  Teta,Psi,VL,Course: single;
  end;

var ShipData:TShipData;


type
  TLU=Array[1..8] of int64;
  TRz=Array[1..9] of int64;
var
  LeftLU:TLU;
  LeftRz:TRz;

type
  TExternalD=record
    OLS:byte;
    Telem:byte;
    PRLK:byte;
  end;

var ExternalDevice:TExternalD;

type
  TLA=record
    LA_ID:byte;
    Name:string;
    XE,YE,ZE,         //отклонение положения глаза
    XF,YF,ZF,         //отклонение положения фары
    XG,YG,ZG:double;  //отклонение положения гака
  end;
  
var LASet:array of TLA;

TYPE HDD = record HDD_NAME:char; TotalSpace,FreeSpace:Single; end;
     THDDEnum=array [1..4] of HDD;

TYPE LAN = record LanIP:String[15];State:boolean; end;
     TLanEnum=array [1..2] of LAN;

TYPE TSMS=record
     HOST     :word;
     HDDCount :word;
     HDDEnum  :THDDEnum;
     LanCount :word;
     LanEnum  :TLANEnum;
     Video    :boolean;
end;

var TempSMS:TSMS;

type
  BufferBmp=array[0..64,0..64] of byte;
  TEscortResult=record
    Host:Word;
    Mouse:TPoint;
    Bmp:BufferBmp;
    BmpSize:word;
    SetNumber:int64;
    Luna:TLU;
    Rez :TRz;
   // Tel :TTT;
    SMS :TSMS;
  end;
  pBMp=^BufferBmp;

var MP:Array [1..3] of TPoint;

var
  ViX:integer=360;
  ViY:integer=288;
  PR:String;
  MinVI,MaxVI:integer;
  SOPRGrey:BufferBmp; // массив SOPR в сером по ТВ формуле 0.3Red+0.59Gren+0.11Blue
  cs_Auto  : TCriticalSection;
  adx,ady:integer;        //координаты объекта сопровождения внутри фрагмента SOPRGrey
  fl_Video,fl_VideoEsc:boolean; //детектор видео внутренний и для отправки центральному оператору
  fl_EscortResult:array [2..3] of boolean = (false,false);
  HOST_TP:word;           // тип машины 1-центральный,2-левый,3-правый,4-левый в режиме правого
  {все из базы данных}
  IP_SrvWSC1: String = '';
  IP_SrvWSC2: String = '';
  IP_SrvVRD1: String = '';
  IP_SrvVRD2: String = '';
  IP_SrvWSL1: String = '';
  IP_SrvWSL2: String = '';
  IP_SrvWSR1: String = '';
  IP_SrvWSR2: String = '';
  IP_2409_1 : String = '';
  IP_2409_2 : String = '';
  IP_Printer: String = '';
  IP_2411_1 : String = '';
  IP_2411_2 : String = '';
  IP_2411_3 : String = '';
  IP_Broadcast:string = '192.168.1.255';
  sizebm: Integer = 32;
  sizebm_:integer = 32;//временная величина
  div_2,div_5:integer;//рисование рамок
  div_8,div_32:integer;//границы адаптивного порога
  porog:integer;
  MaxP:integer=50;
  VideoCount:int64;
  TimeGrabber:double;
  EscortResult:array  [2..3] of TEscortResult;
  UDPSendCounter: array [2..3] of int64 = (0,0);
  fl_IndependentEscort:boolean=false;//разрешение на автономное сопровождение
  fl_ChangeOfMode:boolean=false;//флаг смены режима сопровождения
  fl_CenralNoConnect:boolean=false;
  DEVICE_ID:word;
  fl_LAN1:boolean=true; //флаги активных сетей
  fl_LAN2:boolean=true;
  //ручной режим сопровождения или автомат
  AutoSopr:word=0;
  cs_AutoSopr:word=0;
  // сопровождение по фаре, гаку или силуэту
  AlgNum:word=0;
  cs_AlgNum:word=0;
  //выбор алгоритма сопровождения
  AlgSopr:word=0;
  //размеры и параметры фильтров
  AlgFilter:byte=1;
  cs_AlgSopr:word=0;
  //посылка о состоянии режима сопровождения
  EscortMode:string[3]='100';
  GlobalStop:boolean=false;
  TimeExh:TDateTime;
  fl_Global:boolean;
  fl_NP:boolean=false;
  cs_Ladoga:TCriticalSection;
  NumChanel:word=0;
  WaitEvent : TWaitEvent;
  TranDir:WideString;
  TranName:WideString;
  TranReady:array[1..3] of byte=(0,0,0);
  //флаг записи для стереопары
  fl_Record:boolean =false;
  //нужен для синхронизации при записи/воспроизведении стереопары
  NeverUse:cardinal;

TYPE                         //параметры COM-портов
  TComList=record
  cCom:integer;
  cBaudRate:TBaudRate;
  cByteSize:TByteSize;
  cEnableDTR:boolean;
  cEnableRTS:boolean;
  cParity:TParity;
  cStopBits:TStopBits;
  cTimeOut:integer;
//  cComState:integer;//0-открыт,1-закрыт,2-занят,4-закрыт
  end;

var
  ComList:array [1..ComCount] of TComList;
  cs_ComState:TCriticalSection;

TYPE                        //комманды устройств
   TCommand=record
   cCOM_ID:integer;        //номер команды
   cCommand:integer;       //комманда
   cComandCount:integer;   //размер команды на чтение данных
   cAnswerCount:integer;
   cComment:string[100];
 end;

var
 Command_TM2220:array [1..33] of TCommand;  
 Command_EM5401:array [1..10] of TCommand;
 Command_EM2437:array [1..20] of TCommand;
 Command_EM7401:array [1..10] of TCommand;

TYPE
    TTM2404State=record
    com1:boolean;
    com2:boolean;
    //0 - нет , 1 - есть , 2 - первое включение - загрузка параметров из базы обязательна
    Work:array [23..31] of byte;
   { указания к выполнению
    $80 - идентификация
    $40 - перезагрузка параметров блока из базы по требованию системы
    $20 - перезагрузка параметров блока по требованию пользователя
    $10 - запрос наработки}
    DoIt:array [23..31] of byte;
    //статус блока для анализа
    Status:Array [23..31] of byte;
    //кол-во запросов по двум COM
    TotalQuery1:byte;
    PositiveQuery1:byte;
    TotalQuery2:byte;
    PositiveQuery2:byte;
  end;
var TM2404State:TTM2404State;
    cs_2404:TCriticalSection;

TYPE                   //связь номера устройства с номером COM и адресом
 TComDev=record
   cDEV_ID:integer;
   cCom_ID:integer;
   cDev_Name:string[20];
   cAdress:integer;
 end;

var
 COMDev: array[1..DevCount] of TComDev;
 List2404:TStringList;
 ListKU  :TStringList; 
 fl_ListProtocol:boolean=true;

 //для работы с СОМ-портами используется несколько списков комманд и соответственно критических секций к ним
 CommandList   :TList; //список команд - высокий  приоритет
 QuestionList  :TList; //опросный лист - низкий приоритет
 DeleteList    :TList; //лист команд на удаление
 ExternalList   :TList;
 cs_External   :TCriticalSection;
 TypeNP:byte=0;

const
      Color_G : TColor = $009AE129;
      Color_R : TColor = $004542F3;
      Color_B : TColor = $00d3d3d3;
      Color_Y : TColor = $0034c9fd;
      Color_S : TColor = clSilver;
      Color_W : TColor = clWhite;
      ChangeOfMode: array [1..6] of string=
      (' auto tracking:   ',' manual tracking: ','  monitoring:      ',' silhouette',' head lamp',' hook');

var  LanCount:word;
     HDDCount:word;
     HDDEnum:THDDEnum;
     LanEnum:TLanEnum;

type TKUConst=record
     Umin1, Umax1,  //границы жёлтого сектора напряжения
     Umin2, Umax2,  //границы красного сектора напряжения
     Tmin1, Tmax1,  //границы жёлтого сектора температуры
     Tmin2, Tmax2,  //границы красного сектора температуры
     Nmin,  Nmax,   //границы скорости вращения венилятора
     H1,    H2      //границы влажности
     :double;
     fl_U1,
     fl_U2,
     fl_T1,
     fl_T2,
     fl_N,
     fl_H1,
     fl_H2
     :boolean;
     end;

var KUConst: TKUConst;

TYPE
  TARM  = class(TObject)
  Private
    FDataExh  : Byte;      //Обмен есть!
    FLunExh   : Byte;      //Луна. Обмен есть!
    FRezExh   : Byte;      //Резистор. Обмен есть!
    FTelExh   : Byte;      //Телем. Обмен есть!
    FSyncTime : TDateTime; //Время последнего обмена
    FVideoTDV : boolean;   //Видеосигнал с КУ
    FLANCount : Word;      //Количество сетевых карт
    FLAN      : TLanEnum;  //Lan
    FHDDCount : Word;      //Количество дисков
    FHDD      : THDDEnum;  //Свободное простанство на дисках
    FType     : word;      //Тип АРМ, 2 - WSl, 3 - WSR
  Public
    Property HDD      : THDDEnum    read FHDD      write FHDD;
    Property LAN      : TLanEnum    read FLAN      write FLAN;
  Published
    Property DataExh  : Byte  read FDataExh  write FDataExh;
    Property LunExh   : Byte  read FLunExh   write FLunExh;
    Property RezExh   : Byte  read FRezExh   write FRezExh;
    Property TelExh   : Byte  read FTelExh   write FTelExh;
    Property SyncTime : TDateTime  read FSyncTime write FSyncTime;
    Property VideoTDV : boolean  read FVideoTDV write FVideoTDV;
    Property LANCount : Word  read FLANCount write FLANCount;
    Property HDDCount : Word  read FHDDCount write FHDDCount;
    Property aType    : Word  read FType     write FType;
  End;

  TKU = class(TObject)
  Private
    FDataExh : byte;      //обмен есть
    FTVK     : Boolean;   //Признак включения ТВ-камеры. 1 - включена
    FUpit    : Single;    //Напряжение питания видеокамеры
    FTemp    : Single;    //Температура внутри видеокамеры
    FTeIn    : Boolean;   //Признак достоверности температуры. 1 - достоверна
    FVlag    : Single;    //Уровень влажности внутри видеокамеры
    FVeOn    : Boolean;   //Признак включения вентилятора
    FVent    : Word;      //Скорость вращения вентилятора
    FVeAu    : Boolean;   //Режим работы вентилятора 1 - автомат
    FPwOn    : Boolean;   //Признак включения обогревателя
    FPwIn    : Boolean;   //Признак исправности обогрева. 1 - исправен
    FPwAu    : Boolean;   //Режим работы обогревателя 1 - автомат
    FSSP     : Boolean;   //Признак наличия синхросигнала. 1 - ССП в видеосигнале есть
    FCvet    : Boolean;   //Признак наличия цветности. 1 - есть
    FSvd     : Boolean;   //Признак включения светодиода. 1 - включен
    FUsY     : Word;      //Коэффициент усиления в корректоре "Y"
    FbUsY    : Word;      //коэффициент усиления в корректоре "Y" в базе
    FAhxY    : Word;      //Наклон АЧХ в корректоре "Y"
    FbAhxY   : Word;      //Наклон АЧХ в корректоре "Y" в базе
    FUsC     : Word;      //Коэффициент усиления в корректоре "C"
    FbUsC    : Word;      //Коэффициент усиления в корректоре "C"  в базе
    FAhxC    : Word;      //Наклон АЧХ в корректоре "C"
    FbAhxC   : Word;      //Наклон АЧХ в корректоре "C" в базе
    FHour    : Word;      //Наработка видеокамеры
    FError   : String;    //Комментарии ошибок обмена
    FPubl    :String;
  Published
    Property DataExh : byte read FDataExh write FDataExh;
    Property Upit    : Single   read FUpit  write FUpit;
    Property Temp    : Single   read FTemp  write FTemp;
    Property Vlag    : Single   read FVlag  write FVlag;
    Property Vent    : Word     read FVent  write FVent;
    Property VeOn    : Boolean  read FVeOn  write FVeOn;
    Property PwOn    : Boolean  read FPwOn  write FPwOn;
    Property Hour    : Word     read FHour  write FHour;
    Property PwAu    : Boolean  read FPwAu  write FPwAu;
    Property VeAu    : Boolean  read FVeAu  write FVeAu;
    Property SSP     : Boolean  read FSSP   write FSSP;
    Property Cvet    : Boolean  read FCvet  write FCvet;
    Property PwIn    : Boolean  read FPwIn  write FPwIn;
    Property Svd     : Boolean  read FSvd   write FSvd;
    Property TVK     : Boolean  read FTVK   write FTVK;
    Property TeIn    : Boolean  read FTeIn  write FTeIn;
    Property UsY     : Word     read FUsY   write FUsY;
    Property AhxY    : Word     read FAhxY  write FAhxY;
    Property UsC     : Word     read FUsC   write FUsC;
    Property AhxC    : Word     read FAhxC  write FAhxC;
    Property bUsY    : Word     read FbUsY  write FbUsY;
    Property bAhxY   : Word     read FbAhxY write FbAhxY;
    Property bUsC    : Word     read FbUsC  write FbUsC;
    Property bAhxC   : Word     read FbAhxC write FbAhxC;
    Property Error   : String   read FError write FError;
    Property Publ    : String   read FError write FError;
  End;

  TUPSParam = Array[0..5] of Integer;
  TUPS  = class(TObject)
  Private
    FDataExh       : Byte;      //Обмен есть!
    FParams        : TUPSParam;
    FPState        : TUPSParam;
    FState         : Word;
    FDirective     : TStringList;
    FInformation   : TStringList;
  Public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  Public
    Property Params      : TUPSParam read FParams      write FParams;
    Property PState      : TUPSParam read FPState      write FPState;
    Property DataExh     : Byte      read FDataExh     write FDataExh;
    Property State       : Word      read FState       write FState;
    Property Directive   : TStringList  read FDirective   write FDirective;
    Property Information : TStringList  read FInformation write FInformation;
  End;

  TGateways=Array[1..8] of byte;
  TEM2409 = class(TObject)
  Private
    FDataExh   : Byte; //Обмен есть!
    FChannel   : TGateways;
  Public
    Property Channel :TGateways read FChannel   write FChannel;
  Published
    Property DataExh   : Byte read FDataExh   write FDataExh;
  End;

  TSwitch=Array[1..16]of byte;
  TEM2410 = class(TObject)
  Private
    FDataExh   : Byte; //Обмен есть!
    FChannel   : TSwitch;
  Public
    Property Channel :TSwitch read FChannel   write FChannel;
  Published
    Property DataExh   : Byte read FDataExh   write FDataExh;
  End;

  TEM3401 = class(TObject)
  Private
    FDataExh : Byte;  //Обмен есть!
    FSignY1  : Byte;  //Яркость 1 есть!
    FSignC1  : Byte;  //Цветность 1 есть!
    FSignY2  : Byte;  //Яркость 2 есть!
    FSignC2  : Byte;  //Цветность 2 есть!
    FCSumm1  : Byte;  //Текущий пакет верен!
    FCSumm0  : Byte;  //Предыдущий пакет верен!
  Published
    Property DataExh : Byte read FDataExh write FDataExh;
    Property SignY1  : Byte read FSignY1  write FSignY1;
    Property SignC1  : Byte read FSignC1  write FSignC1;
    Property SignY2  : Byte read FSignY2  write FSignY2;
    Property SignC2  : Byte read FSignC2  write FSignC2;
    Property CSumm1  : Byte read FCSumm1  write FCSumm1;
    Property CSumm0  : Byte read FCSumm0  write FCSumm0;
  End;

  //т.к. канала 4 ArrStateDevice для 5402 не используем,хотя мысль та же
  TEM5402 = class(TObject)
  Private
    FDataExh  : Byte;       //Обмен есть!
    Fuse1     : boolean;    //использование канала
    FCh1      : byte;       //статус канала  0 - неисправно, 1 - исправно, 2- не опрошено, 3 - жёлтая зона
    FTQ1      : word;       //TotalQuery
    FPQ1      : word;       //PositiveQuery
    FDev1     : byte;       //DEVICE_ID устройства, подключённого к этому каналу
    Fuse2     : boolean;
    FCh2      : byte;
    FTQ2      : Word;
    FPQ2      : Word;
    FDev2     : byte;
    Fuse3     : boolean;
    FCh3      : byte;
    FTQ3      : Word;
    FPQ3      : Word;
    FDev3     : byte;
    Fuse4     : boolean;
    FCh4      : byte;
    FTQ4      : Word;
    FPQ4      : Word;
    FDev4     : byte;
  Published
    Property DataExh : Byte    read FDataExh  write FDataExh;
    Property Use1    : boolean read Fuse1     write Fuse1;
    Property Use2    : boolean read Fuse2     write Fuse2;
    Property Use3    : boolean read Fuse3     write Fuse3;
    Property Use4    : boolean read Fuse4     write Fuse4;
    Property Ch1     : byte    read FCh1      write FCh1;
    Property Ch2     : byte    read FCh2      write FCh2;
    Property Ch3     : byte    read FCh3      write FCh3;
    Property Ch4     : byte    read FCh4      write FCh4;
    Property TQ1     : word    read FTQ1      write FTQ1;
    Property TQ2     : word    read FTQ2      write FTQ2;
    Property TQ3     : word    read FTQ3      write FTQ3;
    Property TQ4     : word    read FTQ4      write FTQ4;
    Property PQ1     : word    read FPQ1      write FPQ1;
    Property PQ2     : word    read FPQ2      write FPQ2;
    Property PQ3     : word    read FPQ3      write FPQ3;
    Property PQ4     : word    read FPQ4      write FPQ4;
    Property Dev1    : byte    read FDev1     write FDev1;
    Property Dev2    : byte    read FDev2     write FDev2;
    Property Dev3    : byte    read FDev3     write FDev3;
    Property Dev4    : byte    read FDev4     write FDev4;
  End;

  TEM5401 = class(TObject)
  Private
    FDataExh : Byte;       //Обмен есть!
    FIfBus   : Byte;       //Байт статуса устройства
    FIfBSync : Byte;       //Байт состояния синхросигналов
    FIfBTst  : Byte;       //Байт состояния тестовых входов
    FHour    : DWord;      //Наработка
    FDate    : TDateTime;  //Дата изготовления
    FTypeU   : DWord;      //Код типа устройства
    FVersU   : DWord;      //Версия устройства
    FVersP   : DWord;      //Версия программы устройства
    FSerNum  : DWord;      //Серийный номер
    FPS1     : Word;       //Уровень питания 1
    FPS2     : Word;       //Уровень питания 2
    FPT1     : Word;       //Порог питания 1
    FPT2     : Word;       //Порог питания 2
  Published
    Property DataExh : Byte  read FDataExh  write FDataExh;
    Property IfBus   : Byte read FIfBus   write FIfBus;
    Property IfBSync : Byte read FIfBSync write FIfBSync;
    Property IfBTst  : Byte read FIfBTst  write FIfBTst;
    Property UHour   : DWord read FHour   write FHour;
    Property UDate   : TDateTime read FDate write FDate;
    Property TypeU   : DWord read FTypeU   write FTypeU;
    Property VersU   : DWord read FVersU   write FVersU;
    Property VersP   : DWord read FVersP   write FVersP;
    Property SerNum  : DWord read FSerNum  write FSerNum;
    Property UPS1    : Word read FPS1     write FPS1;
    Property UPS2    : Word read FPS2     write FPS2;
    Property UPT1    : Word read FPT1     write FPT1;
    Property UPT2    : Word read FPT2     write FPT2;
  End;

  TEM2437 = class(TPersistent)
  Private
    FDataExh : Byte;      //Обмен есть!
    FMabus   : Byte;      //Байт статуса устройства
    FMabVs   : Byte;      //Байт состояния видеосигналов
    FPSS     : Byte;      //Байт состояния ДУ питанием внешних устройств
    FHour    : DWord;     //Наработка
    FDate    : TDateTime; //Дата изготовления
    FTypeU   : Word;      //Код типа устройства
    FVersU   : Word;      //Версия устройства
    FVersP   : Word;      //Версия программы устройства
    FSerNum  : DWord;      //Серийный номер
    FGain1   : Byte;      //Коэффициент усиления в канале 1
    FEqual1  : Byte;      //Коэффициент ВЧ коррекции в канале 1
    FGain2   : Byte;      //Коэффициент усиления в канале 2
    FEqual2  : Byte;      //Коэффициент ВЧ коррекции в канале 2
    FGain3   : Byte;      //Коэффициент усиления в канале 3
    FEqual3  : Byte;      //Коэффициент ВЧ коррекции в канале 3
    FGain4   : Byte;      //Коэффициент усиления в канале 4
    FEqual4  : Byte;      //Коэффициент ВЧ коррекции в канале 4
    FPS11    : Byte;      //Уровень питания 11
    FPS12    : Byte;      //Уровень питания 12
    FPS21    : Byte;      //Уровень питания 21
    FPS22    : Byte;      //Уровень питания 22
    FPT11    : Byte;      //Порог питания 11
    FPT12    : Byte;      //Порог питания 12
    FPT21    : Byte;      //Порог питания 21
    FPT22    : Byte;      //Порог питания 22
  Published
    Property DataExh : Byte      read FDataExh   write FDataExh;
    Property Mabus   : Byte      read FMabus     write FMabus;
    Property MabVs   : Byte      read FMabVs     write FMabVs;
    Property UPSS    : Byte      read FPSS       write FPSS;
    Property UHour   : DWord     read FHour      write FHour;
    Property UDate   : TDateTime read FDate      write FDate;
    Property TypeU   : Word      read FTypeU     write FTypeU;
    Property VersU   : Word      read FVersU     write FVersU;
    Property VersP   : Word      read FVersP     write FVersP;
    Property SerNum  : DWord     read FSerNum    write FSerNum;
    Property Gain1   : Byte      read FGain1     write FGain1;
    Property Equal1  : Byte      read FEqual1    write FEqual1;
    Property Gain2   : Byte      read FGain2     write FGain2;
    Property Equal2  : Byte      read FEqual2    write FEqual2;
    Property Gain3   : Byte      read FGain3     write FGain3;
    Property Equal3  : Byte      read FEqual3    write FEqual3;
    Property Gain4   : Byte      read FGain4     write FGain4;
    Property Equal4  : Byte      read FEqual4    write FEqual4;
    Property UPS11   : Byte      read FPS11      write FPS11;
    Property UPS12   : Byte      read FPS12      write FPS12;
    Property UPS21   : Byte      read FPS21      write FPS21;
    Property UPS22   : Byte      read FPS22      write FPS22;
    Property UPT11   : Byte      read FPT11      write FPT11;
    Property UPT12   : Byte      read FPT12      write FPT12;
    Property UPT21   : Byte      read FPT21      write FPT21;
    Property UPT22   : Byte      read FPT22      write FPT22;
  End;

  TCross=Array[1..8]of byte;
  TEM7401 = class(TObject)
  Private
    FDataExh : Byte;      //Обмен есть!
    FVMSUS   : Byte;      //Байт статуса устройства
    FVMSVS   : Byte;      //Байт состояния видеосигналов
    FHour    : DWord;     //Наработка
    FDate    : TDateTime; //Дата изготовления
    FTypeU   : Word;      //Код типа устройства
    FVersU   : Word;      //Версия устройства
    FVersP   : Word;      //Версия программы устройства
    FSerNum  : DWord;      //Серийный номер
    FCross   : TCross;
    Public
    Property Cross:TCross read FCross   write FCross;
  Published
    Property DataExh : Byte      read FDataExh write FDataExh;
    Property VMSUS   : Byte      read FVMSUS   write FVMSUS;
    Property VMSVS   : Byte      read FVMSVS   write FVMSVS;
    Property UHour   : DWord     read FHour    write FHour;
    Property UDate   : TDateTime read FDate    write FDate;
    Property TypeU   : Word      read FTypeU   write FTypeU;
    Property VersU   : Word      read FVersU   write FVersU;
    Property VersP   : Word      read FVersP   write FVersP;
    Property SerNum  : DWord     read FSerNum  write FSerNum;
  End;

type
  TLuna = class(TObject)
  Private
    FDataExh : Byte;      //Обмен есть!
    FWork    : Byte;      //Команда Byte;
    FAlphaST : Single;    //Угол стабилизации глиссады
    FAlphaGL : Single;    //Текущий установленный угол
    FErrorST : Single;    //Текущая погрешность стабилизации
    FPsiShip : Single;    //Дифферент осевой линии корабля
    FBetta   : Single;    //Задаваемый угол компенсации
    FErrorB  : Single;    //Текущая погрешность компенсации
    FTimeSt  : cardinal;  //
  Published
    Property DataExh : Byte   read FDataExh write FDataExh;
    Property Work    : Byte   read FWork    write FWork;
    Property AlphaST : Single read FAlphaST write FAlphaST;
    Property AlphaGL : Single read FAlphaGL write FAlphaGL;
    Property ErrorST : Single read FErrorST write FErrorST;
    Property PsiShip : Single read FPsiShip write FPsiShip;
    Property Betta   : Single read FBetta   write FBetta;
    Property ErrorB  : Single read FErrorB write  FErrorB;
    Property TimeST  :cardinal read FTimeSt write FTimeSt;
  End;

  TResistor = class(TObject)
  Private
    FDataExh : Byte;      //Обмен есть!
    FAccomp  : Byte;      //Признак сопровождения ЛА
    FNPrlk   : Word;      //Номер канала ПРЛК
    FLandPoint: Word;     //Тип точки посадки
    FNomLA   : Word;      //№ ЛА
    FDistanse: Single;    //Дальность до ЛА
    FCorse   : Single;    //Угол курса ЛА
    FAltitude: Single;    //Угол места ЛА
    FSpeedLA : Single;    //Скорость ЛА
    FSpeedVr : Single;    //Вертикальная скорость ЛА
    FGlissad : Single;    //Текущий угол заданной глиссады
    FTimeSt  : cardinal;  //
  Published
    Property DataExh  : Byte   read FDataExh  write FDataExh;
    Property Accomp   : Byte   read FAccomp   write FAccomp;
    Property NPrlk    : Word   read FNPrlk    write FNPrlk;
    Property LandPoint: Word   read FLandPoint write FLandPoint;
    Property NomLA    : Word   read FNomLA    write FNomLA;
    Property Distanse : Single read FDistanse write FDistanse;
    Property Corse    : Single read FCorse    write FCorse;
    Property Altitude : Single read FAltitude write FAltitude;
    Property SpeedLA  : Single read FSpeedLA  write FSpeedLA;
    Property SpeedVr  : Single read FSpeedVr  write FSpeedVr;
    Property Glissad  : Single read FGlissad  write FGlissad;
    Property TimeST  :cardinal read FTimeSt write FTimeSt;
  End;

TYPE TvSMS=record
     HOST     :word;
     HDDCount :word;
     HDDEnum  :THDDEnum;
     LanCount :word;
     LanEnum  :TLANEnum;
     Video    :boolean;
     fl_VRD   :byte;
     Size     :int64;
end;

var vSMS:TvSMS;

type
  TArrStateDevice=record
    ResultState   :byte;  //0 - неисправно, 1 - исправно, 2- не опрошено, 3 - жёлтая зона
    TotalQuery    :byte;  //общее кол-во запросов с момента последней проверки
    PositiveQuery :byte;  //положительное кол-во запросов с момента последнего запроса
    ExhState      :byte;  //наличие обмена с блоком отлично от его состояния
  end;

var ArrDevice:Array[1..DevCount] of TObject;
    cs_ArrDevice:Array[1..DevCount] of TCriticalSection;
    ArrStateDevice:array [1..DevCount] of TArrStateDevice;
    TM2404i:byte;  MTK201i:byte;
    cs_ArrStateDevice:TCriticalSection;
    fl_QuestionOfDevice:boolean=false;
    fl_Synchro:boolean=false;
    QuestionOfDevice:int64=0; //счётчик
    time_QuestionOfDevice:TDateTime;

type TMass = Array[0..255] of byte;

var //потоки опроса Com-портов
     MTKCom:array[10..ComCount] of TComPortR;
     UPSEvent:array [17..19] of TEvent;

type
  TCamParams = record
    //координаты установки
    X,Y,Z,
    //угловая ориентация камер
    Az,Um:Double;
    //усиление и коррекция яркости
    UsY,AhxY,
    //усиление и коррекция цветности
    UsC,AhxC:Integer;
    //фокус
    Focus,
    //параметры матрицы
    Rx, Ry,
    Kx, Ky,
    RxKx,RyKy,
    //координаты центра снимка
    X0, Y0,
    //угловые элементы внешнего ориентирования снимков
    Alf, Xi, Om : double;
  end;

var
  koor:array [1..11] of TCamParams;

type
  TLad       = record
    laDataExh : Byte;     //Обмен есть!
    laFi      : single;   //географические координаты  на эллипсоиде Красовского (СК-42)
    laLmb     : single;   //географические координаты  на эллипсоиде Красовского (СК-42)
    lagVn     : single;   //северная составляющая скорости корабля относительно грунта
    lagVe     : single;   //восточная составляющая  скорости корабля относительно грунта
    laK       : single;   //курс
    laVl      : single;   //скорость от лага
    laPsi     : single;   //угол килевой качки, измеренный в вертикальной плоскости в месте установки гиромодуля. Положительный угол соответствует дифференту корабля на корму
    laTeta    : single;   //угол бортовой качки, измеренный в плоскости шпангоута. Положительный угол соответствует крену корабля на правый борт
    laVPsi    : single;   //угловая скорость изменения угла килевой качки
    laVTeta   : single;   //угловая скорость изменения бортовой качки
    laVK      : single;   //угловая скорость изменения курса
    laVn      : single;   //составляющие линейной скорости корабля в географической системе координат
    laVe      : single;   //составляющие линейной скорости корабля в географической системе координат
    laVz      : single;   //составляющие линейной скорости корабля в географической системе координат
    laSn      : single;   //перемещения корабля, вызванные качкой и орбитальным движением в месте  установки гиромодуля
    laSe      : single;   //перемещения корабля, вызванные качкой и орбитальным движением в месте  установки гиромодуля
    laSz      : single;   //перемещения корабля, вызванные качкой и орбитальным движением в месте  установки гиромодуля
    laRo      : single;   // полный угол наклона палубы
    laDTL     : TDateTime;//текущее время и дата
    laCC      : word;     // служебное слово
  end;

  TLadoga  = record
    Central   :TLad;
    Fore      :TLad;
    Aft       :TLad;
    Counter   :int64;
  end;

  TMedLadoga = record
    Psi       :single;
    Teta      :single;
    Sx        :single;
    Sy        :single;
    Sz        :single;
    Validity  :boolean;
    LeaveTime :string[5];
  end;

  TSetLad     = record
    Psi      :single;
    Teta     :single;
    Sx       :single;
    Sy       :single;
    Sz       :single;
  end;

const
  Divisor  = 3;
  //вряд ли стоит для средних значений использовать все отсчёты
  MediumQuantity = 18000 div Divisor;
  MediumTime     = 18000 div Divisor div 6;

var
    //признак достоверности усреднённых данных
    MediumValidity : boolean = false;
    //массивы усреднённых значений от Ладоги
    MediumLadoga   : TMedLadoga;
    //массив расчёта статических параметров Ладоги за 6 минут
    SetLadoga      : array [0..MediumQuantity] of TSetLad;
    //ещё один счётчик
    WSLLadogaCounter:int64   = 0;
    Ladoga  :array[1..2] of TLadoga;
    CounterMiniLadoga:int64=0;
type
  TMiniLad    = record
    miniPsi   :single;
    miniTeta  :single;
    miniK     :single;
    miniVL    :single;
    miniSn    :single;
    miniSe    :single;
    miniSz    :single;
    miniCC    :word;
    miniDE    :word;
  end;
  //Channel 1 : 0=Central, 2=Aft, 4=Fore
  //Channel 2 : 1=Central, 3=Aft, 5=Fore
  TMiniLadoga=array [1..10] of TMiniLad;
var MiniLadoga:TMiniLadoga;
     cs_MiniLadoga:TCriticalSection;
    cs_MedLadoga :TCriticalSection;

function  CheckSUM(p:Pointer;Start,Count:Word):Word;
function  CheckSUMw(p:pointer;Start,Count:Word):Word;
procedure TimeOut(time:integer);
function  StrToHex(p:Char):integer;
function  HexToStr(p:integer):Char;
function  AddCode(D:DWord):word;
procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
procedure BaseCalc(N1,N2:byte);
function  AddCodeD(D:DWord):DWord;

implementation

function AddCodeD(D:DWord):DWord;
var i:byte;
begin
  Result:=0;
  for i:=0 to 30 do
    if D and (1 shl i)>0 then Result:=Result+(0 shl i)
                         else Result:=Result+(1 shl i);
  Result:=Result+1;
end;

{Вычисление контрольной суммы}
function  CheckSUMW(p:Pointer;Start,Count:Word):Word;
var i:Word;
    pb:^Word;
begin
 {$R-}
 pb:=p;
 Result:=0;
 if Start>0 then INC(pb,Start);
 For i:=Start to Count-1 do
   begin
     Result:=Result+pb^;
     INC(pb);
   end;
 {$R+}
end;

//определение линии базы
procedure BaseCalc(N1,N2:byte);
begin
  if (koor[N2].Y-koor[N1].Y)<>0 then
  Alfa_Base:=(arctan((koor[N2].X-koor[N1].X)/(koor[N2].Y-koor[N1].Y))*grad)+Azl
  else Alfa_Base:=90/grad+Azl;
  base:=SQRT(SQR(koor[N1].X-koor[N2].X)+SQR(koor[N1].Y-koor[N2].Y));
end;

function StrToHex(p:Char):integer;
begin
  Result:=-1;
  if p in ['0'..'9'] then  Result:=StrToInt(p) else
  begin
    if UpperCase(p)='A' then Result:=10;
    if UpperCase(p)='B' then Result:=11;
    if UpperCase(p)='C' then Result:=12;
    if UpperCase(p)='D' then Result:=13;
    if UpperCase(p)='E' then Result:=14;
    if UpperCase(p)='F' then Result:=15;
  end;
end;

function HexToStr(p:integer):Char;
begin
  Result:='Z';
  case p of
  0: Result:='0';
  1: Result:='1';
  2: Result:='2';
  3: Result:='3';
  4: Result:='4';
  5: Result:='5';
  6: Result:='6';
  7: Result:='7';
  8: Result:='8';
  9: Result:='9';
  10:Result:='A';
  11:Result:='B';
  12:Result:='C';
  13:Result:='D';
  14:Result:='E';
  15:Result:='F';
  end;
end;

{Вычисление контрольной суммы}
function  CheckSUM(p:Pointer;Start,Count:Word):Word;
var i:Word;
    pb:^Word;
begin
 {$R-}
 pb:=p;
 Result:=0;
 if Start>0 then INC(pb,Start);
 For i:=Start to Count-1 do
   begin
     Result:=Result+pb^;
     INC(pb);
   end;
 {$R+}
end;

procedure TimeOut(time:integer);
var h:THANDLE;
begin
  h:=CreateEvent(nil,true,false,'');
  WaitForSingleObject(h,Time);
  CloseHandle(h);
end;

//обратное преобразование дополнительного двоичного кода
function AddCode(D:DWord):word;
var D1:Word;
    i:byte;
begin
     D1:=0;
     for i:=0 to 14 do
        if D and(1 shl i)>0 then D1 := D1 +(0 shl(i))
                            else D1 := D1 +(1 shl(i));
     D1:=D1+1;
     Result:=D1;
end;

procedure PERENOS(const x,y,z:double; var xk,yk,zk:double);
begin //Перенос координат
  xk:=xk+x;
  yk:=yk+y;
  zk:=zk+z;
end;

procedure POVOROT(all,btt,gmm:double;var xk,yk,zk:double);
var
  a,b,c,d,g,f,e,u,h,xk1,yk1,zk1:double;
begin
  all:=all/grad;  //Поворот вокруг OZ  в корабельной системе координат
  btt:=btt/grad;	//Поворот вокруг OY  в корабельной системе координат
  gmm:=gmm/grad;	//Поворот вокруг OX  в корабельной системе координат
  xk1:=xk;
  yk1:=yk;
  zk1:=zk;
  //функция менее прозрачна, но существенно меньше Sin-Cos * кол-во её вызова из DataCalc
  //экономия порядка 1/3 времени для DataCalc
  if (all<>0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1*Cos(all)-yk1*Sin(all);
    yk:=xk1*Sin(all)+yk1*Cos(all);
    zk:=zk1;
    EXIT;
  end;
  if (all=0) and (btt<>0) and (gmm=0) then
  begin
    xk:=xk1*Cos(btt)+zk1*Sin(btt);
    yk:=yk1;
    zk:=-xk1*Sin(btt)+zk1*Cos(btt);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm<>0) then
  begin
    xk:=xk1;
    yk:=yk1*Cos(gmm)-zk1*Sin(gmm);
    zk:=yk1*Sin(gmm)+zk1*Cos(gmm);
    EXIT;
  end;
  if (all=0) and (btt=0) and (gmm=0) then
  begin
    xk:=xk1;
    yk:=yk1;
    zk:=zk1;
    EXIT;
  end;
  //никогда не задействуется, только для пояснения...
  a:=Cos(all)*Cos(btt);
  b:=Sin(all)*Cos(btt);
  c:=-Sin(btt);
  d:=-Sin(all)*Cos(gmm)+Cos(all)*Sin(btt)*Sin(gmm);
  g:=Sin(all)*Sin(gmm)+Cos(all)*Sin(btt)*Cos(gmm);
  f:=Cos(btt)*Sin(gmm);
  e:=Cos(all)*Cos(gmm)+Sin(all)*Sin(btt)*Sin(gmm);
  u:=Cos(btt)*Cos(gmm);
  h:=-Cos(all)*Sin(gmm)+Sin(all)*Sin(btt)*Cos(gmm);
 {ПОВОРОТ КОНСТРУКЦИИ}
  xk:=(xk1*a+yk1*d+zk1*g);
  yk:=xk1*b+yk1*e+zk1*h;
  zk:=(xk1*c+yk1*f+zk1*u);
end;

procedure TUPS.AfterConstruction;
Begin
 Directive:=TStringList.Create;
 Information:=TStringList.Create;
End;

procedure TUPS.BeforeDestruction;
Begin
 Directive.Free;
 Information.Free;
End;

end.
