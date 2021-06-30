unit BDRecord;
//описание типов файлов БД

interface

type
  T7210 = record
    // используется удалённый пост или нет
    Use     : boolean;
    //имя поста
    Name    : string[50];
    //аббривеатура
    SName   : string[10];
    //позиция на Э6
    Position: string[10];
  end;

type
  TKUr  = record
    // используется КУ или нет
    Use     :boolean;
    // имя КУ
    Name    :string[10];
    // название позиции КУ
    PName   :string[15];
    // усиление У
    YCG     :integer;
    // коррекция У
    YCE     :integer;
    // усиление С
    CCG     :integer;
    // коррекция С
    CCE     :integer;
    //position E6
    Position:string[10];
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

  TEM2437 = record
    Correction :array [1..4] of TChannelCorr;
  end;

var
  f72101    :array [0..13] of T7210;
  f72102    :array [0..13] of T7210;
  fKU       :array [1..8]  of TKUr;
  fEM2437   :array [1..4]  of TEM2437;
  fKUParam  :TKUParam;

implementation

end.
