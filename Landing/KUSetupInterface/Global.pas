unit Global;

interface
uses Types,Messages,SyncObjs, Graphics, Math, sysutils, Classes,XComDrv,Windows;

const ComCount=50;
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
  cComState:integer;//0-открыт,1-закрыт,2-занят
  end;



var
  ComList:array [1..ComCount] of TComList;
  e:array [12..18] of integer;

TYPE                        //комманды для КУ
 TCommand=record
   cCOM_ID:integer;        //номер команды
   cCommand:integer;       //комманда
   cComandCount:integer;   //ответ в случае успешного выполнения
   cAnswerCount:integer;   //ответ в случае неудачи
   cComment:string[100];
 end;

var
 Command_TM2220:array [1..33] of TCommand;  //список команд для КУ
 Command_EM7401:array [1..10] of TCommand;  //список команд для 7401
 HOST_TP:byte;

TYPE                   //связь номера устройства с номером порта и адресом
 TComDev=record
   cDEV_ID:integer;
   cCom_ID:integer;
   cAdress:integer;
 end;

var
 COMDev: array[1..DevCount] of TComDev;

 DEVICE_ID:integer;
 COM_ID:integer;
TYPE
 TMass = Array[0..255] of byte;

var
  savecom: array [1..4] of byte;//нужен для сохранения настроек
 
implementation

end.
