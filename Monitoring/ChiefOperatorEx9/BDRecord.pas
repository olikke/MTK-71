unit BDRecord;
//???????? ????? ?????? ??

interface

type
  Tb7210 = record
    // ???????????? ????????? ???? ??? ???
    Use     : boolean;
    //??? ?????
    Name    : string[50];
    //
    SName   : string[10];
    //??????? ?? ?6
    Position: string[10];
  end;

type
  TKUr  = record
    // ???????????? ?? ??? ???
    Use     :boolean;
    // ??? ??
    Name    :string[10];
    // ???????? ??????? ??
    PName   :string[15];
    // ???????? ?
    YCG     :integer;
    // ????????? ?
    YCE     :integer;
    // ???????? ?
    CCG     :integer;
    // ????????? ?
    CCE     :integer;
    //??????? ?? ?6
    Position: string[10];
  end;

  type
  TKUParam = record
    Umin    :single;
    Umax    :single;
    Tmin1   :integer;
    Tmin2   :integer;
    Tmax1   :integer;
    Tmax2   :integer;
    Nmin    :integer;
    Nmax    :integer;
    H1      :integer;
    H2      :integer;
  end;

  type
  TChannelCorr = record
    GainFactor   :integer;
    Equalization :integer;
  end;

  T2437corr = array [1..4] of TChannelCorr;

  type
  Trec = record
    FactNumber:cardinal;
    TestEntry :byte;
    EmptyEntry: array [0..16] of byte;
  end;

  type
  T7212Record = record
    first  :TRec;
    second :TRec;
  end;

  var n7212:T7212Record;

type
    TPositionCoor = record pLEFT:integer; pTop:integer; end;

const
  PositionMatrixKU: array [1..8] of TPositionCoor =
                     ((pLeft:10;pTop:5),
                      (pLeft:105;pTop:5),
                      (pLeft:10;pTop:45),
                      (pLeft:105;pTop:45),
                      (pLeft:10;pTop:85),
                      (pLeft:105;pTop:85),
                      (pLeft:10;pTop:125),
                      (pLeft:105;pTop:125));

  PositionMonitoring:array [1..10] of TPositionCoor =
                     ((pLeft:10;pTop:5),
                      (pLeft:10;pTop:45),
                      (pLeft:10;pTop:85),
                      (pLeft:10;pTop:125),
                      (pLeft:10;pTop:165),
                      (pLeft:10;pTop:205),
                      (pLeft:10;pTop:245),
                      (pLeft:10;pTop:285),
                      (pLeft:10;pTop:325),
                      (pLeft:10;pTop:365));
  PositionVRD:array [1..10] of TPositionCoor =
                     ((pLeft:16 ;pTop:30),
                      (pLeft:230;pTop:30),
                      (pLeft:16 ;pTop:70),
                      (pLeft:230;pTop:70),
                      (pLeft:16 ;pTop:110),
                      (pLeft:230;pTop:110),
                      (pLeft:16 ;pTop:150),
                      (pLeft:230;pTop:150),
                      (pLeft:16 ;pTop:190),
                      (pLeft:230;pTop:190));

    PositionMatrixP: array [0..27] of TpositionCoor =
                     ((pLeft:10;pTop:5),
                      (pLeft:105;pTop:5),
                      (pLeft:10;pTop:40),
                      (pLeft:105;pTop:40),
                      (pLeft:10;pTop:75),
                      (pLeft:105;pTop:75),
                      (pLeft:10;pTop:110),
                      (pLeft:105;pTop:110),
                      (pLeft:10;pTop:145),
                      (pLeft:105;pTop:145),
                      (pLeft:10;pTop:180),
                      (pLeft:105;pTop:180),
                      (pLeft:10;pTop:215),
                      (pLeft:105;pTop:215),
                      (pLeft:10;pTop:250),
                      (pLeft:105;pTop:250),
                      (pLeft:10;pTop:285),
                      (pLeft:105;pTop:285),
                      (pLeft:10;pTop:320),
                      (pLeft:105;pTop:320),
                      (pLeft:10;pTop:355),
                      (pLeft:105;pTop:355),
                      (pLeft:10;pTop:390),
                      (pLeft:105;pTop:390),
                      (pLeft:10;pTop:425),
                      (pLeft:105;pTop:425),
                      (pLeft:10;pTop:460),
                      (pLeft:105;pTop:460));

var
  bd7210_1   :array [0..13] of Tb7210;
  bd7210_2   :array [0..13] of Tb7210;
  bdKU       :array [1..8]  of TKUr;
  bd2437     :array [1..4]  of T2437Corr;
  bdKUParam  :TKUParam;

implementation

end.
