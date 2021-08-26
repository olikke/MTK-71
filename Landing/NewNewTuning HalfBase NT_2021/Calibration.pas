unit Calibration;

interface

uses Windows,SysUtils,Dialogs,Global;

type
  TCalibration = class (TObject)
  Private
    FhWnd :cardinal;
    FMsg  :cardinal;
    FOwn  :integer;
    FD    :double;
    FL    :double;
    FH    :double;
    FPR  :array [1..4] of TPoint;
    FFocus:double;
    FRx   :double;
    const
    FRy   :double =3.6;
    FKx   :double =720;
    FKy   :double =576;
    procedure calibr();
    procedure setD(Value:double);
    procedure setL(Value:double);
    procedure setH(Value:double);
  Public
    Constructor Create(hWnd:cardinal;Msg:cardinal;OwnNumb:integer);
    Property D  :double read FD write setD;
    Property L  :double read FL write setL;
    Property H  :double read FH write setH;
    Property Focus: double read FFocus;
    Property Rx :double read FRx;
    Procedure setPRX(number: integer; val: integer);
    Procedure setPRY(number: integer; val: integer);
    function  getPRX(number: integer):String;
    function  getPRY(number: integer):String;
    function getFocus(): String;
    function getRx(): String;
    function getRy(): String;
    function getKx(): String;
    function getKy(): String;
    function focusOK(): boolean;
    function rxOK(): boolean;
    function OK(): boolean;
  end;

implementation

procedure TCalibration.calibr;
begin
  if (fH<>0)then
    FFocus:=FRy*FL*(FPR[2].Y-FPR[1].Y)/FKy/FH
  else
    FFocus:=0;
  if (FL<>0) and (FPR[4].X-FPR[3].X<>0) then
    FRx:=FKx*FFocus*FD/FL/(FPR[4].X-FPR[3].X)
  else FRX:=0;
  PostMessage(FhWnd,FMsg,FOwn,0);
end;

constructor TCalibration.Create(hWnd:cardinal;Msg:cardinal;OwnNumb:integer);
begin
  inherited Create;
  FhWnd   :=hWnd;
  FMsg    :=Msg;
  FOwn    :=OwnNumb;
end;

function TCalibration.focusOK: boolean;
begin
  result:=FFocus>0;
end;

function TCalibration.getFocus: String;
begin
  result:=FloatToStrF(FFocus,ffFixed,INT,FRACT);
end;

function TCalibration.getKx: String;
begin
  result:=FloatToStrF(FKx,ffFixed,INT,FRACT);
end;

function TCalibration.getKy: String;
begin
  result:=FloatToStrF(FKy,ffFixed,INT,FRACT);
end;

function TCalibration.getPRX(number: integer): String;
begin
  if not number in [1..4] then exit;
  result:=IntToStr(FPR[number].X);
end;

function TCalibration.getPRY(number: integer): String;
begin
  if not number in [1..4] then exit;
  result:=IntToStr(FPR[number].Y);
end;

function TCalibration.getRx: String;
begin
  result:=FloatToStrF(FRx,ffFixed,INT,FRACT);
end;

function TCalibration.getRy: String;
begin
  result:=FloatToStrF(FRy,ffFixed,INT,FRACT);
end;

function TCalibration.OK: boolean;
begin
  result:=FocusOk and RxOk;
end;

function TCalibration.rxOK: boolean;
begin
  result:=FRx>0;
end;

procedure TCalibration.setD(Value:double);
begin
  FD:=Value;
  calibr();
end;

procedure TCalibration.setL(Value:double);
begin
  FL:=Value;
  calibr();
end;

procedure TCalibration.setPRX(number: integer; val: integer);
begin
  if not number in [1..4] then exit;
  FPR[number].x:=val;
  calibr;
end;

procedure TCalibration.setPRY(number, val: integer);
begin
  if not number in [1..4] then exit;
  FPR[number].y:=val;
  calibr;
end;

procedure TCalibration.setH(Value:double);
begin
  FH:=Value;
  calibr();
end;

end.
