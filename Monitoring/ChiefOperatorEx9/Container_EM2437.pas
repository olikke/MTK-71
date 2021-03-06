unit Container_EM2437;

interface

uses  BDRecord,Global,SysUtils,myPanel,Graphics,Dialogs;

type
  TEM2437 = class
  private
    FDataExh         :boolean;
    FDeviceTypeCode  :integer;
    FHardwareVersion :integer;
    FSoftwareVersion :integer;
    FSerialNumber    :integer;
    FOldSerialNumber :integer;
    FDeviceMDate     :TDateTime;
    FUse1            :boolean;
    FUse2            :boolean;
    FName1           :string;
    FName2           :string;
    FNumb            :byte;
    FCorrection      :T2437Corr;
    fMask            :byte;
    fStatusOfFeed    :byte;
    fStatusOfVideo   :byte;
    fHandle          :THandle;
    FCP              :boolean;
    function FColor:TColor;
    function FState:TState;
    function FStateChannel1:TState;
    function FStateChannel3:TState;
    function FColorChannel1:TColor;
    function FColorChannel3:TColor;
  public
    property    DataExh       :boolean    read FDataExh                    write FDataExh;
    property    Mask          :byte       read FMask;
    property    FormHandle    :THandle    read FHandle                     write FHandle;
    property    GainFactor1   :integer    read FCorrection[1].GainFactor   write FCorrection[1].GainFactor;
    property    GainFactor2   :integer    read FCorrection[2].GainFactor   write FCorrection[2].GainFactor;
    property    GainFactor3   :integer    read FCorrection[3].GainFactor   write FCorrection[3].GainFactor;
    property    GainFactor4   :integer    read FCorrection[4].GainFactor   write FCorrection[4].GainFactor;
    property    Equalization1 :integer    read FCorrection[1].Equalization write FCorrection[1].Equalization;
    property    Equalization2 :integer    read FCorrection[2].Equalization write FCorrection[2].Equalization;
    property    Equalization3 :integer    read FCorrection[3].Equalization write FCorrection[3].Equalization;
    property    Equalization4 :integer    read FCorrection[4].Equalization write FCorrection[4].Equalization;
    property    Use1          :boolean    read FUse1;
    property    Use2          :boolean    read FUse2;
    property    Name1         :string     read FName1;
    property    Name2         :string     read FName2;
    property    pStatusOfVideo:byte       write FStatusOfVideo;
    property    pStatusOfFeed :byte       read FStatusOfFeed    write FStatusOfFeed;
    property    DeviceTypeCode:integer    read FDeviceTypeCode  write FDeviceTypeCode;
    property    HardwareVersion:integer   read FHardwareVersion write FHardwareVersion;
    property    SoftwareVersion:integer   read FSoftwareVersion write FSoftwareVersion;
    property    SerialNumber   :integer   read FSerialNumber    write FSerialNumber;
    property    DeviceMDate    :TDateTime read FDeviceMDate     write FDeviceMDate;
    property    Color          :TColor    read FColor;
    property    State          :TState    read FState;
    property    StateChannel1  :TState    read FStateChannel1;
    property    StateChannel3  :TState    read FStateChannel3;
    property    ColorChannel1  :TColor    read FColorChannel1;
    property    ColorChannel3  :TColor    read FColorChannel3;
    property    PermissionToChange:boolean read FCP              write FCP;
    function    DeviceState:boolean;
    constructor Create(Numb:byte);
  end;

var EM2437:array [1..4] of TEM2437;

implementation

function TEM2437.DeviceState:boolean;
begin
  if fColor=_Red then result:=false
                  else result:=true;
end;

function TEM2437.FColorChannel1:TColor;
begin
  if not FUse1 then
  begin
    result:=_Gray;
    exit;
  end else result:=_Red;
  if not fDataExh then exit;
  if (fStatusOfVideo and $01) = $01 then result:=_Green;
end;

function TEM2437.FColorChannel3:TColor;
begin
  if not FUse2 then
  begin
    result:=_Gray;
    exit;
  end else result:=_Red;
  if not fDataExh then exit;
  if (fStatusOfVideo and $10) = $10 then result:=_Green;
end;

function TEM2437.FStateChannel1:TState;
begin
  if not FUse1 then
  begin
    result:=dsGray;
    exit;
  end else result:=dsRed;
  if not fDataExh then exit;
  if (fStatusOfVideo and $01) = $01 then result:=dsGreen;
end;

function TEM2437.FStateChannel3:TState;
begin
  if not FUse2 then
  begin
    result:=dsGray;
    exit;
  end else result:=dsRed;
  if not fDataExh then exit;
  if (fStatusOfVideo and $10) = $10 then result:=dsGreen;
end;

function TEM2437.fColor:TColor;
begin
  result:=_Red;
  if not fDataExh then exit;
  if FStatusOfVideo=FMask then result:=_Green;
end;

function TEM2437.FState:TState;
begin
  result:=dsRed;
  if not fDataExh then exit;
  if FStatusOfVideo=FMask then result:=dsGreen;
end;

constructor TEM2437.Create(Numb:byte);
begin
  inherited Create;
  FDataExh  :=false;
  FNumb     :=Numb;
  FUse1     :=bdKU[KUtoPort [EM2437toPort[FNumb*2-1]]].Use;
  FUse2     :=bdKU[KUtoPort [EM2437toPort[FNumb*2]]].Use;
  fMask     :=$00;
  if FUse1  then fMask :=$03;
  if FUse2  then fMask :=fMask+$30;
  FName1    :=bdKU[KUtoPort [EM2437toPort[FNumb*2-1]]].Name+' ('+
              bdKU[KUtoPort [EM2437toPort[FNumb*2-1]]].PName+')'+#10#13+'TM-2221-2 '+
              TRIM(bdKU[KUtoPort [EM2437toPort[FNumb*2-1]]].Position);
  FName2    :=bdKU[KUtoPort [EM2437toPort[FNumb*2]]].Name+' ('+
              bdKU[KUtoPort [EM2437toPort[FNumb*2]]].PName+')'+#10#13+'TM-2221-2 '+
              TRIM(bdKU[KUtoPort [EM2437toPort[FNumb*2]]].Position);
  FHandle   :=0;
  FCP       :=false;
  //????????? OLD Serial Number
end;

end.
