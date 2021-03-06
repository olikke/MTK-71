unit Manager_EM7302;

interface

uses Global,client_EM7302,Classes,Windows,SyncObjs,Graph,Container_EM7302,Dialogs;

type
  TmEM7302 = class(TThread)
  private
    TCPClient   :TTCPClient;
    IP          :string;
    ClientLost  :boolean;
    ErrCount    :integer;
    fNumb       :integer;
    fEv         :TEvent;
    procedure  Identefity;
    procedure  PrepareCommand(Command:TKUMO_Command;v1:byte;v2:byte);
  public
    //??? ??????????? KUMO_image
    procedure   ExternalCommand(Command:TKUMO_Command;v1:byte;v2:byte);
    constructor Create(IPa:string;Numb:integer;Han:THandle;ev:TEvent);
  protected
    procedure Execute; override;
  end;

var mEM7302: array [1..2] of TmEM7302;

implementation


procedure TmEM7302.ExternalCommand(Command:TKUMO_Command; v1: Byte; v2: Byte);
begin
  PrepareCommand(Command,v1,v2);
end;

procedure TmEM7302.PrepareCommand(Command:TKUMO_Command;v1:byte;v2:byte);
var B        :T255;
    length   :integer;
    Quest    :TKUMOQuestion;
begin
  B[0]:=$01;
  B[1]:=$4e;
  B[2]:=$30;
  length:=3;
  case Command of
    //connect, check
    BK_I: begin
            B[3]:=$42;
            B[4]:=$4B;
            B[5]:=$09;
            B[6]:=$49;
            INC(length,4)
          end;
    //get system name
    BK_N: begin
            B[3]:=$42;
            B[4]:=$4B;
            B[5]:=$09;
            B[6]:=$4E;
            INC(length,4)
          end;
    //get software title
    BK_T: begin
            B[3]:=$42;
            B[4]:=$4B;
            B[5]:=$09;
            B[6]:=$54;
            INC(length,4)
          end;
    //get software version
    BK_R: begin
            B[3]:=$42;
            B[4]:=$4B;
            B[5]:=$09;
            B[6]:=$52;
            INC(length,4)
          end;
    //get device name
    BK_D: begin
            B[3]:=$42;
            B[4]:=$4B;
            B[5]:=$09;
            B[6]:=$44;
            INC(length,4)
          end;
    //?????? ?????? ??????? ??????????
    QD_B: begin
            B[3]:=$51;
            B[4]:=$44;
            B[5]:=$09;
            INC(length,3)
          end;
    //get all source by name
    QN_S: begin
            B[3]:=$51;
            B[4]:=$4E;
            B[5]:=$09;
            B[6]:=$53;
            INC(length,4)
          end;
    //get all destination by name
    QN_D: begin
            B[3]:=$51;
            B[4]:=$4E;
            B[5]:=$09;
            B[6]:=$44;
            INC(length,4)
          end;
    //?????? ????????? ??? ??????????? ??????
    QD_N: begin
            //? ?????? ?????? v1 - ????? ????????? ??????
            //??????? ?? ?????? ????????? ? ???!!!
            B[3]:=$51;
            B[4]:=$44;
            B[5]:=$09;
            if not( v1 in [0..15]) then exit;
          //  for i:=1 to DestinLength[v1] do B[5+i]:=DestinTable[v1][i-1];
          //  INC(length,3+DestinLength[v1]);
          end;
    //??????????
    TI  : begin
            B[3]:=$54;
            B[4]:=$49;
            B[5]:=$09;
            //v1 - destination index
            if not( v1 in [1..16]) then exit;
            case v1 of
              0..9: begin B[6]:=$30+v1;    INC(length,4); end
              else  begin B[6]:=$31;  B[7]:=$30+v1-10; INC(length,5); end;
            end;
            B[length]:=$09;
            INC(length);
            //v2 - source index
            if not( v2 in [1..16]) then exit;
            case v2 of
              0..9: begin B[length]:=$30+v2;    INC(length); end
              else  begin B[length]:=$31;  B[length+1]:=$30+v2-10; INC(length,2); end;
            end;
          end;
  end;
  CheckSumCalculation(B,length);
  INC(length,2);
  B[length]:=$04;
  New(Quest);
  Quest^.MASS  :=B;
  Quest^.length:=length+1;
  Quest^.Comm  :=Command;

  if fnumb>2 then sleep(5);
  cs_KUMOList[fnumb].Enter;
  try
    KUMOList[fnumb].Add(Quest);
  finally
    cs_KUMOList[fnumb].Leave;
  end;
end;

procedure TmEM7302.Identefity;
begin
  PrepareCommand(BK_N,0,0);
  PrepareCommand(BK_R,0,0);
  PrepareCommand(QN_S,0,0);
  PrepareCommand(QN_D,0,0);
  TCPClient.UpdateMAC;
end;

procedure TmEM7302.Execute;
begin
  FreeOnTerminate:=false;
  ClientLost:=true;
  ErrCount:=3;
  while not Terminated do
  begin
    if NeedForSpeed then WaitForSingleObject(fev.Handle,TimeToUpdate)
                    else sleep(TimeToUpdate);
    if Terminated then
    begin
      TCPClient.Terminate;
      TCPClient.WaitFor;
      EM7302[fNumb].Free;
      EM7302[fNumb]:=nil;
      Gr[fNumb].Terminate;
      StopEventGraph[fNumb].SetEvent;
      Gr[fNumb].WaitFor;
      Gr[fNumb]:=nil;
      KUMOList[fnumb].Free;
      cs_KUMOList[fnumb].Free;
      exit;
    end;
    if not TCPClient.ConnectionState then
    begin
      INC(ErrCount);
      if ErrCount>=3 then ClientLost:=true;
    end else
    begin
      ErrCount:=0;
      if ClientLost then
      Identefity;
      ClientLost:=false;
    end;
    PrepareCommand(BK_D,0,0);
    PrepareCommand(QD_B,0,0);
  end;
end;

constructor TmEM7302.Create(IPa:string;Numb:integer;Han:THandle;ev:TEvent);
begin
  inherited create(true);
  cs_KUMOList[numb]   :=TCriticalSection.Create;
  KUMOList[numb]      :=TList.Create;
  IP            :=IPa;
  fNumb         :=Numb;
  fEv           :=ev;
  Gr[Numb]      :=TGraph.Create(numb,Han,StopEventGraph[Numb],numb=1);
  EM7302[Numb]  :=TEM7302.Create(IPa,Gr[Numb],numb);
  TCPClient     :=TTCPClient.Create(IPa,EM7302[Numb],numb);
    if numb=2 then
    fev:=ev;
  resume;
end;

end.
