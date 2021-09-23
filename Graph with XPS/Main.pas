unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, ComCtrls, StdCtrls, TeEngine, Series, TeeProcs,
  Chart, Buttons,Printers,ComObj;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    OpenProtocol1: TMenuItem;
    N1: TMenuItem;
    PrintGraph1: TMenuItem;
    N2: TMenuItem;
    Saveas1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Panel2: TPanel;
    Chart3: TChart;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Chart1: TChart;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series7: TLineSeries;
    Splitter2: TSplitter;
    Chart2: TChart;
    Series3: TLineSeries;
    Series4: TLineSeries;
    Series8: TLineSeries;
    Label13: TLabel;
    Edit1: TEdit;
    Label14: TLabel;
    Edit2: TEdit;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    PrintDialog1: TPrintDialog;
    WritetoExcel1: TMenuItem;
    N4: TMenuItem;
    OpenExcel1: TMenuItem;
    procedure OpenExcel1Click(Sender: TObject);
    procedure WritetoExcel1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart2Zoom(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure PrintGraph1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure OpenProtocol1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Normalization;
    procedure Graph;
    procedure PrintGraph;
    function MyRemoveDir(sDir : String) : Boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type   //только в метрах
  TMD=record
    tD :double;
    tLR:double;
    tUD:double;
    pD :double;
    pLR:double;
    pUD:double;
    tdt:TDateTime;
  end;

var
  Form1: TForm1;
  FILE_NAME:String;
  TEMP_RAR:String;
  TEMP_FOLDER:String;
  RAR_FOLDER:String;
  PAGE_FOLDER:string;
  si:TStartUpInfo;
  p:TPRocessInformation;
  MD:array of TMD;
  STARTN,STOPN:integer;
  RecordCount:integer;
  MinD,MaxD:double;
  MinUD,MaxUD:double;
  MinLR,MaxLR:double;

implementation

{$R *.dfm}

function TForm1.MyRemoveDir(sDir: string):boolean;
var  
  iIndex : Integer;
  SearchRec : TSearchRec;
  sFileName : String;
begin
  Result := False;
  sDir := sDir + '\*.*';
  iIndex := FindFirst(sDir, faAnyFile, SearchRec);
  while iIndex = 0 do
  begin
    sFileName := ExtractFileDir(sDir)+'\'+SearchRec.Name;
    if SearchRec.Attr = faDirectory then
    begin
      if (SearchRec.Name <> '' ) and (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then MyRemoveDir(sFileName);
    end else
    begin
      if SearchRec.Attr <> faArchive then FileSetAttr(sFileName, faArchive);
      if NOT DeleteFile(sFileName) then
      ShowMessage('Could NOT delete ' + sFileName);
    end;
    iIndex := FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  RemoveDir(ExtractFileDir(sDir));
  Result := True;
end;

procedure TForm1.PrintGraph;
var     x,y:single;
begin
  PrintDialog1.FromPage := 1;
  PrintDialog1.ToPage   := 3;
  PrintDialog1.MinPage  := 1;
  PrintDialog1.MaxPage  := 1;
  Printer.Orientation   :=poLandscape;
  x:=Printer.PageWidth/3508;
  y:=Printer.PageHeight/2480;
  Printer.BeginDoc;
  Printer.Canvas.Refresh;
  Printer.Canvas.Font.Size:=12;
  Printer.Canvas.TextOut(450,80,'Diagram according protocol');
  Printer.Canvas.Font.Size:=10;
  Printer.Canvas.TextOut(450,Round(100+60*y),Label1.Caption+Label7.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+60*y),Label2.Caption+Label8.Caption);
  Printer.Canvas.TextOut(450,Round(100+120*y),Label3.Caption+Label9.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+120*y),Label4.Caption+Label10.Caption);
  Printer.Canvas.TextOut(450,Round(100+180*y),Label5.Caption+Label11.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+180*y),Label6.Caption+Label12.Caption);
  Chart1.PrintPartialCanvas(Printer.Canvas,   Rect(100,   Round(100+230*y),   Printer.PageWidth-50,   Printer.PageHeight-75));
  Printer.Canvas.TextOut(Printer.PageWidth div 2 -50,Printer.PageHeight-150,'Page 1 of 3');
  Printer.NewPage;
  Printer.Canvas.Font.Size:=12;
  Printer.Canvas.TextOut(450,80,'Diagram according protocol');
  Printer.Canvas.Font.Size:=10;
  Printer.Canvas.TextOut(450,Round(100+60*y),Label1.Caption+Label7.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+60*y),Label2.Caption+Label8.Caption);
  Printer.Canvas.TextOut(450,Round(100+120*y),Label3.Caption+Label9.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+120*y),Label4.Caption+Label10.Caption);
  Printer.Canvas.TextOut(450,Round(100+180*y),Label5.Caption+Label11.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+180*y),Label6.Caption+Label12.Caption);
  Chart2.PrintPartialCanvas(Printer.Canvas,   Rect(100,   Round(100+230*y),   Printer.PageWidth-50,   Printer.PageHeight-75));
  Printer.Canvas.TextOut(Printer.PageWidth div 2 -50,Printer.PageHeight-150,'Page 2 of 3');
  Printer.NewPage;
  Printer.Canvas.Font.Size:=12;
  Printer.Canvas.TextOut(450,80,'Diagram according protocol');
  Printer.Canvas.Font.Size:=10;
  Printer.Canvas.TextOut(450,Round(100+60*y),Label1.Caption+Label7.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+60*y),Label2.Caption+Label8.Caption);
  Printer.Canvas.TextOut(450,Round(100+120*y),Label3.Caption+Label9.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+120*y),Label4.Caption+Label10.Caption);
  Printer.Canvas.TextOut(450,Round(100+180*y),Label5.Caption+Label11.Caption);
  Printer.Canvas.TextOut(Round(1100*x),Round(100+180*y),Label6.Caption+Label12.Caption);
  Chart3.PrintPartialCanvas(Printer.Canvas,   Rect(100,   Round(100+230*y),   Printer.PageWidth-50,   Printer.PageHeight-75));
  Printer.Canvas.TextOut(Printer.PageWidth div 2 -50,Printer.PageHeight-150,'Page 3 of 3');
  Printer.EndDoc;
end;

procedure TForm1.OpenProtocol1Click(Sender: TObject);
begin
  if not OpenDialog1.Execute then exit;
  Timer1.Enabled:=true;
end;

procedure TForm1.PrintGraph1Click(Sender: TObject);
var i:integer;
    flag:boolean;
begin
  flag:=false;
  for i:=0 to Printer.Printers.Count-1 do
  if Pos('HTTP://192.168',UpperCase(Printer.Printers.Strings[i]))<>0 then
  begin
    Printer.PrinterIndex:=i;
    flag:=true;
    break;
  end;
  if not flag then if not PrintDialog1.Execute  then exit;
  PrintGraph;
end;

procedure TForm1.Saveas1Click(Sender: TObject);
var i:integer;
    flag:boolean;
begin
  flag:=false;
  for i:=0 to Printer.Printers.Count-1 do
  if (Pos('MICROSOFT XPS DOCUMENT WRITER',UpperCase(Printer.Printers.Strings[i]))<>0 ) and (Pos('VRD',UpperCase(Printer.Printers.Strings[i]))=0 ) then
  begin
    Printer.PrinterIndex:=i;
    flag:=true;
    break;
  end;
  if not flag then if not PrintDialog1.Execute  then exit;
  PrintGraph;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
var str:string;
    i,j:integer;
begin
  str:=Edit1.Text;
  i:=StrToIntDef(str,-1);
  if (i=-1) or (i<0) then
  begin
    Edit1.Text:='0';
    StatusBar.SimpleText:='Incorrect "Start N" value';
    exit;
  end;
  str:=Edit2.Text;
  j:=StrToIntDef(str,-1);
  if (j=-1) or (j<0) or (j>RecordCount) then
  begin
    Edit2.Text:=IntToStr(RecordCount);
    StatusBar.SimpleText:='Incorrect "Stop N" value';
    exit;
  end;
  if j<=i then
  begin
    Edit1.Text:='0';
    Edit2.Text:=IntToStr(RecordCount);
    StatusBar.SimpleText:='Incorrect value';
    exit;
  end;
  StartN:=i;
  StopN:=j;
  Normalization;
  Graph;
end;

procedure TForm1.Chart1Zoom(Sender: TObject);
var    k: integer;
       i:integer;
begin
  Series7.Clear;
  k:=(StopN-StartN) div 10;
  for i:=StartN to StopN do
  begin
  if ((i-StartN) mod k =0) and (MD[i].tD>100) then
    Series7.AddXY(i-StartN,Chart1.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
    Series7.AddNull(' ')
  end;
end;

procedure TForm1.Chart2Zoom(Sender: TObject);
var    k: integer;
       i:integer;
begin
  Series8.Clear;
  k:=(StopN-StartN) div 10;
  for i:=StartN to StopN do
  begin
  if ((i-StartN) mod k =0)and (MD[i].tD>100) then
    Series8.AddXY(i-StartN,Chart2.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
    Series8.AddNull(' ')
  end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 SpeedButton3.Click;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Graph;
var i:integer;
    a,b:double;
    k:integer;
begin
  Series1.Clear;
  Series2.Clear;
  Series7.Clear;
  Chart1.LeftAxis.Minimum:=-9999999;
  Chart1.LeftAxis.Maximum:=9999999;
  Chart1.LeftAxis.Minimum:=MinUD-abs(MinUD)*0.1;
  Chart1.LeftAxis.Maximum:=MaxUD+abs(MaxUD)*0.1;
  Series3.Clear;
  Series4.Clear;
  Chart2.LeftAxis.Minimum:=-9999999;
  Chart2.LeftAxis.Maximum:=9999999;
  Chart2.LeftAxis.Minimum:=MinLR-abs(MinLR)*0.1;
  Chart2.LeftAxis.Maximum:=MaxLR+abs(MaxLR)*0.1;
  Series5.Clear;
  Series6.Clear;
  Chart3.LeftAxis.Minimum:=-9999999;
  Chart3.LeftAxis.Maximum:=9999999;
  Chart3.LeftAxis.Minimum:=MinD-abs(MinD)*0.1;
  Chart3.LeftAxis.Maximum:=MaxD+abs(MaxD)*0.1;
  Series7.Clear;
  Series8.Clear;
  k:=(StopN-StartN) div 10;
  if not CheckBox1.Checked then
  begin
  for i:=StartN to StopN do
  begin
    if MD[i].tD<>0 then
    Series1.AddXY(i,MD[i].tUD,'',clRed) else
    Series1.AddNull('');
    if MD[i].pD<>0 then
    Series2.AddXY(i,MD[i].pUD,'',clGreen) else
    Series2.AddNull('') ;
    {if ((i-StartN) mod k =0) and (MD[i].tD>100) then
      Series7.AddXY(i-StartN,Chart1.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series7.AddNull(' ')  }
  end;
  for i:=StartN to StopN do
  begin
    if MD[i].tD<>0 then
    Series3.AddXY(i,MD[i].tLR,'',clRed) else
    Series3.AddNull('');
    if MD[i].pD<>0 then
    Series4.AddXY(i,MD[i].pLR,'',clGreen) else
    Series4.AddNull('');
    {if ((i-StartN) mod k =0) and (MD[i].tD>100)then
      Series8.AddXY(i-StartN,Chart2.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series8.AddNull(' '); }
  end;
  for i:=StartN to StopN do
  begin
    if MD[i].tD<>0 then
    Series5.AddXY(i,MD[i].tD,'',clRed) else
    Series5.AddNull('');
    if MD[i].pD<>0 then
    Series6.AddXY(i,MD[i].pD,'',clGreen) else
    Series6.AddNull('');
  end;
  for i:=StartN to StopN do
  begin
    if ((i-StartN) mod k =0) and (MD[i].tD>100)then
      Series7.AddXY(i-StartN,Chart1.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series7.AddNull(' ');
    if ((i-StartN) mod k =0) and (MD[i].tD>100)then
      Series8.AddXY(i-StartN,Chart2.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series8.AddNull(' ');
  end;
end else
begin
  for i:=StartN to StopN do
  begin
    if i mod 5 <>0 then continue;
    if (MD[i].tD=0) or (MD[i+1].tD=0) or (MD[i+2].tD=0) or (MD[i+3].tD=0) or (MD[i+4].tD=0)  then   Series1.AddNullXY(i,1,'') else
    Series1.AddXY(i,(MD[i].tUD+MD[i+1].tUD+MD[i+2].tUD+MD[i+3].tUD+MD[i+4].tUD)/5,'',clRed);
    if ((MD[i].pD=0) or (MD[i+1].pD=0) or (MD[i+2].pD=0) or (MD[i+3].pD=0) or (MD[i+4].pD=0))  then   Series2.AddNullXY(i,1,'') else
    Series2.AddXY(i,(MD[i].pUD+MD[i+1].pUD+MD[i+2].pUD+MD[i+3].pUD+MD[i+4].pUD)/5,'',clGreen);
  end;
  for i:=StartN to StopN  do
  begin
    if i mod 5 <>0 then continue;
    if (MD[i].tD=0) or (MD[i+1].tD=0) or (MD[i+2].tD=0) or (MD[i+3].tD=0) or (MD[i+4].tD=0)  then   Series3.AddNullXY(i,1,'') else
    Series3.AddXY(i,(MD[i].tLR+MD[i+1].tLR+MD[i+2].tLR+MD[i+3].tLR+MD[i+4].tLR)/5,'',clRed);
    if ((MD[i].pD=0) or (MD[i+1].pD=0) or (MD[i+2].pD=0) or (MD[i+3].pD=0) or (MD[i+4].pD=0))  then   Series4.AddNullXY(i,1,'') else
    Series4.AddXY(i,(MD[i].pLR+MD[i+1].pLR+MD[i+2].pLR+MD[i+3].pLR+MD[i+4].pLR)/5,'',clGreen);
  end;
  for i:=StartN to StopN do
  begin
    if i mod 5 <>0 then continue;
    if MD[i].tD<>0 then
    Series5.AddXY(i,(MD[i].tD+MD[i+1].tD+MD[i+2].tD+MD[i+3].tD+MD[i+4].tD)/5,'',clRed) else
    Series5.AddNullXY(i,1,'');
    if MD[i].pD<>0 then
    Series6.AddXY(i,(MD[i].pD+MD[i+1].pD+MD[i+2].pD+MD[i+3].pD+MD[i+4].pD)/5,'',clGreen) else
    Series6.AddNullXY(i,1,'');
  end;
  for i:=StartN to StopN do
  begin
    if ((i-StartN) mod k =0) and (MD[i].tD>100)then
      Series7.AddXY(i-StartN,Chart1.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series7.AddNull(' ');
    if ((i-StartN) mod k =0) and (MD[i].tD>100)then
      Series8.AddXY(i-StartN,Chart2.LeftAxis.Maximum,IntToStr(Round(MD[i].tD)),clBlue) else
      Series8.AddNull(' ');
  end;
end;
end;

procedure TForm1.Normalization;
var i:integer;
begin
  MinD:=99999999;
  MaxD:=-9999999;
  MinUD:=99999999;
  MaxUD:=-9999999;
  MinLR:=99999999;
  MaxLR:=-9999999;
  for i:=StartN to StopN do
  begin
    if MD[i].tD<MinD then MinD:=MD[i].tD;
    if MD[i].pD<MinD then MinD:=MD[i].pD;
    if MD[i].tD>MaxD then MaxD:=MD[i].tD;
    if MD[i].pD>MaxD then MaxD:=MD[i].pD;
    if MD[i].tLR<MinLR then MinLR:=MD[i].tLR;
    if MD[i].pLR<MinLR then MinLR:=MD[i].pLR;
    if MD[i].tLR>MaxLR then MaxLR:=MD[i].tLR;
    if MD[i].pLR>MaxLR then MaxLR:=MD[i].pLR;
    if MD[i].tUD<MinUD then MinUD:=MD[i].tUD;
    if MD[i].pUD<MinUD then MinUD:=MD[i].pUD;
    if MD[i].tUD>MaxUD then MaxUD:=MD[i].tUD;
    if MD[i].pUD>MaxUD then MaxUD:=MD[i].pUD;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
LABEL ex;
var
  str,word:string;
  flag:boolean;
  c:char;
  fs:TSearchRec;
  PageCount:integer;
  TSL:TStringList;
  i,j,EndWord:integer;
begin
  Timer1.Enabled:=false;
  StatusBar.SimpleText:='Search';
 // для начала надо найти winrar
  flag:=false;
  for c in ['A' .. 'Z'] do
  if GetDriveType(PChar(c+':\'))=DRIVE_FIXED then
  begin
    if DirectoryExists(c+':\Program Files\WinRar\') then
    begin
      RAR_FOLDER:='C:\Program Files\WinRar\';
      flag:=true;
      break;
    end;
    if DirectoryExists(c+':\Program Files (x86)\WinRar\') then
    begin
      RAR_FOLDER:='C:\Program Files (x86)\WinRar\';
      flag:=true;
      break;
    end;
  end;
  if not flag then
  begin
    StatusBar.SimpleText:='WinRar not found';
    exit;
  end;
  flag:=false;
  StatusBar.SimpleText:='Data unpacking';
  FILE_NAME:=OpenDialog1.FileName;
  str:=ExtractFileName(FILE_NAME);
  Delete(str,Pos('.',str),5) ;
  TEMP_RAR:=ExtractFilePath(ParamStr(0))+str+'.rar';
  if not CopyFile(PChar(openDialog1.FileName),PChar(TEMP_RAR),false) then
  begin
    StatusBar.SimpleText:='No possible create zip-file';
    exit;
  end;
  TEMP_FOLDER:=ExtractFilePath(ParamStr(0))+str;
  if DirectoryExists(TEMP_FOLDER) then RemoveDir(TEMP_FOLDER);
  if not ForceDirectories(TEMP_FOLDER) then
  begin
    StatusBar.SimpleText:='Problem1';
    exit;
  end;
  FillChar(si,sizeOf(si),0);
  with si do
  begin
    cb:=SizeOf(si);
    dwFlags:=startf_UseShowWindow;
    wShowWindow:=0;
  end;
  // WinExec(PChar('"'+RAR_FOLDER+'WinRar.exe" x -y ' +'"'+TEMP_RAR+'" "'+TEMP_FOLDER+'"'),SW_Hide);
  CreateProcess(nil,PChar('"'+RAR_FOLDER+'WinRar.exe" x -y ' +'"'+TEMP_RAR+'" "'+TEMP_FOLDER+'"'),nil,nil,false,Create_default_error_mode,nil,nil,si,p);
  WaitForSingleObject(p.hProcess,infinite);
  if not DeleteFile(TEMP_RAR) then
  begin
    StatusBar.SimpleText:='Problem2';
    exit;
  end;
  StatusBar.SimpleText:='Parsing file';
  PAGE_FOLDER:=TEMP_FOLDER+'\Documents\1\Pages\';
  //определить кол-во файлов в папке
  PageCount:=0;
  if FindFirst(PAGE_FOLDER+'\*.fpage',faAnyFile-faDirectory-faVolumeID, fs)=0 then
    repeat  
      inc(PageCount);
    until FindNext(fs)<>0;   
  FindClose(fs);
  StatusBar.SimpleText:='Parsing title';
  if PageCount=0 then
  begin
    StatusBar.SimpleText:='No page found';
    exit;
  end;
  //берём первую страничку  расшифровываем заголовок
  TSL:=TStringList.Create;
  TSL.LoadFromFile(PAGE_Folder+'1.fpage');
  if POS('UnicodeString="Date:',TSL[1])<>0 then
  begin
    str:=TSL[1];
    Delete(str,1,POS('Date:',str)+4);
    Delete(str,POS('"',str),LEngth(str));
    Label7.Caption:=str;
  end else
  if POS('UnicodeString="Date:',TSL[1])<>0 then
  begin
    ShowMEssage('Old format');
    flag:=true;
    goto ex;
  end else goto ex;
  if POS('UnicodeString="Time:',TSL[2])<>0 then
  begin
    str:=TSL[2];
    Delete(str,1,POS('Time:',str)+4);
    Delete(str,POS('"',str),LEngth(str));
    Label8.Caption:=str;
  end else goto ex;
  if POS('UnicodeString="Glidepath',TSL[3])<>0 then
  begin
    str:=TSL[3];
    Delete(str,1,POS('Glidepath:',str)+9);
    Delete(str,POS('°',str)-1,1);
    Delete(str,POS('pos',str)-2,Length(str));
    //str:=str;
    Label9.Caption:=str+chr($92);
  end else goto ex;
  if POS('UnicodeString="List of the TV cameras:',TSL[4])<>0 then
  begin
    str:=TSL[4];
    Delete(str,1,POS('List of the TV cameras:',str)+22);
    Delete(str,POS('"',str),LEngth(str));
    Label10.Caption:=str;
  end else goto ex;
  if POS('UnicodeString="Central operator:',TSL[5])<>0 then
  begin
    str:=TSL[5];
    Delete(str,1,POS('Central operator:',str)+16);
    Delete(str,POS('"',str),LEngth(str));
    Label11.Caption:=str;
  end else goto ex;
  if POS('UnicodeString="Aircraft',TSL[6])<>0 then
  begin
    str:=TSL[6];
    Delete(str,1,POS('Aircraft',str)+7);
    Delete(str,POS('"',str),LEngth(str));
    Label12.Caption:=str;
  end else goto ex;
  //теперь прочитаем общее количество записей
  TSL.Free;
  TSL:=nil;
  TSL:=TStringList.Create;
  RecordCount:=0;
  for i:= 1 to PageCount do
  begin
      TSL.LoadFromFile(PAGE_Folder+IntToStr(i)+'.fpage');
      for j:= 0 to TSL.Count-1 do
        if POS('TRA',TSL[j])<>0 then INC(RecordCount);
  end;
  if RecordCount=-1 then  goto ex;
  //ну а теперь можно парсить
  SetLength(MD,RecordCount+1);
  TSL.Free;
  TSL:=nil;
  RecordCount:=1;
  c:=DecimalSeparator;
  DecimalSeparator:='.';
  //olikke
  for i:=1 to PageCount do
  begin
    TSL:=TStringList.Create;
    TSL.LoadFromFile(PAGE_Folder+IntToStr(i)+'.fpage');
    for j:= 0 to TSL.Count-1 do if POS('TRA',TSL[j])<>0 then
    begin
      str:=TSL[j];
      Delete(str,1,POS('" UnicodeString=',str)+16);
      Delete(str,POS('TRA',str),Length(str));
      Delete(str,1,Length(IntToStr(RecordCount)));

      //DRL
      EndWord:=Pos('.',str)+3;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      //DNrl
      EndWord:=Pos('.',str)+3;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].pD:=StrToFloatDef(word,-10);
      //DNtv
      EndWord:=Pos('.',str)+3;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].tD:=StrToFloatDef(word,-10);
      //LRrl
      EndWord:=Pos('.',str)+1;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].pLR:=StrToFloatDef(word,-10);
      //LRtv
      EndWord:=Pos('.',str)+1;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].tLR:=StrToFloatDef(word,-10);
      //UDrl
      EndWord:=Pos('.',str)+1;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].pUD:=StrToFloatDef(word,-10);
      //UDtv
      EndWord:=Pos('.',str)+1;
      word:=Copy(str,1,EndWord);
      Delete(str,1,EndWord);
      MD[RecordCount-1].tUD:=StrToFloatDef(word,-10);
      //Time
      MD[RecordCount-1].tdt:=StrToTimedef(str,time);
      INC(RecordCount);
    end;
    TSL.Free;
    TSL:=nil;
  end;
  DecimalSeparator:=c;
  flag:=true;
  WriteToExcel1.Enabled:=true;
  OpenExcel1.Enabled:=true;
  PrintGraph1.Enabled:=true;
  SaveAs1.Enabled:=true;
  ex:
  if not flag then ShowMEssage('Unknown format');
  //удаление временных папок
  StatusBar.SimpleText:='Removing temporary folder';
  if not MyRemoveDir(TEMP_FOLDER) then  StatusBar.SimpleText:='Removing temporary folder failed' else
  StatusBar.SimpleText:='o"k';
end;

procedure TForm1.OpenExcel1Click(Sender: TObject);
var
  ap:Variant;
  xls:THandle;
  str: string;
begin
  str:=OpenDialog1.FileName;
  Delete(str,Pos('.',str),Length(str));
  str:=str+'.xls';
  try
    ap:=createOleObject('Excel.Application');
    ap.Workbooks.Open(str);
    ap.Visible:=true;
  finally
     ap.WorkBooks.Close;
     ap.Quit;
  end;
end;

procedure TForm1.WritetoExcel1Click(Sender: TObject);
var
  str: string;
  ap:Variant;
  xls:THandle;
  i:integer;
begin
  str:=OpenDialog1.FileName;
  Delete(str,Pos('.',str),Length(str));
  str:=str+'.xls';
  xls:=CreateFile(PChar(str), GENERIC_READ and GENERIC_WRITE,
    0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (xls=Invalid_Handle_Value) then
  begin
    ShowMEssage('ERROR');
    CloseHandle(xls);
    exit;
  end;

  ap:=createOleObject('Excel.Application');
  ap.Workbooks.Open(str);

  ap.Workbooks[1].WorkSheets[1].Cells[2,2]:='N';
  ap.Workbooks[1].WorkSheets[1].Cells[2,3]:='DNprlk';
  ap.Workbooks[1].WorkSheets[1].Cells[2,4]:='DNtv';
  ap.Workbooks[1].WorkSheets[1].Cells[2,5]:='LRprlk';
  ap.Workbooks[1].WorkSheets[1].Cells[2,6]:='LRtv';
  ap.Workbooks[1].WorkSheets[1].Cells[2,7]:='UDprlk';
  ap.Workbooks[1].WorkSheets[1].Cells[2,8]:='UDtv';
  ap.Workbooks[1].WorkSheets[1].Cells[2,9]:='Time';

  for i:=1 to 8 do
  begin
    ap.Workbooks[1].WorkSheets[1].Columns[i].NumberFormat:='0,000';
    ap.Workbooks[1].WorkSheets[1].Columns[i].ColumnWidth:=100;
  end;
  ap.Workbooks[1].WorkSheets[1].Columns[9].NumberFormat:='00:00:00.000';
  for i:=0 to RecordCount - 1 do
  begin
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,2]:=i+1;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,3]:=MD[i].pD;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,4]:=MD[i].tD;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,5]:=MD[i].pLR;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,6]:=MD[i].tLR;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,7]:=MD[i].pUD;
    ap.Workbooks[1].WorkSheets[1].Cells[3+i,8]:=MD[i].tUD;
  end;

  ap.Workbooks[1].Save;
  ap.DisplayAlerts:=false;
  ap.WorkBooks.Close;
  ap.Quit;

end;

end.

