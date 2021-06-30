unit hPing;

interface

uses Global,Classes,SyncObjs,Windows;

type
  TPing = class(TThread)
    private
      fEvent:TEvent;
      fUse  :array [1..4] of boolean;
      fip   :array [1..4] of string;
      fRest :array [1..4] of byte;
      fExh  :array [1..4] of boolean;
    public
      property  Exh1:boolean read fExh[1];
      property  Exh2:boolean read fExh[2];
      property  Exh3:boolean read fExh[3];
      property  Exh4:boolean read fExh[4];
      constructor Create(Event:TEvent;
                         use1:boolean;ip1:TStric;
                         use2:boolean;ip2:TStric;
                         use3:boolean;ip3:TStric;
                         use4:boolean;ip4:TStric);
    protected
      procedure Execute; override;
  end;

implementation

constructor TPing.Create(Event: TEvent;
                         use1: Boolean; ip1: TStric;
                         use2: Boolean; ip2: TStric;
                         use3: Boolean; ip3: TStric;
                         use4: Boolean; ip4: TStric);
begin
  inherited Create(true);
  fEvent :=Event;
  fUse[1] :=use1;
  fUse[2] :=use2;
  fUse[3] :=use3;
  fUse[4] :=use4;
  fIP[1]  :=ip1;
  fIP[2]  :=ip2;
  fIP[3]  :=ip3;
  fIP[4]  :=ip4;
  fRest[1]:=0;
  fRest[2]:=0;
  fRest[3]:=0;
  fRest[4]:=0;
  fExh[1] :=false;
  fExh[2] :=false;
  fExh[3] :=false;
  fExh[4] :=false;
  resume;
end;

procedure TPing.Execute;
var i:integer;
begin
  FreeOnTerminate:=false;
  while not Terminated do
  begin
    for i:=1 to 4 do
    if fUse[i] then
      if fRest[i]<=2 then
        if ping(PAnsiChar(fip[i]),PAnsiChar('aaaaaaaa'),10) then
        begin
          fRest[i]:=0;
          fExh[i] :=true;
        end else
        begin
          INC(fRest[i]);
          fExh[i] :=false;
        end
      else
      begin
        INC(fRest[i]);
        if fRest[i]>=5 then fRest[i]:=0;
      end;
    if NeedForSpeed then WaitForSingleObject(fEvent.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then exit;
  end;
end;



end.
