unit Algorithm;

interface

uses
  Windows, SysUtils,Classes, Graphics, Dialogs, GR32,Math,FastDib,Global;

type
  TAlgorithm = class(TThread)
  private

  protected
    procedure Execute; override;
  public

  end;

  procedure Algorithm001(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer); //автосопровождение по силуэту
  procedure Algorithm002(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer); //автосопровождение по фаре
  Procedure Algorithm003(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer); //автосопровождение по гаку
  Procedure Algorithm004(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer); //адаптивный порог

implementation
uses Main;
var    WhiteFlag:boolean=false;
       kbl,kwh : Word;
       //флаг текущего размера фильтра или адаптивного порога
       fl_Size:byte=1;
var    msWhX_1 : array[0..200] of Integer;
       msWhY_1 : array[0..200] of Integer;
       msBlX_1 : array[0..200] of Integer;
       msBlY_1 : array[0..200] of Integer;
       msWhX_2 : array[0..200] of Integer;
       msWhY_2 : array[0..200] of Integer;
       msBlX_2 : array[0..200] of Integer;
       msBlY_2 : array[0..200] of Integer;
       msWhX_3 : array[0..200] of Integer;
       msWhY_3 : array[0..200] of Integer;
       msBlX_3 : array[0..200] of Integer;
       msBlY_3 : array[0..200] of Integer;
       msWhX_4 : array[0..200] of Integer;
       msWhY_4 : array[0..200] of Integer;
       msBlX_4 : array[0..200] of Integer;
       msBlY_4 : array[0..200] of Integer;
       msWhX_5 : array[0..200] of Integer;
       msWhY_5 : array[0..200] of Integer;
       msBlX_5 : array[0..200] of Integer;
       msBlY_5 : array[0..200] of Integer;
var    Rbl: Word;
       Rwh: Word;
       msWhX: array[0..200] of Integer;
       msWhY: array[0..200] of Integer;
       msBlX: array[0..200] of Integer;
       msBlY: array[0..200] of Integer;
       TempSoprGrey:BufferBMP;

procedure CreateFilter;
var i,j:integer;
begin
  //Построение фильтра для сопровождения за фару
  FillChar(msWhX_1,SizeOf(msWhX_1),0);
  FillChar(msWhY_1,SizeOf(msWhX_1),0);
  FillChar(msBlX_1,SizeOf(msBlX_1),0);
  FillChar(msBlY_1,SizeOf(msBlY_1),0);
  kbl:=0;
  for I := 0 to 2*Rbl_1 do
    for j := 0 to 2*Rbl_1 do
      if
      ((SQRT(SQR(i-Rbl_1)+SQR(j-Rbl_1))>Rbl_1)AND(SQRT(SQR(i-Rbl_1)+SQR(j-Rbl_1))<Rbl_1+1))OR
         ((i=Rbl_1)AND(j=0))OR((i=Rbl_1)AND(j=2*Rbl_1))OR
         ((j=Rbl_1)AND(i=0))OR((j=Rbl_1)AND(i=2*Rbl_1))
         then
        begin
          msBlX_1[kbl]:=i-Rbl_1;
          msBlY_1[kbl]:=j-Rbl_1;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh_1 do
    for j := 0 to 2*Rwh_1 do
      if SQRT(SQR(i-Rwh_1)+SQR(j-Rwh_1))<1.25*Rwh_1 then
        begin
          msWhX_1[kwh]:=i-Rwh_1;
          msWhY_1[kwh]:=j-Rwh_1;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;
  //Построение фильтра для сопровождения за фару
  FillChar(msWhX_2,SizeOf(msWhX_2),0);
  FillChar(msWhY_2,SizeOf(msWhX_2),0);
  FillChar(msBlX_2,SizeOf(msBlX_2),0);
  FillChar(msBlY_2,SizeOf(msBlY_2),0);
  kbl:=0;
  for I := 0 to 2*Rbl_2 do
    for j := 0 to 2*Rbl_2 do
      if
      ((SQRT(SQR(i-Rbl_2)+SQR(j-Rbl_2))>Rbl_2)AND(SQRT(SQR(i-Rbl_2)+SQR(j-Rbl_2))<Rbl_2+1))OR
         ((i=Rbl_2)AND(j=0))OR((i=Rbl_2)AND(j=2*Rbl_2))OR
         ((j=Rbl_2)AND(i=0))OR((j=Rbl_2)AND(i=2*Rbl_2))
         then
        begin
          msBlX_2[kbl]:=i-Rbl_2;
          msBlY_2[kbl]:=j-Rbl_2;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh_2 do
    for j := 0 to 2*Rwh_2 do
      if SQRT(SQR(i-Rwh_2)+SQR(j-Rwh_2))<1.25*Rwh_2 then
        begin
          msWhX_2[kwh]:=i-Rwh_2;
          msWhY_2[kwh]:=j-Rwh_2;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;
  //Построение фильтра для сопровождения за фару
  FillChar(msWhX_3,SizeOf(msWhX_3),0);
  FillChar(msWhY_3,SizeOf(msWhX_3),0);
  FillChar(msBlX_3,SizeOf(msBlX_3),0);
  FillChar(msBlY_3,SizeOf(msBlY_3),0);
  kbl:=0;
  for I := 0 to 2*Rbl_3 do
    for j := 0 to 2*Rbl_3 do
      if
      ((SQRT(SQR(i-Rbl_3)+SQR(j-Rbl_3))>Rbl_3)AND(SQRT(SQR(i-Rbl_3)+SQR(j-Rbl_3))<Rbl_3+1))OR
         ((i=Rbl_3)AND(j=0))OR((i=Rbl_3)AND(j=2*Rbl_3))OR
         ((j=Rbl_3)AND(i=0))OR((j=Rbl_3)AND(i=2*Rbl_3))
         then
        begin
          msBlX_3[kbl]:=i-Rbl_3;
          msBlY_3[kbl]:=j-Rbl_3;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh_3 do
    for j := 0 to 2*Rwh_3 do
      if SQRT(SQR(i-Rwh_3)+SQR(j-Rwh_3))<1.25*Rwh_3 then
        begin
          msWhX_3[kwh]:=i-Rwh_3;
          msWhY_3[kwh]:=j-Rwh_3;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;
  //Построение фильтра для сопровождения за фару
  FillChar(msWhX_4,SizeOf(msWhX_4),0);
  FillChar(msWhY_4,SizeOf(msWhX_4),0);
  FillChar(msBlX_4,SizeOf(msBlX_4),0);
  FillChar(msBlY_4,SizeOf(msBlY_4),0);
  kbl:=0;
  for I := 0 to 2*Rbl_4 do
    for j := 0 to 2*Rbl_4 do
      if
      ((SQRT(SQR(i-Rbl_4)+SQR(j-Rbl_4))>Rbl_4)AND(SQRT(SQR(i-Rbl_4)+SQR(j-Rbl_4))<Rbl_4+1))OR
         ((i=Rbl_4)AND(j=0))OR((i=Rbl_4)AND(j=2*Rbl_4))OR
         ((j=Rbl_4)AND(i=0))OR((j=Rbl_4)AND(i=2*Rbl_4))
         then
        begin
          msBlX_4[kbl]:=i-Rbl_4;
          msBlY_4[kbl]:=j-Rbl_4;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh_4 do
    for j := 0 to 2*Rwh_4 do
      if SQRT(SQR(i-Rwh_4)+SQR(j-Rwh_4))<1.25*Rwh_4 then
        begin
          msWhX_4[kwh]:=i-Rwh_4;
          msWhY_4[kwh]:=j-Rwh_4;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;
  //Построение фильтра для сопровождения за фару
  FillChar(msWhX_5,SizeOf(msWhX_5),0);
  FillChar(msWhY_5,SizeOf(msWhX_5),0);
  FillChar(msBlX_5,SizeOf(msBlX_5),0);
  FillChar(msBlY_5,SizeOf(msBlY_5),0);
  kbl:=0;
  for I := 0 to 2*Rbl_5 do
    for j := 0 to 2*Rbl_5 do
      if
      ((SQRT(SQR(i-Rbl_5)+SQR(j-Rbl_5))>Rbl_5)AND(SQRT(SQR(i-Rbl_5)+SQR(j-Rbl_5))<Rbl_5+1))OR
         ((i=Rbl_5)AND(j=0))OR((i=Rbl_5)AND(j=2*Rbl_5))OR
         ((j=Rbl_5)AND(i=0))OR((j=Rbl_5)AND(i=2*Rbl_5))
         then
        begin
          msBlX_5[kbl]:=i-Rbl_5;
          msBlY_5[kbl]:=j-Rbl_5;
          INC(kbl);
        end;
  kwh:=0;
  for I := 0 to 2*Rwh_5 do
    for j := 0 to 2*Rwh_5 do
      if SQRT(SQR(i-Rwh_5)+SQR(j-Rwh_5))<1.25*Rwh_5 then
        begin
          msWhX_5[kwh]:=i-Rwh_5;
          msWhY_5[kwh]:=j-Rwh_5;
          INC(kwh);
        end;
  if kwh = 0 then kwh := 1;
  //присвоение начальных значений
  Rbl:=Rbl_1;
  Rwh:=Rwh_1;
  MOVE(msWhX_1,msWhX,SizeOf(msWhX));
  MOVE(msWhY_1,msWhY,SizeOf(msWhY));
  MOVE(msBlX_1,msBlX,SizeOf(msBlX));
  MOVE(msBlY_1,msBlY,SizeOf(msBlY));
end;

procedure TAlgorithm.Execute;
var MxI,MnI:integer;
begin
 CreateFilter;
 FreeOnTerminate:=false;
 while not Terminated do
 begin
    EventAlgorithm.WaitFor(INFINITE);
    EventAlgorithm.ResetEvent;
    adX:=0;
    adY:=0;
    // выбор режима сопровождения
    cs_Auto.Enter;
    try
      cs_AlgNum:=AlgNum;
      cs_AutoSopr:=AutoSopr;
      cs_AlgSopr:=AlgSopr;
      MxI:=MaxVI;
      MnI:=MinVI;
    finally cs_Auto.Leave;end;
    if cs_AutoSopr = 1 then
    case cs_AlgSopr of
    0: case AlgNum of
      1: Algorithm001(@SOPRGrey,MxI,MnI,aDX,aDY);  //силуэт
      2: Algorithm002(@SOPRGrey,MxI,MnI,aDX,aDY);  //фара
      3: Algorithm003(@SOPRGrey,MxI,MnI,aDX,aDY);  //гак
      end;
    1: begin
         case AlgNum of
         1: begin WhiteFlag:=false; end;
         2: begin WhiteFlag:=true;  end;
         3: begin WhiteFlag:=false; end;
         end;
       Algorithm004(@SOPRGrey,MxI,MnI,aDX,aDY);
       end;
    end;
    if aDX > (sizebm shr 2) then aDX := 0;
    if aDY > (sizebm shr 2) then aDY := 0;
    cs_Auto.Enter; try viX:=viX-aDX; viY:=viY-aDY; finally cs_Auto.Leave;end;
    Synchronize(NMain.MyUpdate);
    if terminated then exit;
  end;
end;

/////////////////////////////////////////////////////////////////////////////
///                  Объектное слежение                                   ///
/////////////////////////////////////////////////////////////////////////////

//автосопровождение по силуэту
procedure Algorithm001(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer);
var
  i,j,x,y,max : integer;
  ArrByte: BufferBmp;
begin
  if fl_Change<>0 then fl_Change:=0;  
  //Делаем все ч/б
  if (MaxVI-MinVI)=0 then exit;
  for i:=0 to sizebm-1 do
    for j:=0 to sizebm-1 do
    begin
      if (p^[i,j] - MinVI)/(MaxVI-MinVI) > 0.5
        then ArrByte[i,j] := 255
        else ArrByte[i,j] := 0;
    end;
  //Расчет отклонения в сопровождении
  x:=0; y:=0; Max:=0;
  for i:=0 to sizebm-1 do
    for j:=0 to sizebm-1 do
      if ArrByte[i,j]=0 then
      begin
        x:=x+i;
        y:=y+j;
        INC(Max);
      end;
  x:=x div Max;
  y:=y div Max;
  aDX := (sizebm shr 1) - x;
  aDY := (sizebm shr 1) - y;
end;

//автосопровождение по фаре
procedure Algorithm002(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer);
var i,j,l,x,y,mx,my,sx,sy : integer;
    sDelta,mDelta,mBlack,mWhite,ybl : Single;
begin
  case fl_Change of
  1:
     case fl_Size of
     1: begin
         Rbl:=Rbl_2;
         Rwh:=Rwh_2;
         MOVE(msWhX_2,msWhX,SizeOf(msWhX));
         MOVE(msWhY_2,msWhY,SizeOf(msWhY));
         MOVE(msBlX_2,msBlX,SizeOf(msBlX));
         MOVE(msBlY_2,msBlY,SizeOf(msBlY));
         fl_Size:=2;
         AlgFilter:=2;
        end;
     2: begin
         Rbl:=Rbl_3;
         Rwh:=Rwh_3;
         MOVE(msWhX_3,msWhX,SizeOf(msWhX));
         MOVE(msWhY_3,msWhY,SizeOf(msWhY));
         MOVE(msBlX_3,msBlX,SizeOf(msBlX));
         MOVE(msBlY_3,msBlY,SizeOf(msBlY));
         AlgFilter:=3;
         fl_Size:=3;
        end;
     3: begin
         Rbl:=Rbl_4;
         Rwh:=Rwh_4;
         MOVE(msWhX_4,msWhX,SizeOf(msWhX));
         MOVE(msWhY_4,msWhY,SizeOf(msWhY));
         MOVE(msBlX_4,msBlX,SizeOf(msBlX));
         MOVE(msBlY_4,msBlY,SizeOf(msBlY));
         AlgFilter:=4;
         fl_Size:=4;
        end;
     4: begin
         Rbl:=Rbl_5;
         Rwh:=Rwh_5;
         MOVE(msWhX_5,msWhX,SizeOf(msWhX));
         MOVE(msWhY_5,msWhY,SizeOf(msWhY));
         MOVE(msBlX_5,msBlX,SizeOf(msBlX));
         MOVE(msBlY_5,msBlY,SizeOf(msBlY));
         AlgFilter:=5;
         fl_Size:=5;
        end;
     5: begin
         Rbl:=Rbl_5;
         Rwh:=Rwh_5;
         MOVE(msWhX_5,msWhX,SizeOf(msWhX));
         MOVE(msWhY_5,msWhY,SizeOf(msWhY));
         MOVE(msBlX_5,msBlX,SizeOf(msBlX));
         MOVE(msBlY_5,msBlY,SizeOf(msBlY));
         AlgFilter:=5;
         fl_Size:=5;
        end;
     end;
  2:
     case fl_Size of
     1: begin
         Rbl:=Rbl_1;
         Rwh:=Rwh_1;
         MOVE(msWhX_1,msWhX,SizeOf(msWhX));
         MOVE(msWhY_1,msWhY,SizeOf(msWhY));
         MOVE(msBlX_1,msBlX,SizeOf(msBlX));
         MOVE(msBlY_1,msBlY,SizeOf(msBlY));
         AlgFilter:=1;
         fl_Size:=1;
        end;
     2: begin
         Rbl:=Rbl_1;
         Rwh:=Rwh_1;
         MOVE(msWhX_1,msWhX,SizeOf(msWhX));
         MOVE(msWhY_1,msWhY,SizeOf(msWhY));
         MOVE(msBlX_1,msBlX,SizeOf(msBlX));
         MOVE(msBlY_1,msBlY,SizeOf(msBlY));
         AlgFilter:=1;
         fl_Size:=1;
        end;
     3: begin
          Rbl:=Rbl_2;
          Rwh:=Rwh_2;
          MOVE(msWhX_2,msWhX,SizeOf(msWhX));
          MOVE(msWhY_2,msWhY,SizeOf(msWhY));
          MOVE(msBlX_2,msBlX,SizeOf(msBlX));
          MOVE(msBlY_2,msBlY,SizeOf(msBlY));
          AlgFilter:=2;
          fl_Size:=2;
        end;
     4: begin
          Rbl:=Rbl_3;
          Rwh:=Rwh_3;
          MOVE(msWhX_3,msWhX,SizeOf(msWhX));
          MOVE(msWhY_3,msWhY,SizeOf(msWhY));
          MOVE(msBlX_3,msBlX,SizeOf(msBlX));
          MOVE(msBlY_3,msBlY,SizeOf(msBlY));
          AlgFilter:=3;
          fl_Size:=3;
        end;
     5: begin
          Rbl:=Rbl_4;
          Rwh:=Rwh_4;
          MOVE(msWhX_4,msWhX,SizeOf(msWhX));
          MOVE(msWhY_4,msWhY,SizeOf(msWhY));
          MOVE(msBlX_4,msBlX,SizeOf(msBlX));
          MOVE(msBlY_4,msBlY,SizeOf(msBlY));
          AlgFilter:=4;
          fl_Size:=4;
        end;
     end;
  end;
  fl_Change:=0;
  x:=0; y:=0; sDelta:=0;
  mx:=sizebm-Rbl-2;
  my:=sizebm-Rbl-2;
  //Расчет отклонения в сопровождении
  sx:=Rbl+2;
  sy:=Rbl+2;
  mBlack:=0;
  mWhite:=0;
  for i:=sx to mx do
    begin
      for j:=sy to my do
        begin
          for l:=0 to kwh-1 do mWhite:=mWhite+p^[i+msWhX[l],j+msWhY[l]];
          mWhite:=mWhite/kwh;
          for l:=0 to kbl-1 do mBlack:=mBlack+p^[i+msBlX[l],j+msBlY[l]];
          mBlack:=mBlack/kbl;
          mDelta:=mWhite-mBlack;
          mBlack:=0;
          mWhite:=0;

          if mDelta > sDelta then
            begin
              x:=i;
              y:=j;
              sDelta := mDelta;
            end;
        end;
    end;
  if sDelta > 10 then     //Уровень шума = 21
    begin
      aDX := (sizebm shr 1) - x;
      aDY := (sizebm shr 1) - y;
    end
    else
    begin
      aDX := 0; aDY := 0;
    end;
end;

//автосопровождение по гаку
procedure Algorithm003(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer);
var
  i,j,x,y,mx,my,sx,sy,Rx,Ry,uWhite : integer;
  dx,ddx,x1,x2,x3,x4,x5,xc1,xc2,xc3,xc4,xc5:Integer;
  dy,ddy,y1,y2,y3,y4,y5,yc1,yc2,yc3,yc4,yc5:Integer;
  sDelta,mDelta,mBlack,mWhite : Single;
  Color : TColor;
begin
  if fl_Change<>0 then fl_Change:=0;  
  x:=0; y:=0; sDelta:=0;
  aDX:=0; aDY:=0;
  Rx:=5;
  Ry:=Rx;
  mx:=sizebm;
  my:=sizebm;
  //Расчет отклонения в сопровождении
  sx:=(sizebm shr 2); mx:=sizebm-(sizebm shr 2)-1;
  sy:=(sizebm shr 2); my:=sizebm-(sizebm shr 2)-1;
  for i:=sx to mx do
  begin
    x1:=i-Rx;
    x2:=i-(Rx-1);
    x3:=i+Rx;
    x4:=i+(Rx-1);
    xc1:=i;
    xc2:=i-1;
    xc3:=i+1;
    xc4:=i-2;
    xc5:=i+2;
    for j:=sy to my do
    begin
      y1:=j-Ry;
      y2:=j-(Ry-1);
      y3:=j+Ry;
      y4:=j+(Ry-1);
      yc1:=j;
      yc2:=j-1;
      yc3:=j+1;
      yc4:=j-2;
      yc5:=j+2;

      mWhite:=(p^[x1,yc1]+p^[x2,y3]+p^[xc1,y4]+
               p^[x3,y3]+p^[x4,yc1]+p^[xc2,y4]+
               p^[xc3,y4]+p^[xc5,y4]+
               p^[x2,yc1]+p^[x3,yc1])/10.0;

      mBlack:=(p^[xc2,yc3]+p^[xc2,yc1]+p^[xc2,yc2]+
               p^[xc1,yc3]+p^[xc1,yc1]+p^[xc1,yc2]+
               p^[xc1,yc4]+p^[xc1,yc5]+
               p^[xc2,yc4]+p^[xc2,yc5])/10.0;

      mDelta:=mWhite-mBlack;
      if mDelta > sDelta then
      begin
        x:=i;
        y:=j;
        sDelta := mDelta;
      end;
    end;
  end;
  if sDelta > 40 then
  begin
    aDX := (sizebm shr 1) - x;
    aDY := (sizebm shr 1) - y;
  end;
end;

//////////////////////////////////////////////////////////////////////////////
///               АДАПТИВНЫЙ  ПОРОГ                                        ///
//////////////////////////////////////////////////////////////////////////////
procedure Algorithm004(p:pBmp;MaxVI,MinVI:Integer;var aDX:integer;var aDY:integer);
var
     m,n,k,l:integer;
     MaxX:integer; //кол-во соседних пикселей, совпадающих по значению ( для фильтра)
     Znach:byte;//один элемент SOPRGREY
     Quantity:integer;//кол-во пикселей во фрагменте, отличных от нуля
     SummX,SummY:integer;//сумма координат по X & y, для пикселей, отличных от нуля
     Noise:integer;//кол-во отфильтрованного одиночного шума
procedure Filter6;
var
     ss,m,n:integer;
     his: array [0..255] of integer;//гистограмма
     grad:integer;
begin
  FillChar(his,sizeof(his),0);  //обнуились
  for m := 0 to sizebm-1 do     // строим гистограмму
    for n := 0 to sizebm-1 do
        his [SOPRGrey[m,n]]:=his[SOPRGrey[m,n]]+1;
  //вычисление суммы числа элементов в диапазоне градаций для ведения чёрного объекта
  grad:=0;
  if WhiteFlag then //для ведения белого объекта
  begin
    for ss:=255 downto 0  do
    begin
      grad:=grad+his[ss];
      if grad>MaxP then
      begin
        porog:=ss;
        exit;
      end;
    end;
  end else   // для ведения чёрного объекта
  begin
    grad:=0;
    for ss:=0 to 255 do
    begin
      grad:=grad+his[ss];
      if grad>=MaxP then
      begin
        porog:=ss;
        exit;
      end;
    end;
  end;
end;

begin
  case fl_Change of
  1:
     case fl_Size of
     1: begin
         MaxP:=MaxP_2;
         fl_Size:=2;
         AlgFilter:=2;
        end;
     2: begin
         MaxP:=MaxP_3;
         AlgFilter:=3;
         fl_Size:=3;
        end;
     3: begin
          MaxP:=MaxP_4;
          fl_Size:=4;
          AlgFilter:=4;
        end;
     4: begin
          MaxP:=MaxP_5;
          fl_Size:=5;
          AlgFilter:=5;
        end;
     5: begin
          MaxP:=MaxP_5;
          fl_Size:=5;
          AlgFilter:=5;
        end;
     end;
  2:
     case fl_Size of
     1: begin
         MaxP:=MaxP_1;
         fl_Size:=1;
         AlgFilter:=1;
        end;
     2: begin
         MaxP:=MaxP_1;
         AlgFilter:=1;
         fl_Size:=1;
        end;
     3: begin
         MaxP:=MaxP_2;
         AlgFilter:=2;
         fl_Size:=2;
        end;
     4: begin
         MaxP:=MaxP_3;
         AlgFilter:=3;
         fl_Size:=3;
        end;
     5: begin
         MaxP:=MaxP_4;
         AlgFilter:=4;
         fl_Size:=4;
        end;
     end;
  end;
  fl_Change:=0;
  // вычисление гистограммы
  Filter6;
  // перевод в чёрно-белое в соответствии с полученным порогом
  for m := 0 to sizebm-1  do
    for n := 0 to sizebm-1  do
      case WhiteFlag of
        true:  if SOPRGrey[m,n]>=porog then TempSOPRGrey[m,n]:=255 else TempSOPRGrey[m,n]:=0;
        false: if SOPRGrey[m,n]<=porog then TempSOPRGrey[m,n]:=255 else TempSOPRGrey[m,n]:=0;
      end;
  // пространственная фильтрация 3*3 - убираем одиночные шумы
  Noise:=0;
  for m:=1 to sizebm-2  do
    for n:=1 to sizebm-2  do
      begin
        znach:=TempSOPRGrey[m,n];
        MaxX:=0;
        for k :=0 to 2 do
          for l :=0 to 2 do
            if TempSOPRGrey[m-1+k,n-1+l]=znach then INC(MaxX);
        if MaxX>=4 then TempSOPRGrey[m,n]:=znach else begin TempSOPRGrey[m,n]:=255-Znach; Inc(Noise); end;
      end;
////////////////////////////////////////////////////
  //вычисление центра тяжести  - определение vix & viy
  //Бронштейн 315
////////////////////////////////////////////////////
  Quantity:=0;
  SummX:=0;
  SummY:=0;
  for m:=0 to sizebm-1  do
    for n:=0 to sizebm-1  do
      if TempSOPRGrey[m,n]>0 then
        begin
          Inc(Quantity);
          SummX:=SummX+m;
          SummY:=SummY+n;
        end;
  if Quantity=0 then Quantity:=1;
  adx:=(sizebm shr 1)-SummX div Quantity;
  ady:=(sizebm shr 1)-SummY div Quantity;
 { //регулировка порога
  if (Quantity<(MaxP shr 1)) and (MaxP<div_8)
    then MaxP:=MaxP+10;
  if (Noise>=(MaxP div 5)) and (MaxP>div_32)
    then MaxP:=MaxP-10;
  if (Quantity>MaxP*1.3) and (MaxP>div_32)
    then MaxP:=MaxP-10;}

end;

end.
