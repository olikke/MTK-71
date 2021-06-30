unit Container_TM2409;

interface

uses MyPanel,Classes,SyncObjs,Global,Windows,Graphics;

type TUse      = array [1..8] of boolean;
     TComSt    = array [1..8] of TState;
     TGetState = function:boolean of object;
     TMyFunction = array [1..8] of TGetState;
     TDA       = array [1..8] of TDeviceNameArr;

type
  TTM2409 = class(TThread)
    private
      fComSt    :TComSt;
      fUse      :TUse;
      fState    :TState;
      fDA       :TDA;
      fFunction :TMyFunction;
      fDataExh  :boolean;
      fColor    :TColor;
      fEvent    :TEvent;
      fip       :string;
      fimage    :THandle;
    public
      property Use       : TUse    read fUse     write fUse;
      property ComState  : TComSt  read fComSt   write fComSt;
      property State     : TState  read fState   write fState;
      property Color     : TColor  read fColor   write fColor;
      property FormHandle:THandle  write fimage;
      property DA        :TDA      read fDA;
      function DataExh:boolean;
      constructor Create(Event:TEvent;ip:string;
                         Use1:boolean;Function1:TGetState;DA1:TDeviceNameArr;
                         Use2:boolean;Function2:TGetState;DA2:TDeviceNameArr;
                         Use3:boolean;Function3:TGetState;DA3:TDeviceNameArr;
                         Use4:boolean;Function4:TGetState;DA4:TDeviceNameArr;
                         Use5:boolean;Function5:TGetState;DA5:TDeviceNameArr;
                         Use6:boolean;Function6:TGetState;DA6:TDeviceNameArr;
                         Use7:boolean;Function7:TGetState;DA7:TDeviceNameArr;
                         Use8:boolean;Function8:TGetState;DA8:TDeviceNameArr);
    protected
      procedure Execute; override;
  end;

var TM2409:array [1..3] of TTM2409;

implementation

function TTM2409.DataExh;
begin
  result:=fDataExh;
end;

constructor TTM2409.Create(Event:TEvent;ip:string;
                         Use1:boolean;Function1:TGetState;DA1:TDeviceNameArr;
                         Use2:boolean;Function2:TGetState;DA2:TDeviceNameArr;
                         Use3:boolean;Function3:TGetState;DA3:TDeviceNameArr;
                         Use4:boolean;Function4:TGetState;DA4:TDeviceNameArr;
                         Use5:boolean;Function5:TGetState;DA5:TDeviceNameArr;
                         Use6:boolean;Function6:TGetState;DA6:TDeviceNameArr;
                         Use7:boolean;Function7:TGetState;DA7:TDeviceNameArr;
                         Use8:boolean;Function8:TGetState;DA8:TDeviceNameArr);
var i:integer;
begin
  inherited  Create(true);
  fEvent     :=Event;
  fState     :=dsGray;
  fip        :=ip;
  fimage     :=0;
  fColor     :=clWhite;
  fUse[1]    :=Use1;
  fUse[2]    :=Use2;
  fUse[3]    :=Use3;
  fUse[4]    :=Use4;
  fUse[5]    :=Use5;
  fUse[6]    :=Use6;
  fUse[7]    :=Use7;
  fUse[8]    :=Use8;
  if fUse[1] then fFunction[1]:=Function1 else fFunction[1]:=nil;
  if fUse[2] then fFunction[2]:=Function2 else fFunction[2]:=nil;
  if fUse[3] then fFunction[3]:=Function3 else fFunction[3]:=nil;
  if fUse[4] then fFunction[4]:=Function4 else fFunction[4]:=nil;
  if fUse[5] then fFunction[5]:=Function5 else fFunction[5]:=nil;
  if fUse[6] then fFunction[6]:=Function6 else fFunction[6]:=nil;
  if fUse[7] then fFunction[7]:=Function7 else fFunction[7]:=nil;
  if fUse[8] then fFunction[8]:=Function8 else fFunction[8]:=nil;
  fDA[1]:=DA1;
  fDA[2]:=DA2;
  fDA[3]:=DA3;
  fDA[4]:=DA4;
  fDA[5]:=DA5;
  fDA[6]:=DA6;
  fDA[7]:=DA7;
  fDA[8]:=DA8;
  for i:=1 to 8 do
    fComSt[i]:=dsGray;
  fDataExh:=false;
  resume;
end;

procedure TTM2409.Execute;
var i:integer;
    St:TState;
    GreenCount:byte;
    RedCount  :byte;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    GreenCount:=0;
    RedCount  :=0;
    for i:=1 to 8 do
    if (fUse[i]) and (Assigned(fFunction[i])) then
      if fFunction[i] then begin fComSt[i]:=dsGreen; INC(GreenCount); end
                      else begin fComSt[i]:=dsRed;   INC(RedCount);   end
                      else fComSt[i]:=dsGray;
    fDataExh:=ping(PAnsiChar(fip),PAnsiChar('aaaaaaaa'),10);
    if fDataExh then
      if GreenCount<>0 then
        if RedCount<>0 then
           fState  :=dsYellow
        else fState:=dsGreen
      else fState  :=dsRed
    else fState    :=dsRed;
    if fState=dsGreen    then fColor:=_Green else
      if fState=dsYellow then fColor:=_Yell else
        if fState=dsRed  then fColor:=_Red;
    if fimage<>0 then
    PostMessage(fimage,WM_NOTIFY_2409,0,0);
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate*3)
                    else sleep(TimeToUpdate*3);
    if Terminated then exit;
  end;
end;

end.
