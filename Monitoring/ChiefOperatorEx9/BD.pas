unit BD;

interface

uses Main,Graphics,BDRecord,SysUtils,ExtCtrls,MyPanel,Buttons,StdCtrls,XiButton,Global,Dialogs,Forms;

  function ReadDataBase:boolean;
  function ReadData7210:boolean;
  function ReadDataKU:boolean;
  function ReadDataKUParam:boolean;
  function ReadData2437:boolean;
  procedure PaintKUMain;
  procedure PaintKUMonitoring;
  procedure PaintKUDataExchange;
  procedure PaintKUVideoSystem;
  procedure Paint2437VideoSystem;
  procedure PaintPostMain;
  procedure PaintPostDataExchange;
  procedure PaintPostVideoSystem;
  procedure Write7212;
  procedure Read7212;

implementation

procedure Write7212;
var F: file of T7212Record;
begin
  AssignFile(F, ExtractFilePath(ParamStr(0))+'7212.mtk');
  Rewrite(F);
  try
    write(f,n7212);
  finally
    CloseFile(f);
  end;
end;

procedure Read7212;
var f:file of T7212Record;
begin
  n7212.first.FactNumber   :=0;
  n7212.first.TestEntry    :=1;
  FillChar(n7212.first.EmptyEntry,0,SizeOf(n7212.first.EmptyEntry));
  n7212.first.EmptyEntry[0]:=13;
  n7212.first.EmptyEntry[1]:=14;
  n7212.first.EmptyEntry[2]:=15;
  n7212.second.FactNumber  :=0;
  n7212.second.TestEntry    :=1;
  FillChar(n7212.second.EmptyEntry,0,SizeOf(n7212.second.EmptyEntry));
  n7212.second.EmptyEntry[0]:=13;
  n7212.second.EmptyEntry[1]:=14;
  n7212.second.EmptyEntry[2]:=15;
  if not FileExists(ExtractFilePath(ParamStr(0))+'7212.mtk') then exit;
  AssignFile(F, ExtractFilePath(ParamStr(0))+'7212.mtk');
  Reset(F);
  try
    Read (F, n7212);
  finally
    closeFile(F);
  end;
end;

function ReadDataBase:boolean;
begin
  result:=false;
  read7212;
  if ReadData7210 then
  if ReadDataKU then
  if ReadDataKUParam then
  if ReadData2437 then result:=true;
  fMain.KUPanel.Top   :=fMain.WSCPanel.Top+fMain.WSCPanel.Height+5;
  fMain.MPanel.Top    :=fMain.KUPanel.Top+fMain.KUPanel.Height+5;
  fMain.NPanel.Top    :=fMain.MPanel.Top+fMain.MPanel.Height+5;
end;

function ReadDataKU:boolean;
var F: file of TKUr;
    i:integer;
begin
  result:=FileExists(ExtractFilePath(ParamStr(0))+'KU.mtk');
  if not result then exit;
  AssignFile(F, ExtractFilePath(ParamStr(0))+'KU.mtk');
  Reset(F);
  try
    for i:= 1 to 8 do
    Read (F, bdKU[i]);
  finally
    CloseFile(F);
  end;
  PaintKUMain;
  PaintKUMonitoring;
  PaintKUDataExchange;
  PaintKUVideoSystem;
  Paint2437VideoSystem;
end;

function ReadDataKUParam:boolean;
var F:file of TKUParam;
begin
  result:=FileExists(ExtractFilePath(ParamStr(0))+'KUParam.mtk');
  if not result then exit;  
  AssignFile(F,ExtractFilePath(ParamStr(0))+'KUParam.mtk');
  Reset(F);
  try
    Read(F,bdKUParam);
  finally
    CloseFile(F);
  end;
end;

function ReadData2437:boolean;
var F: file of T2437Corr;
    i,j: integer;
begin
  result:=true;
  if FileExists(ExtractFilePath(ParamStr(0))+'EM2437.mtk')  then
  begin
    AssignFile(F, ExtractFilePath(ParamStr(0))+'EM2437.mtk');
    Reset(F);
    try
      for i:= 1 to 4 do Read (F, bd2437[i]);
    finally
      CloseFile(F);
    end;
  end else result:=false;
end;

procedure PaintKUMain;
var i:integer;
    NEXT:integer;
begin
  NEXT:=1;
  for i:=1 to 8 do
  begin
  if fMain.FindComponent('kb'+IntToStr(i))<>nil then
    begin
      TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Visible:=bdKU[i].Use;
      if bdKU[i].Use then
      begin
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Caption   :=bdKU[i].Name;
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).ShowHint  :=true;
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Hint      :=bdKU[i].Name+' ('+ bdKU[i].PName+')'+#10#13+'TM-2221-2 '+TRIM(bdKU[i].Position);
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Left      :=PositionMatrixKU[NEXT].pLEFT;
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Top       :=PositionMatrixKU[NEXT].pTop;
        TMyPanel(fMain.FindComponent('kb'+IntToStr(i))).Width      :=90;
        INC(NEXT);
      end;
    end;
    if bdKU[i].Use then
      if fMain.FindComponent('kb'+IntToStr(i))<>nil then
         TSpeedButton(fMain.FindComponent('kb'+IntToStr(i))).Caption  :='   '+TRIM(bdKU[i].Name);
  end;
  fMain.KUPanel.Height:=70+PositionMatrixKU[Next-1].pTop;
end;

procedure PaintKUMonitoring;
var i,j:integer;
    NEXT:integer;
    Button:TMyPanel;
    BlaBlaBla:string[17];
    KUCh:byte;
const nn='  ';
begin
  NEXT:=1;
  Button:=fMain.FindComponent('ch1') as TMyPanel;
  if Button<>nil then
  begin
    Button.TextPosition:=tpLeft;
    Button.Caption :=nn+'ch1'+'  '+'LANDING';
    Button.ShowHint:=true;
    Button.Hint    :='ch1  LANDING';
    Button.Left    :=PositionMonitoring[NEXT].pLEFT;
    Button.Top     :=PositionMonitoring[NEXT].pTop;
    Button.Tag     :=1;
    INC(NEXT);
  end;
  FSN[0]:='LANDING';
  Button:=fMain.FindComponent('ch2') as TMyPanel;
  if Button<>nil then
  begin
    Button.TextPosition:=tpLeft;
    Button.Caption :=nn+'ch2'+'  '+'MULTISCREEN';
    Button.ShowHint:=true;
    Button.Hint    :='ch2  MULTISCREEN';
    Button.Left    :=PositionMonitoring[NEXT].pLEFT;
    Button.Top     :=PositionMonitoring[NEXT].pTop;
    Button.Tag     :=2;
    INC(NEXT);
  end;
  FSN[1]:='MULTISCREEN';
  for i:=3 to 10 do
  begin
    KUch:=KUToPort[i-2];
    Button:=fMain.FindComponent('ch'+IntToStr(i)) as TMyPanel;
    if Button<>nil then
    begin
      Button.Visible:=bdKU[KUch].Use;
      if bdKU[KUch].Use then
      begin
        Button.TextPosition:=tpLeft;
        BlaBlaBla:='('+TRIM(bdKU[KUch].PName)+')';
        Button.Caption :=nn+'ch'+IntToStr(Next)+'  '+TRIM(bdKU[KUch].Name)+' '+BlaBlaBla;
        Button.ShowHint:=true;
        Button.Hint    :='ch'+IntToStr(NEXT)+'  '+bdKU[KUch].Name+' ('+ bdKU[KUch].PName+')'+#10#13+'TM-2221-2 '+TRIM(bdKU[KUch].Position);
        Button.Left    :=PositionMonitoring[NEXT].pLEFT;
        Button.Top     :=PositionMonitoring[NEXT].pTop;
        Button.Tag     :=Next;
        FSN[NEXT-1]    :=TRIM(bdKU[KUch].Name);
        INC(NEXT);
      end;
    end;
  end;
  if NEXT<=10 then
  fMain.Monitoring.Height  :=PositionMonitoring[NEXT].pTop+fMain.ch1.Height;
  fMain.WSCRecord.Top      :=fMain.Monitoring.Top+fMain.Monitoring.Height+10;
  fMain.Videorecorder.Top  :=fMain.WSCRecord.Top+fMain.WSCRecord.Height+10;
  fMain.PostPanel.Top      :=fMain.Videorecorder.Top+fMain.Videorecorder.Height+10;
end;

procedure PaintKUDataExchange;
var i,j:integer;
var s1,s2:string;
begin
  for i:=1 to 8 do
  begin
    if fMain.FindComponent('ek'+IntToStr(i))<>nil then
      TMyPanel(fMain.FindComponent('ek'+IntToStr(i))).Visible:=bdKU[KUtoPort [i]].Use;
      if fMain.FindComponent('eks'+IntToStr(i))<>nil then
        TSplitter(fMain.FindComponent('eks'+IntToStr(i))).Visible:=bdKU[KUtoPort [i]].Use;
    if bdKU[KUtoPort [i]].Use then
    if fMain.FindComponent('ek'+IntToStr(i))<>nil then
    begin
      if i<5 then begin s1:=''; s2:='      '; end else begin s1:='      '; s2:=''; end;
      TMyPanel(fMain.FindComponent('ek'+IntToStr(i))).Caption:=s1+bdKU[KUtoPort [i]].Name+bdKU[KUtoPort [i]].Position+s2;
      TMyPanel(fMain.FindComponent('ek'+IntToStr(i))).Tag    :=KUtoPort [i];
      TMyPanel(fMain.FindComponent('ek'+IntToStr(i))).Hint   :=bdKU[KUtoPort [i]].Name+' ('+ bdKU[KUtoPort [i]].PName+')'
                                                             +#10#13+'TM-2221-2 '+TRIM(bdKU[i].Position);
      TMyPanel(fMain.FindComponent('ek'+IntToStr(i))).ShowHint:=true;
    end;
  end;
end;

procedure PaintKUVideoSystem;
var i,j:integer;
lab:TLabel;
begin
  for i:=1 to 8 do
  begin
    if fMain.FindComponent('vk'+IntToStr(i))<> nil then
      TMyPanel(fMain.FindComponent('vk'+IntToStr(i))).Visible:=bdKU[i].Use;
    if bdKU[i].Use then
    begin
      if fMain.FindComponent('l'+IntToStr(i))<>nil then TLabel(fMain.FindComponent('l'+IntToStr(i))).Caption:='  '+bdKU[i].Name+bdKU[i].Position;
      if fMain.FindComponent('vk'+IntToStr(i))<>nil then
      begin
        TMyPanel(fMain.FindComponent('vk'+IntToStr(i))).Hint   :=bdKU[i].Name+' ('+ bdKU[i].PName+')'
                                                             +#10#13+'TM-2221-2 '+TRIM(bdKU[i].Position);
        TMyPanel(fMain.FindComponent('vk'+IntToStr(i))).ShowHint:=true;
      end;
    end  else
    begin
      if fMain.FindComponent('vks'+IntToStr(i))<>nil then
      begin
        TSplitter(fMain.FindComponent('vks'+IntToStr(i))).Visible:=false;
      end;
    end;
    if bdKU[i].Use then
    for j:=1 to 6 do
    if fMain.FindComponent('vl'+IntToStr(i)+IntToStr(j))<>nil then
    begin
       lab:=TLabel(fMain.FindComponent('vl'+IntToStr(i)+IntToStr(j)));
       lab.Caption:=bdKU[i].Name;
       //???????????? tag=0 - ?? ??????? ????, tag=1 - ?? ???????? ????
       if  lab.Tag=0 then
           lab.Top:=TPanel(lab.Parent).Height
       else if  lab.Tag=1 then
           lab.Top:=lab.Canvas.TextWidth(bdKU[i].Name);
    end;
  end;
end;

procedure Paint2437VideoSystem;
var i,j,k:integer;
begin
  for i:=1 to 4 do
    for j:=1 downto 0 do
    if not bdKU[KUtoPort[EM2437toPort[i*2-j]]].Use then
      for k:=1 to 2 do
      if fMain.FindComponent('vt2437'+IntToStr(i)+IntToStr(2-2*j+k))<>nil then
        TMyPanel(fMain.FindComponent('vt2437'+IntToStr(i)+IntToStr(2-2*j+k))).DeviceState:=dsGray;
end;

procedure PaintPostMain;
var NEXT:integer;
    i   :integer;
    MP  :TMyPanel;
begin
  Next:=0;
  for i:=0 to 13 do
  begin
    MP:=fMain.FindComponent('pb'+IntToStr(i+1)) as TMyPanel;
    if MP=nil then continue;
    MP.Visible:=bd7210_1[i].Use;
    if not bd7210_1[i].Use then continue;
    MP.ShowHint :=true;
    MP.Hint     :=bd7210_1[i].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_1[i].Position);
    MP.Left     :=PositionMatrixP[Next].pLEFT;
    MP.Top      :=PositionMatrixP[Next].pTop;
    MP.Width    :=90;
    MP.Caption  :='   '+TRIM(bd7210_1[i].POsition);
    MP.Tag      :=i;
    INC(NEXT);
  end;
  for i:=0 to 13 do
  begin
    MP:=fMain.FindComponent('pv'+IntToStr(i+1)) as TMyPanel;
    if MP=nil then continue;
    MP.Visible:=bd7210_2[i].Use;
    if not bd7210_2[i].Use then continue;
    MP.ShowHint :=true;
    MP.Hint     :=bd7210_2[i].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_2[i].Position);
    MP.Left     :=PositionMatrixP[Next].pLEFT;
    MP.Top      :=PositionMatrixP[Next].pTop;
    MP.Width    :=90;
    MP.Caption  :='   '+TRIM(bd7210_2[i].POsition);
    MP.Tag      :=i+14;
    INC(NEXT);
  end;
  if NEXT<=26 then
  fMain.PostPanel.Height:=35+PositionMatrixP[Next+1].pTop;
end;

procedure PaintPostDataExchange;
var i:integer;
begin
  fMain.et23221.Hint:='"'+IP23221+'"';
  fMain.et23222.Hint:='"'+IP23222+'"';
  fMain.et23223.Hint:='"'+IP23223+'"';
  fMain.et23224.Hint:='"'+IP23224+'"';
  for i:=0 to 12 do
  begin
    if fMain.FindComponent('ep'+IntToStr(i+1))<>nil then
    begin
       TMyPanel(fMain.FindComponent('ep'+IntToStr(i+1))).Visible:=bd7210_1[i].Use;
       if bd7210_1[i].Use then
       begin
         TMyPanel(fMain.FindComponent('ep'+IntToStr(i+1))).Caption  :='TM-2226-1 '+TRIM(bd7210_1[i].Position)+'         ';
         TMyPanel(fMain.FindComponent('ep'+IntToStr(i+1))).ShowHint :=true;
         TMyPanel(fMain.FindComponent('ep'+IntToStr(i+1))).Hint     :=bd7210_1[i].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_1[i].Position);
         TMyPanel(fMain.FindComponent('ep'+IntToStr(i+1))).Tag      :=i;
       end;
    end;
    if fMain.FindComponent('eps'+IntToStr(i+1))<>nil then
       TSplitter(fMain.FindComponent('eps'+IntToStr(i+1))).Visible:=bd7210_1[i].Use;
  end;
  for i:=0 to 11 do
  begin
    if fMain.FindComponent('el'+IntToStr(i+1))<>nil then
    begin
       TMyPanel(fMain.FindComponent('el'+IntToStr(i+1))).Visible:=bd7210_2[i].Use;
       if bd7210_2[i].Use then
       begin
         TMyPanel(fMain.FindComponent('el'+IntToStr(i+1))).Caption  :='         TM-2226-1 '+TRIM(bd7210_2[i].Position);
         TMyPanel(fMain.FindComponent('el'+IntToStr(i+1))).ShowHint :=true;
         TMyPanel(fMain.FindComponent('el'+IntToStr(i+1))).Hint     :=bd7210_2[i].Name+#10#13+'TM-2226-1 '+TRIM(bd7210_2[i].Position);
         TMyPanel(fMain.FindComponent('el'+IntToStr(i+1))).Tag      :=i+14;
       end;
    end;
    if fMain.FindComponent('els'+IntToStr(i+1))<>nil then
       TSplitter(fMain.FindComponent('els'+IntToStr(i+1))).Visible:=bd7210_2[i].Use;
  end;
end;

procedure PaintPostVideoSystem;
var i,j,z:integer;
    n,k:char;
    s,m:string;
    bd7210:array [0..13] of Tb7210;
begin
  for j:=1 to 2 do
  begin
    case j of
      1: begin n:='p'; for i:=0 to Length(bd7210)-1 do bd7210[i]:=bd7210_1[i]; z:=0;  s:='          ';m:=''; end;
      2: begin n:='b'; for i:=0 to Length(bd7210)-1 do bd7210[i]:=bd7210_2[i]; z:=16; s:='';m:='          ';end;
    end;
    for i:=0 to 13 do
    begin
      if fMain.FindComponent('v'+n+IntToStr(i+1))<>nil then
      begin
        TMyPanel(fMain.FindComponent('v'+n+IntToStr(i+1))).Visible :=bd7210[i].Use;
        if bd7210[i].Use then
        begin
          TMyPanel(fMain.FindComponent('v'+n+IntToStr(i+1))).Caption :=s+'TM-2226-1 '+TRIM(bd7210[i].Position)+m;
          TMyPanel(fMain.FindComponent('v'+n+IntToStr(i+1))).ShowHint:=true;
          TMyPanel(fMain.FindComponent('v'+n+IntToStr(i+1))).Hint    :=bd7210[i].Name+#10#13+'TM-2226-1 '+TRIM(bd7210[i].Position);
          TMyPanel(fMain.FindComponent('v'+n+IntToStr(i+1))).Tag     :=i+14*(j-1);
      end;
      end;
      if fMain.FindComponent('out'+IntToStr(i+1+z))<>nil then
         TMyPanel(fMain.FindComponent('out'+IntToStr(i+1+z))).Enabled:=bd7210[i].Use;
      if not bd7210[i].Use then
      if fMain.FindComponent('v'+n+'s'+IntToStr(i+1))<>nil then
      begin
        TSplitter(fMain.FindComponent('v'+n+'s'+IntToStr(i+1))).Width:=TSplitter(fMain.FindComponent('v'+n+'s'+IntToStr(i+1))).Width-200;
        if j=2 then TSplitter(fMain.FindComponent('v'+n+'s'+IntToStr(i+1))).Left:=TSplitter(fMain.FindComponent('v'+n+'s'+IntToStr(i+1))).Left+200;
      end;
    end;
  end;
end;

function ReadData7210:boolean;
var F: file of Tb7210;
    i: integer;
begin
  //olikke
  //?????????? - ???????? GetLastError
  result:=false;
  if FileExists(ExtractFilePath(ParamStr(0))+'Post1.mtk')  then
  begin
    AssignFile(F, ExtractFilePath(ParamStr(0))+'Post1.mtk');
    Reset(F);
    try
      for i:= 0 to 13 do
      Read (F, bd7210_1[i]);
    finally
      CloseFile(F);
    end;
  end else exit;
  if FileExists(ExtractFilePath(ParamStr(0))+'Post2.mtk')  then
  begin
    AssignFile(F, ExtractFilePath(ParamStr(0))+'Post2.mtk');
    Reset(F);
    try
      for i:= 0 to 13 do
      Read (F, bd7210_2[i]);
    finally
      CloseFile(F);
    end;
  end else exit;
  PaintPostMain;
  PaintPostDataExchange;
  PaintPostVideoSystem;
  result:=true;
end;

end.
