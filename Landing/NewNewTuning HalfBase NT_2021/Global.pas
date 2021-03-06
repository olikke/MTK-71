unit Global;

interface
uses Windows,GR32,Messages,DSPack,Types,XComDrv,SysUtils;

const WM_NOTIFY_UPDATE = WM_USER + 129;
const WM_CALIB_READY   = WM_USER + 130;

const FRACT = 2;
const INT = 8;

const TVDName: array [7..10] of String = ('TVD1 (Left)','TVD2 {Axial1)','TVD4 (Right)','TVD3 (Axial2)');

Type
TKUKoor=Array[1..5] of Single;
TKoor=Array[1..11] of TKUKoor;
TvirgBufWriteBmp = Array[1..64,1..64] of byte;
var Device_IN:word;
    Device_OUT:word=9;
    vix,viy:integer;
    aDX,aDY: Integer;
    Rbl:Word = 5;
    Rwh:Word = 1;
    AutoSopr : Word = 0;
    bmRect : TRect;
    ArrClByte: TvirgBufWriteBmp;


var msWhX : array[0..200] of Integer;
    msWhY : array[0..200] of Integer;
    msBlX : array[0..200] of Integer;
    msBlY : array[0..200] of Integer;
    kbl,kwh : Word;
var
    Base,Alfa_Base: double;
    First,Second:integer;

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
    Alf_degree: double;
  end;

type
  TRP = record
    X,Y,Z: double;
  end;

type
  TRPforKU=record
    x: array [1..3] of Integer;
    y: array [1..3] of Integer;
  end;

var
  koor:array [7..10] of TCamParams;
  //элементы внешнего ориентирования камер
  Matrix   : array [7..10,1..3,1..3] of double;
  //угол наклона  линии посадки к диаметральной плоскости аэродрома
  Azl:double=0;
 // MiniKoff:array [1..3] of integer;
  RP: array [0..3] of TRP;   //reference point
  RPforKU: array [7..10] of TRPforKU;  //reference point pixel coordinates for each KU

var CountSum : Word = 25;
    CountRes : Word =  0;
    SumX,SumY : Cardinal;
    vsX,vsY:word;
    NumCol : Word = 111;
    HOST_TP:integer;
    sizebm:word=32;
    div_2: word = 16;//sizebm div 2;
    div_5: word = 6;//sizebm div 5;
const Rad = pi/180;

const ComCount=30;
      DevCount=50;

TYPE                         //параметры COM-портов
  TComList=record
  cCom:integer;
  cBaudRate:TBaudRate;
  cBaudValue:cardinal;
  cByteSize:TDataBits;
  cEnableDTR:boolean;
  cEnableRTS:boolean;
  cParity:TParity;
  cStopBits:TStopbits;
  cTimeOut:integer;
  cComState:integer;//0-открыт,1-закрыт,2-занят,4-закрыт
  end;
  TMass = Array[0..255] of byte;
var
  ComList:array [1..ComCount] of TComList;

TYPE                   //связь номера устройства с номером COM и адресом
 TComDev=record
   cDEV_ID:integer;
   cCom_ID:integer;
   cDev_Name:string[20];
   cAdress:integer;
 end;

var
 COMDevi: array[1..DevCount] of TComDev;

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
 Command_EM7401:array [1..10] of TCommand;

function CheckSUM(p:Pointer;Count:Word):Byte;

implementation

{Вычисление контрольной суммы}
function CheckSUM(p:Pointer;Count:Word):Byte;
var i:Word;
    pb:^byte;
begin
 {$R-}
 pb:=p;
 Result:=0;
 For i:=0 to Count-1 do
   begin
     Result:=Result+pb^;
     INC(pb);
   end;
 {$R+}
end;

end.
