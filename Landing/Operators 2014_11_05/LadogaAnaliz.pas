unit LadogaAnaliz;

interface

uses
  Classes,Global,SyncObjs,Windows,SysUtils,INIFiles,Dialogs;

type
  TLadogaAnaliz = class(TThread)
  private
    WSPLAD        :TLAD;
    WSLLAD        :TLAD;
    updateWSP     :boolean;
    updateWSL     :boolean;
    cs_WSP        :TCriticalSection;
    cs_WSL        :TCriticalSection;
    MissingData   :integer;
    Counter       :int64;
    LadogaCounter :integer;
    MediLadoga    :TMedLadoga;
    timestr       :string[5];
    INI           :TIniFile;
    Remember      :TMedLadoga;
    NeedINIWrite  :byte;
    procedure   WriteNewDataByWSP(LAD:TLAD);
    procedure   WriteNewDataByWSL(LAD:TLAD);
    procedure   ReadFromINI;
    procedure   WriteInINI;
    procedure   Analiz;
  protected
    procedure   Execute; override;
  public
    property    LAD_BY_WSP:TLAD  write WriteNewDataByWSP;
    property    LAD_BY_WSL:TLAD  write WriteNewDataByWSL;
    constructor Create;
  end;

implementation

procedure TLadogaAnaliz.WriteInINI;
begin
  INI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) +'\LADOGA.ini');
  INI.WriteFloat('MEDI','LastTime',now);
  INI.WriteString('MEDI','PSI', FloatToStr(MEDILadoga.Psi));
  INI.WriteString('MEDI','TETA',FloatToStr(MEDILadoga.Teta));
  INI.WriteString('MEDI','Sx',  FloatToStr(MEDILadoga.Sz));
  INI.WriteString('MEDI','Sy',  FloatToStr(MEDILadoga.Sy));
  INI.WriteString('MEDI','Sz',  FloatToStr(MEDILadoga.Sz));
  INI.WriteString('MEDI','REAL TIME',FormatDateTime('yyyy/mm/dd hh:nn:ss:zzz',now));
  INI.Free;
end;

procedure TLadogaAnaliz.ReadFromINI;
var tempstr  :string;
    temp:  double;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) +'\LADOGA.ini') then exit;
  INI:=TINIFile.Create(ExtractFilePath(ParamStr(0)) +'\LADOGA.ini');
  temp:=INI.ReadFloat('MEDI','LastTime',0);
  if (now-temp)>1/24/3 then LADOGA_NO_DATA:=true
                       else LADOGA_NO_DATA:=false;
  tempstr          :=INI.ReadString('MEDI','PSI','0');
  Remember.Psi     :=StrToFloatDef(tempstr,0);
  tempstr          :=INI.ReadString('MEDI','TETA','0');
  Remember.Teta    :=StrToFloatDef(tempstr,0);
  tempstr          :=INI.ReadString('MEDI','Sx','0');
  Remember.Sx      :=StrToFloatDef(tempstr,0);
  tempstr          :=INI.ReadString('MEDI','Sy','0');
  Remember.Sy      :=StrToFloatDef(tempstr,0);
  tempstr          :=INI.ReadString('MEDI','Sz','0');
  Remember.Sz      :=StrToFloatDef(tempstr,0);
  INI.Free;
  SetLadoga[0].Psi :=Remember.Psi *MediumQuantity;
  SetLadoga[0].Teta:=Remember.Teta*MediumQuantity;
  SetLadoga[0].Sx  :=Remember.Sx  *MediumQuantity;
  SetLadoga[0].Sy  :=Remember.Sy  *MediumQuantity;
  SetLadoga[0].Sz  :=Remember.Sz  *MediumQuantity;
  MEDILadoga.Psi   :=Remember.Psi;
  MEDILadoga.Teta  :=Remember.Teta;
  MediLadoga.Sx    :=Remember.Sx;
  MEDILadoga.Sy    :=Remember.Sy;
  MEDILAdoga.Sz    :=Remember.Sz;
  MEDILadoga.Validity:=not LADOGA_NO_DATA;
end;

constructor TLadogaAnaliz.Create;
begin
  inherited Create(true);
  NeedINIWrite:=0;
  FreeOnTerminate:=false;
  cs_WSP:=TCriticalSection.Create;
  cs_WSL:=TCriticalSection.Create;
  updateWSP:=false;
  updateWSL:=false;
  MissingData:=0;
  Counter:=0;
  LadogaCounter:=0;
  FillChar(SetLadoga,SizeOf(SetLadoga),0);
  FillChar(Remember, SizeOf(Remember),0);
  ReadFromINI;
  resume;
end;


procedure TLadogaAnaliz.WriteNewDataByWSP( LAD: TLad);
begin
  cs_WSP.Enter;
  try
    WSPLAD:=LAD;
    updateWSP:=true;
    LadogaLastWSP:=0;
  finally
    cs_WSP.Leave;
  end;
end;

procedure TLadogaAnaliz.WriteNewDataByWSL(LAD: TLad);
begin
  cs_WSL.Enter;
  try
    WSLLAD:=LAD;
    updateWSL:=true;
    LadogaLastWSL:=0;
  finally
    cs_WSL.Leave;
  end;
end;

procedure TLadogaAnaliz.Execute;
begin
  while not terminated do
  begin
    sleep(20);
    Analiz;
  end;
  if Terminated then
  begin
    cs_WSP.Free;
    cs_WSL.Free;
  end;
end;

procedure TLadogaAnaliz.Analiz;
var LAD:TLAD;
    Sn,Sw,Sz:double;
    tempstr:string;
    nm:int64;
begin
  if NeedINIWrite<105 then INC(NeedINIWrite) else NeedINIWrite:=0;
  if updateWSP then
  begin
    cs_WSP.Enter;
    try
      LAD:=WSPLAD;
      updateWSP:=false;
      MissingData:=0;
    finally
      cs_WSP.Leave;
    end;
    UpdateWSL:=false;
  end else
  if updateWSL then
  begin
    cs_WSL.Enter;
    try
      LAD:=WSLLAD;
      updateWSL:=false;
      MissingData:=0;
    finally
      cs_WSL.Leave;
    end;
  end else
  begin
    if MissingData<11 then INC(MissingData);
    if MissingData>10 then LADOGA_NO_DATA:=true;
    exit;
  end;
  MissingData:=0;
  INC(COUNTER);
  LADOGA_NO_DATA:=false;
  
  if Counter mod Divisor = 0 then
  begin
    INC(LadogaCounter);
    if LadogaCounter<MediumQuantity then
    begin
      //текущие значения качки
      SetLadoga[LadogaCounter].Psi  :=LAD.laPsi;
      SetLadoga[LadogaCounter].Teta :=LAD.laTeta;
      //SetLadoga[0] - суммарное значение данного поля массива
      SetLadoga[0].Psi  :=SetLadoga[0].Psi  +LAD.laPsi - Remember.Psi;
      SetLadoga[0].Teta :=SetLadoga[0].Teta +LAD.laTeta- Remember.Teta;
      if flag_XYZ then
      begin
        //вектор смещений
        Sn:=LAD.laSn;
        //поменяли направление координатной оси для правой координатной системы
        Sw:=-LAD.laSe;
        Sz:=LAD.laSz;
        //поворот системы на угол курса
        POVOROT(0,LAD.laK,0,Sn,Sw,Sz);
        ////////////////////////////////////////////////////////////////////////
        //текущий вектор смещений в корабельной системе координат
        SetLadoga[LadogaCounter].Sx   :=Sn;
        SetLadoga[LadogaCounter].Sy   :=Sw;
        SetLadoga[LadogaCounter].Sz   :=Sz;
        //SetLadoga[0] - суммарное значение данного поля массива
        SetLadoga[0].Sx   :=SetLadoga[0].Sx   +Sn - Remember.Sx;
        SetLadoga[0].Sy   :=SetLadoga[0].Sy   +Sw - Remember.Sy;
        SetLadoga[0].Sz   :=SetLadoga[0].Sz   +Sz - Remember.Sz;
      end;
    end;
    if LadogaCounter>MediumQuantity then
    begin
      //SetLadoga[0] - суммарное значение данного поля массива
      SetLadoga[0].Psi  :=SetLadoga[0].Psi  +LAD.laPsi
                        - SetLadoga[LadogaCounter-MediumQuantity].Psi;
      SetLadoga[0].Teta :=SetLadoga[0].Teta +LAD.laTeta
                        - SetLadoga[LadogaCounter-MediumQuantity].Teta;
      SetLadoga[LadogaCounter-MediumQuantity].Psi  :=LAD.laPsi;
      SetLadoga[LadogaCounter-MediumQuantity].Teta :=LAD.laTeta;
      if flag_XYZ then
      begin
        //вектор смещений
        Sn:=LAD.laSn;
        //поменяли направление координатной оси для правой координатной системы
        Sw:=-LAD.laSe;
        Sz:=LAD.laSz;
        //поворот системы на угол курса
        POVOROT(0,LAD.laK,0,Sn,Sw,Sz);
        /////////////////////////////////////////////////////////////////////////
        SetLadoga[0].Sx   :=SetLadoga[0].Sx   +Sn
                            - SetLadoga[LadogaCounter-MediumQuantity].Sx;
        SetLadoga[0].Sy   :=SetLadoga[0].Sy   +Sw
                            - SetLadoga[LadogaCounter-MediumQuantity].Sy;
        SetLadoga[0].Sz   :=SetLadoga[0].Sz   +Sz
                            - SetLadoga[LadogaCounter-MediumQuantity].Sz;
        //текущие значения
        SetLadoga[LadogaCounter-MediumQuantity].Sx   :=Sn;
        SetLAdoga[LadogaCounter-MediumQuantity].Sy   :=Sw;
        SetLadoga[LadogaCounter-MediumQuantity].Sz   :=Sz;
      end;
      if LadogaCounter=MediumQuantity*2 then LadogaCounter:=MediumQuantity;
    end;
    //средние значения
    MEDILadoga.Psi :=SetLadoga[0].Psi / MediumQuantity;
    MEDILadoga.Teta:=SetLadoga[0].Teta/ MediumQuantity;
    if flag_XYZ then
    begin
      MEDILadoga.Sx  :=SetLadoga[0].Sx  / MediumQuantity;
      MEDILadoga.Sy  :=SetLadoga[0].Sy  / MediumQuantity;
      MEDILadoga.Sz  :=SetLadoga[0].Sz  / MediumQuantity;
    end;
    //признак достоверности
    if LadogaCounter >=MediumQuantity then
    begin
      MEDILadoga.Validity:=true;
      if NeedINIWrite>=100 then WriteInINI;
      MEDILadoga.LeaveTime:='';
    end else
    begin
      //время до завершения накопления
      tempstr:=IntToStr(Round(FRAC((MediumQuantity-LadogaCounter) / MediumTime)*60));
      if length(tempstr)=1 then tempstr:='0'+tempstr;
      timestr:='0' + IntToStr((MediumQuantity-LadogaCounter) div MediumTime)+':'+tempstr;
      MEDILadoga.LeaveTime:=timestr;
    end;
  end;
  //запомним массив данных для Ладоги
  begin
    INC(CounterMiniLadoga);
    if CounterMiniLadoga>10 then CounterMiniLadoga:=1;
    nm:=CounterMiniLadoga;
    cs_MiniLadoga.Enter;
    try
      if LAD.laDataExh=1 then
      begin
        MiniLadoga[nm].miniPsi :=LAD.laPsi;
        MiniLadoga[nm].miniTeta:=LAD.laTeta;
        MiniLadoga[nm].miniK   :=LAD.laK;
        MiniLadoga[nm].miniVL  :=LAD.laVl;
        MiniLadoga[nm].miniSn  :=LAD.laSn;
        MiniLadoga[nm].miniSe  :=LAD.laSe;
        MiniLadoga[nm].miniSz  :=LAD.laSz;
        MiniLadoga[nm].miniCC  :=LAD.laCC;
        MiniLadoga[nm].miniDE  :=1;
      end else
        MiniLadoga[nm].miniDE  :=0;
    finally
      cs_MiniLadoga.Leave;
    end;
  end;
  cs_MedLadoga.Enter;
  try
    MediumLadoga:=MEDILadoga;
  finally
    cs_MedLadoga.Leave;
  end;
end;

end.
