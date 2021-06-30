unit ListPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls,Main, ExtCtrls, Menus, StdCtrls,Global;

type
  TLP = class(TForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    ListView1: TListView;
    MainMenu1: TMainMenu;
    Sortby1: TMenuItem;
    Date: TMenuItem;
    AircraftName1: TMenuItem;
    AircraftNumber1: TMenuItem;
    Options1: TMenuItem;
    Onlyfullvideo1: TMenuItem;
    N1: TMenuItem;
    OnlyFullVideo2: TMenuItem;
    ImageList1: TImageList;
    File1: TMenuItem;
    Play1: TMenuItem;
    Stop1: TMenuItem;
    N2: TMenuItem;
    exit1: TMenuItem;
    procedure ListView1DblClick(Sender: TObject);
    procedure exit1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure Play1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OnlyFullVideo2Click(Sender: TObject);
    procedure Onlyfullvideo1Click(Sender: TObject);
    procedure AircraftNumber1Click(Sender: TObject);
    procedure AircraftName1Click(Sender: TObject);
    procedure DateClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure SearchFile;
    procedure PaintFile(LN:TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  type TWS=record
  use:byte;
  FileName:string;
  FileSize:int64;
end;

type TStereoTV=record
  Date:TDateTime;
  Time:TDateTime;
  AircraftName:string;
  AircraftNumber:string;
  Name:String;
  LWS:TWS;
  CWS:TWS;
  RWS:TWS;
end;

var
  LP: TLP;
  TranDir:WideString;
  StereoTV:array of TStereoTV;
  FolderList:TStringList;
  AirNameList:TStringList;
  AirNumbList:TStringList;
  Column:String;
  OnlyFull:boolean=false;
  Flags: TReplaceFlags;
implementation

{$R *.dfm}

procedure TLP.SearchFile;
var i,n:integer;
    sr,st:TSearchRec;
    str:String;
    FoldName:String;
    TranFile:WideString;

procedure Expand(NameL:String;List:TStringList);
var j:integer;
    flag:boolean;
begin
  if List.Count=0 then
  begin List.Add(NameL);  exit;  end;
  flag:=true;
  for j:= 0 to List.Count-1 do
  if (List.Strings[j]=NameL) then flag:=false;
  if flag then List.Add(NameL);
end;

procedure FR;
var TF:TStereoTV;
     k:integer;
begin
  if Pos('WSC',TranDir)<>0 then
  begin
    try StereoTV[i].Date:=StrToDate(FoldName) except end;
    Str:=st.Name;
    Delete(Str,1,Pos('_',Str));
    Delete(Str,Pos('_',Str),Length(Str)-Pos('_',Str)+1);
    Insert(':',Str,3);
    Insert(':',Str,6);
    try StereoTV[i].Time:=StrToTime(Str) except end;
    Str:=st.Name;
    Delete(Str,1,Pos('_',Str));
    Delete(Str,1,Pos('_',Str));
    Delete(Str,Pos('_',Str),Length(Str)-Pos('_',Str)+1);
    if StrToIntDef(str,-1)<>-1 then
    begin
    k:=StrToInt(str);
    str:=LASet[k].Name ;
    StereoTV[i].AircraftName:=str;
    end;
    Expand(str,AirNameList);
    str:=st.Name;
    StereoTV[i].AircraftNumber:=Copy(Str,1,Pos('_',Str)-1);
    Expand(StereoTV[i].AircraftNumber,AirNumbList);
    StereoTV[i].Name:=st.Name;
    StereoTV[i].CWS.use:=1;
    StereoTV[i].CWS.FileName:=TranDir+FoldName+st.Name;
    StereoTV[i].CWS.FileSize:=st.Size;
    Inc(i);
    if i>200*n then
    begin
      Inc(n);
      SetLength(StereoTV,200*n);
    end;
  end else
  begin;
    try TF.Date:=StrToDate(FoldName) except end;
    Str:=st.Name;
    Delete(Str,1,Pos('_',Str));
    Delete(Str,Pos('_',Str),Length(Str)-Pos('_',Str)+1);
    Insert(':',Str,3);
    Insert(':',Str,6);
    try TF.Time:=StrToTime(Str) except end;
    Str:=st.Name;
    Delete(Str,1,Pos('_',Str));
    Delete(Str,1,Pos('_',Str));
    Delete(Str,Pos('_',Str),Length(Str)-Pos('_',Str)+1);
    if StrToIntDef(str,-1)=-1 then exit;
    k:=StrToInt(str);
    str:=LASet[k].Name ;
    TF.AircraftName:=str;
    str:=st.Name;
    TF.AircraftNumber:=Copy(Str,1,Pos('_',Str)-1);
    TF.Name:=st.Name;
    for k:= 0 to Length(StereoTV) do
      if (TF.Date=StereoTV[k].Date) and
         (TF.Time=StereoTV[k].Time) and
         (TF.AircraftName=StereoTV[k].AircraftName) and
         (TF.AircraftNumber=StereoTV[k].AircraftNumber) then
         begin
           if Pos('WSL',TranDir)<>0 then
           begin
             StereoTV[k].LWS.use:=1;
             StereoTV[k].LWS.FileName:=TranDir+FoldName+st.Name;
             StereoTV[k].LWS.FileSize:=st.Size;
           end;
           if Pos('WSR',TranDir)<>0 then
           begin
             StereoTV[k].RWS.use:=1;
             StereoTV[k].RWS.FileName:=TranDir+FoldName+st.Name;
             StereoTV[k].RWS.FileSize:=st.Size;
           end;
           exit;
         end;
    Expand(TF.AircraftName,AirNameList);
    Expand(TF.AircraftNumber,AirNumbList);
    StereoTV[i].Date:=TF.Date;
    StereoTV[i].Time:=TF.Time;
    StereoTV[i].AircraftName:=TF.AircraftName;
    StereoTV[i].AircraftNumber:=TF.AircraftNumber;
    StereoTV[i].Name:=TF.Name;
    if Pos('WSL',TranDir)<>0 then
    begin
      StereoTV[i].LWS.use:=1;
      StereoTV[i].LWS.FileName:=TranDir+FoldName+st.Name;
      StereoTV[i].LWS.FileSize:=st.Size;
    end;
    if Pos('WSR',TranDir)<>0 then
    begin
      StereoTV[i].RWS.use:=1;
      StereoTV[i].RWS.FileName:=TranDir+FoldName+st.Name;
      StereoTV[i].RWS.FileSize:=st.Size;
    end;
    Inc(i);
    if i>200*n then
    begin
      Inc(n);
      SetLength(StereoTV,200*n);
    end;
  end;
end;

procedure PR;
begin
  if (sr.Name='.') or (sr.Name='..') then exit;
  if sr.Attr<>faDirectory then exit;
  TranFile:=TranDir+sr.Name+'\*.avi';
  FoldName:=sr.Name;
  FoldName:=StringReplace(sr.Name, '_',   SysUtils.DateSeparator, Flags);
  Expand(FoldName,FolderList);
  if FindFirst(TranFile, faAnyFile, st) =0 then
  begin FR;
  while FindNext(st) = 0 do FR; end;
end;

begin
  TranDir:='D:\TrainingRecord_WSC\';
  SetLength(StereoTV,200);
  i:=0;
  n:=1;
  if FindFirst(TranDir+'*', faDirectory, sr) =0 then
  begin  PR;
  while FindNext(sr) = 0 do PR; end;
  FindClose(sr);
  TranDir:='\\WSL\TrainingRecord_WSL\';
  if FindFirst(TranDir+'*', faDirectory, sr) =0 then
  begin  PR;
  while FindNext(sr) = 0 do PR; end;
  FindClose(sr);
  TranDir:='\\WSR\TrainingRecord_WSR\';
  if FindFirst(TranDir+'*', faDirectory, sr) =0 then
  begin  PR;
  while FindNext(sr) = 0 do PR; end;
  FindClose(sr);
end;

procedure TLP.AircraftName1Click(Sender: TObject);
begin
  ListView1.Clear;
  PaintFile(AirNameList);
  Column:='AircraftName';
end;

procedure TLP.AircraftNumber1Click(Sender: TObject);
begin
  ListView1.Clear;
  PaintFile(AirNumbList);
  Column:='AircraftNumber';
end;

procedure TLP.DateClick(Sender: TObject);
begin
  ListView1.Clear;
  PaintFile(FolderList);
  Column:='Date';
end;

procedure TLP.exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TLP.FormActivate(Sender: TObject);
begin
  ListView1.Clear;
  TreeView1.Items.Clear;
  FolderList:=TStringList.Create;
  AirNameList:=TStringList.Create;
  AirNumbList:=TStringList.Create;
  Flags:= [ rfReplaceAll, rfIgnoreCase ];
  Column:='Date';
  SearchFile;
  PaintFile(FolderLIst);
end;

procedure TLP.FormDestroy(Sender: TObject);
begin
  FolderList.Free;
  AirNameList.Free;
  AirNumbList.Free;
end;

procedure TLP.ListView1DblClick(Sender: TObject);
var LF:string;
begin
  if ListView1.Selected=nil then exit;
  LF:=StringReplace(ListView1.Selected.SubItems[3], '.', '_', Flags)+'\'+ListView1.Selected.Caption;
  NMain.PlayStart(LF);
  Close;
end;

procedure TLP.Onlyfullvideo1Click(Sender: TObject);
begin
  SearchFile;
  PaintFile(FolderLIst);
end;

procedure TLP.OnlyFullVideo2Click(Sender: TObject);
begin
  OnlyFull:= not OnlyFull;
  TreeView1DblClick(self);
end;

procedure TLP.TreeView1DblClick(Sender: TObject);
var SearchStr:string;
    i:integer;
    str:String;
begin
  if TreeView1.Selected=nil then  exit;
  SearchStr:=TreeView1.Selected.Text;
  ListView1.Items.BeginUpdate;
  ListView1.Clear;
  for i:=0 to Length(StereoTV) do
    if ((SearchStr='TrainingRecord') and (StereoTV[i].Name<>'')) or
       ((Column='Date') and (FormatDateTime('dd'+SysUtils.DateSeparator+'mm'+SysUtils.DateSeparator+'yy',StereoTV[i].Date)=SearchStr)) or
       ((Column='AircraftName') and (StereoTV[i].AircraftName=SearchStr)) or
       ((Column='AircraftNumber') and (StereoTV[i].AircraftNumber=SearchStr)) then
    with ListView1.Items.Add do
    begin
      if (OnlyFull) then
      if (StereoTV[i].LWS.use<>1) or (StereoTV[i].RWS.use<>1) or (StereoTV[i].CWS.use<>1) then continue;
      Caption:=StereoTV[i].Name;
      if StereoTV[i].LWS.use=1 then  str:='  +  ' else str:='  -  ';
      Subitems.Add(str);
      if StereoTV[i].CWS.use=1 then  str:='  +  ' else str:='  -  ';
      Subitems.Add(str);
      if StereoTV[i].RWS.use=1 then  str:='  +  ' else str:='  -  ';
      Subitems.Add(str);
      try str:=FormatDateTime('dd.mm.yy',StereoTV[i].Date) except str:='Unknown date'; end;
      Subitems.Add(str);
      try str:=FormatDateTime('hh.mm.ss',StereoTV[i].Time) except str:='Unknown time'; end;
      Subitems.Add(str);
      Subitems.Add(StereoTV[i].AircraftName);
      Subitems.Add(StereoTV[i].AircraftNumber);
    end;
  ListView1.Items.EndUpdate;
end;

procedure TLP.PaintFile(LN:TStringList);
var i:integer;
    NewNode:TTreeNode;
begin
  TreeView1.Items.Clear;
  NewNode:=TreeView1.Items.Add(TreeView1.TopItem, 'TrainingRecord');
  NewNode.ImageIndex:=0;
  for i:=0 to LN.Count-1 do
  begin
    NewNode:=TreeView1.Items.AddChild(TreeView1.Items[0], LN[i]);
    NewNode.ImageIndex:=0;
  end;
end;

procedure TLP.Play1Click(Sender: TObject);
var LF:string;
begin
  if ListView1.Selected=nil then exit;
  LF:=StringReplace(ListView1.Selected.SubItems[3], '.', '_', Flags)+'\'+ListView1.Selected.Caption;
  NMain.PlayStart(LF);
  Close;
end;

procedure TLP.Stop1Click(Sender: TObject);
var LF:string;
    FF:String;
    r:TSearchRec;
begin
  if ListView1.Selected=nil then exit;
  LF:=StringReplace(ListView1.Selected.SubItems[3], '.', '_', Flags)+'\'+ListView1.Selected.Caption;
  FF:='D:\TrainingRecord_WSC\';
  if FindFirst(FF+LF, faAnyFile, r) = 0 then
  DeleteFile(FF+LF);
  FF:='\\LWS\TrainingRecord_WSL\';
  if FindFirst(FF+LF, faAnyFile, r) = 0 then
  DeleteFile(FF+LF);
  FF:='\\RWS\TrainingRecord_WSR\';
  if FindFirst(FF+LF, faAnyFile, r) = 0 then
  DeleteFile(FF+LF);
end;

end.
