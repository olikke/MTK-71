unit face3401;

interface
USES SysUtils , Global,math,DataCalc;

  type
 // данные для кодирования и передачи
  tmessage = record
    // линия курса посадки
    n1x,
    // середина зеленой зоны
    n1y : integer;
    // 2 желтые, 2 зеленые, 2 красные вертикальные метки (отклонение от n1y)
    nyl : array [0..5] of shortint;
    // индикатор бокового отклонения ЛАК от заданной глиссады
    n5x,n5y,n5v : integer;
    // индикатор дальности ЛАК
    n6x,n6y : integer;
    //дальность
    n6v:double;
    // рамка захвата
    n8x, n8y, n8w, n8h : integer;
    // текст
    ch: array[0..19] of string[8];
    //Время от Ладоги
    dt:TDateTime;
  end;

  // пакет передаваемый на микшер
  tpacket = array [0..186] of byte;
  var msg3401:TPacket;
 const
   Koef : single = 720/1536;


   procedure Encode3401;
   procedure Zerode3401;

   var Mes:TMessage;
   GlobalCount:int64=0;

implementation

procedure Zerode3401;
var stt:string;
     ii:integer;
function lformat( name, value : string):string;
var sp : integer;
begin
  sp:=8-length(name)-length(value);
  if sp>0 then result:=name+copy('        ',1,sp)+value
          else result:=name+value;
end;
function btos(val:boolean;const falseval,trueval:string):string;
begin
  if val then result := trueval else result := falseval;
end;
var   
       i,h : integer;
       csum : byte;
       ch: array[0..19] of string[8];
begin
    INC(GlobalCount);
    h:=high(msg3401);
    msg3401[0]:=$FF;
    msg3401[1]:=$55;
    msg3401[2]:=$AA;
    msg3401[3]:=0;
    msg3401[4]:=180 and $FF;
    ii:= Round((4-ShipData.fAlphaST)/vt+288) div 2;
    msg3401[5]:=ii and $FF;
		msg3401[6]:=(ii shr 7) and $2;
    //при неизвестной дальности нарисуем цветовые сектора для бесконечности,
    //т.е. при совпадении с луной
    msg3401[7] :=239;
    msg3401[8] :=253;
    msg3401[9] :=249;
    msg3401[10]:=7;
    msg3401[11]:=3;
    msg3401[12]:=17;
    msg3401[13]:=46;
    msg3401[14]:=37;
    msg3401[15]:=0;
    msg3401[16]:=0;
    msg3401[17]:=46;
    msg3401[18]:=37;
    msg3401[19]:=0;
    msg3401[20]:=0;
    msg3401[21]:=0;
    msg3401[22]:=0;
    msg3401[23]:=0;
    msg3401[24]:=0;
    msg3401[25]:=0;
    //ПРЛК
        if ShipData.re then
        begin
          if ShipData.fAccomp=1 then
          begin
            //признак сопровождения ЛАК
            ch[0] := lformat('RACS '+IntTostr(ShipData.fNPRLK),btos(ShipData.fAccomp=1,'NT','YT'));
            //дальность до ЛАК измеренная ПРЛК
            if MK1=1.00 then ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,0))
                        else ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,2));
           { if SI then ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,0));
                 // else ch[1] := lformat('D ',FloatToStrF(ShipData.fDist/mile,ffFixed,6,1));}
            //угол курса (градус)
            ch[2] := lformat('RB ',FloatToStrF(ShipData.fCourse,ffFixed,5,1));
            //угол места (градус)
            ch[3] := lformat('EA ',FloatToStrF(ShipData.fAlt,ffFixed,3,1));
            //бортовой номер ЛАК
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            //скорость сближения (км/час)
            if ShipData.fSpeedLA>0 then ch[5] := lformat('ASP+',FloatToStrF(ShipData.fSpeedLA,ffFixed,4,0))
                                   else ch[5] := lformat('ASP', FloatToStrF(ShipData.fSpeedLA,ffFixed,4,0));
            //вертикальная скорость (м/сек)
            if ShipData.fSpeedVr>0 then ch[6] := lformat('VSP+',FloatToStrF(ShipData.fSpeedVr,ffFixed,4,0))
                                   else ch[6] := lformat('VSP', FloatToStrF(ShipData.fSpeedVr,ffFixed,4,0));
          end  else
          begin
            //признак сопровождения ЛАК
            ch[0] := lformat('RACS '+IntTostr(ShipData.fNPRLK),btos(ShipData.fAccomp=1,'NT','YT'));
            ch[1] := lformat('D   ','*');
            ch[2] := lformat('RB  ','*');
            ch[3] := lformat('EA  ','*');
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            ch[5] := lformat('ASP','*');
            ch[6] := lformat('VSP','*');
          end
        end else
        begin
            //отсутствие ПРЛК
            ch[0] := lformat('RACS','NO');
            ch[1] := lformat('D   ','*');
            ch[2] := lformat('RB  ','*');
            ch[3] := lformat('EA  ','*');
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            ch[5] := lformat('ASP','*');
            ch[6] := lformat('VSP','*');
        end;
    ch[7] := '';
    case ShipData.fTrack of
      1: ch[8] := 'DIS   RS';
      0: ch[8] := 'DIS   TV';
    end;
    // числовое значение заданного угла возвышения глиссады (град/мин)
   { if FRAC(ShipData.fGlissad)<>0 then ch[9] := lformat('GP ', IntToStr(TRUNC(ShipData.fGlissad))+chr($B0)+IntToStr((TRUNC(FRAC(ShipData.fGlissad)*60)))+chr($27))
                                  else ch[9] := lformat('GP ', IntToStr(TRUNC(ShipData.fGlissad))+chr($B0)+'00'+chr($27)); }
    ch[9] := lformat('GP ', st_Alpha);
    ch[10]:= lformat('Bt', st_Betta);
    // Список КУ, выбранных для наблюдения за заходящими на посадку ЛАК
    case  ShipData.fku and $0F of
    0: if (ShipData.fKU shr 4)=8 then ch[11] := 'C 1 2 4 ' else
                                      ch[11] := 'C 1 3 4 ';
    1: if (ShipData.fKU shr 4)=8 then ch[11] := 'C   2 4 ' else
                                      ch[11] := 'C   3 4 ';
    2:                                ch[11] := 'C 1   4 ';
    3: if (ShipData.fKU shr 4)=8 then ch[11] := 'C 1 2   ' else
                                      ch[11] := 'C 1 3   ';
    end;
    if not ShipData.fLadErr then
    begin
        if ShipData.Teta>0 then ch[12]:=LFormat('R',FloatToStrF(ShipData.Teta,ffFixed,3,2)+'S') else
        if ShipData.Teta<0 then ch[12]:=LFormat('R',FloatToStrF(ABS(ShipData.Teta),ffFixed,3,2)+'P') else
        ch[12]:=LFormat('R','0');
        if ShipData.Psi>0 then ch[13]:=LFormat('P','+'+FloatToStrF(ShipData.Psi,ffFixed,3,2)) else
        if ShipData.Psi<0 then ch[13]:=LFormat('P','-'+FloatToStrF(ABS(ShipData.Psi),ffFixed,3,2)) else
        ch[13]:=LFormat('P','0');
        ch[14]:=LFormat('CO',FloatToStrF(ShipData.Course,ffFixed,3,1));
        ch[15]:=LFormat('SPD',FloatToStrF(ShipData.VL,ffFixed,3,1));
    end else
    begin
       ch[12]:=LFormat('R','Er');
       ch[13]:=LFormat('P','Er');
       ch[14]:=LFormat('CO','Er');
       ch[15]:=LFormat('SPD','Er');
    end;
    ch[16] := FormatDateTime('hh:nn:ss',now);
    ch[17] := FormatDateTime('dd/mm/yy',now);
    stt:='   ';
    if ShipData.fPC  then  if  ShipData.fPCVisible then stt:='PC ';
    if ShipData.fPCH then  stt:='PCH';
    if flag_night then stt:=stt+' N' else stt:=stt+' D';
    case ShipData.fVRD of
    0:ch[18]:=lformat(stt,'');
    1:ch[18]:=lformat(stt,'VR');
    end;
    if ABS(TRUNC(FRAC(ShipData.fErrorST)*60))<10 then
    stt:='0'+IntToStr(ABS(TRUNC(FRAC(ShipData.fErrorST)*60))) else  stt:=IntToStr(ABS(TRUNC(FRAC(ShipData.fErrorST)*60)));
    if ShipData.lu then
    if ShipData.fErrorST>=0 then
                ch[19] := lformat('OS', IntToStr(ABS(TRUNC(ShipData.fErrorST)))+chr($B0)+stt+chr($27)) else
                ch[19] := lformat('OS', IntToStr((TRUNC(ShipData.fErrorST)))+chr($B0)+stt+chr($27)) else
                ch[19] := Lformat('OS','0'+chr($B0)+'00'+chr($27));
    for i:=0 to 8*20-1 do
        msg3401[26+i]:=ord(ch[i div 8][i mod 8+1]);
    csum:=0;
    for i:=3 to h-1 do
      csum:=csum+msg3401[i];
    msg3401[h]:=csum;
end;

procedure Encode3401;
var
    i,h : integer;
    csum : byte;
    kk:  int64;
    stt:string;
    k:string;
    ii:integer;
function btos(val:boolean;const falseval,trueval:string):string;
begin
  if val then result := trueval else result := falseval;
end;

function lformat( name, value : string):string;
var sp : integer;
begin
  sp:=8-length(name)-length(value);
  if sp>0 then result:=name+copy('        ',1,sp)+value
          else result:=name+value;
end;
begin
  INC(GlobalCount);
  with Mes do
  begin
    // линия курса посадки
    n1x := 180;
      begin
        // середина зеленой зоны
        n1y :=ShipData.fGz;    //сама не рисуется, но относительно неё строятся все зоны
        // 2 желтые, 2 зеленые, 2 красные вертикальные метки (отклонение от n1y)
        nyl[0] :=ShipData.fUpY;
        nyl[1] :=ShipData.fDownY;
        nyl[2] :=ShipData.fUpZ;
        nyl[3] :=ShipData.fDownZ;
        nyl[4] :=ShipData.fUpR;
        nyl[5] :=ShipData.fDownR;
      end;
      // индикатор бокового отклонения ЛАК от заданной глиссады
      if (AutoSopr=1) or (AutoSopr=2) then
      begin
        if ShipData.fHg<0 then  n5x:=15 else n5x:=28;       //горизонтальная координата смещения
        n5y := 12;                                          //вертикальная координата смещения
        n5v := abs(TRUNC(ShipData.fHg));                    //смещение
      end else
      begin
        n5x:=0; n5y:=0; n5v:=0;
      end;
      // индикатор дальности ЛАК
      if ShipData.fflag then
      begin
        n6x := 20;                          //горизонтальная координата
        n6y := 1;                           //вертикальная координата
        n6v := ShipData.fDTP;               //дальность
      end else
      begin
        n6x:=46;
        n6y:=37;
        n6v:=ShipData.fDTP;
      end;
      // рамка захвата
      if (AutoSopr=1) or (AutoSopr=2) then
      begin
        n8w := 0; n8h := 0; n8x := ShipData.fx div 2 -6; n8y := ShipData.fy div 2;
      end else begin n8w:=0; n8h:=0; n8x:=0; n8Y:=0; end;
      dt :=ShipData.fDate;
     // текст
      begin
    //ПРЛК
        if ShipData.re then
        begin
          if ShipData.fAccomp=1 then
          begin
            //признак сопровождения ЛАК
            ch[0] := lformat('RACS '+IntTostr(ShipData.fNPRLK),btos(ShipData.fAccomp=1,'NT','YT'));
            //дальность до ЛАК измеренная ПРЛК
            if MK1=1.00 then ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,0))
                        else ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,2));
            {if SI then ch[1] := lformat('D ',FloatToStrF(ShipData.fDist,ffFixed,6,0));
                //  else ch[1] := lformat('D ',FloatToStrF(ShipData.fDist/mile,ffFixed,6,1));}
            //угол курса (градус)
            ch[2] := lformat('RB ',FloatToStrF(ShipData.fCourse,ffFixed,5,1));
            //угол места (градус)
            ch[3] := lformat('EA ',FloatToStrF(ShipData.fAlt,ffFixed,3,1));
            //бортовой номер ЛАК
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            //скорость сближения (км/час)
            if ShipData.fSpeedLA>0 then ch[5] := lformat('ASP+',FloatToStrF(ShipData.fSpeedLA,ffFixed,4,0))
                                   else ch[5] := lformat('ASP', FloatToStrF(ShipData.fSpeedLA,ffFixed,4,0));
            //вертикальная скорость (м/сек)
            if ShipData.fSpeedVr>0 then ch[6] := lformat('VSP+',FloatToStrF(ShipData.fSpeedVr,ffFixed,4,0))
                                   else ch[6] := lformat('VSP', FloatToStrF(ShipData.fSpeedVr,ffFixed,4,0));
          end  else
          begin
            //признак сопровождения ЛАК
            ch[0] := lformat('RACS '+IntTostr(ShipData.fNPRLK),btos(ShipData.fAccomp=1,'NT','YT'));
            ch[1] := lformat('D   ','*');
            ch[2] := lformat('RB  ','*');
            ch[3] := lformat('EA  ','*');
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            ch[5] := lformat('ASP','*');
            ch[6] := lformat('VSP','*');
          end
        end else
        begin
            //отсутствие ПРЛК
            ch[0] := lformat('RACS','NO');
            ch[1] := lformat('D   ','*');
            ch[2] := lformat('RB  ','*');
            ch[3] := lformat('EA  ','*');
            ch[4] := lformat('AVNO',IntTostr(ShipData.fNomLa));
            ch[5] := lformat('ASP','*');
            ch[6] := lformat('VSP','*');
        end;
        // вертикальное отклонение ЛАК от заданной гилссады в метрах 'A' - выше
        if (ShipData.fHv>0) then  k:='A  ' else  k:='B  ';
        if ShipData.fflag then
        if abs(ShipData.fHv)<10 then ch[7]:='  V00'+IntToStr(Round(abs(ShipData.fHv)))+k else
        if abs(ShipData.fHv)<100 then ch[7]:='  V0'+IntToStr(Round(abs(ShipData.fHv)))+k else
        if abs(ShipData.fHv)<1000 then ch[7]:='  V'+IntToStr(Round(abs(ShipData.fHv)))+k else
                                        ch[7]:='  V---'+k else
                                         ch[7]:='';
        // Источник дальности
        case ShipData.fTrack of
         1: ch[8] := 'DIS   RS';
         0: ch[8] := 'DIS   TV';
        end;
        // числовое значение заданного угла возвышения глиссады (град/мин)
       { if FRAC(ShipData.fGlissad)<>0 then  ch[9] := lformat('GP ', IntToStr(TRUNC(ShipData.fGlissad))+chr($B0)+IntToStr((TRUNC(FRAC(ShipData.fGlissad)*60)))+chr($27))
                                      else  ch[9] := lformat('GP ', IntToStr(TRUNC(ShipData.fGlissad))+chr($B0)+'00'+chr($27));    }
        ch[9] := lformat('GP ', st_Alpha);
        // буквенное обозначение характерной точки ЛАК, назначенной на сопровождение
        ch[10]:= lformat('Bt', st_Betta);
        // Список КУ, выбранных для наблюдения за заходящими на посадку ЛАК
        case  ShipData.fku and $0F of
          0: if (ShipData.fKU shr 4)=8 then ch[11] := 'C 1 2 4 ' else
                                      ch[11] := 'C 1 3 4 ';
          1: if (ShipData.fKU shr 4)=8 then ch[11] := 'C   2 4 ' else
                                      ch[11] := 'C   3 4 ';
          2:                          ch[11] := 'C 1   4 ';
          3: if (ShipData.fKU shr 4)=8 then ch[11] := 'C 1 2   ' else
                                      ch[11] := 'C 1 3   ';
        end;
        if not ShipData.fLadErr then
        begin
          if ShipData.Teta>0 then ch[12]:=LFormat('R',FloatToStrF(ShipData.Teta,ffFixed,3,2)+'S') else
          if ShipData.Teta<0 then ch[12]:=LFormat('R',FloatToStrF(ABS(ShipData.Teta),ffFixed,3,2)+'P') else
          ch[12]:=LFormat('R','0');
          if ShipData.Psi>0 then ch[13]:=LFormat('P','+'+FloatToStrF(ShipData.Psi,ffFixed,3,2)) else
          if ShipData.Psi<0 then ch[13]:=LFormat('P','-'+FloatToStrF(ABS(ShipData.Psi),ffFixed,3,2)) else
          ch[13]:=LFormat('P','0');
          ch[14]:=LFormat('CO',FloatToStrF(ShipData.Course,ffFixed,3,1));
          ch[15]:=LFormat('SPD',FloatToStrF(ShipData.VL,ffFixed,3,1));
        end else
        begin
          ch[12]:=LFormat('R','Er');
          ch[13]:=LFormat('P','Er');
          ch[14]:=LFormat('CO','Er');
          ch[15]:=LFormat('SPD','Er');
        end;
        // текущее время
        ch[16] := FormatDateTime('hh:nn:ss',ShipData.fDate);
        // текущая дата
        ch[17] := FormatDateTime('dd/mm/yy',ShipData.fDate);
        // в Компенсация качки (PC), признак включения режима видеозаписи (VR)
        stt:='   ';
        if ShipData.fPC  then  if  ShipData.fPCVisible then stt:='PC ';
        if ShipData.fPCH then  stt:='PCH';
        if flag_night then stt:=stt+' N' else stt:=stt+' D';
        case ShipData.fVRD of
          0:ch[18]:=lformat(stt,'');
          1:ch[18]:=lformat(stt,'VR');
        end;
        // ошибка стабилизации глиссады Луной
        if ABS(round(FRAC(ShipData.fErrorST)*60))<10 then
        stt:='0'+IntToStr(ABS(round(FRAC(ShipData.fErrorST)*60))) else  stt:=IntToStr(ABS(round(FRAC(ShipData.fErrorST)*60)));
        if ShipData.lu then
        if ShipData.fErrorST>=0 then
                ch[19] := lformat('OS', IntToStr(ABS(TRUNC(ShipData.fErrorST)))+chr($B0)+stt+chr($27)) else
                ch[19] := lformat('OS', IntToStr((TRUNC(ShipData.fErrorST)))+chr($B0)+stt+chr($27)) else
                ch[19] := Lformat('OS','0'+chr($B0)+'00'+chr($27));
      end;
  end;
    h:=high(msg3401); csum:=0;
    msg3401[0]:=$FF;
    msg3401[1]:=$55;
    msg3401[2]:=$AA;
    msg3401[3]:=0;
    with Mes do
    begin
		{
		- 2-й байт	- 8 младших бит координаты X линии курса посадки (координата X определяется от левого края активной части кадра вдоль строки и изменяется от 0 до 360);
		- 3-й байт	- 8 младших бит координаты Y середины зеленой зоны (координата Y определяется от верхнего края активной части кадра изменяется от 0 до 288);
		- 4-й байт	0-й бит - старший бит координаты X линии курса посадки;
			1-й бит - старший бит координаты Y середины зеленой зоны;}
      if ShipData.fflag then
      begin
        if (ShipData.fTrack=1) and ((ShipData.fAccomp<>1) or  not ShipData.re ) then
        begin
          msg3401[4]:=180 and $FF;
          ii:= Round((4-ShipData.fAlphaST)/vt+288) div 2;
          msg3401[5]:=ii and $FF;
	       	msg3401[6]:=(ii shr 7) and $2;
          msg3401[7] :=239;
          msg3401[8] :=253;
          msg3401[9] :=249;
          msg3401[10] :=7;
          msg3401[11] :=3;
          msg3401[12] :=17;
        end else
        begin
          msg3401[4]:=n1x and $FF;
	 		    msg3401[5]:=n1y and $FF;
			    msg3401[6]:=(n1x shr 8) and $1 + (n1y shr 7) and $2;
          for i:=0 to 5 do msg3401[7+i]:=nyl[i];
        end;
      end else
      begin
          msg3401[4]:=180 and $FF;
          ii:= Round((4-ShipData.fAlphaST)/vt+288) div 2;
          msg3401[5]:=ii and $FF;
      		msg3401[6]:=(ii shr 7) and $2;
          msg3401[7] :=239;
          msg3401[8] :=253;
          msg3401[9] :=249;
          msg3401[10] :=7;
          msg3401[11] :=3;
          msg3401[12] :=17;
      end;

		{- 11-й байт	- Положение по координате X индикатора бокового отклонения ЛАК кодируется в сетке знакомест 8*8 и может принимать значение от 8 до 45)
		- 12-й байт	- Положение по координате Y индикатора дальности до ЛАК расчетной точки посадки (кодируется в сетке знакомест 8*8 и может принимать значение от 0 до 36)
		- 13-й байт	- Закодированное значение бокового отклонения.
			0..3 биты - цифра единиц,
			4..7 биты - цифра десятков}
      if ShipData.fflag then
      begin
        msg3401[13]:=n5x;
        if n5v<99 then
        begin
          //  15 ст, 15 мл, 16 ст, 16 мл
          // два старших бита - длина отклонения $00=2цифры, $40=3, $С0=4
          msg3401[14]:=n5y and $3F + $40;
         //12 = 'L', 13 = 'R'
          if n5x=15 then msg3401[16]:=12 shl 4
                    else msg3401[16]:=13 shl 4;
          msg3401[15]:=((n5v div 10) mod 10) shl 4 + (n5v mod 10);
        end else
        if (n5v>99) and (n5v<999) then
        begin
          msg3401[14]:=n5y and $3F + $C0;
          if n5x=15 then msg3401[16]:=(n5v mod 10) shl 4 +12
                    else msg3401[16]:=(n5v mod 10) shl 4 +13;
          msg3401[15]:=((n5v div 100) mod 10) shl 4 + ((n5v div 10) mod 10) ;
        end
      end else
      begin
        msg3401[13]:=46;
        msg3401[14]:=37;
        msg3401[15]:=0;
        msg3401[16]:=0;
      end;

		{- 14-й байт	- Положение по координате X индикатора дальности до ЛАК расчетной точки посадки (кодируется в сетке знакомест и может принимать значение от 8 до 45)
		- 15-й байт	- Положение по координате Y индикатора дальности до ЛАК расчетной точки посадки (кодируется в сетке знакомест и может принимать значение от 0 до 36)
		- 16-й байт	- Младшая часть закодированного значения дальности до ЛАК
			0..3 биты - цифра единиц,
			4..7 биты - цифра десятков
		- 17-й байт	- Старшая часть закодированного значения дальности до ЛАК
			0..3 биты - цифра сотен,
			4..7 биты - цифра тысяч }
			msg3401[17]:=n6x; msg3401[18]:=n6y;
      kk:=Round(n6v);
      if SI then
      begin
       { msg3401[20]:=((kk div 1000) mod 10) shl 4 +((kk div 100) mod 10);
        msg3401[19]:= ((kk div 10) mod 10) shl 4 +  ((kk div 1) mod 10); }
        msg3401[20]:=((kk div 10000) mod 10) shl 4 +((kk div 1000) mod 10);
        msg3401[19]:=((kk div 100) mod 10) shl 4 +  ((kk div 10) mod 10);
        msg3401[24]:=$F0+((kk div 1) mod 10);

      end else
      begin
        begin
          msg3401[24]:=$F0 + ((kk*1000)mod 10 );
		 	    msg3401[19]:=(TRUNC(n6v * 10) mod 10) shl 4 + (TRUNC(n6v * 100) mod 10);
		 	    msg3401[20]:=TRUNC(n6v) shl 4 + $B;
        end;
      end;

		{- 18-й байт	- 8 младших бит координаты X (левая граница маркера сопровождения);
		- 19-й байт	- 8 младших бит координаты Y (верхняя граница маркера сопровождения);
		- 20-й байт	0-й бит - старший бит координаты X маркера сопровождения;
			1-й бит - старший бит координаты Y маркера сопровождения;
		- 21-й байт	- ширина маркера сопровождения;
		- 22-й байт	- высота маркера сопровождения;}
			msg3401[21]:=n8x and $FF;
			msg3401[22]:=n8y and $FF;
			msg3401[23]:=(n8x shr 8) and $1 + (n8y shr 7) and $2;
	 //		msg3401[24]:=msg3401[24] +  n8w and $FF;
      msg3401[25]:=n8h and $FF;



      for i:=0 to 8*20-1 do
        msg3401[26+i]:=ord(ch[i div 8][i mod 8+1]);
    end;
    for i:=3 to h-1 do
      csum:=csum+msg3401[i];
    msg3401[h]:=csum;
end;

end.
