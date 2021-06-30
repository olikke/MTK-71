unit Global;

interface
uses Types,Messages,SyncObjs, Graphics, Math, sysutils, Classes,XComDrv,Windows;

const ComCount=50;
      DevCount=50;

TYPE                         //��������� COM-������
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
  cComState:integer;//0-������,1-������,2-�����
  end;



var
  ComList:array [1..ComCount] of TComList;
  e:array [12..18] of integer;

TYPE                        //�������� ��� ��
 TCommand=record
   cCOM_ID:integer;        //����� �������
   cCommand:integer;       //��������
   cComandCount:integer;   //����� � ������ ��������� ����������
   cAnswerCount:integer;   //����� � ������ �������
   cComment:string[100];
 end;

var
 Command_TM2220:array [1..33] of TCommand;  //������ ������ ��� ��
 Command_EM7401:array [1..10] of TCommand;  //������ ������ ��� 7401
 HOST_TP:byte;

TYPE                   //����� ������ ���������� � ������� ����� � �������
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
  savecom: array [1..4] of byte;//����� ��� ���������� ��������
 
implementation

end.
