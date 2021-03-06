unit Container_TM2410;

interface

uses MyPanel,Global,Classes,SyncObjs,Windows,container_TM2409,Graphics,hPing,SysUtils;

type
  TUse        = array [1..16] of boolean;
  TExch       = array [1..16] of TState;
  Tip         = array [1..16] of TStric;
  TExchState  = function:boolean of object;
  TMyFunction = array [1..16] of TExchState;
  TDA         = array [1..16] of TDeviceNameArr;
type
  TTM2410 = class(TThread)
  private
    fUse      :TUse;
    fExch     :TExch;
    fFunction :TMyFunction;
    fDA       :TDA;
    fip       :Tip;
    fEvent    :TEvent;
    fimage    :THandle;
    fState    :TState;
    fColor    :TColor;
    fMyDA     :integer;
    //????? ??????? ?????? ?? ????????????. ?? ? ???? ????? 1 ???? ??????????????
    fPing     :TPing;
    fPEvent   :TEvent;
    procedure MakePing(b1,b2,b3,b4:boolean;s1,s2,s3,s4:string);
  public
    property    Use:TUse   read fUse;
    property    Exch:TExch read fExch;
    property    DA:TDA     read fDA;
    property    ip:Tip     read fip;
    property    Color:TColor read fColor;
    property    State:TState read fState;
    property    FormHandle:THandle write fimage;
    constructor Create(Event:TEvent;MyDA:integer;
                       Use1 :boolean; Function1 :TExchState; DA1 :TDeviceNameArr; ip1 :TStric;
                       Use2 :boolean; Function2 :TExchState; DA2 :TDeviceNameArr; ip2 :TStric;
                       Use3 :boolean; Function3 :TExchState; DA3 :TDeviceNameArr; ip3 :TStric;
                       Use4 :boolean; Function4 :TExchState; DA4 :TDeviceNameArr; ip4 :TStric;
                       Use5 :boolean; Function5 :TExchState; DA5 :TDeviceNameArr; ip5 :TStric;
                       Use6 :boolean; Function6 :TExchState; DA6 :TDeviceNameArr; ip6 :TStric;
                       Use7 :boolean; Function7 :TExchState; DA7 :TDeviceNameArr; ip7 :TStric;
                       Use8 :boolean; Function8 :TExchState; DA8 :TDeviceNameArr; ip8 :TStric;
                       Use9 :boolean; Function9 :TExchState; DA9 :TDeviceNameArr; ip9 :TStric;
                       Use10:boolean; Function10:TExchState; DA10:TDeviceNameArr; ip10:TStric;
                       Use11:boolean; Function11:TExchState; DA11:TDeviceNameArr; ip11:TStric;
                       Use12:boolean; Function12:TExchState; DA12:TDeviceNameArr; ip12:TStric;
                       Use13:boolean; Function13:TExchState; DA13:TDeviceNameArr; ip13:TStric;
                       Use14:boolean; Function14:TExchState; DA14:TDeviceNameArr; ip14:TStric;
                       Use15:boolean; Function15:TExchState; DA15:TDeviceNameArr; ip15:TStric;
                       Use16:boolean; Function16:TExchState; DA16:TDeviceNameArr; ip16:TStric);
    procedure Execute; override;
  end;
                    //?????? ?????? ??? ??????? ???????? ???????? ??????
var TM24101,TM24102,TM24101d,TM24102d:TTM2410;

implementation

constructor TTM2410.Create(Event:TEvent;MyDA:integer;
                       Use1 :boolean; Function1 :TExchState; DA1 :TDeviceNameArr; ip1 :TStric;
                       Use2 :boolean; Function2 :TExchState; DA2 :TDeviceNameArr; ip2 :TStric;
                       Use3 :boolean; Function3 :TExchState; DA3 :TDeviceNameArr; ip3 :TStric;
                       Use4 :boolean; Function4 :TExchState; DA4 :TDeviceNameArr; ip4 :TStric;
                       Use5 :boolean; Function5 :TExchState; DA5 :TDeviceNameArr; ip5 :TStric;
                       Use6 :boolean; Function6 :TExchState; DA6 :TDeviceNameArr; ip6 :TStric;
                       Use7 :boolean; Function7 :TExchState; DA7 :TDeviceNameArr; ip7 :TStric;
                       Use8 :boolean; Function8 :TExchState; DA8 :TDeviceNameArr; ip8 :TStric;
                       Use9 :boolean; Function9 :TExchState; DA9 :TDeviceNameArr; ip9 :TStric;
                       Use10:boolean; Function10:TExchState; DA10:TDeviceNameArr; ip10:TStric;
                       Use11:boolean; Function11:TExchState; DA11:TDeviceNameArr; ip11:TStric;
                       Use12:boolean; Function12:TExchState; DA12:TDeviceNameArr; ip12:TStric;
                       Use13:boolean; Function13:TExchState; DA13:TDeviceNameArr; ip13:TStric;
                       Use14:boolean; Function14:TExchState; DA14:TDeviceNameArr; ip14:TStric;
                       Use15:boolean; Function15:TExchState; DA15:TDeviceNameArr; ip15:TStric;
                       Use16:boolean; Function16:TExchState; DA16:TDeviceNameArr; ip16:TStric);
var i:integer;
var c:integer;
b    :array [1..4] of boolean;
fi   :array [1..4] of string;
n    :array [1..4] of integer;
begin
  inherited Create(true);
  fImage       :=0;
  fEvent       :=Event;
  fMyDA        :=MyDA;
  fUse[1]      :=Use1;
  fUse[2]      :=Use2;
  fUse[3]      :=Use3;
  fUse[4]      :=Use4;
  fUse[5]      :=Use5;
  fUse[6]      :=Use6;
  fUse[7]      :=Use7;
  fUse[8]      :=Use8;
  fUse[9]      :=Use9;
  fUse[10]     :=Use10;
  fUse[11]     :=Use11;
  fUse[12]     :=Use12;
  fUse[13]     :=Use13;
  fUse[14]     :=Use14;
  fUse[15]     :=Use15;
  fUse[16]     :=Use16;
  fFunction[1] :=Function1;
  fFunction[2] :=Function2;
  fFunction[3] :=Function3;
  fFunction[4] :=Function4;
  fFunction[5] :=Function5;
  fFunction[6] :=Function6;
  fFunction[7] :=Function7;
  fFunction[8] :=Function8;
  fFunction[9] :=Function9;
  fFunction[10]:=Function10;
  fFunction[11]:=Function11;
  fFunction[12]:=Function12;
  fFunction[13]:=Function13;
  fFunction[14]:=Function14;
  fFunction[15]:=Function15;
  fFunction[16]:=Function16;
  fDA[1]       :=DA1;
  fDA[2]       :=DA2;
  fDA[3]       :=DA3;
  fDA[4]       :=DA4;
  fDA[5]       :=DA5;
  fDA[6]       :=DA6;
  fDA[7]       :=DA7;
  fDA[8]       :=DA8;
  fDA[9]       :=DA9;
  fDA[10]      :=DA10;
  fDA[11]      :=DA11;
  fDA[12]      :=DA12;
  fDA[13]      :=DA13;
  fDA[14]      :=DA14;
  fDA[15]      :=DA15;
  fDA[16]      :=DA16;
  fip[1]       :=IP1;
  fip[2]       :=IP2;
  fip[3]       :=IP3;
  fip[4]       :=IP4;
  fip[5]       :=IP5;
  fip[6]       :=IP6;
  fip[7]       :=IP7;
  fip[8]       :=IP8;
  fip[9]       :=IP9;
  fip[10]      :=IP10;
  fip[11]      :=IP11;
  fip[12]      :=IP12;
  fip[13]      :=IP13;
  fip[14]      :=IP14;
  fip[15]      :=IP15;
  fip[16]      :=IP16;
  for i:=1 to 16 do fExch[i]:=dsGray;
  c:=0;
  randomize;
  fillchar(b,4,false);
  //???? ?-?? ?? ?????? ????, ???? ?????????? ?? ????? ping
  for i:=1 to 16 do
    if (fUse[i]) and not Assigned(fFunction[i]) then
    begin
      inc(c);
      b[c] :=true;
      fi[c]:=fip[i];
      n[c] :=i;
      if c=4 then
        //?? ?? ?????? ? ???????????? ?????? ?? event ? ping  - ? ?????? ?????? ??? ??????????
        break;
    end;
  if c<>0 then
  begin
    MakePing(b[1],b[2],b[3],b[4],fi[1],fi[2],fi[3],fi[4]);
    if b[1] then fFunction[n[1]]:=fPing.Exh1;
    if b[2] then fFunction[n[2]]:=fPing.Exh2;
    if b[3] then fFunction[n[3]]:=fPing.Exh3;
    if b[4] then fFunction[n[4]]:=fPing.Exh4;
  end;
  fState:=dsGray;
  fColor:=_gray;
  resume;
end;

procedure TTM2410.MakePing(b1: Boolean; b2: Boolean; b3: Boolean; b4: Boolean; s1: string; s2: string; s3: string; s4: string);
begin
  fPEvent:=TEvent.Create(nil,false,false,'Event2410'+IntToStr(Random(255)));
  fPing  :=TPing.Create(fPEvent,
                        b1,s1,
                        b2,s2,
                        b3,s3,
                        b4,s4);

end;

procedure TTM2410.Execute;
var i:integer;
    GreenCount:integer;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    GreenCount:=0;
    for i:=1 to 16 do
    begin
      if (fUse[i]) and Assigned(fFunction[i]) then
        if fFunction[i] then begin fExch[i]:=dsGreen; INC(GreenCount) end
                             else  fExch[i]:=dsRed;


    end;
    if GreenCount<>0 then
    begin
      fState:=dsGreen;
      fColor:=_green;
    end else
    begin
      fState:=dsRed;
      fColor:=_red;
    end;
    if fimage<>0 then PostMessage(fimage,WM_NOTIFY_2410,fMyDA,0);
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate*3)
                    else sleep(TimeToUpdate*3);
    if Terminated then exit;
  end;
end;

end.
