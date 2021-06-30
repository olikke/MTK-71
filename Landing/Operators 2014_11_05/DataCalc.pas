unit DataCalc;

interface

uses
  Windows,Classes,Global,SysUtils,Math,SyncObjs,ComPOrtR;

type
  TTvKoor=record
  X,Y:double;
end;

type
  TDataCalc = class(TThread)
  private
    _AlphaST:Single;    //угол стабилизации качки луной
    PCCount:byte;      //время мигания признкак компенсации качки PC
    //элементы внешнего ориентирования камер
    Matrix   : array [7..10,1..3,1..3] of double;
    //массив координат точки сопровождения в изображениях всех камер
    TvKoor     : array [7..10] of TTvKoor;
    mNPrlk   : Word;      //Номер канала ПРЛК
    mAccomp  : Byte;      //Признак сопровождения ЛА
    mNomLA   : Word;      //№ ЛА
    mDistanse: Single;    //Дальность до ЛА
    mCorse   : Single;    //Угол курса ЛА
    mAltitude: Single;    //Угол места ЛА
    mSpeedLA : Single;    //Скорость ЛА
    mSpeedVr : Single;    //Вертикальная скорость ЛА
    mGlissad : Single;    //Глиссада от резистора
    mAlpha   : double;    //Текущий установленный угол глиссады
    mAlgNum  : word;      //Текущяя точка сопровождения
    mSys     : byte;      //текущая конфигурация сопровождения
    mAir     : byte;      //текущий тип ЛА
    mNum     : integer;   //текущий номер ЛА
    mTrack   : byte;      //текущее определение координат по ТВ или ПРЛК
    Xsm,Ysm,Zsm : Single; //смещения в координатной сетке ЛА
    XE,YE,ZE:single;      //смещения глаза в координатной сетке ЛА 
    _lu  :boolean;        //признак наличия в системе луны
    _re  :boolean;        //признак наличия в системе резистора
    _te  :boolean;        //признак наличия в системе телеметрического комплекса
    E_lu :boolean;        //признак наличия обмена данными с луной
    E_re :boolean;        //признак наличия обмена данными с резистором
    E_la :boolean;        //признак наличия обмена данными с телемтрическим комплексом
    XL,YL,XR,YR:double;
    X1,Y1,Z1   :double;
    X2,Y2,Z2   :double;
    X,Y,Z      :double;
    kRS        :byte;     //номер ПРЛК
    kKU        :byte;     //номер выбранной осевой камеры
    kPr        :byte;     //номер алгоритма по Резистору
    Dtstr,Hvr,Hgr    :single;  //расстояние до ЛА и отклонения только по резистору   (не используем)
    Dstc,Hvc,Hgc     :single;  //дальность по резистору положение по центральной камере
    Dsttv,Hvtv,Hgtv  :single;  //дальность по ТВ системе
    Hv,Hg,DTP        :single;  //конечные координаты
    GZ               :integer; //высота середины зелёной зоны в пикселях
    HZ               :integer; //половина высоты цветной зоны
    DZ               :integer; //высота луча
    H_GZ,H_Zone,D_Zone:double;
    A_GZ,A_HZ,A_DZ    :double;
    ind               :integer;//в дневное время привязка цветовых линий к глазу, в ночное - к фаре.

    m12,m18:double;       // углы 12,5' и 18' в радианах
    Port3401 : TComPortR;
    //koff1:double;
    //koff2:double;
    Moment_Psi    : Single;    //Угол килевой качки центр
    Moment_Teta   : Single;    //Угол бортовой качки центр
    LCourse : Single;    //Курс
    Vlaga   : Single;    //Скорость от лага
    //смещения от Ладоги в корабельной системе координат
    Moment_X : double;
    Moment_Y : double;
    Moment_Z : double;
    //рассчитанное статическое смещение (в корабельной системе координат)
    Static_X:single;
    Static_Y:single;
    Static_Z:single;
    Static_Psi:Single;          //статический дифферент
    Static_Teta:Single;         //статический крен
    LAD_NO_DATA:boolean;
    procedure FLTimeCallBack;
    procedure LadogaAnaliz;
  protected
    procedure Execute; override;
  public
    var GlobalCount:int64;
    procedure ReadPacket(const p:Pointer;const Count:Integer;
                         const ErrCode:Cardinal;const NComPort:Word);
  end;

  var    vt:double; //угол видимости 1 пикселя осевой камеры по вертикали
implementation

uses Main,face3401,UnitDM;

procedure TDataCalc.LadogaAnaliz;
var
    mMiniLadoga:TMiniLadoga;
    mMediumLadoga:TMedLadoga;
    BackCounter:integer;
    Counter:integer;
begin
  //петля на микшере даёт отставание видео минимум на кадр
  //следовательно и для Ладоги введём задержку в кадр
  BackCounter:=3;
  //текущее положение данных в массиве
  Counter:=CounterMiniLadoga;
  //положение данных с учётом задержки
  if Counter>=BackCounter+1 then Counter:=Counter-BackCounter
                            else Counter:=Counter-BackCounter+10;
  //обнулимся
  begin
    Moment_Psi  :=0;
    Moment_Teta :=0;
    LCourse     :=0;
    Vlaga       :=0;
    Moment_X    :=0;
    Moment_Y    :=0;
    Moment_Z    :=0;
    E_la        :=false;
  end;
  LAD_NO_DATA :=LADOGA_NO_DATA;
  if LADOGA_NO_DATA then exit;
  cs_MiniLadoga.Enter;
  try
    mMiniLadoga:=MiniLadoga;
  finally
    cs_MiniLadoga.Leave;
  end;
  if (mMiniLadoga[Counter].miniDE=1) and
     ((mMiniLadoga[Counter].miniCC and $C0) shr 6 = 0) then
  begin
    //мгновенные значения с задержкой BackCounter
    Moment_Psi  :=mMiniLadoga[Counter].miniPsi;
    Moment_Teta :=mMiniLadoga[Counter].miniTeta;
    LCourse     :=mMiniLadoga[Counter].miniK;
    Vlaga       :=mMiniLadoga[Counter].miniVl;
    Moment_X    :=mMiniLadoga[Counter].miniSn;
    Moment_Y    :=mMiniLadoga[Counter].miniSe;
    Moment_Z    :=mMiniLadoga[Counter].miniSz;
            E_la:=true;
  end;
  cs_MedLadoga.Enter;
  try
    mMediumLadoga:=MediumLadoga;
  finally
    cs_MedLadoga.Leave;
  end;
  //средние значения
  MediumValidity:=mMEdiumLadoga.Validity;
  Static_Psi  :=mMediumLadoga.Psi;
  Static_Teta :=mMediumLadoga.Teta;
  Static_X    :=mMediumLadoga.Sx;
  Static_Y    :=mMediumLadoga.Sy;
  Static_Z    :=mMediumLadoga.Sz;
  LAD_NO_DATA :=LADOGA_NO_DATA;
end;

procedure TDataCalc.FLTimeCallBack;
var
    i:integer;
    flag:boolean;
    Z1X2X1Z2:double;
    NB,ZB,YB,XB,Z,Y,X : Double;
    ErrorST:single;
    Bet    :single;
    First,Second:byte;
    Prt:TProtocolLine;
    Fx,Fy:double;
begin
  LadogaAnaliz;
  //отбор данных от внешних источников для обработки
  if _re then
  begin
    i:=0;
    case RESCh of
        1: if (RESCh=1) and (TResistor(ArrDevice[45]).DataExh<>0) and(TResistor(ArrDevice[45]).Accomp=1) then  i:=45;
        2: if (RESCh=2) and (TResistor(ArrDevice[46]).DataExh<>0) and(TResistor(ArrDevice[46]).Accomp=1) then  i:=46;
    end;
    if i<>0 then
    begin
      E_re:=true;
      case i of
      45:  kRs:=2;
      46:  kRs:=3;
      end;
      cs_ArrDevice[i].Enter;
      with TResistor(ArrDevice[i]) do
      begin
        mNPrlk:=RESCh;
        mAccomp:=Accomp;
        mNomLa:=NomLa;
       // if not SI then mDistanse:=Distanse*koff2
                 { else} mDistanse:=Distanse;
        mCorse:=Corse;
        mAltitude:=Altitude;
        mSpeedLa:=SpeedLA;
        mSpeedVr:=SpeedVr;
        mGlissad:=Glissad;
        mNum:=NomLa;
      end;
      cs_ArrDevice[i].Leave;
    end else
      E_re:=false;
  end else E_re:=false;
  ErrorST:=0;
  Bet    :=0;
  if _lu then
    if TLuna(ArrDevice[38]).DataExh=1 then
    begin
      ErrorST:=TLuna(ArrDevice[38]).AlphaGL+TLuna(ArrDevice[38]).ErrorST;
      Bet    :=TLuna(ArrDevice[38]).Betta;
    end else
    if TLuna(ArrDevice[39]).DataExh=1 then
    begin
      ErrorST:=TLuna(ArrDevice[39]).AlphaGL+TLuna(ArrDevice[39]).ErrorST;
      Bet    :=TLuna(ArrDevice[39]).Betta;
    end;
  kPr  :=2;
  Dstc :=0;
  Hvc  :=0;
  Hgc  :=0;
  if fl_protocol then
  if E_re then
  if (mSys<>2) and (TvKoor[kKu].X<>0) and (TvKoor[kKu].Y<>0) then
  begin
      //Дальность от резистора, положение от камеры
      Dstc:=0;Hvc:=0;Hgc:=0;
      //переход в декартову систему координат
      X:=mDistanse*Cos(mAltitude/gRad)*Cos((180-mCorse)/grad);
      Y:=mDistanse*Cos(mAltitude/gRad)*Sin((mCorse)/grad);
      Z:=mDistanse*Sin(mAltitude/gRad);
      //Разворот по углу наклона линии посадки
      POVOROT(Azl,0,0,x,y,z);
      //Перенос в точку установки выбранной камеры
      PERENOS(Koor[kRs].X-Koor[kKU].X,Koor[kRs].Y-Koor[kKU].Y,Koor[kRs].Z-Koor[kKU].Z,X,Y,Z);
      //Разворот по оси визирования камеры
      POVOROT(0,Koor[kKU].Um,0,x,y,z);
      //учёт изображения с центральной камеры
      Y:=(X/Koor[kKU].Focus)*(Koor[kKU].X0-TvKoor[kKu].X)*Koor[kKU].RxKx;
      Z:=(X/Koor[kKU].Focus)*(Koor[kKU].Y0-TvKoor[kKu].Y)*Koor[kKU].RyKy;
      //возвращаемся в корабельную систему координат
      POVOROT(0,-Koor[kKU].Um,0,x,y,z);
      //Перенос в точку установки центрального поста гиромодуля
      PERENOS(Koor[kKU].X-Koor[11].X,Koor[kKU].Y-Koor[11].Y,Koor[kKU].Z-Koor[11].Z,X,Y,Z);
      if E_la then
      begin
        //Поворот по азимуту
        POVOROT(-Azl,0,0,x,y,z);
        if flag_PC then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi-Static_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta-Static_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(Static_X-Moment_X,Static_Y-Moment_Y,Static_Z-Moment_Z,X,Y,Z);
        end;
        if flag_PR then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(-Moment_X,-Moment_Y,-Moment_Z,X,Y,Z);
        end;
        //Поворот по азимуту
        POVOROT(Azl,0,0,x,y,z);
      end;
      //Перенос в РТП
      PERENOS(Koor[11].X-Koor[4].X,Koor[11].Y-Koor[4].Y,Koor[11].Z-Koor[4].Z,X,Y,Z);
      //Поворот по углу места
      POVOROT(0,mAlpha,0,x,y,z);
      if flag_XYZ then
      //Учёт смещений в системе координат ЛА
      PERENOS(-Xsm,-Ysm,-Zsm,X,Y,Z);
      //Конечный результат
      Dstc  := SQRT(SQR(X)+SQR(Y)+SQR(Z));
      Hvc   := z;
      Hgc   := y;
      kPr   :=0;
  end else
  begin
      //Все данные от резистора
      Dtstr:=0;Hvr:=0;Hgr:=0;
      //переход в декартову систему координат
      X:=mDistanse*Cos(mAltitude/gRad)*Cos((180-mCorse)/grad);
      Y:=mDistanse*Cos(mAltitude/gRad)*Sin((mCorse)/grad);
      Z:=mDistanse*Sin(mAltitude/gRad);
      //Поворот по азимуту
      POVOROT(Azl,0,0,x,y,z);
     //Перенос в точку установки центрального поста гиромодуля
      PERENOS(Koor[kRs].X-Koor[11].X,Koor[kRs].Y-Koor[11].Y,Koor[kRs].Z-Koor[11].Z,X,Y,Z);
      if E_la then
      begin
        //Поворот по азимуту
        POVOROT(-Azl,0,0,x,y,z);
        if flag_PC then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi-Static_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta-Static_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(Static_X-Moment_X,Static_Y-Moment_Y,Static_Z-Moment_Z,X,Y,Z);
        end;
        if flag_PR then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(-Moment_X,-Moment_Y,-Moment_Z,X,Y,Z);
        end;
        //Поворот по азимуту
        POVOROT(Azl,0,0,x,y,z);
      end;
      //Перенос в РТП
      PERENOS(Koor[11].X-Koor[4].X,Koor[11].Y-Koor[4].Y,Koor[11].Z-Koor[4].Z,X,Y,Z);
      //Последовательность поворотов солюдать! Для обратного перехода - последовательность обратная
      //Поворот по углу места
      POVOROT(0,mAlpha,0,x,y,z);
      if flag_XYZ then
      //Учёт смещений в системе координат ЛА
      PERENOS(-Xsm,-Ysm,-Zsm,X,Y,Z);
      //конечный результат
      Dtstr := SQRT(SQR(X)+SQR(Y)+SQR(Z));
      Hvr   := z;
      Hgr   := y;
      kPr   :=1;
  end;

    Dsttv := 0;
    Hvtv  := 0;
    Hgtv  := 0;
    flag:=false;
    //Дальность по ТВ камерам
    case SysConfig of
    0,2: begin
           flag:=true;
           First:=9;
           Second:=7;
         end;
    1:   begin
           flag:=true;
           First:=9;
           Second:=Axial;
         end;
    3:   begin
           flag:=true;
           First:=Axial;
           Second:=7;
         end;
    end;
    //olikke
    //расчет по осевой и боковой камемре смотри в НТ!!!
    if fl_protocol then
    if flag then
    begin
      //  расчёт точки сопровождения по первой камере
      XL := koor[First].RxKx*(TvKoor[First].X-Koor[First].X0);
      YL := koor[First].RyKy*(Koor[First].Y0-TvKoor[First].Y);
      X1 := Matrix[First,1,1]*XL+Matrix[First,1,2]*YL-Matrix[First,1,3]*Koor[First].focus;
      Y1 := Matrix[First,2,1]*XL+Matrix[First,2,2]*YL-Matrix[First,2,3]*Koor[First].focus;
      Z1 := Matrix[First,3,1]*XL+Matrix[First,3,2]*YL-Matrix[First,3,3]*Koor[First].focus;
      //  расчёт точки сопровождения по второй камере
      XR := koor[Second].RxKx*(TvKoor[Second].X-Koor[Second].X0);
      YR := koor[Second].RyKy*(Koor[Second].Y0-TvKoor[Second].Y);
      X2 := Matrix[Second,1,1]*XR+Matrix[Second,1,2]*YR-Matrix[Second,1,3]*Koor[Second].focus;
      Y2 := Matrix[Second,2,1]*XR+Matrix[Second,2,2]*YR-Matrix[Second,2,3]*Koor[Second].focus;
      Z2 := Matrix[Second,3,1]*XR+Matrix[Second,3,2]*YR-Matrix[Second,3,3]*Koor[Second].focus;
      Z1X2X1Z2:=Z1*X2-X1*Z2;
      if Z1X2X1Z2<>0 then NB:=(X2*base*sin(Alfa_Base/grad)-Z2*base*(cos(Alfa_Base/grad)))/Z1X2X1Z2 else NB:=0;
      ZB:=NB*Z1;
      YB:=NB*Y1;
      XB:=NB*X1;
      //Координаты по ТВ системе
      Z:=-YB;
      Y:=XB;
      X:=ZB;
      //Поворот по углу места
      POVOROT(0,-Koor[First].Um,0,x,y,z);
      //Перенос в точку установки центрального поста гиромодуля
      PERENOS(Koor[First].X-Koor[11].X,Koor[First].Y-Koor[11].Y,Koor[First].Z-Koor[11].Z,X,Y,Z);
      if E_la then
      begin
        //Поворот по азимуту
        POVOROT(-Azl,0,0,x,y,z);
        if flag_PC then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi-Static_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta-Static_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(Static_X-Moment_X,Static_Y-Moment_Y,Static_Z-Moment_Z,X,Y,Z);
        end;
        if flag_PR then
        begin
          //Учет  килевой качки
          POVOROT(0,Moment_Psi,0,x,y,z);
          //Учёт бортовой качки
          POVOROT(0,0,-(Moment_Teta),x,y,z);
          //учёт смещений
          if flag_XYZ then
          PERENOS(-Moment_X,-Moment_Y,-Moment_Z,X,Y,Z);
        end;
        //Поворот по азимуту
        POVOROT(Azl,0,0,x,y,z);
      end;
      //Перенос в РТП
      PERENOS(Koor[11].X-Koor[4].X,Koor[11].Y-Koor[4].Y,Koor[11].Z-Koor[4].Z,X,Y,Z);
      //Поворот по углу места
      POVOROT(0,mAlpha,0,x,y,z);
      if flag_XYZ then
      //Учёт смещений в системе координат ЛА
      PERENOS(-Xsm,-Ysm,-Zsm,X,Y,Z);
      //Конечный результат
      Dsttv := SQRT(SQR(X)+SQR(Y)+SQR(Z));
      Hvtv  := Z;
      Hgtv  := Y;
    end;

  Hv  :=0;
  Hg  :=0;
  DTP :=0;
  if fl_protocol then
  case mTrack of
  0: begin Hv:=Hvtv; Hg:=Hgtv; DTP :=Dsttv; end;     //определение дальности по стереопаре
  1: case kPr of
     0:  begin Hv:=Hvc;  Hg:=Hgc;  DTP :=Dstc;  end; //определение дальности по резистору положение от центральной камеры
     1:  begin Hv:=Hvr;  Hg:=Hgr;  DTP :=Dtstr; end; //определение дальности только по резистору
     end;
  end;

  //расчёт угла БУО в режиме стабилизации глиссады  Луной или ПРЛК
  _AlphaST:=mAlpha;
    if E_la then
  begin
    if flag_PC then  _AlphaST:=mAlpha+(Moment_Psi*cos(-Azl/grad)+Moment_Teta*sin(-Azl/grad))-(Static_Psi*cos(-Azl/grad)+Static_Teta*sin(-Azl/grad));
    if flag_PR then  _AlphaST:=mAlpha+(Moment_Psi*cos(-Azl/grad)+Moment_Teta*sin(-Azl/grad));
  end;

  GZ:=0;  HZ:=0;  DZ:=0;
  //расчёт цветовых зон для ОСП
  if (DTP<>0)  then
  begin
    X:=(SQR(DTP)-SQR(Hg)-SQR(Hv));
    if X>=0 then X:=SQRT(X) else X:=0;
    Y:=Hg;
    Z:=Hv;
    //Учёт смещений в системе координат ЛА
    PERENOS(XE,YE,ZE,X,Y,Z);
    //Поворот по углу места
    POVOROT(0,-mAlpha,0,x,y,z);
    X1:=X;
    Y1:=Y;
    Z1:=Z;
    //в ночное время зоны рисуются по глиссаде фары.
    if flag_night then  ind:=6 else ind:=5;
    BettaCorrection:=Koor[ind].Y*tan(aBetta/grad);
    //Перенос в ОСП
    PERENOS(-Koor[ind].X,-Koor[ind].Y,-Koor[ind].Z-BettaCorrection,X,Y,Z);
    //Высота середины зелёной зоны относительно палубы:
    H_GZ:=X*sin(_AlphaST/grad)+Koor[ind].Z+BettaCorrection;
    //Половина высоты зоны
    H_Zone:=X*tan(m12);
    //Высота второго луча
    D_Zone:=X*tan(m18)+0.3;
    //Перенос к выбранной осевой камере
    PERENOS(-Koor[kKU].X,-Koor[kKU].Y,-Koor[kKU].Z,X1,Y1,Z1);
    //углы видности цветовых зон относительно КУ
    if X1<>0 then
    begin
      //угол видности центра зелёной зоны
      A_GZ:=arctan(H_GZ/X1)*grad;
      //угол видности половины ширины зелёной зоны
      A_HZ:=arctan(H_Zone/X1)*grad;
      //угол видности угла расхождения зон
      A_DZ:=arctan(D_Zone/X1)*grad;
    end else
    begin
      A_GZ    :=0;
      A_HZ    :=0;
      A_DZ    :=0;
    end;
    //положение границ цветовых зон в кадре осевой КУ
    GZ        :=Round(Koor[kKU].Y0+(Koor[kKU].Um-A_GZ)/vt);
    HZ        :=Round(A_HZ/vt);
    DZ        :=Round(A_DZ/vt);

    //положение маркера сопровождения для осевой камеры
    X:=(SQR(DTP)-SQR(Hg)-SQR(Hv));
    if X>=0 then X:=SQRT(X) else X:=0;
    Y:=Hg;
    Z:=Hv;
    //Поворот по углу места
    POVOROT(0,-mAlpha,0,x,y,z);
    //Перенос к осевой камере
    PERENOS(-Koor[kKU].X,-Koor[kKU].Y,-Koor[kKU].Z,X,Y,Z);
    //получили наклонную дальность до КУ
    X:=SQRT(SQR(X)+SQR(Y)+SQR(Z));
    //расстояние характерная точка-гак
    Y:=Zsm;
    //Угловой размер гак-характерная точка
    Z:=arcsin(Y/X)*grad;
    //соответственно положение
    Z:=z/vt;
    //координаты маркера
    ShipData.fy:=Round(TvKoor[kKu].Y+Z);
    Y:=Ysm;
    Z:=arcsin(Y/X)*grad;
    z:=z/vt;
    ShipData.fx:=Round(TvKoor[kKu].X+Z);
  end else
  begin
    GZ:=Round((4-_AlphaST)/vt+288);
    //при неизвестной дальности нарисуем цветовые сектора для бесконечности,
    //т.е. при совпадении с луной
    HZ:=14;
    DZ:=21;
  end;

   //формирование данных для протокола
  if fl_Protocol then
  begin
    prt.pN:=CountProtocol;
    if E_re then
    begin
      prt.pDrl:=mDistanse;
      case kPr of
     0://ПРЛК и камера
       begin
         prt.pDnrl:=Dstc;
         prt.pLRrl:=Hgc;
         prt.pUDtv:=Hvc;
       end;
     1://только ПРЛК
       begin
         prt.pDnrl:=Dtstr;
         prt.pLRrl:=Hgr;
         prt.pUDtv:=Hvr;
       end;
      end;
    end else
    begin
      prt.pDrl:=0;
      prt.pDnrl:=0;
      prt.pLRrl:=0;
      prt.pUDrl:=0;
    end;
   { if not SI then
      if Dsttv<=GlobalMaxDistance*mile then prt.pDntv:=Dsttv
                                       else prt.pDntv:=0 else }
      if Dsttv<=GlobalMaxDistance then prt.pDntv :=Dsttv
                                  else prt.pDntv:=0;
    prt.pLRtv :=Hgtv;
    prt.pUDtv :=Hvtv;
    prt.pTracking:='';
    case mAlgNum of
    1: prt.pTracking:='TRA  SIL';
    2: prt.pTracking:='TRA LAMP';
    3: prt.pTracking:='TRA HOOK';
    end;
    prt.pTime:=now;
    //сам протокол запишем
    //протокол всегда в метрах
    begin
      DM.SetData.Close;
      DM.SetData.ParamByName('Protocol_ID').Value:=Protocol_ID;
      DM.SetData.ParamByName('N').Value          :=prt.pN;
      DM.SetData.ParamByName('Drl').Value        :=prt.pDrl;
      DM.SetData.ParamByName('Dnrl').Value       :=prt.pDnrl;
      DM.SetData.ParamByName('Dntv').Value       :=prt.pDntv;
      DM.SetData.ParamByName('LRrl').Value       :=prt.pLRrl;
      DM.SetData.ParamByName('LRtv').Value       :=prt.pLRtv;
      DM.SetData.ParamByName('UDrl').Value       :=prt.pUDrl;
      DM.SetData.ParamByName('UDtv').Value       :=prt.pUDtv;
      DM.SetData.ParamByName('Tracking').Value   :=prt.pTracking;
      DM.SetData.ParamByName('DTime').Value       :=prt.pTime;
      DM.SetData.ExecSQL;
    end;
  end;

  begin
    //мигание признака компенсации качки PC
    if not flag_PC then
    begin
      ShipData.fPCVisible:=true;
      PCCount:=0;
    end else
    begin
      if MediumValidity then
      begin
        ShipData.fPCVisible:=true;
        PcCount:=0;
      end else
      begin
        INC(PCCount);
        if PCCount<10 then ShipData.fPCVisible:=true
                     else ShipData.fPCVisible:=false;
        if PCCount>20 then PCCount:=0;
      end;
    end;
  end;
  ErrorST:=(Ceil(ErrorST*1000))div 1000;
  //recalculate
  if MK1<>1 then
  begin
    mDistanse:=mDistanse/MK1;
    DTP     :=DTP/MK1;
  end;
  if MK2<>1.00 then Hg:=Hg/MK2;
  if MK3<>1.00 then Hv:=Hv/MK3;
  if MK4<>1.00 then MSpeedLa:=mSpeedLA*MK4;
  if MK5<>1.00 then MSpeedVr:=mSpeedVr*MK5;
  if MK6<>1.00 then Vlaga   :=VLaga*MK6;
  //if (GlobalCount mod 5)=0 then
  begin
    if fl_protocol then
    //формирование данных для микшера-генератора
    with ShipData do
    begin
      re:=E_re;
      lu:= _lu;
      te:= _te;
      fLadErr:=Lad_No_Data;
      if E_re then
      begin
        fNPRLK    :=mNPrlk;
        fAccomp   :=mAccomp;
        fDist     :=mDistanse;
        fCourse   :=mCorse;
        fAlt      :=mAltitude;
        fSpeedLA  :=mSpeedLA;
        fSpeedVr  :=mSpeedVr;
      end else
      begin
        fNPRLK    :=mNPrlk;
        fAccomp   :=mAccomp;
        fDist     :=0;
        fCourse   :=0;
        fAlt      :=0;
        //скорости посчитать
        fSpeedLA  :=0;
        fSpeedVr  :=0;
      end;
      Teta        :=Moment_Teta;
      Psi         :=Moment_Psi;
      VL          :=VLaga;
      Course      :=LCourse;
      fNomLa      :=AirNumb;
      fGZ         :=GZ div 2;
      fUpZ        :=(-HZ) div 2;
      fDownZ      :=(+HZ) div 2;
      fUpY        :=(-DZ-HZ) div 2;
      fDownY      :=(-DZ+HZ) div 2;
      fUpR        :=( DZ-HZ) div 2;
      fDownR      :=( DZ+HZ) div 2;
      fTrack      :=mTrack;
      fGlissad    :=mAlpha;
      fKU         :=(kKU shl 4) + (mSys and $0F);
      fDTP        :=DTP;
      fHv         :=Hv;
      fHg         :=Hg;
      fVRD        :=fl_VRD;
      fDate       :=Now;
      fVRD        :=fl_VRD;
      fErrorST    :=ErrorST;
      fBettaOLS   :=Bet;
      fPC         :=flag_PC;
      fPCH        :=flag_PR;
      fAlphaST    :=_AlphaST;
      if mTrack=0 then
      if (fDTP>=GlobalMaxDistance/MK1) then fflag:=false else fflag:=true;
      if mTrack=1 then fflag:=true;
      encode3401;
    end else
    with ShipData do
    begin
      fLadErr     :=Lad_No_Data;
      fNomLA      :=AirNumb;
      fGlissad    :=Alpha;
      re          :=E_re;
      lu          :=_lu;
      te          := _te;
      fErrorST    :=ErrorST;
      Teta        :=Moment_Teta;
      Psi         :=Moment_Psi;
      VL          :=VLaga;
      Course      :=LCourse;
      fBettaOLS   :=Bet;
      fKU         :=kKU;
      fTrack      :=mTrack;
      fPC         :=flag_PC;
      fPCH        :=flag_PR;
      fAlphaST    :=_AlphaST;
      fVRD        :=fl_VRD;
      if re then
      begin
        fNPRLK    :=mNPrlk;
        fAccomp   :=mAccomp;
        fDist     :=mDistanse;
        fCourse   :=mCorse;
        fAlt      :=mAltitude;
        fSpeedLA  :=mSpeedLA;
        fSpeedVr  :=mSpeedVr;
      end else
      begin
        ShipData.fNPRLK    :=mNPrlk;
        ShipData.fAccomp   :=mAccomp;
        ShipData.fDist     :=0;
        ShipData.fCourse   :=0;
        ShipData.fAlt      :=0;
        ShipData.fSpeedLA  :=0;
        ShipData.fSpeedVr  :=0;
      end;
      fKU         :=(kKU shl 4) + (mSys and $0F);
      zerode3401;
    end;
    //отправка данных
    cs_ArrStateDevice.Enter;
    INC(ArrStateDevice[25].TotalQuery);
    cs_ArrStateDevice.Leave;
    //отправить
    try
    Port3401.WriteBuffer(@msg3401[0],SizeOf(msg3401));
    except //При ошибке перезапустить порт
      begin
        Port3401.Close;
        Sleep(500);
        Port3401.Open;
      end;
    end;
  end;
end;

procedure TDataCalc.Execute;
var i:integer;
begin
  //Матрицы направляющих косинусов  для всех камер
  for i in [7..10] do
  begin
    Matrix[i,1,1]:= cos(koor[i].Alf)*cos(koor[i].Xi);
    Matrix[i,1,2]:=-cos(koor[i].Alf)*sin(koor[i].Xi);
    Matrix[i,1,3]:= sin(koor[i].Alf);
    Matrix[i,2,1]:= sin(koor[i].Om)*sin(koor[i].Alf)*cos(koor[i].Xi)+cos(koor[i].Om)*sin(koor[i].Xi);
    Matrix[i,2,2]:=-sin(koor[i].Om)*sin(koor[i].Alf)*sin(koor[i].Xi)+cos(koor[i].Om)*cos(koor[i].Xi);
    Matrix[i,2,3]:=-sin(koor[i].Om)*cos(koor[i].Alf);
    Matrix[i,3,1]:=-cos(koor[i].Om)*sin(koor[i].Alf)*cos(koor[i].Xi)+sin(koor[i].Om)*sin(koor[i].Xi);
    Matrix[i,3,2]:= cos(koor[i].Om)*sin(koor[i].Alf)*sin(koor[i].Xi)+sin(koor[i].Om)*cos(koor[i].Xi);
    Matrix[i,3,3]:= cos(koor[i].Om)*cos(koor[i].Alf);
  end;
  if koor[9].Y>koor[7].Y then BaseCalc(9,7)
  else  BaseCalc(7,9);
  m12:=12.5/60/grad;
  m18:=18  /60/grad;
 { if not SI then
  begin
    koff1:=mile;
    koff2:=foot;
  end else
  begin
    koff1:=1;
    koff2:=1;
  end;  }
  i:=ComDev[25].cCom_ID;
  Port3401:=TComPortR.Create(nil);
  Port3401.ComProp.BaudRate:=ComList[i].cBaudRate;
  Port3401.ComProp.ByteSize:=ComList[i].cByteSize;
  Port3401.ComProp.EnableDTR:=ComList[i].cEnableDTR;
  Port3401.ComProp.EnableRTS:=ComList[i].cEnableRTS;
  Port3401.ComProp.Parity:=ComList[i].cParity;
  Port3401.ComProp.Stopbits:=ComList[i].cStopBits;
  Port3401.ComProp.WaitResult:=ComList[i].cTimeOut;
  Port3401.InBufSize:=8000;
  Port3401.WaitFullBuffer:=false;
  Port3401.OnReadPacket:=ReadPacket;
  Port3401.ComNumber:=ComList[i].cCom;
  if not Port3401.Connected then Port3401.Open;
  Port3401.ReadActive:=True;

  if ExternalDevice.OLS=1 then _lu:=true else _lu:=false;
  if ExternalDevice.PRLK=1 then _re:=true else _re:=false;
  if ExternalDevice.Telem=1 then _te:=true else _te:=false;
  E_lu:=false;
  E_re:=false;
  E_la:=false;
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    if not Port3401.Connected then
    begin
      Port3401.Open;
      Port3401.ReadActive:=true;
    end;
    //угол видимости 1 пикселя осевой камеры по вертикали
    //0,01470156283998134557177739112367
    vt:=arctan(koor[Axial].Ry/koor[Axial].Focus)/koor[Axial].Ky*grad;
    INC(GlobalCount);
    mAlpha:=Alpha;
    mAlgNum:=AlgNum;
    kKU:=Axial;
    mAir:=Aircraft;
    mSys:=SysConfig;
    mTrack:=Track;
  // Al:=mAlpha/grad;
    if fl_protocol then
    begin
      //отбор точек для сопровождения
      TvKoor[kKU].X:=MP[1].X;   MP[1].X:=0;
      TvKoor[kKU].Y:=MP[1].Y;   MP[1].Y:=0;
      TvKoor[7].X  :=MP[2].X;   MP[2].X:=0;
      TvKoor[7].Y  :=MP[2].Y;   MP[2].Y:=0;
      TvKoor[9].X  :=MP[3].X;   MP[3].X:=0;
      TvKoor[9].Y  :=MP[3].Y;   MP[3].Y:=0;
      case mAlgNum of
      1: begin
         Xsm:=LASet[mAir].XG;
         Ysm:=LASet[mAir].YG;
         Zsm:=LASet[mAir].ZG;
       end;
      2: begin
         Xsm:=LASet[mAir].XF;
         Ysm:=LASet[mAir].YF;
         Zsm:=LASet[mAir].ZF;
       end;
      3: begin
         Xsm:=0;
         Ysm:=0;
         Zsm:=0;
       end;
      end;
      XE:=LASet[mAir].XE;
      YE:=LASet[mAir].YE;
      ZE:=LASet[mAir].ZE;
      INC(CountProtocol);
    end else GLobalCount:=0;
    FLTimeCallBack;
    sleep(45);
  end;
  if terminated then
    begin
   //   Port3401.Close;
   //   Port3401.Free;
      Port3401.Connected:=false;
      exit;
    end;
end;

procedure TDataCalc.ReadPacket(const p: Pointer; const Count: Integer;
                            const ErrCode: Cardinal; const NComPort: Word);
var pb:^byte;
    wr: array [0..2] of byte;
    raw:byte;
    i:integer;
begin
  if p=nil then EXIT;
  if Count<>3 then EXIT;
  pb:=p;
  for i:=0 to 2 do
    begin
      raw:=pb^;
      wr[i]:=raw;
      INC(pb);
    end;
  if wr[1]<>$55 then exit;  
  cs_ArrStateDevice.Enter;
  INC(ArrStateDevice[25].PositiveQuery);
  cs_ArrStateDevice.Leave;
  cs_ArrDevice[25].Enter;
    TEM3401(ArrDevice[25]).SignY1:=wr[2] and $01;
    TEM3401(ArrDevice[25]).SignC1:=wr[2] and $02 shr 1;
    TEM3401(ArrDevice[25]).SignY2:=wr[2] and $01;
    TEM3401(ArrDevice[25]).SignC2:=wr[2] and $02 shr 1;
    TEM3401(ArrDevice[25]).CSumm1:=wr[2] and $10 shr 4;
    TEM3401(ArrDevice[25]).CSumm0:=wr[2] and $20 shr 5;
  cs_ArrDevice[25].Leave;
end;

end.
