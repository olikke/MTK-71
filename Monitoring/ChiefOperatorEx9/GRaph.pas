unit GRaph;

interface
uses Classes,Windows,SyncObjs,SysUtils,Graphics,Global,MyPanel,FastDIB,FastDraw,Dialogs;

type TBut=record
       midd:integer;
       enbl:boolean;
     end;

type TGraph=class(TThread)
     private
       fIn :array [0..15] of TBut;
       fOut:array [0..15] of TBut;
       fwid:integer;
       fhei:integer;
       fNeedToChange:boolean;
       fHand1:THandle;   //main form
       fHand2:THandle;   //form 7302
       fevent:TEvent;
       fnumb :integer;
       bm    :TBitmap;
       cs    :TCriticalSection;
       Fast  :TFastDib;
       fright:boolean;
       procedure Paint;
       procedure   FMEssageToForm;
     public
       property    ReadyImage:TFastDib read Fast;
       constructor Create(numb:integer;Handle:THandle;Event:TEvent; Right:boolean);
       procedure   Change;
     protected
       procedure Execute; override;
     end;

var Gr: array [1..2] of TGraph;

implementation

uses Main,Container_EM7302;

procedure TGraph.Change;
begin
  Paint;
end;

constructor TGraph.Create(numb:integer;Handle:THandle;Event:TEvent;right:boolean);
var i:integer;
    panel:TMyPanel;
    shift:integer;
begin
  inherited Create(true);
  fHand1:=Handle;
  fEvent:=Event;
  fnumb :=numb;
  fright:=right;
  shift :=fMain.i01.Top;
  for i:=1 to 16 do
  begin
    Panel:=fMain.FindComponent('in'+IntToStr(i)) as TMyPanel;
    if Panel=nil then begin fIn[i].enbl:=false; continue; end;
    fin[i-1].enbl  :=Panel.Enabled;
    fin[i-1].midd  :=(panel.Top+panel.Height div 2)-shift;
  end;
  for i:=1 to 16 do
  begin
    Panel:=fMain.FindComponent('out'+IntToStr(i)) as TMyPanel;
    if Panel=nil then begin fout[i].enbl:=false; continue; end;
    fout[i-1].enbl  :=Panel.Enabled;
    fout[i-1].midd  :=(panel.Top+panel.Height div 2)-shift;
  end;
  fwid:=fMain.i01.Width;
  fhei:=fMain.i01.Height;
  Fast:=TFastDib.Create;
  Fast.SetSize(fwid,fhei,32);
  Fast.FillColors(0,255,[tfBlack,FRGB(0,100,128),tfWhite]);
  resume;
end;

procedure TGraph.Paint;
var Commutation:T25;
    Color:tColor;
    i,j  :integer;
    y1,y2:integer;
    EM7302IsWork:boolean;
begin
  case fnumb of
    1:begin Commutation:=EM7302[1].TableOfCommutation;  EM7302IsWork:=EM7302[1].DataExh;  Color:=EM7302[1].Color; cs:=GraphCS1; end;
    2:begin Commutation:=EM7302[2].TableOfCommutation;  EM7302IsWork:=EM7302[2].DataExh; Color:=EM7302[2].Color;  cs:=GraphCS2; end
    else exit;
  end;
  cs.Enter;
  try
    Fast.Clear(tfSilver);
    if EM7302IsWork then
    for i:=0 to 15 do
    begin
      if not fout[i].enbl then continue;
      y1:=fout[i].midd;
      j:=Commutation[i];
      y2:=fin[j].midd;
      if fright then
      begin
        SmoothLine(Fast,0,y2,fwid-1,y1,tfBlack);
        SmoothLine(Fast,0,y2+1,fwid-1,y1+1,tfBlack);
      end else
      begin
        SmoothLine(Fast,fwid-1,y2,0,y1,tfBlack);
        SmoothLine(Fast,fwid-1,y2+1,0,y1+1,tfBlack);
      end;
    end;
  finally
    cs.Leave;
  end; 
  FMessageToForm;
end;

procedure TGraph.FMessageToForm;
begin
  if fHand1<>0 then
  PostMessage(fHand1,WM_NOTIFY_Graph,fnumb,fnumb);
end;

procedure TGraph.Execute;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin

    end;

    Paint;
  end;
end;

end.
