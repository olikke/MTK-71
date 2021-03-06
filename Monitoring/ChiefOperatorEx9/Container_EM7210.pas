unit Container_EM7210;

interface

uses BDRecord,MyPanel,Graphics,SysUtils,Global,Windows;

type
  TEM7210 = class
  private
    fUse     : boolean;
    fSource  : byte;
    fMistake : byte;
    fDataExh : boolean;
    fVideoExh: byte;
    fNum     : integer;
    fName    : string;
    fHint    : string;
    fStop    : int64;
    fStart   : int64;
    function  fState:TState;
    function  fColor:TColor;
    procedure fVideoExhWr(Video:boolean);
    function  fVideoExhRd:boolean;
  public
    property    Use       :boolean  read fUse;
    property    DataExh   :boolean  read fDataExh;
    property    VideoExh  :boolean  read fVideoExhRd write fVideoExhWr;
    property    Source    :byte     read fSource   write fSource;
    property    Name      :string   read fName;
    property    Hint      :string   read fHint;
    property    State     :TState   read fState;
    property    Color     :TColor   read fColor;
    procedure   WriteDataExh(b:byte);
    constructor Create(numb:integer;dnum:integer);

  end;

var
  EM7210:array [0..27] of TEM7210;

implementation

function TEM7210.fVideoExhRd:boolean;
begin
  if fDataExh then
    if fVideoExh<=3 then result:=true
                    else result:=false
              else result:=false;
end;

procedure TEM7210.fVideoExhWr(Video: Boolean);
begin
  if Video then fVideoExh:=0
           else if fVideoExh<5 then INC(fVideoExh);
end;

constructor TEM7210.Create(numb:integer;dnum:integer);
begin
  inherited Create;
  fNum     :=numb;
  case dnum of
    1:  begin fUse:=bd7210_1[fNum].Use; fName:=bd7210_1[fNum].Position; fHint:=bd7210_1[fnum].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_1[fnum].Position); end;
    2:  begin fUse:=bd7210_2[fNum].Use; fName:=bd7210_2[fNum].Position; fHint:=bd7210_2[fnum].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_2[fnum].Position); end;
  end;
  fSource  :=20;
  fMistake :=3;
  fDataExh :=false;
  fVideoExh:=0;
end;

function TEM7210.fState;
begin
  if fUse then
    if fDataExh then
      if fVideoExh<=3 then result:=dsGreen
                   else result:=dsRed
                else result:=dsRed
          else result:=dsGray;
end;

function TEM7210.fColor;
begin
  if fUse then
    if fDataExh then
      if fVideoExh<=3 then result:=_Green
                   else result:=_Red
                else result:=_Red
          else result:=_Gray;
end;

procedure TEM7210.WriteDataExh(b:byte);
begin
  if b<>$80 then
    if fMistake>=4 then fMistake:=3
     else  fMistake:=fMistake+1 else fMistake:=0;
  if fMistake>=3 then fDataExh:=false
                 else fDataExh:=true;
  QueryPerformanceCounter(fStart);
end;

end.
