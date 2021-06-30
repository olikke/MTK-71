unit QThread;

interface

uses
  Windows,Classes,SyncObjs,Dialogs,SysUtils,Types,Global,ComPortR,XComDrv;



type
  TQuestion = class(TThread)
  private
    RabCom:byte;
    RezCom:byte;
    ComB:array [23..31] of byte;
    ComNP:array [23..31] of byte;
    ComTV:array[7..10] of byte;
    Freq,TimeStart,TimeStop,TimeStart1,TimeStop1:int64;
    procedure DeviceTest;
    procedure Analiz;
    procedure TM2404Question;
    procedure TM2404Analiz;
    procedure SimpleCommand(RabCom:byte;DV_ID:byte;Cm_ID:byte;AddC:byte;AddN:TCross);
    procedure CommandExecute(var List:TList;ListType:String);
  protected
    procedure Execute; override;
  public
    procedure ReadPacket2220(const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
    procedure ReadPacket5401(const p:Pointer;const Count:Integer;const ErrCode:Cardinal;const NComPort:Word);
  end;

  //в случае отсутсвия связи с уст-вом,
  //чтобы комманда не повторялась без ответа
  //и не перегружала систему устроим ей отпуск (внеочередной)
const
  AllowToRepeat=3;   //кол-во разрешённых повторений -1
  Holliday = 100;    //отпуск (в циклах)

implementation

uses Main,EM5402,UnitDM,TM2410,TM2409,EM5401,EM2437,EM7401,KU,ARM;

procedure TQuestion.ReadPacket5401(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var  pb:^byte;
     ReceiveCommand:array [0..255] of byte;
     i,h:integer;
     Adress:byte;
     DV_ID:byte;
     m2404:TTm2404State;
     CNT:byte;
     LRC:byte;
     CS_ID:word; //код выполненной команды (не номер)
     CC_ID:word; //номер выполненной комманды (не код :)
     IAdd:byte;
     Day:word;
     Month:word;
     Year:word;
     Remember:Cardinal;
     cr:TCross;
     b,d:byte;
     Add:TCross;
     ms:string;
begin
   if p=nil then exit;
   pb:=p;
   for i:=0 to Count-1 do
   begin
     ReceiveCommand[i]:=pb^;
     INC(pb);
   end;
   Adress:=ReceiveCommand[0];
   for i:=1 to DevCount do
   if (ComDev[i].cAdress=Adress) then
   begin
     DV_ID:=i;
     break;
   end;
   if not (DV_ID in [23,24,26..31]) then  exit;
   CS_ID:=ReceiveCommand[2];
   CNT:=ReceiveCommand[1];
   LRC:=0;
   FillChar(m2404,SizeOf(m2404),0);
   for i := 0 to CNT do
     LRC:=LRC+ReceiveCommand[i];
   i:=0;
   if NComPort=ComDev[23].cCom_ID then i:=23;
   if NComPort=ComDev[24].cCom_ID then i:=24;
   if i=0 then exit;
   if fl_ListProtocol then
   begin
      QueryPerformanceCounter(TimeStop1);
      List2404.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                     'ComPort '+IntToStr(NComPort)+'    '+
                     'Device '+IntToStr(Device_ID));
      ms:='';
      for i:=0 to Count-1 do
      ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
      List2404.Add(ms);
      List2404.Add('');
  end;
   //проверка контрольной суммы
   if LRC<>ReceiveCommand[CNT+1] then
   begin
     exit;
   end;
   //проверка числа принятых байт
   if CNT+2<>Count then
   begin
     exit;
   end;
   cs_ArrStateDevice.Enter;
   try Inc(ArrStateDevice[DV_ID].PositiveQuery);
   finally cs_ArrStateDevice.Leave;  end;
   cs_2404.Enter;
   try if NComPort=ComDev[23].cCom_ID then Inc(TM2404State.PositiveQuery1);
       if NComPort=ComDev[24].cCom_ID then Inc(TM2404State.PositiveQuery2);
   finally cs_2404.Leave; end;
   if (DV_ID<>ComDev[23].cDEV_ID) and (DV_ID<>ComDev[24].cDEV_ID) then
   if DV_ID in [26..31] then
   begin
     cs_ArrStateDevice.Enter;
     try Inc(ArrStateDevice[DV_ID].PositiveQuery);
     finally cs_ArrStateDevice.Leave; end;
   end;
   if (DV_ID=23) or (DV_ID=24) then
   begin
     CC_ID:=0;
     case CS_ID of
       1:  CC_ID:=1;
       2:  CC_ID:=2;
       3:  CC_ID:=3;
       6:  CC_ID:=4;
       8:  CC_ID:=5;
       9:  CC_ID:=6;
       21: CC_ID:=7;
       22: CC_ID:=8;
       25: CC_ID:=9;
       26: CC_ID:=10;
     end;
     if CC_ID=0 then exit;
     case CS_ID of
     1:   //статус устройства
        TM2404State.Status[DV_ID]:=ReceiveCommand[3];
     2:  // статус синхро
        TEM5401(ArrDevice[DV_ID]).IfBSync:=ReceiveCommand[3];
     3: //статус тестовых входов ( в этой системе не используем)
        TEM5401(ArrDevice[DV_ID]).IfBTst:=ReceiveCommand[3];
     6: //статус внутренней шины
     begin
        for i in [23,24,26..31] do
        m2404.Work[i]:=0;
        for i:=1 to CNT div 2 - 1  do
        begin
          //адрес устр-ва, о котором получено извещение
          IAdd:=ReceiveCommand[1+2*i];
          //узнаем номер устр-ва
          h:=0;
          if ComDev[23].cAdress=IAdd then h:=23;
          if ComDev[24].cAdress=IAdd then h:=24;
          if ComDev[26].cAdress=IAdd then h:=26;
          if ComDev[27].cAdress=IAdd then h:=27;
          if ComDev[28].cAdress=IAdd then h:=28;
          if ComDev[29].cAdress=IAdd then h:=29;
          if ComDev[30].cAdress=IAdd then h:=30;
          if ComDev[31].cAdress=IAdd then h:=31;
          if h<>0 then
          begin
            m2404.Work[h]:=1;
            m2404.Status[h]:=ReceiveCommand[2+2*i];
            cs_ArrStateDevice.Enter;
            try Inc(ArrStatedevice[h].PositiveQuery);
            finally cs_ArrStateDevice.Leave;   end;
            case h of
              30,31:  if (fm7401 <> nil) then
                      if (fm7401.Visible) then
                      PostMessage(Fm7401.Handle,WM_NOTIFY_MSD,h,202);
              23,24:
                      if (fm5401 <> nil) then
                      if (fm5401.Visible) then
                      PostMessage(Fm5401.Handle,WM_NOTIFY_MSD,h,202);
              25..29: if (fm2437 <> nil) then
                      if (fm2437.Visible) then
                      PostMessage(Fm2437.Handle,WM_NOTIFY_MSD,h,202);
            end;
          end;
        end;
        //проверка присутствия блоков
        for i in [23,24,26..31] do
        begin
          //не было и нет
          if (m2404.Work[i]=0) and (TM2404State.Work[i]<>2) then TM2404State.Work[i]:=0;
          //был, есть и будет
          if (m2404.Work[i]=1) and (TM2404State.Work[i]=1) then TM2404State.Status[i]:=m2404.Status[i];
          //фронт
          if (m2404.Work[i]=1) and (TM2404State.Work[i]=0) then
          begin
            TM2404State.Work[i]:=1;
            TM2404State.Status[i]:=m2404.Status[i];
            if TM2404State.DoIt[i] and $80 <> $80 then
            TM2404State.DoIt[i]:=TM2404State.DoIt[i]+$80;  //приказ на экстренную идентификацию
            if TM2404State.DoIt[i] and $40 <> $40 then
            TM2404State.DoIt[i]:=TM2404State.DoIt[i]+$40;
          end;
          //первое включение - загрузка параметров обязательна
          if (m2404.Work[i]=1) and (TM2404State.Work[i]=2) then
          begin
            TM2404State.Work[i]:=1;
            TM2404State.Status[i]:=m2404.Status[i];
            if TM2404State.DoIt[i] and $80 <> $80 then
            TM2404State.DoIt[i]:=TM2404State.DoIt[i]+$80;
            if TM2404State.DoIt[i] and $40 <> $40 then
            TM2404State.DoIt[i]:=TM2404State.DoIt[i]+$40;
          end;
        end;
      end;
    8: //наработка выполняется как скан порта (постоянно по резервному COM)
        TEM5401(ArrDevice[DV_ID]).UHour:=((ReceiveCommand[3] shl 8)+ReceiveCommand[4]) shl 8 +ReceiveCommand[5];
    9:   //идентификация
       with (ArrDevice[DV_ID] as TEM5401) do
       begin
         TypeU:=(ReceiveCommand[5] and $F0) shr 4;
         VersU:=ReceiveCommand[5] and $0F;
         VersP:=ReceiveCommand[6];
         Remember:=SerNum;
         SerNum:=ReceiveCommand[7] shl 16 + ReceiveCommand[8] shl 8 + ReceiveCommand[9];
         Day:=(ReceiveCommand[3] and $F8) shr 3;
         Month:=(ReceiveCommand[3] and $07) shl 1 + (ReceiveCommand[4] and $80) shr 7;
         Year:=ReceiveCommand[4] and $7F +2000;
         try  UDate:=EncodeDate(Year,Month,Day);
         except UDate:=Date; end;
        // TEM5401(ArrDevice[DV_ID]).Publ:='Successfully: '+Command_EM5401[CC_ID].cComment;
         if (fm5401 <> nil) then
         if (fm5401.Visible) then
         if (Remember<>SerNum) then
            PostMessage(Fm5401.Handle,WM_NOTIFY_MSD,DV_ID,200);
         if (Remember<>SerNum) then
         if TM2404State.DoIt[DV_ID] and $40 <> $40 then
            TM2404State.DoIt[DV_ID]:=TM2404State.DoIt[DV_ID]+$40;
       end;
    21: // статус питания 1
        TEM5401(ArrDevice[DV_ID]).UPS1:=ReceiveCommand[3];
    22: // статус питания 2
        TEM5401(ArrDevice[DV_ID]).UPS2:=ReceiveCommand[3];
    25: // порог питания 1
        TEM5401(ArrDevice[DV_ID]).UPT1:=ReceiveCommand[3];
    26: // порог питания 2
        TEM5401(ArrDevice[DV_ID]).UPT2:=ReceiveCommand[3];
    end;
    //отправка оповещения на отображение
    if (fm5401 <> nil) then
    if (fm5401.Visible) then
        PostMessage(Fm5401.Handle,WM_NOTIFY_MSD,DV_ID,CC_ID);
  end;
  if DV_ID in [26..29] then
  begin
    CC_ID:=0;
    case CS_ID of
      1:  CC_ID:=1;
      2:  CC_ID:=2;
      5:  CC_ID:=3;
      8:  CC_ID:=5;
      9:  CC_ID:=6;
      11: CC_ID:=7;
      12: CC_ID:=8;
      13: CC_ID:=9;
      14: CC_ID:=10;
      21: CC_ID:=11;
      22: CC_ID:=12;
      23: CC_ID:=13;
      24: CC_ID:=14;
      25: CC_ID:=15;
      26: CC_ID:=16;
      27: CC_ID:=17;
      28: CC_ID:=18;
      32: CC_ID:=20;
    end;
    if CC_ID=0 then exit;
    case CS_ID of
    1: //статус устройства
       TM2404State.Status[DV_ID]:=ReceiveCommand[3];
    2: //статус видео
       TEM2437(ArrDevice[DV_ID]).MabVs:=ReceiveCommand[3];
    5: //управление питанием
       TEM2437(ArrDevice[DV_ID]).UPSS:=ReceiveCommand[3];
    8: //наработка
       TEM2437(ArrDevice[DV_ID]).UHour:=((ReceiveCommand[3] shl 8)+ReceiveCommand[4]) shl 8 +ReceiveCommand[5];
    9: //идентификация
       with (ArrDevice[DV_ID] as TEM2437) do
         begin
           TypeU:=(ReceiveCommand[5] and $F0) shr 4;
           VersU:=ReceiveCommand[5] and $0F;
           VersP:=ReceiveCommand[6];
           Remember:=SerNum;
           SerNum:=ReceiveCommand[7] shl 16 + ReceiveCommand[8] shl 8 + ReceiveCommand[9];
           Day:=(ReceiveCommand[3] and $F8) shr 3;
           Month:=(ReceiveCommand[3] and $07) shl 1 + (ReceiveCommand[4] and $80) shr 7;
           Year:=ReceiveCommand[4] and $7F +2000;
           try  UDate:=EncodeDate(Year,Month,Day);
           except UDate:=Date; end;
           if (fm2437 <> nil) then
           if (fm2437.Visible) then
           if (Remember<>SerNum) then
              PostMessage(Fm2437.Handle,WM_NOTIFY_MSD,DV_ID,2);
           if (Remember<>SerNum) then
           if TM2404State.DoIt[DV_ID] and $40 <> $40 then
             TM2404State.DoIt[DV_ID]:=TM2404State.DoIt[DV_ID]+$40;
       end;
    11: //коррекция канала 1
       begin
         TEM2437(ArrDevice[DV_ID]).Gain1 :=ReceiveCommand[3];
         TEM2437(ArrDevice[DV_ID]).Equal1:=ReceiveCommand[4];
       end;
    12: //коррекция канала 2
       begin
         TEM2437(ArrDevice[DV_ID]).Gain2 :=ReceiveCommand[3];
         TEM2437(ArrDevice[DV_ID]).Equal2:=ReceiveCommand[4];
       end;
    13: //коррекция канала 3
       begin
         TEM2437(ArrDevice[DV_ID]).Gain3 :=ReceiveCommand[3];
         TEM2437(ArrDevice[DV_ID]).Equal3:=ReceiveCommand[4];
       end;
    14: //коррекция канала 4
       begin
         TEM2437(ArrDevice[DV_ID]).Gain4 :=ReceiveCommand[3];
         TEM2437(ArrDevice[DV_ID]).Equal4:=ReceiveCommand[4];
       end;
    21: //статус питания 11
        TEM2437(ArrDevice[DV_ID]).UPS11:=ReceiveCommand[3];
    22: //статус питания 12
        TEM2437(ArrDevice[DV_ID]).UPS12:=ReceiveCommand[3];
    23: //статус питания 21
        TEM2437(ArrDevice[DV_ID]).UPS21:=ReceiveCommand[3];
    24: //статус питания 22
        TEM2437(ArrDevice[DV_ID]).UPS22:=ReceiveCommand[3];
    25: //порог питания 11
        TEM2437(ArrDevice[DV_ID]).UPT11:=ReceiveCommand[3];
    26: //порог питания 12
        TEM2437(ArrDevice[DV_ID]).UPT12:=ReceiveCommand[3];
    27: //порог питания 21
        TEM2437(ArrDevice[DV_ID]).UPT21:=ReceiveCommand[3];
    28: //порог питания 22
        TEM2437(ArrDevice[DV_ID]).UPT22:=ReceiveCommand[3];
    32: //задание маски видеовыхода
        SimpleCommand(RabCom,DV_ID,2,0,Add);
    end;
  //отправка оповещения на отображение
  if (fm2437 <> nil) then
  if (fm2437.Visible) then
     PostMessage(Fm2437.Handle,WM_NOTIFY_MSD,DV_ID,CC_ID);
  end;
  if DV_ID in [30..31] then
  begin
    CC_ID:=0;
    case CS_ID of
    1:  CC_ID:=1;
    2:  CC_ID:=2;
    8:  CC_ID:=5;
    9:  CC_ID:=6;
    21: CC_ID:=7;
    22: CC_ID:=8;
    32: CC_ID:=10;
    end;
    if CC_ID=0 then exit;
    case CS_ID of
    1: //статус устройства
       TM2404State.Status[DV_ID]:=ReceiveCommand[3];
    2: //статус видео
       TEM7401(ArrDevice[DV_ID]).VMSVS:=ReceiveCommand[3];
    8: //наработка
       TEM7401(ArrDevice[DV_ID]).UHour:=((ReceiveCommand[3] shl 8)+ReceiveCommand[4]) shl 8 +ReceiveCommand[5];
    9: //идентификация
       with (ArrDevice[DV_ID] as TEM7401) do
         begin
           TypeU:=(ReceiveCommand[5] and $F0) shr 4;
           VersU:=ReceiveCommand[5] and $0F;
           VersP:=ReceiveCommand[6];
           Remember:=SerNum;
           SerNum:=ReceiveCommand[7] shl 16 + ReceiveCommand[8] shl 8 + ReceiveCommand[9];
           Day:=(ReceiveCommand[3] and $F8) shr 3;
           Month:=(ReceiveCommand[3] and $07) shl 1 + (ReceiveCommand[4] and $80) shr 7;
           Year:=ReceiveCommand[4] and $7F +2000;
           try  UDate:=EncodeDate(Year,Month,Day);
           except UDate:=Date; end;
           if (fm7401 <> nil) then
           if (fm7401.Visible) then
           if (Remember<>SerNum) then
              PostMessage(Fm7401.Handle,WM_NOTIFY_MSD,DV_ID,2);
           if (Remember<>SerNum) then
           if TM2404State.DoIt[DV_ID] and $40 <> $40 then
             TM2404State.DoIt[DV_ID]:=TM2404State.DoIt[DV_ID]+$40;
       end;
    21: //таблица коммутации
       begin
         cs_ArrDevice[DV_ID].Enter;
         try for i:=1 to 8 do
           cr[i]:=ReceiveCommand[2+i];
         TEM7401(ArrDevice[DV_ID]).Cross:=cr;
         finally cs_ArrDevice[DV_ID].Leave; end;
         //только для коммутатора центрального оператора
         if DV_ID=30 then
         if (nMain<>nil) then if nMain.Visible then
           PostMessage(nMain.Handle,WM_NOTIFY_TVD,1,2);
       end;
    22: //коммутация выхода
       begin
         b:=(ReceiveCommand[3] and $F0) shr 4; //выход
         d:=ReceiveCommand[3] and $0F; //вход
         if not b in [0..7] then exit;
         if not d in [0..15] then exit;
         cs_ArrDevice[DV_ID].Enter;
         try cr:=TEM7401(ArrDevice[DV_ID]).Cross;
         finally cs_ArrDevice[DV_ID].Leave; end;
         for i:=1 to 8 do
           if (cr[i] and $F0) shr 4 = b then
           cr[i]:= (b shl 4) + d;
         cs_ArrDevice[DV_ID].Enter;
         try TEM7401(ArrDevice[DV_ID]).Cross:=cr;
         finally cs_ArrDevice[DV_ID].Leave;  end;
         //только для коммутатора центрального оператора
         if DV_ID=30  then
         if (nMain<>nil) then if nMain.Visible then
           PostMessage(nMain.Handle,WM_NOTIFY_TVD,d,b);
       end;
    32: //задание маски видеовыхода
       SimpleCommand(RabCom,DV_ID,2,0,Add);
    end;
  //отправка оповещения на отображение
  if (fm7401 <> nil) then
  if (fm7401.Visible) then
     PostMessage(Fm7401.Handle,WM_NOTIFY_MSD,DV_ID,CC_ID);
  end;
  //оценка работы устройства
  cs_ArrStateDevice.Enter;
  try Inc(ArrStateDevice[DV_ID].PositiveQuery);
  finally cs_ArrStateDevice.Leave; end;
  SetEvent(h5401);
end;

procedure TQuestion.ReadPacket2220(const p: Pointer; const Count: Integer; const ErrCode: Cardinal; const NComPort: Word);
var pb:^byte;
    wr: byte;
    ReceiveCommand:array[0..255] of byte;
    Adress:word;
    i,j:integer;
    KU_ID,CS_ID:byte;
    LRC:byte;
    d5402   :byte;
    k,l     :single;
    ms:string;
procedure AddCommandTM2220(NumbCom,Value,KU_ID:integer);
var command:TMass;
pms:^Tmass;
begin
     //сама комманда
     command[1]:=HI(ComDev[KU_ID].cAdress);
     command[2]:=LO(ComDev[KU_ID].cAdress);
     command[3]:=Command_TM2220[NumbCom].cCommand;
     if NumbCom<>1 then command[4]:=Value else Command[4]:=$ff-(command[1]+command[2]+command[3])+1;
     command[5]:=$ff-(command[1]+command[2]+command[3]+command[4])+1;
     //структура для записи в TList
     New(pms);
     pms^[1]:=Device_ID;                   //Device_ID
     pms^[2]:=ComDev[KU_ID].cCom_ID;       //Com_ID;
     if NumbCom<>4 then pms^[3]:=5 else pms^[3]:=4; //размер комманды
     pms^[4]:=NumbCom;                           //номер команды
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
begin
   if p=nil then exit;
   if (Count<>5) and (Count<>21) then
   begin
     if fl_ListProtocol then
     begin
       QueryPerformanceCounter(TimeStop1);
       ListKU.Add('UNKNOWN COMMAND');
       ListKU.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                  'ComPort '+IntToStr(NComPort)+'    '+
                  'Device '+IntToStr(Device_ID));
       ms:='';
       for i:=0 to Count-1 do
       ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
       ListKU.Add(ms);
       ListKU.Add('');
     end;
     SetEvent(h2220);
     exit;
   end;
   pb:=p;
   for i:=0 to Count-1 do
   begin
     wr:=pb^;
     ReceiveCommand[i]:=wr;
     INC(pb);
   end;
   Adress:=ReceiveCommand[0] shl 8 +ReceiveCommand[1];
   KU_ID:=0;
   for i:=1 to DevCount do
   if (ComDev[i].cAdress=Adress) then
   begin
     KU_ID:=i;
     break;
   end;
   if not KU_ID in [7..10] then
   begin
     if fl_ListProtocol then
     begin
       QueryPerformanceCounter(TimeStop1);
       List2404.Add('UNKNOWN DEVICE');
       List2404.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                    'ComPort '+IntToStr(NComPort)+'    '+
                    'Device '+IntToStr(Device_ID));
       ms:='';
       for i:=0 to Count-1 do
       ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
       List2404.Add(ms);
       List2404.Add('');
    end;
     SetEvent(h2220);
     exit;
   end;
   cs_ArrDevice[KU_ID].Enter;
   try  TKU(ArrDevice[KU_ID]).Error:='';
   finally cs_ArrDevice[KU_ID].Leave; end;
   LRC:=0;
   for i := 0 to Count-2 do LRC:=LRC+ReceiveCommand[i];
   LRC:=$FF-LRC+1;
   //проверка контрольной суммы
   if LRC<>ReceiveCommand[Count-1] then
   begin
      cs_ArrDevice[KU_ID].Enter;
      try TKU(ArrDevice[KU_ID]).Error:='Error of check sum';//'Ошибка контрольной суммы!';
      finally cs_ArrDevice[KU_ID].Leave;  end;
      if fm_KU <> nil then if fm_KU.Visible then
      PostMessage(Fm_KU.Handle,WM_NOTIFY_MSD,KU_ID,222);
      if fl_ListProtocol then
      begin
        QueryPerformanceCounter(TimeStop1);
        ListKU.Add('ERROR CheckSum');
        ListKU.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                   'ComPort '+IntToStr(NComPort)+'    '+
                   'Device '+IntToStr(Device_ID));
         ms:='';
         for i:=0 to Count-1 do
         ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
         ListKU.Add(ms);
         ListKU.Add('');
      end;
      SetEvent(h2220);
      exit;
   end;
   //проверка выолнения
   if ReceiveCommand[2]>$80 then
   begin
     cs_ArrDevice[KU_ID].Enter;
     try TKU(ArrDevice[KU_ID]).Error:='Mistake of performance. A code of the reason  '+inttohex(ReceiveCommand[3],2);
     finally cs_ArrDevice[KU_ID].Leave;   end;
     if fm_KU <> nil then if fm_KU.Visible then
     PostMessage(Fm_KU.Handle,WM_NOTIFY_MSD,KU_ID,222);
     if (ReceiveCommand[3]and $20) = $20 then //тайм-аут от камеры  считаем, что виновата камера, канал разветвителя работает
     begin
       //сначала узнаем номер разветвителя
       for j:=1 to DevCount do if (ComDev[j].cCom_ID=NComPort) and (Pos('5402',UpperCase(ComDev[j].cDev_Name))<>0) then
       d5402:=j;
       if (d5402<>11) and (d5402<>21) then exit;
       cs_ArrDevice[d5402].Enter; try
       if (TEM5402(ArrDevice[d5402]).Use1) and (TEM5402(ArrDevice[d5402]).Dev1=KU_ID)
         then  TEM5402(ArrDevice[d5402]).PQ1:=TEM5402(ArrDevice[d5402]).PQ1+1;
       if (TEM5402(ArrDevice[d5402]).Use2) and (TEM5402(ArrDevice[d5402]).Dev2=KU_ID)
         then  TEM5402(ArrDevice[d5402]).PQ2:=TEM5402(ArrDevice[d5402]).PQ2+1;
       if (TEM5402(ArrDevice[d5402]).Use3) and (TEM5402(ArrDevice[d5402]).Dev3=KU_ID)
         then  TEM5402(ArrDevice[d5402]).PQ3:=TEM5402(ArrDevice[d5402]).PQ3+1;
       if (TEM5402(ArrDevice[d5402]).Use4) and (TEM5402(ArrDevice[d5402]).Dev4=KU_ID)
         then  TEM5402(ArrDevice[d5402]).PQ4:=TEM5402(ArrDevice[d5402]).PQ4+1;
       finally  cs_ArrDevice[d5402].Leave; end;
     end;
     if fl_ListProtocol then
     begin
       QueryPerformanceCounter(TimeStop1);
       ListKU.Add('ERROR');
       ListKU.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                  'ComPort '+IntToStr(NComPort)+'    '+
                  'Device '+IntToStr(Device_ID));
        ms:='';
        for i:=0 to Count-1 do
        ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
        ListKU.Add(ms);
        ListKU.Add('');
     end;
     SetEvent(h2220);
     exit;
   end;
   // оценка работы канала разветвителя
    for j:=1 to DevCount do if (ComDev[j].cCom_ID=NComPort) and (Pos('5402',UpperCase(ComDev[j].cDev_Name))<>0) then
    d5402:=j;
    if (d5402<>11) and (d5402<>21) then exit;
    cs_ArrDevice[d5402].Enter;try
    if (TEM5402(ArrDevice[d5402]).Use1) and (TEM5402(ArrDevice[d5402]).Dev1=KU_ID)
      then  TEM5402(ArrDevice[d5402]).PQ1:=TEM5402(ArrDevice[d5402]).PQ1+1;
    if (TEM5402(ArrDevice[d5402]).Use2) and (TEM5402(ArrDevice[d5402]).Dev2=KU_ID)
      then  TEM5402(ArrDevice[d5402]).PQ2:=TEM5402(ArrDevice[d5402]).PQ2+1;
    if (TEM5402(ArrDevice[d5402]).Use3) and (TEM5402(ArrDevice[d5402]).Dev3=KU_ID)
      then  TEM5402(ArrDevice[d5402]).PQ3:=TEM5402(ArrDevice[d5402]).PQ3+1;
    if (TEM5402(ArrDevice[d5402]).Use4) and (TEM5402(ArrDevice[d5402]).Dev4=KU_ID)
      then  TEM5402(ArrDevice[d5402]).PQ4:=TEM5402(ArrDevice[d5402]).PQ4+1;
    finally cs_ArrDevice[d5402].Leave; end;
    //оценка работы контроллера камеры
    cs_ArrStateDevice.Enter;
    try Inc(ArrStateDevice[KU_ID].PositiveQuery);
    finally cs_ArrStateDevice.Leave; end;
    if fl_ListProtocol then
    begin
       QueryPerformanceCounter(TimeStop1);
       ListKU.Add('Answer    +'+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms    '+
                        'ComPort '+IntToStr(NComPort)+'    '+
                        'Device '+IntToStr(KU_ID));
        ms:='';
        for i:=0 to Count-1 do
        ms:=ms+HexToStr((ReceiveCommand[i]and $F0) shr 4)+HexToStr(ReceiveCommand[i] and $0F)+' ';
        ListKU.Add(ms);
        ListKU.Add('');
     end;
    //комманда
    if Count=5 then
    begin
        CS_ID:=ReceiveCommand[2];
        if fm_KU <> nil then if fm_KU.Visible then
        PostMessage(Fm_KU.Handle,WM_NOTIFY_MSD,KU_ID,CS_ID);
        SetEvent(h2220);
        exit;
    end;
    //диагностика КУ
    if Count=21 then
    begin
      cs_ArrDevice[KU_ID].Enter;
      //напряжение питания
      TKU(ArrDevice[KU_ID]).Upit:=ReceiveCommand[3]+ReceiveCommand[4]*0.1;
      //температура
      k:=ReceiveCommand[5]*256+ReceiveCommand[6];
      l:=k*1.13636364/1024;
      if (19.05-3.81*l)<>0 then
      k:=(5710*l-5050)/(19.05-3.81*l);
      TKU(ArrDevice[KU_ID]).Temp:=k;
      //наружняя температура
      //влажность
      k:=ReceiveCommand[9]*256+ReceiveCommand[10];
      l:=k*5/1024;
      k:=(l-0.8)/0.031;
      TKU(ArrDevice[KU_ID]).Vlag:=k;
      //скорость вращения вентилятора
      TKU(ArrDevice[KU_ID]).Vent:=((ReceiveCommand[11] and $0F)*256+ReceiveCommand[12])*10;
      //признак вкл вентилятора
      if (ReceiveCommand[11] and $80) = $80 then TKU(ArrDevice[KU_ID]).VeOn:=true else TKU(ArrDevice[KU_ID]).VeOn:=false;
      //признак включения обогревателя
      if (ReceiveCommand[11] and $40) = $40 then TKU(ArrDevice[KU_ID]).PwOn:=true else TKU(ArrDevice[KU_ID]).PwOn:=false;
      //наработка
      TKU(ArrDevice[KU_ID]).Hour:=ReceiveCommand[13]*256+ReceiveCommand[14];
      //набор признаков
      if (ReceiveCommand[15] and $01) = $01 then TKU(ArrDevice[KU_ID]).PwAu:=true else TKU(ArrDevice[KU_ID]).PwAu:=false;
      if (ReceiveCommand[15] and $02) = $02 then TKU(ArrDevice[KU_ID]).VeAu:=true else TKU(ArrDevice[KU_ID]).VeAu:=false;
      if (ReceiveCommand[15] and $04) = $04 then TKU(ArrDevice[KU_ID]).SSP:=true  else TKU(ArrDevice[KU_ID]).SSP:=false;
      if (ReceiveCommand[15] and $08) = $08 then TKU(ArrDevice[KU_ID]).Cvet:=true else TKU(ArrDevice[KU_ID]).Cvet:=false;
      if (ReceiveCommand[15] and $10) = $10 then TKU(ArrDevice[KU_ID]).PwIn:=true else TKU(ArrDevice[KU_ID]).PwIn:=false;
      if (ReceiveCommand[15] and $20) = $20 then TKU(ArrDevice[KU_ID]).Svd:=true  else TKU(ArrDevice[KU_ID]).Svd:=false;
      if (ReceiveCommand[15] and $40) = $40 then TKU(ArrDevice[KU_ID]).TVK:=true  else TKU(ArrDevice[KU_ID]).TVK:=false;
      if (ReceiveCommand[15] and $80) = $80 then TKU(ArrDevice[KU_ID]).TeIn:=true else TKU(ArrDevice[KU_ID]).TeIn:=false;
      //коэфф усиления в корректоре У
      TKU(ArrDevice[KU_ID]).UsY :=ReceiveCommand[16];
      //наклон АЧХ в корректоре У
      TKU(ArrDevice[KU_ID]).AhxY:=ReceiveCommand[17];
      //коэфф усиления в корректоре с
      TKU(ArrDevice[KU_ID]).UsC :=ReceiveCommand[18];
      //наклон АЧХ в корректоре с
      TKU(ArrDevice[KU_ID]).AhxC:=ReceiveCommand[19];
      cs_ArrDevice[KU_ID].Leave;
      //при открытой форме изменения могут не соответствовать базе данных,
      //но при закрытой форме любое несоответствие это ошибка
      if (fm_KU <> nil) then if fm_KU.Visible then
      PostMessage(Fm_KU.Handle,WM_NOTIFY_MSD,KU_ID,18);
      if (fm_KU = nil) then
      begin
        //проверка соответствия базе данных
        if TKU(ArrDevice[KU_ID]).bUsY<>TKU(ArrDevice[KU_ID]).UsY then
          AddCommandTM2220(19,TKU(ArrDevice[KU_ID]).bUsY,KU_ID);
        if TKU(ArrDevice[KU_ID]).bAhxY<>TKU(ArrDevice[KU_ID]).AhxY then
          AddCommandTM2220(20,TKU(ArrDevice[KU_ID]).bAhxY,KU_ID);
      end;
      //если ку была выключена - включить её
      if (TKU(ArrDevice[KU_ID]).DataExh=0) and (ComTV[KU_ID]=0) then
      begin
          AddCommandTM2220(1,1,KU_ID);
          ComTV[KU_ID]:=1;
      end;
    end;
    SetEvent(h2220);
end;

procedure TQuestion.Execute;
var i:integer;
    command:TMass;
    Signaled:cardinal;
    flag:boolean;
    pms:^Tmass;
begin
  QueryPerformanceFrequency(Freq);
  QuestionOfDevice:=0;
  TimeExh:=Now;
  RabCom:=0;RezCom:=0;
  cs_2404.Enter;
  try TM2404State.com1:=false;
      TM2404State.com2:=false;
      for i in [23..31] do
      begin
        TM2404State.Work[i]:=2;
        TM2404State.DoIt[i]:=0;
        TM2404State.Status[i]:=0;
      end;
      TM2404State.TotalQuery1:=0;
      TM2404State.PositiveQuery1:=0;
      TM2404State.TotalQuery2:=0;
      TM2404State.PositiveQuery2:=0;
  finally cs_2404.Leave;   end;
  FillChar(ComB,SizeOf(ComB),0);
  FillChar(ComNP,SizeOf(ComNP),0);
  FillChar(ComTV,SizeOf(ComTV),0);
  //формируем опросный лист
  for i:=1 to DevCount do
  case i of
     //Опрос камерных установок
     7..10:
     begin
         //сама команда
         command[1]:=HI(ComDev[i].cAdress);
         command[2]:=LO(ComDev[i].cAdress);
         command[3]:=Command_TM2220[18].cCommand;
         command[4]:=$ff-(command[1]+command[2]+command[3])+1;
         //структура для записи в TList
         New(pms);
         pms^[1]:=i;                   //Device_ID
         pms^[2]:=ComDev[i].cCom_ID;   //Com_ID;
         pms^[3]:=4;                   //размер команды
         pms^[4]:=18;                  //номер команды
         pms^[5]:=AllowToRepeat-1;     //кол-во повторов команды
         pms^[6]:=0;                   //свободно
         pms^[7]:=command[1];
         pms^[8]:=command[2];
         pms^[9]:=command[3];
         pms^[10]:=command[4];
         //поставить в очередь на выполнение
         QuestionList.Add(pms);
     end;
     23,24:
     begin
       //наработка  5401 - скан портов 2404
       begin
         //сама комманда
         command[1]:=ComDev[i].cAdress;                    //адрес
         command[2]:=Command_EM5401[5].cComandCount-2;     //кол-во байт комманды
         command[3]:=Command_EM5401[5].cCommand;           //сама команда
         command[4]:=(command[1]+command[2]+command[3]);
         //структура для записи в TList
         New(pms);
         pms^[1]:=i;                   //Device_ID
         pms^[2]:=ComDev[i].cCom_ID;   //Com_ID;
         pms^[3]:=Command_EM5401[5].cComandCount;//размер комманды
         pms^[4]:=5;//номер команды
         pms^[5]:=AllowToRepeat-1;     //кол-во повторов комманды
         pms^[6]:=0;                   //свободно
         pms^[7]:=command[1];
         pms^[8]:=command[2];
         pms^[9]:=command[3];
         pms^[10]:=command[4];
         //поставить в очередь на выполнение
         QuestionList.Add(pms);
       end;
       //опрос внутренней шины - выбор TM2404Question после определения рабочего портя
       begin
         //сама комманда
         command[1]:=ComDev[i].cAdress;                    //адрес
         command[2]:=Command_EM5401[4].cComandCount-2;     //кол-во байт комманды
         command[3]:=Command_EM5401[4].cCommand;           //сама команда
         command[4]:=(command[1]+command[2]+command[3]);
         //структура для записи в TList
         New(pms);
         pms^[1]:=i;                   //Device_ID
         pms^[2]:=ComDev[i].cCom_ID;   //Com_ID;
         pms^[3]:=Command_EM5401[4].cComandCount;//размер комманды
         pms^[4]:=4;//номер команды
         pms^[5]:=AllowToRepeat+10;     //запуск регулирует TM2404Question
         pms^[6]:=0;                   //свободно
         pms^[7]:=command[1];
         pms^[8]:=command[2];
         pms^[9]:=command[3];
         pms^[10]:=command[4];
         pms^[255]:=1;
         //поставить в очередь на выполнение
         QuestionList.Add(pms);
       end;
     end;
  end;
  fl_QuestionOfDevice:=false;
  QueryPerformanceCounter(TimeStart);
  while not Terminated do
  begin
    QueryPerformanceCounter(TimeStop);
    if Freq=0 then QueryPerformanceFrequency(Freq);
    if (TimeStop-TimeStart)/Freq*1000>=501 then
    begin
      if QuestionOfDevice=1000 then QuestionOfDevice:=1;      
      inc(QuestionOfDevice);
      fl_QuestionOfDevice:=true;
      TimeStart:=TimeStop;
    end;
    DeviceTest;
    if fl_ListProtocol then
    begin
      List2404.Add('------------------------------------------------------------');
      ListKU.Add  ('------------------------------------------------------------');
    end;
    Sleep(51);
  end;
  if terminated then
    begin
      Sleep(1000);
      if MTKCom[ComDev[23].cCom_ID]<>nil  then begin MTKCom[ComDev[23].cCom_ID].Connected:=false;{  MTKCom[ComDev[23].cCom_ID].Destroy;  } end;
      sleep(5);
      if MTKCom[ComDev[24].cCom_ID]<>nil  then begin MTKCom[ComDev[24].cCom_ID].Connected:=false;{  MTKCom[ComDev[24].cCom_ID].Destroy; }  end;
      sleep(5);
      if MTKCom[ComDev[11].cCom_ID]<>nil  then begin MTKCom[ComDev[11].cCom_ID].Connected:=false; { MTKCom[ComDev[11].cCom_ID].Destroy;  } end;
      sleep(5);
      if MTKCom[ComDev[21].cCom_ID]<>nil  then begin MTKCom[ComDev[21].cCom_ID].Connected:=false; { MTKCom[ComDev[21].cCom_ID].Destroy;  } end;
      sleep(5);
      CommandList.Free;
      QuestionList.Free;
      ExternalList.Free;
      cs_External.Free;
      cs_2404.Free;
      exit;
    end;
end;

procedure TQuestion.SimpleCommand(RabCom:byte;DV_ID:byte;Cm_ID:byte;AddC:byte;AddN:TCross);
  var command:TMass;
      QuestCount:byte;
      AnsCount:byte;
      Com     :byte;
      IC:^TMass;
      Result:byte;
      n,m:integer;
      cr:byte;
      LRC:byte;
      pms:^Tmass;
  begin
    case DV_ID of
    23..24: begin QuestCount:=Command_EM5401[CM_ID].cComandCount;
                  AnsCount:=Command_EM5401[CM_ID].cAnswerCount;
                  Com:=Command_EM5401[CM_ID].cCommand;
            end;
    26..29: begin QuestCount:=Command_EM2437[CM_ID].cComandCount;
                  AnsCount:=Command_EM2437[CM_ID].cAnswerCount;
                  Com:=Command_EM2437[CM_ID].cCommand;
            end;
    30..31: begin QuestCount:=Command_EM7401[CM_ID].cComandCount;
                  AnsCount:=Command_EM7401[CM_ID].cAnswerCount;
                  Com:=Command_EM7401[CM_ID].cCommand;
            end;
    end;
    command[1]:=ComDev[DV_ID].cAdress;
    command[2]:=QuestCount-2+AddC;
    command[3]:=Com;
    LRC:=command[1]+command[2]+command[3];
    for n:=1 to AddC do
    begin
      command[3+n]:=AddN[n];
      LRC:=LRC+AddN[n];
    end;
    command[4+AddC]:=LRC;
    New(pms);
    pms^[1]:=DV_ID;
    pms^[2]:=0;
    pms^[3]:=QuestCount+AddC;
    pms^[4]:=CM_ID;
    pms^[5]:=0;
    pms^[6]:=0;
    for n:=0 to 3+AddC do
    pms^[7+n]:=command[1+n];
    //может команда уже присутствует ?
    {Result:=0;
    cs_Command.Enter;
    for n:=0 to CommandList.Count-1 do
    begin
      IC:=CommandList.Items[n];
      cr:=0;
      for m in [1..4,7..(10+AddC)] do if IC^[m]=pms^[m] then  Inc(cr);
      if cr=(4+(10+AddC)-6) then
      begin
        Result:=1;
        break;
      end;
    end;
    cs_Command.Leave;
    case Result of
    0: begin
         cs_Command.Enter;
         try CommandList.Add(pms)
         finally cs_Command.Leave; end;
       end;
    1: Dispose(pms);
    end;  }
    cs_External.Enter;  try ExternalList.Add(pms) finally cs_External.Leave; end;
  end;

procedure TQuestion.TM2404Analiz;
var i,j   :integer;
    ICC:^TMass;
    AddCom:TCross;
    ST,ST1:byte;
    s:string;
    SS:cardinal;
    mTM2404State:TTM2404State;
begin
  FillChar(AddCom,SizeOf(AddCom),0);
  cs_2404.Enter;
    mTM2404State.com1:=TM2404State.com1;
    mTM2404State.com2:=TM2404State.com2;
    mTM2404State.Work:=TM2404State.Work;
    mTM2404State.DoIt:=TM2404State.DoIt;
    mTM2404State.Status:=Tm2404State.Status;
    mTM2404State.TotalQuery1:=TM2404State.TotalQuery1;
    mTM2404State.TotalQuery2:=TM2404State.TotalQuery2;
    mTM2404State.PositiveQuery1:=TM2404State.PositiveQuery1;
    mTM2404State.PositiveQuery2:=TM2404State.PositiveQuery2;
  cs_2404.Leave;
  //определим рабочий COM
  if RabCom=0 then
  begin
    if mTM2404State.com2 then begin RabCom:=ComDev[24].cCom_ID; RezCom:=ComDev[23].cCom_ID; end;
    if mTM2404State.com1 then begin RabCom:=ComDev[23].cCom_ID; RezCom:=ComDev[24].cCom_ID; end;
  end else
  begin
    //рабочий порт 1 вышел из строя
    if (RabCom=ComDev[23].cCom_ID) and not mTM2404State.com1 then
    //при этом резервный жив
    if mTM2404State.com2 then
       begin
         RabCom:=ComDev[24].cCom_ID;
         RezCom:=ComDev[23].cCom_ID;
       end else
    //при этом резервный не живёт
       begin
         RabCom:=0;
         RezCom:=0;
       end;
    //рабочий порт 2 вышел из строя
    if (RabCom=ComDev[24].cCom_ID) and not mTM2404State.com2 then
    //при этом резервный жив
    if mTM2404State.Com1 then
       begin
         RabCom:=ComDev[23].cCom_ID;
         RezCom:=ComDev[24].cCom_ID;
       end else
    //при этом резервный не живёт
       begin
         RabCom:=0;
         RezCom:=0;
       end;
  end;
  if RabCom=0 then  exit;
  //если прошла ошибка внутренней шины на работающем порте - полученный статус устройств считается бредовым
  if ((RabCom=ComDev[23].cCom_ID) and (mTM2404State.Status[23] and $20 = $20 )) then
  begin
    if mTM2404State.com2  then
    begin
      RabCom:=ComDev[24].cCom_ID;
      RezCom:=ComDev[23].cCom_ID;
      SimpleCommand(RabCom,24,4,0,AddCom);
      exit;
    end else
    begin
      SimpleCommand(RabCom,23,4,0,AddCom);
      exit;
    end;
  end;
  if ((RabCom=ComDev[24].cCom_ID) and (mTM2404State.Status[24] and $20  = $20 )) then
  begin
    if mTM2404State.com1  then
    begin
      RabCom:=ComDev[23].cCom_ID;
      RezCom:=ComDev[24].cCom_ID;
      SimpleCommand(RabCom,23,4,0,AddCom);
      exit;
    end else
    begin
      SimpleCommand(RabCom,24,4,0,AddCom);
      exit;
    end;
  end;
  //определим изменения конфигурации 2404
  with mTM2404State do
  for i in [23,24,26..31] do
  begin
    //запрос только для работающих блоков  
    if Work[i]<>1 then continue;
    //комманда идентефикации
    if DoIt[i] and $80 = $80 then
    begin
      SimpleCommand(RabCom,i,6,0,AddCom);
      if TM2404State.DoIt[i] and $80 = $80 then
      TM2404State.DoIt[i]:=TM2404State.DoIt[i]-$80;
    end;
    //замена блока - запись серийника в базу
    //восстановление параметров из базы (первое включение, смена блока,Reload Оператора)
    if (DoIt[i] and $40 = $40) or
       (DoIt[i] and $20 = $20) then
    begin
      case i of
      23..24:
             begin
               cs_ArrDevice[i].Enter;
               try SS:=TEM5401(ArrDevice[i]).SerNum;
               finally cs_ArrDevice[i].Leave; end;
               begin
                 DM.QDin.Close;
                 s:='UPDATE EM5401Param SET Serial_Numb='+IntToStr(SS)+' WHERE Device_ID='+IntToStr(i);
                 DM.QDin.SQL.Clear;
                 DM.QDin.SQL.Add(s);
                 DM.QDin.ExecSQL;
                 DM.QDin.Close;
               end;
               AddCom[1]:=TEM5401(ArrDevice[i]).UPT1;
               SimpleCommand(RabCom,i,9,1,AddCom);
               AddCom[1]:=TEM5401(ArrDevice[i]).UPT2;
               SimpleCommand(RabCom,i,10,1,AddCom);
               SimpleCommand(RabCom,i,2,0,AddCom);
               SimpleCommand(RabCom,i,3,0,AddCom);
             end;
      26..27:
             begin
             cs_ArrDevice[i].Enter;
             try SS:=TEM2437(ArrDevice[i]).SerNum;
             finally cs_ArrDevice[i].Leave; end;
             begin
               s:='UPDATE EM2437Param SET Serial_Numb='+IntToStr(SS)+' WHERE Device_ID='+IntToStr(i);
               DM.QDin.SQL.Clear;
               DM.QDin.SQL.Add(s);
               DM.QDin.ExecSQL;
               DM.QDin.Close;
             end;
             AddCom[1]:=TEM2437(ArrDevice[i]).UPSS;
             SimpleCommand(RabCom,i,3,1,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain1;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal1;
             SimpleCommand(RabCom,i,7,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain2;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal2;
             SimpleCommand(RabCom,i,8,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain3;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal3;
             SimpleCommand(RabCom,i,9,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain4;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal4;
             SimpleCommand(RabCom,i,10,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).UPT11;
             SimpleCommand(RabCom,i,15,1,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).UPT12;
             SimpleCommand(RabCom,i,16,1,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).UPT21;
             SimpleCommand(RabCom,i,17,1,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).UPT22;
             SimpleCommand(RabCom,i,18,1,AddCom);
             if i=26 then   AddCom[1]:=$55;
             if i=27 then   AddCom[1]:=$55;
             SimpleCommand(RabCom,i,20,1,AddCom);
             end;
      28..29:
             begin
             cs_ArrDevice[i].Enter;
             try SS:=TEM2437(ArrDevice[i]).SerNum;
             finally cs_ArrDevice[i].Leave; end;
             begin
               s:='UPDATE EM2437Param SET Serial_Numb='+IntToStr(SS)+' WHERE Device_ID='+IntToStr(i);
               DM.QDin.SQL.Clear;
               DM.QDin.SQL.Add(s);
               DM.QDin.ExecSQL;
               DM.QDin.Close;
             end;
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain1;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal1;
             SimpleCommand(RabCom,i,7,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain2;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal2;
             SimpleCommand(RabCom,i,8,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain3;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal3;
             SimpleCommand(RabCom,i,9,2,AddCom);
             AddCom[1]:=TEM2437(ArrDevice[i]).Gain4;
             AddCom[2]:=TEM2437(ArrDevice[i]).Equal4;
             SimpleCommand(RabCom,i,10,2,AddCom);
             if i=28 then   AddCom[1]:=$2;
             if i=29 then   AddCom[1]:=$20;
             SimpleCommand(RabCom,i,20,1,AddCom);
             end;
      30..31:
             begin
             cs_ArrDevice[i].Enter;
             try SS:=TEM7401(ArrDevice[i]).SerNum;
             finally cs_ArrDevice[i].Leave; end;
             begin
               s:='UPDATE EM7401Param SET Serial_Numb='+IntToStr(SS)+' WHERE Device_ID='+IntToStr(i);
               DM.QDin.SQL.Clear;
               DM.QDin.SQL.Add(s);
               DM.QDin.ExecSQL;
               DM.QDin.Close;
             end;
             AddCom:=TEM7401(ArrDevice[i]).Cross;
             SimpleCommand(RabCom,i,7,8,AddCom);
             AddCom[1]:=$55;
             SimpleCommand(RabCom,i,10,1,AddCom);
             end;
      end;
      if TM2404State.DoIt[i] and $40=$40 then  TM2404State.DoIt[i]:=TM2404State.DoIt[i]-$40;
      if TM2404State.DoIt[i] and $20=$20 then  TM2404State.DoIt[i]:=TM2404State.DoIt[i]-$20;
    end;
    //проверка указаний от пользователя
    begin
      cs_External.Enter;
      if ExternalList.Count<>0 then
      for j:=0 to ExternalList.Count-1 do
      begin
        ICC:=ExternalList.Items[j];
        CommandList.Add(ICC);
      end;
      ExternalList.Clear;
      cs_External.Leave;
    end;
    //проверка статуса - уточнение изменённых параметров
    if not fl_NP then
    begin
      case i of
      23..24:
           begin
           ST:=mTM2404State.Status[i];
           cs_ArrDevice[i].Enter;
           try TEM5401(ArrDevice[i]).IfBus:=ST;
               ST1:=TEM5401(ArrDevice[i]).IfBSync;
           finally cs_ArrDevice[i].Leave; end;
           //ошибки синхросигналов
           if ((ST and $40 = $40) and (ComB[i] and $40 <> $40))  or
              (ST1 and $0F <> $0F) then
           begin
             SimpleCommand(RabCom,i,02,0,AddCom);
             ComB[i]:=ComB[i]+$40;
           end;
           //ошибка питания 1
           if (ST and $08 = $08) and (ComB[i] and $08 <> $08) then
           begin
               SimpleCommand(RabCom,i,07,0,AddCom);
               ComB[i]:=ComB[i]+$08;
           end;
           //ошибка питания 2
           if (ST and $04 = $04) and (ComB[i] and $04 <> $04) then
           begin
             SimpleCommand(RabCom,i,08,0,AddCom);
             ComB[i]:=ComB[i]+$04;
           end;
           //ошибки изменения тестовых входов 3401
           if (ST and $02 = $02) and (ComB[i] and $02 <> $02) then
           begin
             SimpleCommand(RabCom,i,03,0,AddCom);
             ComB[i]:=ComB[i]+$02;
           end;
           end;
      26..29:
           begin
           ST:=mTM2404State.Status[i];
           cs_ArrDevice[i].Enter;
           try TEM2437(ARrDevice[i]).Mabus:=ST;
           finally cs_ArrDevice[i].Leave; end;
           //ошибки видеосигналов
           if (ST and $40 = $40) and (ComB[i] and $40 <> $40) then
           begin
             SimpleCommand(RabCom,i,02,0,AddCom);
             ComB[i]:=ComB[i]+$40;
           end;
           if (i=26) or (i=27) then
           //ошибки питания 11
           if (ST and $08 = $08) and (ComB[i] and $08 <> $08) then
           begin
             SimpleCommand(RabCom,i,11,0,AddCom);
             ComB[i]:=ComB[i]+$08;
           end;
           if (i=26) or (i=27) then
           //ошибки питания 12
           if (ST and $04 = $04) and (ComB[i] and $04 <> $04) then
           begin
             SimpleCommand(RabCom,i,12,0,AddCom);
             ComB[i]:=ComB[i]+$04;
           end;
           if (i=26) or (i=27) then
           //ошибки питания 21
           if (ST and $02 = $02) and (ComB[i] and $02 = $02)  then
           begin
             SimpleCommand(RabCom,i,13,0,AddCom);
             ComB[i]:=ComB[i]+$02;
           end;
           if (i=26) or (i=27) then
           //ошибки питания 22
           if (ST and $01 = $01) and (ComB[i] and $01 <> $01) then
           begin
             SimpleCommand(RabCom,i,14,0,AddCom);
             ComB[i]:=ComB[i]+$01;
           end;
           end;
      30..31:
           begin
           ST:=mTM2404State.Status[i];
           cs_ArrDevice[i].Enter;
           try TEM7401(ARrDevice[i]).VMSUS:=ST;
           finally cs_ArrDevice[i].Leave; end;
           if (ST and $40 = $40) and (ComB[i] and $40 <> $40) then
           begin
             SimpleCommand(RabCom,i,2,0,AddCom);
             ComB[i]:=ComB[i]+$40;
           end;
           end;
      end;
    end;
  end;
  //при отображении страницы электропитания дополнительный опрос
  //статусов и порогов питания для отображения на форме
  if fl_NP then
  begin
    if (ComNP[23]=0) and ((TypeNP=23) or (TypeNP=155)) then
    begin
      SimpleCommand(RabCom,23,7,0,AddCom);
      SimpleCommand(RabCom,23,8,0,AddCom);
      ComNP[23]:=1;
    end;
    if (ComNP[24]=0) and ((TypeNP=24) or (TypeNP=155)) then
    begin
      SimpleCommand(RabCom,24,7,0,AddCom);
      SimpleCommand(RabCom,24,8,0,AddCom);
      ComNP[24]:=1;
    end;
    if (ComNP[26]=0) and ((TypeNP=26) or (TypeNP=155)) then
    begin
      SimpleCommand(RabCom,26,11,0,AddCom);
      SimpleCommand(RabCom,26,12,0,AddCom);
      SimpleCommand(RabCom,26,13,0,AddCom);
      SimpleCommand(RabCom,26,14,0,AddCom);
      ComNP[26]:=1;
    end;
    if (ComNP[27]=0) and ((TypeNP=27) or (TypeNP=155))then
    begin
      SimpleCommand(RabCom,27,11,0,AddCom);
      SimpleCommand(RabCom,27,12,0,AddCom);
      SimpleCommand(RabCom,27,13,0,AddCom);
      SimpleCommand(RabCom,27,14,0,AddCom);
      ComNP[27]:=1;
    end;
  end;
end;

//опрос внутренней шины по рабочему порту
procedure TQuestion.TM2404Question;
var i:integer;
    IRR:^TMass;
begin
  for i:=0 to QuestionList.Count - 1 do
  begin
    IRR:=QuestionList.Items[i];
    if IRR^[2]=RabCom then
    begin
      //команду наработки для рабочего порта закрываем
      if IRR^[9]=Command_EM5401[5].cCommand then IRR^[5]:=AllowToRepeat+10;
      //команду опроса внутренней шины для рабочего порта открыть
      if IRR^[9]=Command_EM5401[4].cCommand then IRR^[5]:=AllowToRepeat-1;
    end;
    if IRR^[2]=RezCom then
    begin
      //команду наработки открываем в качестве скана порта
      if IRR^[9]=Command_EM5401[5].cCommand then IRR^[5]:=AllowToRepeat-1;
      //команду опроса внутренней шины запретить
      if IRR^[9]=Command_EM5401[4].cCommand then IRR^[5]:=AllowToRepeat+10;      
    end;
    //если рабочий порт неопределён или потерян, то оставляем только скан портов
    if RabCom=0 then
    begin
      if (IRR^[2]=ComDev[23].cCom_ID) or (IRR^[2]=ComDev[24].cCom_ID) then
      if (IRR^[9]=Command_EM5401[4].cCommand) then IRR^[5]:=AllowToRepeat-1;
    end;
  end;
end;

procedure TQuestion.DeviceTest;
var i:integer;
    InternalCommand:^TMass;
begin
  for i:=1 to ComCount do
  begin
    if (i<>ComDev[23].cCom_ID) and
       (i<>ComDev[24].cCom_ID) and
       (i<>ComDev[11].cCom_ID) and
       (i<>ComDev[21].cCom_ID) then
       continue;
    if MTKCom[i]=nil then
    begin
       MTKCom[i]:=TComPortR.Create(nil);
       MTKCom[i].ComProp.BaudRate:=ComList[i].cBaudRate;
       MTKCom[i].ComProp.ByteSize:=ComList[i].cByteSize;
       MTKCom[i].ComProp.EnableDTR:=ComList[i].cEnableDTR;
       MTKCom[i].ComProp.EnableRTS:=ComList[i].cEnableRTS;
       MTKCom[i].ComProp.Parity:=ComList[i].cParity;
       MTKCom[i].ComProp.Stopbits:=ComList[i].cStopBits;
       MTKCom[i].ComProp.WaitResult:=ComList[i].cTimeOut;
       MTKCom[i].InBufSize:=1024;
       MTKCom[i].WaitFullBuffer:=false;
       if (i=ComDev[23].cCom_ID) or (i=ComDev[24].cCom_ID) then  MTKCom[i].OnReadPacket:=ReadPacket5401;
       if (i=ComDev[11].cCom_ID) or (i=ComDev[21].cCom_ID) then  MTKCom[i].OnReadPacket:=ReadPacket2220;
       MTKCom[i].ComNumber:=ComList[i].cCom;
       if not MTKCom[i].Connected then MTKCom[i].Open;
       MTKCom[i].ReadActive:=True;
    end;
  end;
  TM2404Analiz;
  if fl_QuestionOfDevice then
  begin
    FillChar(ComB,SizeOf(ComB),0);
    fl_QuestionOfDevice:=false;
    //возобновляем опрос устройств
    if QuestionList.Count<>0 then
    for i:=0 to QuestionList.Count - 1 do
    begin
      InternalCommand:=QuestionList.Items[i];
      InternalCommand^[5]:=AllowToRepeat-1;
    end;
    //анализируем состояние устройств каждый третий опрос
    if (QuestionOfDevice mod 3)=0 then ANALIZ;
    TM2404Question;
  end;
  CommandExecute(CommandList , 'Command');
  CommandExecute(QuestionList, 'Question');
end;

procedure TQuestion.CommandExecute(var List: TList; ListType: string);
var 
    ListCount,i,k,j,d5402:integer;
    pms:^TMass;
    ComNumb,DevNumb,Count,COM_ID:integer;
    VC:TMass;
    ms:string;
    Signaled:cardinal;
    vvs:^TMass;
begin
  DeleteList:=TList.Create;
  ListCount:=List.Count;
  if ListCount>0 then
  begin
    for i:=0 to ListCount-1 do
    begin
      if fl_STOP then exit;
      pms:=List.Items[i];
      if ListType<>'Question' then
      if pms^[5]>=Holliday then pms^[5]:=0;
      INC(pms^[5]);
      if pms^[5]>AllowToRepeat then continue;
      ComNumb:=pms^[2];
      if ComNumb=0 then ComNumb:=RabCom;
      DevNumb:=pms^[1];
      if MTKCom[ComNumb]=nil then  continue;
      Count:=pms^[3];
      COM_ID:=pms^[4];
      for k:=1 to Count+7 do
      VC[k-1]:=pms^[k+6];
      //////////////////////////////////////////////////////////////////////////
      if fl_ListProtocol then
      begin
        ms:='';
        case DevNumb of
          23,24:    ms:=Command_EM5401[COM_ID].cComment;
          7..10:    ms:=Command_TM2220[COM_ID].cComment;
          26..29:   ms:=Command_EM2437[COM_ID].cComment;
          30,31:    ms:=Command_EM7401[COM_ID].cComment;
        end;
        case DevNumb of
          7..10:   ListKU.Add('Question    '+FormatDateTime('hh:nn:ss:zzz',Time)+'    '+
                              'ComPort '+IntToStr(ComNumb)+'    '+
                              'Device '+IntToStr(DevNumb)+'    '+
                               ms);
          23..31:  List2404.Add('Question    '+FormatDateTime('hh:nn:ss:zzz',Time)+'    '+
                                'ComPort '+IntToStr(ComNumb)+'    '+
                                'Device '+IntToStr(DevNumb)+'    '+
                                 ms);
        end;
        ms:='';
        for k:=0 to Count-1 do
          ms:=ms+HexToStr((VC[k]and $F0) shr 4)+HexToStr(VC[k] and $0F)+' ';
        case DevNumb of
          7..10:   ListKU.Add(ms);
          23..31:  List2404.Add(ms);
        end;
        QueryPerformanceCounter(TimeStart1);
        if Freq=0 then QueryPerformanceFrequency(Freq);
      end;
      //////////////////////////////////////////////////////////////////////////
      //анализ состояния блока
      cs_ArrStateDevice.Enter; try Inc(ArrStateDevice[DevNumb].TotalQuery); finally cs_ArrStateDevice.Leave; end;
      //для камер дополнительно разветвитель
      if DevNumb in [7..10] then
      begin
        //сначала узнаем номер разветвителя
        for j:=1 to DevCount do if (ComDev[j].cCom_ID=ComNumb) and (Pos('5402',UpperCase(ComDev[j].cDev_Name))<>0) then
        d5402:=j;
        if (d5402<>11) and (d5402<>21) then break;
        cs_ArrDevice[d5402].Enter;
        if (TEM5402(ArrDevice[d5402]).Use1) and (TEM5402(ArrDevice[d5402]).Dev1=DevNumb)
          then  TEM5402(ArrDevice[d5402]).TQ1:=TEM5402(ArrDevice[d5402]).TQ1+1;
        if TEM5402(ArrDevice[d5402]).Use2 and (TEM5402(ArrDevice[d5402]).Dev2=DevNumb)
          then  TEM5402(ArrDevice[d5402]).TQ2:=TEM5402(ArrDevice[d5402]).TQ2+1;
        if TEM5402(ArrDevice[d5402]).Use3 and (TEM5402(ArrDevice[d5402]).Dev3=DevNumb)
          then  TEM5402(ArrDevice[d5402]).TQ3:=TEM5402(ArrDevice[d5402]).TQ3+1;
        if TEM5402(ArrDevice[d5402]).Use4 and (TEM5402(ArrDevice[d5402]).Dev4=DevNumb)
          then  TEM5402(ArrDevice[d5402]).TQ4:=TEM5402(ArrDevice[d5402]).TQ4+1;
        cs_ArrDevice[d5402].Leave;
      end;
      //анализ состояния общей шины 2404
      if ComNumb=RabCom then
      begin
        //опрос внутренней шины
        if pms^[9]=Command_EM5401[4].cCommand then
        begin
          cs_ArrStateDevice.Enter;
          for j in [23,24,26..31] do  Inc(ArrStateDevice[j].TotalQuery);
          cs_ArrStateDevice.Leave;
        end else
        begin
          if ComNumb=ComDev[23].cCom_ID then Inc(ArrStateDevice[23].TotalQuery);
          if ComNumb=ComDev[24].cCom_ID then Inc(ArrStateDevice[24].TotalQuery);
        end;
      end;
      cs_2404.Enter;
      if ComNumb=ComDev[23].cCom_ID then Inc(TM2404State.TotalQuery1);
      if ComNumb=ComDev[24].cCom_ID then Inc(TM2404State.TotalQuery2);
      cs_2404.Leave;
      MTKCom[ComNumb].WriteBuffer(@VC[0],Count);
      if (ComNumb=ComDev[21].cCom_ID) or (ComNumb=ComDev[11].cCom_ID) then Signaled:=WaitForSingleObject(h2220,ComList[ComNumb].cTimeOut);
      if (ComNumb=ComDev[23].cCom_ID) or (ComNumb=ComDev[24].cCom_ID) then Signaled:=WaitForSingleObject(h5401,ComList[ComNumb].cTimeOut);
      //удалить выполненную команду
      if Signaled=WAIT_OBJECT_0 then
      if ListType<>'Question' then DeleteList.Add(pms);
      //вывод сообщений на формы
      if Signaled<>WAIT_OBJECT_0 then
      begin
        case DevNumb of
        23,24:    if (fm5401 <> nil) then
                  if (fm5401.Visible) then
                  PostMessage(Fm5401.Handle,WM_NOTIFY_MSD,DevNumb,201);
        26..29:   if (fm2437 <> nil) then
                  if (fm2437.Visible) then
                  PostMessage(Fm2437.Handle,WM_NOTIFY_MSD,DevNumb,201);
        30,31:    if (fm7401 <> nil) then
                  if (fm7401.Visible) then
                  PostMessage(Fm7401.Handle,WM_NOTIFY_MSD,DevNumb,201);
        7..10:    if (fm_KU <> nil) then
                  if (fm_KU.Visible) then
                  PostMessage(fm_KU.Handle,WM_NOTIFY_MSD,DevNumb,201);
        end;
        ////////////////////////////////////////////////////////////////////////
        if fl_ListProtocol then
        begin
          QueryPerformanceCounter(TimeStop1);
          case DevNumb of
            7..10:   begin
                       ListKU.Add('No Answer    '+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms');
                       ListKU.Add('');
                     end;
            23..31:  begin
                       List2404.Add('No Answer    '+IntToStr(Round((TimeStop1-TimeStart1)/Freq*1000))+'ms');
                       List2404.Add('');
                     end;
          end;
        end;
        ////////////////////////////////////////////////////////////////////////
        sleep(5);
      end;
    end;
  end;
  //Исключение выполненных команд из списка
  if DeleteList.Count>0 then
  for i:=0 to DeleteList.Count - 1 do
  begin
    vvs:=DeleteList.Items[i];
    List.Delete(List.IndexOf(vvs));
    DISPOSE(vvs);
  end;
  if ListCount-DeleteList.Count<>List.Count then
     ShowMEssage('123');
  DeleteList.Free;
end;

procedure TQuestion.Analiz;
var i,j:integer;
    State:boolean;
    ResultState:byte;
    mArrStateDevice:array [1..DevCount] of TArrStateDevice;
    DataExh:byte;
    ST:byte;
    DSA: array [23..31] of byte;  //массив состояний корзины
    CH:TSwitch;
    CG:TGateways;
    TST:cardinal;
begin
  if QuestionOfDevice mod 18 = 0 then  FillChar(ComNP,SizeOf(ComNP),0);
  FillChar(ComTV,SizeOf(ComTV),0);
  if fl_ListProtocol then
  begin
    List2404.Add('');
    List2404.Add('analiz');
    List2404.Add('');
    ListKU.Add('');
    ListKU.Add('analiz');
    ListKU.Add('');
  end;
  TimeExh:=Now;
  FillChar(DSA,SizeOF(DSA),0);
  cs_ArrStateDevice.Enter;
  for i:=1 to DevCount do mArrStateDevice[i]:=ArrStateDevice[i];
  cs_ArrStateDevice.Leave;
  TARM(ArrDevice[1]).SyncTime:=now;
  for i:=1 to DevCount do
     case i of
     1,2,3,16: //ARM
       begin
         cs_ArrDevice[i].Enter;
         //ни одного сообщения от АРМ за прошедшее время

         if TARM(ArrDevice[i]).SyncTime<=time_QuestionOfDevice then
         begin
           mArrStateDevice[i].ResultState:=0;
           DataExh:=0;
         end else
         begin
           State:=true;
           DataExh:=1;
           if not (TARM(ArrDevice[i]).VideoTDV)
             then State:=false;  //отсутствует видео
           if (not TARM(ArrDevice[i]).Lan[1].State) or (not TARM(ArrDevice[i]).Lan[2].State)
             then State:=false; //отсутствует одна из сетевых карт
           for j:= 1 to TARM(ArrDevice[i]).HDDCount do
           if TARM(ArrDevice[i]).HDD[j].TotalSpace<>0 then
           if (TARM(ArrDevice[i]).HDD[j].FreeSpace/TARM(ArrDevice[i]).HDD[j].TotalSpace<=0.05) then State:=false; //мало свободного места на одном из жёстких дисков
           if State then mArrStateDevice[i].ResultState:=1
             else mArrStateDevice[i].ResultState:=3;
         end;
         TARM(ArrDevice[i]).DataExh:=DataExh;
         cs_ArrDevice[i].Leave;
         if fm_ARM <> nil then if fm_ARM.Visible then PostMessage(Fm_ARM.Handle,WM_NOTIFY_MSA,i,0);
       end;
     20:
       begin
         mArrStateDevice[20].ResultState:=mArrStateDevice[20].ExhState;
       end;
     38,39: //LUNA
       begin
         if ExternalDevice.OLS=0 then continue;
         cs_ArrDevice[i].Enter;
         try  TST:=TLuna(ArrDevice[i]).TimeSt;
              TLuna(ArrDevice[i]).TimeST:=0;
         finally cs_ArrDevice[i].Leave; end;
         if TST<>1 then mArrStateDevice[i].ResultState:=2 else mArrStateDevice[i].ResultState:=1;
         cs_ArrDevice[i].Enter;
         try  TLuna(ArrDevice[i]).DataExh:=mArrStateDevice[i].ResultState;
         finally cs_ArrDevice[i].Leave;  end;
         if i=38 then
         begin
           cs_ArrDevice[1].Enter;
           try   TArm(ArrDevice[1]).LunExh:=mArrStateDevice[i].ResultState;
           finally cs_ArrDevice[1].Leave; end;
         end;
         if i=39 then
         begin
           cs_ArrDevice[2].Enter;
           try TArm(ArrDevice[2]).LunExh:=mArrStateDevice[i].ResultState;
           finally cs_ArrDevice[2].Leave; end;
         end;
       end;
      40,41: //Telemetric system
       begin
         if ExternalDevice.Telem=0 then continue;
         if LadogaLastWSP>=5 then
         begin
           Ladoga[1].Central.laDataExh:=0;
           Ladoga[1].Fore.laDataExh:=0;
           Ladoga[1].Aft.laDataExh:=0;
           LadogaLastWSP:=6;
         end else INC(LadogaLastWSP);
         if LadogaLastWSL>=5 then
         begin
           Ladoga[2].Central.laDataExh:=0;
           Ladoga[2].Fore.laDataExh:=0;
           Ladoga[2].Aft.laDataExh:=0;
           LadogaLastWSL:=6;
         end else INC(LadogaLastWSL);
         ST:=0;
         cs_Ladoga.Enter;
         try
           ST:=Ladoga[i-39].Central.laDataExh+Ladoga[i-39].Aft.laDataExh;
         finally
           cs_Ladoga.Leave;
         end;
         case ST of
           0: mArrStateDevice[i].ResultState:=2;
           1: mArrStateDevice[i].ResultState:=3;
           2: mArrStateDevice[i].ResultState:=1;
         end;
         begin
           cs_ArrDevice[i-39].Enter;
           try
             TArm(ArrDevice[i-39]).TelExh:=mArrStateDevice[i].ResultState;
           finally
             cs_ArrDevice[i-39].Leave;
           end;
         end;
       end;
     45,46: //PRLK
       begin
         if ExternalDevice.PRLK=0 then continue;
         cs_ArrDevice[i].Enter;
         try  TST:=TResistor(ArrDevice[i]).TimeSt;
              TResistor(ArrDevice[i]).TimeST:=0;
         finally cs_ArrDevice[i].Leave; end;
         if TST<>1 then mArrStateDevice[i].ResultState:=2 else mArrStateDevice[i].ResultState:=1;
         cs_ArrDevice[i].Enter;
         try  TResistor(ArrDevice[i]).DataExh:=mArrStateDevice[i].ResultState;
         finally cs_ArrDevice[i].Leave; end;
         if i=45 then
         begin
           cs_ArrDevice[1].Enter;
           try   TArm(ArrDevice[1]).RezExh:=mArrStateDevice[i].ResultState;
           finally cs_ArrDevice[1].Leave; end;
         end;
         if i=46 then
         begin
           cs_ArrDevice[2].Enter;
           try   TArm(ArrDevice[2]).RezExh:=mArrStateDevice[i].ResultState;
           finally cs_ArrDevice[2].Leave; end;
         end;
       end;
     11,21: //ЭМ-5402 - прямо не опрашиваются
       begin
         cs_ArrDevice[i].Enter;
         //1 канал
         if TEM5402(ArrDevice[i]).Use1 then
            if TEM5402(ArrDevice[i]).TQ1>0 then
              if (TEM5402(ArrDevice[i]).PQ1=0) or (TEM5402(ArrDevice[i]).PQ1/TEM5402(ArrDevice[i]).TQ1<0.5) then TEM5402(ArrDevice[i]).Ch1:=0
              else TEM5402(ArrDevice[i]).Ch1:=1
            else TEM5402(ArrDevice[i]).Ch1:=0
         else TEM5402(ArrDevice[i]).Ch1:=1; //проще критерий общей оценки
         TEM5402(ArrDevice[i]).TQ1:=0;
         TEM5402(ArrDevice[i]).PQ1:=0;
         //2 канал
         if TEM5402(ArrDevice[i]).Use2 then
            if TEM5402(ArrDevice[i]).TQ2>0 then
              if (TEM5402(ArrDevice[i]).PQ2=0) or (TEM5402(ArrDevice[i]).PQ2/TEM5402(ArrDevice[i]).TQ2<0.5) then TEM5402(ArrDevice[i]).Ch2:=0
              else TEM5402(ArrDevice[i]).Ch2:=1
            else TEM5402(ArrDevice[i]).Ch2:=0
         else TEM5402(ArrDevice[i]).Ch2:=1;
         TEM5402(ArrDevice[i]).TQ2:=0;
         TEM5402(ArrDevice[i]).PQ2:=0;
         //3 канал
         if TEM5402(ArrDevice[i]).Use3 then
            if TEM5402(ArrDevice[i]).TQ3>0 then
              if (TEM5402(ArrDevice[i]).PQ3=0) or (TEM5402(ArrDevice[i]).PQ3/TEM5402(ArrDevice[i]).TQ3<0.5) then TEM5402(ArrDevice[i]).Ch3:=0
              else TEM5402(ArrDevice[i]).Ch3:=1
            else TEM5402(ArrDevice[i]).Ch3:=0
         else TEM5402(ArrDevice[i]).Ch3:=1;
         TEM5402(ArrDevice[i]).TQ3:=0;
         TEM5402(ArrDevice[i]).PQ3:=0;
         //4 канал
         if TEM5402(ArrDevice[i]).Use4 then
            if TEM5402(ArrDevice[i]).TQ4>0 then
              if (TEM5402(ArrDevice[i]).PQ4=0) or (TEM5402(ArrDevice[i]).PQ4/TEM5402(ArrDevice[i]).TQ4<0.5) then TEM5402(ArrDevice[i]).Ch4:=0
              else TEM5402(ArrDevice[i]).Ch4:=1
            else TEM5402(ArrDevice[i]).Ch4:=0
         else TEM5402(ArrDevice[i]).Ch4:=1;
         TEM5402(ArrDevice[i]).TQ4:=0;
         TEM5402(ArrDevice[i]).PQ4:=0;
         cs_ArrDevice[i].Leave;
         //общее состояние
         if (TEM5402(ArrDevice[i]).Ch1=1) and (TEM5402(ArrDevice[i]).Ch2=1) and (TEM5402(ArrDevice[i]).Ch3=1) and (TEM5402(ArrDevice[i]).Ch4=1)
           then ResultState:=1;
         if (TEM5402(ArrDevice[i]).Ch1=2) or  (TEM5402(ArrDevice[i]).Ch2=2) or  (TEM5402(ArrDevice[i]).Ch3=2) or  (TEM5402(ArrDevice[i]).Ch4=2)
           then ResultState:=2;
         if (TEM5402(ArrDevice[i]).Ch1=0) or  (TEM5402(ArrDevice[i]).Ch2=0) or  (TEM5402(ArrDevice[i]).Ch3=0) or  (TEM5402(ArrDevice[i]).Ch4=0)
           then ResultState:=0;
            mArrStateDevice[i].ResultState:=ResultState;

         if fm5402 <> nil then if fm5402.Visible then
         PostMessage(fm5402.Handle,WM_NOTIFY_MSU,5,5);
       end;
     7..10: //КУ
       begin
         if (ArrStateDevice[i].TotalQuery<>0) then
         if (ArrStateDevice[i].PositiveQuery=0) then
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end else
         begin
           mArrStateDevice[i].ExhState:=1;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=1;
         end else
         begin
           mArrStateDevice[i].ExhState:=2;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end;
         if DataExh=0 then 
           if (fm_KU <> nil) then if (fm_KU.Visible) then
            PostMessage(Fm_KU.Handle,WM_NOTIFY_MSD,i,3);
         cs_ArrDevice[i].Enter;
         try TKU(ArrDevice[i]).DataExh:=DataExh;
         finally cs_ArrDevice[i].Leave; end;
         if DataExh<>0 then
         begin
           ResultState:=1;
           cs_ArrDevice[i].Enter;
           with   TKU(ArrDevice[i]) do
           begin
             if not TVK then ResultState:=0;
             if not SSP then ResultState:=0;
             if ResultState<>0 then
             begin
               if KUConst.fl_T1    then if (Temp<=Kuconst.Tmin1) or (Temp>=KUconst.Tmax1) then ResultState:=3;
               if KUConst.fl_T2    then if (Temp<=Kuconst.Tmin2) or (Temp>=KUconst.Tmax2) then ResultState:=3;
               if ((KUConst.fl_H1) and (Vlag>KUConst.H1)) or ((KUConst.fl_H2) and (Vlag>KUConst.H2))then ResultState:=3;
               if KUConst.fl_U1    then if (Upit<=Kuconst.Umin1) or (Upit>=KUconst.Umax1) then ResultState:=3;
               if KUConst.fl_U2    then if (Upit<=Kuconst.Umin2) or (Upit>=KUconst.Umax2) then ResultState:=3;
               if KUConst.fl_N     then if Vent<KUConst.Nmax then ResultState:=3;
             end;
           end;
           cs_ArrDevice[i].Leave;
           mArrStateDevice[i].ResultState:=ResultState;
         end else mArrStateDevice[i].ResultState:=0;
       end;
       23,24:  //5401
       begin
         if (ArrStateDevice[i].TotalQuery<>0) then
         if (ArrStateDevice[i].PositiveQuery=0) then
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end else
         begin
           mArrStateDevice[i].ExhState:=1;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=1;
         end else
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end;
         cs_ArrDevice[i].Enter;
         TEM5401(ArrDevice[i]).DataExh:=DataExh;
         if (DataExh<>0)  then DSA[i]:=TEM5401(ArrDevice[i]).IfBus
           else TEM5401(ArrDevice[i]).IfBus:=DSA[i];
         cs_ArrDevice[i].Leave;
         if DataExh=0 then
           if (fm5401 <> nil) then if (fm5401.Visible) then
            PostMessage(Fm5401.Handle,WM_NOTIFY_MSD,i,0);
         if (DataExh<>0)  then
         begin
           mArrStateDevice[i].ResultState:=1;
           if (DSA[i] and $40 = $40) then
             mArrStateDevice[i].ResultState:=0;
         end else  mArrStateDevice[i].ResultState:=0;
         cs_2404.Enter;
         case i of
         23:
           begin
             DataExh:=0;
             if TM2404State.TotalQuery1<>0 then
             begin
               if TM2404State.PositiveQuery1=0 then DataExh:=0;
               if TM2404State.PositiveQuery1<>0 then DataExh:=1;
             end;
             TM2404State.TotalQuery1:=0;
             TM2404State.PositiveQuery1:=0;
             if DataExh=1 then TM2404State.com1:=true else TM2404State.com1:=false;
           end;
         24:
           begin
             DataExh:=0;
             if TM2404State.TotalQuery2<>0 then
             begin
               if TM2404State.PositiveQuery2=0 then DataExh:=0;
               if TM2404State.PositiveQuery2<>0 then DataExh:=1;
             end;
             TM2404State.TotalQuery2:=0;
             TM2404State.PositiveQuery2:=0;
             if DataExh=1 then TM2404State.com2:=true else TM2404State.com2:=false;
           end;
         end;
         cs_2404.Leave;
       end;
       25: begin
           if (ArrStateDevice[i].TotalQuery<>0) then
           if (ArrStateDevice[i].PositiveQuery=0) then
           begin
             mArrStateDevice[i].ExhState:=0;
             mArrStateDevice[i].TotalQuery:=0;
             mArrStateDevice[i].PositiveQuery:=0;
             DataExh:=0;
           end else
           begin
             mArrStateDevice[i].ExhState:=1;
             mArrStateDevice[i].TotalQuery:=0;
             mArrStateDevice[i].PositiveQuery:=0;
             DataExh:=1;
           end else
           begin
             mArrStateDevice[i].ExhState:=0;
             mArrStateDevice[i].TotalQuery:=0;
             mArrStateDevice[i].PositiveQuery:=0;
             DataExh:=0;
           end;
           cs_ArrDevice[i].Enter;
           TEM3401(ArrDevice[i]).DataExh:=DataExh;
           if DataExh<>0 then
           begin
             ResultState:=1;
             if (TEM3401(ArrDevice[i]).CSumm1<>1) or (TEM3401(ArrDevice[i]).CSumm0<>1) then  ResultState:=3;
             if (TEM3401(ArrDevice[i]).SignY1<>1) then ResultState:=0;
           end else ResultState:=0;
           cs_ArrDevice[i].Leave;
           mArrStateDevice[i].ResultState:=ResultState;
           end;
       26..29:
       begin
         if (ArrStateDevice[i].TotalQuery<>0) then
         if (ArrStateDevice[i].PositiveQuery=0) then
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end else
         begin
           mArrStateDevice[i].ExhState:=1;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=1;
         end else
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end;
         cs_ArrDevice[i].Enter;
         TEM2437(ArrDevice[i]).DataExh:=DataExh;
         if DataExh<>0 then DSA[i]:=TEM2437(ArrDevice[i]).Mabus
           else TEM2437(ArrDevice[i]).Mabus:=DSA[i];
           ST:=TEM2437(ArrDevice[i]).MabVs;
         cs_ArrDevice[i].Leave;
         if DataExh=0 then
           if (fm2437 <> nil) then if (fm2437.Visible) then
            PostMessage(Fm2437.Handle,WM_NOTIFY_MSD,i,0);
         if DataExh<>0 then
         begin
           mArrStateDevice[i].ResultState:=1;
           if (DSA[i] and $80 = $80) then
             mArrStateDevice[i].ResultState:=0;
           case i of
             26,27:if ST and $99 = $99 then  mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
             28: if ST and $2 = $2 then mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
             29: if ST and $20 = $20 then mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
           end;
         end else
           mArrStateDevice[i].ResultState:=0;
         end;
       30..31:
       begin
         if (ArrStateDevice[i].TotalQuery<>0) then
         if (ArrStateDevice[i].PositiveQuery=0) then
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end else
         begin
           mArrStateDevice[i].ExhState:=1;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=1;
         end else
         begin
           mArrStateDevice[i].ExhState:=0;
           mArrStateDevice[i].TotalQuery:=0;
           mArrStateDevice[i].PositiveQuery:=0;
           DataExh:=0;
         end;
         cs_ArrDevice[i].Enter;
         TEM7401(ArrDevice[i]).DataExh:=DataExh;
         ST:=TEM7401(ArrDevice[i]).VMSVS;
         if DataExh<>0 then DSA[i]:=TEM7401(ArrDevice[i]).VMSUS
           else TEM7401(ArrDevice[i]).VMSUS:=DSA[i];
         cs_ArrDevice[i].Leave;
         if DataExh=0 then
           if (fm7401 <> nil) then if (fm7401.Visible) then
            PostMessage(Fm7401.Handle,WM_NOTIFY_MSD,i,0);
         if DataExh<>0 then
         begin
           mArrStateDevice[i].ResultState:=1;
         //  if (DSA[i] and $80 = $80) then
        //     mArrStateDevice[i].ResultState:=0;
           if (ST and $40 <> $40) or (ST and $10 <> $10) or (ST and $04 <> $04) or (ST and $01 <> $01) then
             mArrStateDevice[i].ResultState:=0;
         end else
           mArrStateDevice[i].ResultState:=0;
         end;
       32:
         if (mArrStateDevice[23].ExhState<>0) or (mArrStateDevice[24].ExhState<>0) then
         begin
           if (DSA[23] and $08 = $08) and (DSA[24] and $08 = $08) then
             mArrStateDevice[i].ResultState:=0
           else
           if (DSA[23] and $08 = $08) or (DSA[24] and $08 = $08) then
             mArrStateDevice[i].ResultState:=3
           else
             mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
       33:
         if (mArrStateDevice[23].ExhState<>0) or (mArrStateDevice[24].ExhState<>0) then
         begin
           if (DSA[23] and $04 = $04) and (DSA[24] and $04 = $04) then
             mArrStateDevice[i].ResultState:=0
           else
           if (DSA[23] and $04 = $04) or (DSA[24] and $04 = $04) then
             mArrStateDevice[i].ResultState:=3
           else
             mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
       34:
         if mArrStateDevice[26].ExhState<>0 then
         begin
           if (DSA[26] and $08 = $08) then mArrStateDevice[i].ResultState:=0 else
           if (DSA[26] and $04 = $04) then mArrStateDevice[i].ResultState:=3 else
           mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
       35:
         if mArrStateDevice[26].ExhState<>0 then
         begin
           if (DSA[26] and $02 = $02) then mArrStateDevice[i].ResultState:=0 else
           if (DSA[26] and $01 = $01) then mArrStateDevice[i].ResultState:=3 else
           mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
       36:
         if mArrStateDevice[27].ExhState<>0 then
         begin
           if (DSA[27] and $08 = $08) then mArrStateDevice[i].ResultState:=0 else
           if (DSA[27] and $04 = $04) then mArrStateDevice[i].ResultState:=3 else
           mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
       37:
         if mArrStateDevice[27].ExhState<>0 then
         begin
           if (DSA[27] and $02 = $02) then mArrStateDevice[i].ResultState:=0 else
           if (DSA[27] and $01 = $01) then mArrStateDevice[i].ResultState:=3 else
           mArrStateDevice[i].ResultState:=1;
         end else mArrStateDevice[i].ResultState:=0;
     end;
    for i:=1 to DevCount do
     case i  of
     12: //2409
       begin
         FillChar(CG,sizeOf(CG),0);
         CG[5]:=mArrStateDevice[11].ResultState;
         CG[6]:=mArrStateDevice[25].ExhState;
         cs_2404.Enter;
         try if TM2404State.Com1 then CG[4]:=1 else CG[4]:=0;
         finally cs_2404.Leave; end;
         if ExternalDevice.OLS=0  then CG[7]:=5
         else CG[7]:=TLuna(ArrDevice[38]).DataExh;
         if ExternalDevice.PRLK=0 then CG[8]:=5
         else CG[8]:=TResistor(ArrDevice[45]).DataExh;
         for j in [1..3] do
           CG[j]:=5;
         cs_ArrDevice[i].Enter;
           DataExh:=TEM2409(ArrDevice[i]).DataExh;
           TEM2409(ArrDevice[i]).Channel:=CG;
         cs_ArrDevice[i].Leave;
         mArrStateDevice[i].ResultState:=0;
         if DataExh=1 then
         begin
           if (CG[5]=1) and (CG[6]=1) and (CG[4]=1) then
              mArrStateDevice[i].ResultState:=1
              else
              mArrStateDevice[i].ResultState:=3
         end;
         if fm2409 <> nil then if fm2409.Visible then
         PostMessage(fm2409.Handle,WM_NOTIFY_MSU,i,5);
       end;
       13: //2409
       begin
         FillChar(CG,sizeOf(CG),0);
         CG[5]:=mArrStateDevice[21].ResultState;
         cs_2404.Enter;
         try if TM2404State.Com2 then CG[4]:=1 else CG[4]:=0;
         finally cs_2404.Leave; end;
         if ExternalDevice.OLS=0  then CG[7]:=5
         else CG[7]:=TLuna(ArrDevice[39]).DataExh;
         if ExternalDevice.PRLK=0 then CG[8]:=5
         else CG[8]:=TResistor(ArrDevice[46]).DataExh;
         for j in [1..3,6] do
           CG[j]:=5;
         cs_ArrDevice[i].Enter;
           if TEM2409(ArrDevice[i]).DataExh<>0 then mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
           DataExh:=TEM2409(ArrDevice[i]).DataExh;
           TEM2409(ArrDevice[i]).Channel:=CG;
         cs_ArrDevice[i].Leave;
         if DataExh=1 then
         begin
           if (CG[5]=1) and (CG[4]=1) then
              mArrStateDevice[i].ResultState:=1
              else
              mArrStateDevice[i].ResultState:=3
         end;
         if fm2409 <> nil then if fm2409.Visible then
         PostMessage(fm2409.Handle,WM_NOTIFY_MSU,i,5);
       end;
       14: //2410
       begin
         FillChar(CH,SizeOf(CH),0);
         cs_ArrDevice[1].Enter;
         try  if (TARM(ArrDevice[1]).DataExh<>0) and
                 (TARM(ArrDevice[1]).LAN[1].State) then ResultState:=1 else  ResultState:=0;
         finally cs_ArrDevice[1].Leave;  end;
         CH[1]:=ResultState;

         cs_ArrDevice[2].Enter;
         try  if (TARM(ArrDevice[2]).DataExh<>0) and
                 (TARM(ArrDevice[2]).LAN[1].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[2].Leave; end;
         CH[3]:=ResultState;

         cs_ArrDevice[3].Enter;
         try  if (TARM(ArrDevice[3]).DataExh<>0) and
                 (TARM(ArrDevice[3]).LAN[1].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[3].Leave; end;
         CH[5]:=ResultState;

         cs_ArrDevice[16].Enter;
         try  if (TARM(ArrDevice[16]).DataExh<>0) and
                 (TARM(ArrDevice[16]).LAN[1].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[16].Leave;end;
         CH[7]:=ResultState;

         cs_ArrDevice[12].Enter;
         try   if TEM2409(ArrDevice[12]).DataExh<>0 then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[12].Leave; end;
         CH[8]:=ResultState;

         cs_ArrDevice[17].Enter;
         try  if TUPS(ArrDevice[17]).DataExh<>0 then  ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[17].Leave; end;
         CH[4]:=ResultState;

         cs_ArrDevice[19].Enter;
         try  if TUPS(ArrDevice[19]).DataExh<>0 then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[19].Leave;  end;
         CH[6]:=ResultState;

         CH[9]:=mArrStateDevice[20].ExhState;

         for j in [2,10..16] do
         CH[j]:=5;
         DataExh:=0;
         for j in [1,3..9] do
           DataExh:=DataExh+CH[j];
         if DataExh<>0 then mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
         cs_ArrDevice[i].Enter;
         try  TEM2410(ArrDevice[i]).Channel:=CH;
              TEM2410(ArrDevice[i]).DataExh:=mArrStateDevice[i].ResultState;
         finally cs_ArrDevice[i].Leave; end;
         if fm2410 <> nil then if fm2410.Visible then
         PostMessage(fm2410.Handle,WM_NOTIFY_MSU,i,5);
       end;
       15: //2410
       begin
         FillChar(CH,SizeOf(CH),0);
         cs_ArrDevice[1].Enter;
         try  if (TARM(ArrDevice[1]).DataExh<>0) and
              (TARM(ArrDevice[1]).LAN[2].State) then ResultState:=1 else  ResultState:=0;
         finally cs_ArrDevice[1].Leave;  end;
         CH[1]:=ResultState;

         cs_ArrDevice[2].Enter;
         try  if (TARM(ArrDevice[2]).DataExh<>0) and
              (TARM(ArrDevice[2]).LAN[2].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[2].Leave; end;
         CH[3]:=ResultState;

         cs_ArrDevice[3].Enter;
         try  if (TARM(ArrDevice[3]).DataExh<>0) and
              (TARM(ArrDevice[3]).LAN[2].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[3].Leave; end;
         CH[5]:=ResultState;

         cs_ArrDevice[16].Enter;
         try  if (TARM(ArrDevice[16]).DataExh<>0) and
              (TARM(ArrDevice[16]).LAN[2].State) then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[16].Leave;  end;
         CH[7]:=ResultState;

         cs_ArrDevice[13].Enter;
         try  if TEM2409(ArrDevice[13]).DataExh<>0 then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[13].Leave; end;
         CH[8]:=ResultState;

         cs_ArrDevice[18].Enter;
         try  if TUPS(ArrDevice[18]).DataExh<>0 then ResultState:=1 else ResultState:=0;
         finally cs_ArrDevice[18].Leave; end;
         CH[4]:=ResultState;

         for j in [2,6,9..16] do
         CH[j]:=5;
         DataExh:=0;
         for j in [1,3..5,7,8] do
           DataExh:=DataExh+CH[j];
         if DataExh<>0 then mArrStateDevice[i].ResultState:=1 else mArrStateDevice[i].ResultState:=0;
         cs_ArrDevice[i].Enter;
         try  TEM2410(ArrDevice[i]).Channel:=CH;
              TEM2410(ArrDevice[i]).DataExh:=mArrStateDevice[i].ResultState;
         finally cs_ArrDevice[i].Leave; end;
         if fm2410 <> nil then if fm2410.Visible then
         PostMessage(fm2410.Handle,WM_NOTIFY_MSU,i,5);
       end;
     end;
     //состояние 2404
     begin
       ResultState:=1;
       if mArrStateDevice[11].ResultState=3 then ResultState:=3;
       if mArrStateDevice[21].ResultState=3 then ResultState:=3;
       if mArrStateDevice[25].ResultState=3 then ResultState:=3;
       if mArrStateDevice[26].ResultState=3 then ResultState:=3;
       if mArrStateDevice[27].ResultState=3 then ResultState:=3;
       if mArrStateDevice[28].ResultState=3 then ResultState:=3;
       if mArrStateDevice[29].ResultState=3 then ResultState:=3;
       if mArrStateDevice[30].ResultState=3 then ResultState:=3;
       if mArrStateDevice[31].ResultState=3 then ResultState:=3;
       if mArrStateDevice[32].ResultState=3 then ResultState:=3;
       if mArrStateDevice[33].ResultState=3 then ResultState:=3;
       if mArrStateDevice[34].ResultState=3 then ResultState:=3;
       if mArrStateDevice[35].ResultState=3 then ResultState:=3;
       if mArrStateDevice[36].ResultState=3 then ResultState:=3;
       if mArrStateDevice[37].ResultState=3 then ResultState:=3;
       if (mArrStateDevice[32].ResultState=0)  and (mArrStateDevice[33].ResultState<>0) or
          (mArrStateDevice[32].ResultState<>0) and (mArrStateDevice[33].ResultState=0)  then ResultState:=3;

       if mArrStateDevice[11].ResultState=0 then ResultState:=0;
       if mArrStateDevice[21].ResultState=0 then ResultState:=0;
       if mArrStateDevice[25].ResultState=0 then ResultState:=0;
       if mArrStateDevice[26].ResultState=0 then ResultState:=0;
       if mArrStateDevice[27].ResultState=0 then ResultState:=0;
       if mArrStateDevice[28].ResultState=0 then ResultState:=0;
       if mArrStateDevice[29].ResultState=0 then ResultState:=0;
       if mArrStateDevice[30].ResultState=0 then ResultState:=0;
       if mArrStateDevice[31].ResultState=0 then ResultState:=0;
       if (mArrStateDevice[32].ResultState=0)  and (mArrStateDevice[33].ResultState=0) then  ResultState:=0;
       if mArrStateDevice[34].ResultState=0 then ResultState:=0;
       if mArrStateDevice[35].ResultState=0 then ResultState:=0;
       if mArrStateDevice[36].ResultState=0 then ResultState:=0;
       if mArrStateDevice[37].ResultState=0 then ResultState:=0;

       TM2404i:=ResultState;
     end;
     //состояние общее
     begin
       ResultState:=1;
       if mArrStateDevice[1].ResultState=3  then ResultState:=3;
       if mArrStateDevice[2].ResultState=3  then ResultState:=3;
       if mArrStateDevice[3].ResultState=3  then ResultState:=3;
       if mArrStateDevice[7].ResultState=3  then ResultState:=3;
       if mArrStateDevice[8].ResultState=3  then ResultState:=3;
       if mArrStateDevice[9].ResultState=3  then ResultState:=3;
       if mArrStateDevice[10].ResultState=3 then ResultState:=3;
       if mArrStateDevice[12].ResultState=3 then ResultState:=3;
       if mArrStateDevice[13].ResultState=3 then ResultState:=3;
       if mArrStateDevice[14].ResultState=3 then ResultState:=3;
       if mArrStateDevice[15].ResultState=3 then ResultState:=3;
       if mArrStateDevice[16].ResultState=3 then ResultState:=3;
       if mArrStateDevice[17].ResultState=3 then ResultState:=3;
       if mArrStateDevice[18].ResultState=3 then ResultState:=3;
       if mArrStateDevice[19].ResultState=3 then ResultState:=3;
       if mArrStateDevice[20].ResultState=3 then ResultState:=3;
       if TM2404i=3 then ResultState:=3;
       if mArrStateDevice[1].ResultState=0  then ResultState:=0;
       if mArrStateDevice[2].ResultState=0  then ResultState:=0;
       if mArrStateDevice[3].ResultState=0  then ResultState:=0;
       if mArrStateDevice[7].ResultState=0  then ResultState:=0;
       if mArrStateDevice[8].ResultState=0  then ResultState:=0;
       if mArrStateDevice[9].ResultState=0  then ResultState:=0;
       if mArrStateDevice[10].ResultState=0 then ResultState:=0;
       if mArrStateDevice[12].ResultState=0 then ResultState:=0;
       if mArrStateDevice[13].ResultState=0 then ResultState:=0;
       if mArrStateDevice[14].ResultState=0 then ResultState:=0;
       if mArrStateDevice[15].ResultState=0 then ResultState:=0;
       if mArrStateDevice[16].ResultState=0 then ResultState:=0;
       if mArrStateDevice[17].ResultState=0 then ResultState:=0;
       if mArrStateDevice[18].ResultState=0 then ResultState:=0;
       if mArrStateDevice[19].ResultState=0 then ResultState:=0;
       if mArrStateDevice[20].ResultState=0 then ResultState:=0;
       if TM2404i=0 then ResultState:=0;
       MTK201i:=ResultState;
     end;
     cs_ArrStateDevice.Enter;
     for i:=1 to DevCount do ArrStateDevice[i]:=mArrStateDevice[i];
     cs_ArrStateDevice.Leave;
     time_QuestionOfDevice:=now;
     //сообщение главной форме о внесении изменений
     if NMain <> nil then if NMain.Visible then
      PostMessage(NMain.Handle,WM_NOTIFY_MSU,5,5);
end;

end.
