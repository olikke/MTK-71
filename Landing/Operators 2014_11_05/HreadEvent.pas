unit HreadEvent;

interface

uses Forms,Classes,Types,Windows,SysUtils,MMSystem,DateUtils,Protocol;

type
  TWaitEvent = class(TThread)
  private  
    function  GetEvent : Word;
  protected
    procedure Execute; override;
  end;

implementation
USES Main,Global,Telem;



var nInt : Integer;
    wMode,wStatus,wCmd : word;
    FlRead:Word = 0;
    MTimerID:Cardinal; //Таймер обмена с Ладогой

function TWaitEvent.GetEvent : Word;
begin
  Result:=$FFFF;    
  nInt:=0;
  CASE WaitForSingleObject(hEvent,2000) of
  WAIT_OBJECT_0:
    begin
      While nInt<>1 do
        begin  //Вн.цикл
          ResetEvent(hEvent);
          tmkgetevd(FHandl,hEvent,nInt,wMode,wStatus,wCmd);
          if nInt = $FFFF then EXIT;
          if nInt = 1 then
            begin
              if wCmd=CMD_SYNC_DATA then
                begin
                  Result:=rtgetcmddata(FHandl,CMD_SYNC_DATA);
                  INC(SumSend);
                end;
            end;
        end; //Вн.цикл
    end;
  WAIT_TIMEOUT: nInt:=-1;
  ELSE nInt:=-1;
  END;
end;

procedure ReadLadoga;
var fl:Boolean;
    MAS1,MAS2,MAS3:TMAS;
begin
  fl:=False;
//Чтение 3-х массивов данных
  rtdefsubaddr(FHandl,RT_RECEIVE,$11);     //RT_TRANSMIT
  rtgetblk(FHandl,0,@MAS1,29);
  if (MAS1[28]<>CheckSUM(@MAS1,0,28))OR(MAS1[0]=0)then begin fl:=True;INC(Errors[1]);end;
  rtdefsubaddr(FHandl,RT_RECEIVE,$12);
  rtgetblk(FHandl,0,@MAS2,29);
  if (MAS2[28]<>CheckSUM(@MAS2,0,28))OR(MAS2[0]=0)then begin fl:=True;INC(Errors[2]);end;
  rtdefsubaddr(FHandl,RT_RECEIVE,$13);
  rtgetblk(FHandl,0,@MAS3,29);
  if (MAS3[28]<>CheckSUM(@MAS3,0,28))OR(MAS3[0]=0)then begin fl:=True;INC(Errors[3]);end;
  //При наличии ошибки выход!
  INC(FlRead);
  IF FlRead > 49 then begin timeKillEvent(MTimerID); Application.ProcessMessages; end;
  if fl then EXIT;
  //Результирующий массив
  cs_Ladoga.Enter;
  try
    MSO[1]:=MAS1;
    MSO[2]:=MAS2;
    MSO[3]:=MAS3;
    if NMain <> nil then if NMain.Visible then PostMessage(NMain.Handle,WM_NOTIFY_MSL,5,5);
  finally
  cs_Ladoga.Leave;
  end;  
end;

procedure FLTimeCallBack(MTimerID,uMessage:UINT;dwUser,dw1,dw2:DWORD);stdcall;
begin
  ReadLadoga;
end;

procedure TWaitEvent.Execute;
var Result:Word;

begin
  //Обнуление результирующего массива
  MSO:=oMSO;
  While (not Stop) do
    begin
      Result:=GetEvent;
      if Result<>$FFFF then
        begin
          FlRead:=0;
//          Count_A:=0;
          LSleep:=0.0004*Result;
          if LSleep > 10 then LSleep:=0; //Задержка передачи KK [ms]

          //Постановка задачи "Удаление таймера" в очередь
          timeKillEvent(MTimerID);
          //Завершение задач в очереди
          Application.ProcessMessages;
          Sleep(Pause);//+TRUNC(LSleep));
          ReadLadoga;
          //Запуск таймера
          MTimerID:=timeSetEvent(20,0,FLTimeCallBack,0,TIME_PERIODIC);
        end;
    end;
end;

end.



