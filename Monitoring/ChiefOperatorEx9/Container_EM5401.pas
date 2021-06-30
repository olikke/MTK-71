unit Container_EM5401;

interface

uses Windows,Global,Graphics,MyPanel;

type
  TEM5401 = class
  private
    FDeviceTypeCode  :integer;
    FHardwareVersion :integer;
    FSoftwareVersion :integer;
    FSerialNumber    :integer;
    FOldSerialNumber :integer;
    FDeviceMDate     :TDateTime;
    fStart           :int64;
    fStop            :int64;
    fPresence        :boolean;
    function          FColor:TColor;
    function          FState:tState;
    function          fDataExh:boolean;
  public
    property    DeviceTypeCode :integer read FDeviceTypeCode  write FDeviceTypeCode;
    property    HardwareVersion:integer read FHardwareVersion write FHardwareVersion;
    property    SoftwareVersion:integer read FSoftwareVersion write FSoftwareVersion;
    property    SerialNumber   :integer read FSerialNumber    write FSerialNumber;
    property    DeviceMDate    :TDateTime read FDeviceMDate   write FDeviceMDate;
    property    Color          :TColor  read FColor;
    property    State          :TState  read FState;
    property    DataExh        :boolean read FDataExh;
    function    DeviceState    :boolean;
    procedure   Analiz5401;
    constructor Create;
  end;

var
  EM5401:TEM5401;


implementation

function TEM5401.DeviceState:boolean;
begin
  result:=fDataExh;
end;

procedure TEM5401.Analiz5401;
var Comm:T5401Question;
begin
  if not fPresence then
  begin
    new(Comm);
    Comm^.Comm5401:=Identification5401;
    Comm^.DevType :=dtEM5401;
    Comm^.DevNumb :=0;
    Comm^.length  :=4;
    Comm^.MASS[0] :=EM5401Addr;
    Comm^.MASS[1] :=Comm^.length-2;
    Comm^.MASS[2] :=Command5401[Identification5401];
    Comm^.MASS[3]:=Comm^.MASS[0]+Comm^.MASS[1]+Comm^.MASS[2];
    cs_QuestionList.Enter;
    try
      QuestionList.Add(Comm);
    finally
      cs_QuestionList.Leave;
    end;
    fPresence:=true;
  end;
  QueryPerformanceCounter(fStart);
end;

function  TEM5401.fDataExh:boolean;
begin
 QueryPerformanceCounter(fStop);
  if GlobalFreq=0 then QueryPerformanceFrequency(GlobalFreq);
  if (fStop-fStart)/GlobalFreq*1000>TimeToUpdate*2
    then result:=false
      else result:=true;
  if not result then fPresence:=false;
end;

function TEM5401.FColor:TColor;
begin
  if fDataExh then result:=_Green
              else result:=_Red;
end;

function TEM5401.FState:TState;
begin
  if fDataExh then result:=dsGreen
              else result:=dsRed;
end;

constructor TEM5401.Create;
begin
  inherited;
  fStart    :=0;
  fStop     :=0;
  fPresence :=false;
  //заполнить OLD Serial Number
end;

end.
