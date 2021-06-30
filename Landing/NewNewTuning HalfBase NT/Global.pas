unit Global;

interface
uses GR32,DSPack,Types,XComDrv;

Type
TKUKoor=Array[1..5] of Single;
TKoor=Array[1..11] of TKUKoor;
TvirgBufWriteBmp = Array[1..64,1..64] of byte;
var Device_IN:word;
    Device_OUT:word=9;
    vix,viy:integer;
    aDX,aDY,MaxVI,MinVI : Integer;
    bmdiv,bmddiv:Word;
    bm:TBitmap32;
    VMRBitmap : TVMRBitmap;
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
//Ïàðàìåòðû êàìåð
var{ fA1,fA2,fl,fr,D8BL,D11BL,
    Rxr,Kxr,Ryr,Kyr,Wxr,Wyr,Azr,Umr,
    Rxl,Kxl,Ryl,Kyl,Wxl,Wyl,Azl,Uml,
    RxA1,KxA1,RyA1,KyA1,WxA1,WyA1,AzA1,UmA1,
    RxA2,KxA2,RyA2,KyA2,WxA2,WyA2,AzA2,UmA2,
    AzRTP,UmRTP,
    LAlf,LXi,Om,RAlf,RXi: double;
    A1Alf,A1Xi,A2Alf,A2Xi:double; }
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
  end;

var
  koor:array [1..10] of TCamParams;
  //элементы внешнего ориентирования камер
  Matrix   : array [7..10,1..3,1..3] of double;
  //угол наклона  линии посадки к диаметральной плоскости аэродрома
  Azl:double=0;
  MiniKoff:array [1..3] of integer;

var CountSum : Word = 25;
    CountRes : Word =  0;
    SumX,SumY : Cardinal;
    vsX,vsY:word;
    NumCol : Word = 111;
    HOST_TP:integer;
const sizebm:word=32;
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
