unit Container_TM2408;

interface
uses Global,Graphics,MyPanel,Windows,SysUtils,Dialogs;

type
  TypeOfState=(Red,Yellow,Green);

type
  TTM2408 = class
  private
    const
      GreenLimit:double  = 90;
      YellowLimit:double = 95;
    var
    fip1           :TStric;
    fip2           :TStric;
    fip3           :TStric;
    fip4           :TStric;
    fExh1          :boolean;
    fExh2          :boolean;
    fExh3          :boolean;
    fExh4          :boolean;
    fStart         :int64;
    fStop          :int64;
    fimage         :THandle;
    fHDDCount      :integer;
    fColor         :TColor;
    fState         :TState;
    fVideo         :boolean;
    fHDDChar       :array of Char;
    fHDDTotal      :array of double;
    fHDDFree       :array of double;
    fHDDUse        :array of double;
    fHDDColor      :array of TColor;
    fHDDState      :TypeOfState;
    procedure      FullState;
  public
    constructor Create;
    procedure   NewPacketAnaliz;
    function    DataExh:boolean;
    property    HDDCount:integer read fHDDCount;
    property    IP1 :TStric   read fip1;
    property    IP2 :TStric   read fip2;
    property    IP3 :TStric   read fip3;
    property    IP4 :TStric   read fip4;
    property    Color:TColor  read fColor;
    property    State:TState  read fState;
    property    Video:boolean read fVideo;
    property    FormHandle:THandle  write fimage;
    function    HDDChar (num:byte):char;
    function    HDDTotal(num:byte):TStric;
    function    HDDFree (num:byte):TStric;
    function    HDDUse  (num:byte):TStric;
    function    HDDColor(num:byte):TColor;
    function    Exh1:boolean;
    function    Exh2:boolean;
    function    Exh3:boolean;
    function    Exh4:boolean;
    function    dsExh(numb:byte):TState;
    function    EColor(numb:byte):TColor;
    function    Text (numb:byte):TStric;
  end;

var TM2408:TTM2408;

implementation

function TTM2408.Text(numb: Byte):TStric;
begin
  result:='  Not connected';
  case numb of
    1: if fExh1 then result:='  Connected';
    2: if fExh2 then result:='  Connected';
    3: if fExh3 then result:='  Connected';
    4: if fExh4 then result:='  Connected';
  end;
end;

function TTM2408.EColor(numb: Byte):TColor;
begin
  result:=_Red;
  case numb of
    1:  if fExh1 then result:=_Green;
    2:  if fExh2 then result:=_Green;
    3:  if fExh3 then result:=_Green;
    4:  if fExh4 then result:=_Green;
  end;
end;

function TTM2408.dsExh(numb: Byte):TState;
begin
  result:=dsRed;
  case numb of
    1:  if fExh1 then result:=dsGreen;
    2:  if fExh2 then result:=dsGreen;
    3:  if fExh3 then result:=dsGreen;
    4:  if fExh4 then result:=dsGreen;
  end;
end;

function TTM2408.Exh1:boolean;
begin
  if DataExh then result:=fExh1
             else result:=false;
end;

function TTM2408.Exh2:boolean;
begin
  if DataExh then result:=fExh2
             else result:=false;
end;

function TTM2408.Exh3:boolean;
begin
  if DataExh then result:=fExh3
             else result:=false;
end;

function TTM2408.Exh4:boolean;
begin
  if DataExh then result:=fExh4
             else result:=false;
end;

function TTM2408.HDDChar(num: Byte):char;
begin
  result:='D';
  if num>fHDDCount then exit;
  result:=fHDDChar[num-1];
end;

function TTM2408.HDDTotal(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDTotal[num-1],ffFixed,6,2)+' Gb';
end;

function TTM2408.HDDFree(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDFree[num-1],ffFixed,6,2)+' Gb';
end;

function TTM2408.HDDUse(num: Byte):TStric;
begin
  if num>fHDDCount then exit;
  result:=FloatToStrF(fHDDUse[num-1],ffFixed,6,2)+' %';
end;

function TTM2408.HDDColor(num: Byte):TColor;
begin
  if num>fHDDCount then exit;
  result:=fHDDColor[num-1];
end;

procedure TTM2408.FullState;
var St:TypeOfState;
     i:integer;
begin
  St:=Green;
  if not fVideo then St:=Red;
  if St<>Red then
    if not fExh1 then
      if not fExh2 then St:=Red
                   else St:=Yellow;
  if fHDDState=Red then St:=Red else
    if (FHDDState=Yellow) and (St<>Red) then St:=Yellow;
  case INTEGER(St) of
    INTEGER(Red)   : begin fColor:=_Red;    fState:=dsRed;    end;
    INTEGER(Yellow): begin fColor:=_Yell; fState:=dsYellow; end;
    INTEGER(Green) : begin fColor:=_Green;   fState:=dsGreen;  end;
  end; 
end;

function TTM2408.DataExh;
begin
  result:=false;
  QueryPerformanceCounter(fStop);
  if GlobalFreq<>0 then
  if (fStop-fStart)/GlobalFreq*1000<TimeToUpdate*2 then Result:=true;
  if not result then FirstVRDMessage:=true;
end;

constructor TTM2408.Create;
begin
  inherited Create;
  fStart  :=0;
  fStop   :=0;
  fimage  :=0;
  fip1    :=IP24081;
  fip2    :=IP24082;
  fip3    :=IP24083;
  fip4    :=IP24084;
  fExh1   :=false;
  fExh2   :=false;
  fExh3   :=false;
  fExh4   :=false;
  fHDDCount :=0;
  fState    :=dsRed;
  fColor    :=_Red;
end;

procedure TTM2408.NewPacketAnaliz;
var i:integer;
    c:TypeOfState;
begin
  QueryPerformanceCounter(fStart);
  cs_WSCPacket.Enter;
  try
    fVideo  :=WSCPacket.VideoExh;
    fExh1   :=WSCPacket.LAN1;
    fExh2   :=WSCPacket.LAN2;
    fExh3   :=WSCPacket.LAN3;
    fExh4   :=WSCPacket.LAN4;
    if fHDDCount=0 then
    begin
      fHDDCount:=WSCPacket.HDDCount;
      SetLength(fHDDChar ,fHDDCount);
      SetLength(fHDDTotal,fHDDCount);
      SetLength(fHDDFree ,fHDDCount);
      SetLength(fHDDUse  ,fHDDCount);
      SetLength(fHDDColor,fHDDCount);
    end;
    for i:=0 to fHDDCount-1 do
    begin
      fHDDChar[i]  :=WSCPacket.HDD[i].Name;
      fHDDTotal[i] :=WSCPacket.HDD[i].Total;
      fHDDFree[i]  :=WSCPacket.HDD[i].Free;
      if  fHDDTotal[i]<>0 then
      fHDDUse[i]   :=(fHDDTotal[i]-fHDDFree[i])/fHDDTotal[i]*100
    end;
  finally
    cs_WSCPAcket.Leave;
  end;
  c:=Green;
  for i:=0 to fHDDCount-1 do
  begin
    if fHDDUse[i]<=GreenLimit  then fHDDColor[i]:=_Green else
    if fHDDUse[i]<=YellowLimit then fHDDColor[i]:=_Yell else
                                    fHDDColor[i]:=_Red;
    if (fHDDColor[i]=_Yell) and (c<>Red) then c:=Yellow;
    if  fHDDColor[i]=_Red then c:=Red;
  end;
  fHDDState:=c;
  FullState;
  if fimage<>0 then
    PostMessage(fimage,WM_NOTIFY_2408,1,1);
end;

end.
