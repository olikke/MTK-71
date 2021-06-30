unit Data;

interface
USES Windows, SysUtils, Classes, Dialogs, WinSpool,SyncObjs,Messages;

const WM_NOTIFY_MSR = WM_USER + 150;
const WM_NOTIFY_MSL = WM_USER + 151;

TYPE TAWord=Array[0..8] of Word;
     TAByte=Array[0..15]of Byte;
     TAnByte=Array [0..3] of Byte;

var  ResAWord:TAWord;
     LunAnswer:TAnByte;
     Rcd,Rck,Rcm,Rcsi,Rcv,Rcl,Rcgl:Single;
     a:byte=1;
     b:byte=0;
     c:byte=0;
     f:byte=0;
     
Type
  TRezUpdateForm=record
   fDistanse,
   fAltitude,
   fCourse:double;
   fvv,fvg:double;
   RezAnsw:cardinal;
   RezSend:cardinal;
   RWord:TAWord;
  end;

var RezUpdateForm:TRezUpdateForm;
    cs_RezUpdate:TCriticalSection;

Type
  TLunUpdateForm=record
    LunAnsw:cardinal;
    LunSend:cardinal;
    LByte:TAByte;
  end;

var LunUpdateForm:TLunUpdateForm;
    cs_LunUpdate:TCriticalSection;

function BinToInt(Value:string):Integer;
function IntToBin(Value:Cardinal;Digits:integer): string;
function IntToBin2(Value:Cardinal;Digits:integer): string;
function CheckSUM(p:Pointer;Start,Count:Word):byte;
function IntTo16(pMAS:Pointer;M:Word):String;
function  AddCode(D:DWord):word;


implementation
USES Unit1;


//обратное преобразование дополнительного двоичного кода
function AddCode(D:DWord):word;
var D1:Word;
    i:byte;
begin
     D1:=0;
     for i:=0 to 14 do
        if D and(1 shl i)>0 then D1 := D1 +(0 shl(i))
                            else D1 := D1 +(1 shl(i));
     D1:=D1+1;
     Result:=D1;
end;

function IntToBin(Value:Cardinal;Digits:integer): string;
var i: integer;
begin
  result := '';
  for i := 0 to Digits - 1 do
    if Value and (1 shl i) > 0 then result := '1' + result
                               else result := '0' + result;
end;

function IntToBin2(Value:Cardinal;Digits:integer): string;
var i: integer;
begin
  result := '';
  for i := 0 to Digits - 1 do
    if Value and (1 shl i) > 0 then result := '1' + result
                               else result := '0' + result;
end;

function BinToInt(Value:string):Integer;
var i, iValueSize: Integer;
begin
  Result := 0;
  iValueSize := Length(Value);
  for i := iValueSize downto 1 do
     if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
 end;

{Вычисление контрольной суммы}
function  CheckSUM(p:Pointer;Start,Count:Word):byte;
var i:Word;
    pb:^byte;
begin
 {$R-}
 pb:=p;
 Result:=0;
 if Start>0 then INC(pb,Start);
 For i:=Start to Count-1 do
   begin
     Result:=Result+pb^;
     INC(pb);
   end;
 {$R+}
end;

function IntTo16(pMAS:Pointer;M:Word):String;
var i:Word;
    b,bs,bm:Byte;
    pb:^Byte;
begin
  pb:=pMas; Result:='';
  for i:=1 to m do
    begin
      bs:=pb^ shr 4;
      bm:=pb^-((pb^ shr 4) shl 4);
      case bs of
         0:Result:=Result+'0';
         1:Result:=Result+'1';
         2:Result:=Result+'2';
         3:Result:=Result+'3';
         4:Result:=Result+'4';
         5:Result:=Result+'5';
         6:Result:=Result+'6';
         7:Result:=Result+'7';
         8:Result:=Result+'8';
         9:Result:=Result+'9';
        10:Result:=Result+'A';
        11:Result:=Result+'B';
        12:Result:=Result+'C';
        13:Result:=Result+'D';
        14:Result:=Result+'E';
        15:Result:=Result+'F';
      end;
      case bm of
         0:Result:=Result+'0';
         1:Result:=Result+'1';
         2:Result:=Result+'2';
         3:Result:=Result+'3';
         4:Result:=Result+'4';
         5:Result:=Result+'5';
         6:Result:=Result+'6';
         7:Result:=Result+'7';
         8:Result:=Result+'8';
         9:Result:=Result+'9';
        10:Result:=Result+'A';
        11:Result:=Result+'B';
        12:Result:=Result+'C';
        13:Result:=Result+'D';
        14:Result:=Result+'E';
        15:Result:=Result+'F';
      end;
      INC(pb);
    end;       //Результат перепутан!
end;

end.
