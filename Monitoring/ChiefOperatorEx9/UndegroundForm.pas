unit UndegroundForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, ExtCtrls,Dialogs,
  Global,fm7212,fm7210,fm2220,fm3401,fm5401,fm2437,fm5402,fm2409,fm2411,fmARM,fm2408,fmLanding,
  fm2407,fm2410,fm7302;

type
  TUnd = class(TForm)
    CloseTIMER: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CloseTIMERTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ShowForm(dev:TDeviceNameArr);
  private
    FormList:TList;
    NeedToDelete:boolean;
  public
    Device:TDeviceNameArr;
    PostNumb:integer;
    procedure NextForm(n:TDeviceNameArr);


  end;

var
  Und: TUnd;

implementation

uses Main;

{$R *.dfm}

procedure TUnd.NextForm(n: TDeviceNameArr);
var Form:^TDeviceNameArr;
begin
  New(Form);
  Form^:=n;
  FormList.Add(Form);
  NeedToDelete:=false;
end;

procedure TUnd.CloseTIMERTimer(Sender: TObject);
begin
  CloseTimer.Enabled:=false;
  close;
end;

//olikke разобраться!
procedure TUnd.ShowForm(dev:TDeviceNameArr);
function Cap(D:TDeviceNameArr):string;
  begin
    result:=DeviceArr[Dev].FullName+' '+DeviceArr[Dev].Name+' '+DeviceArr[Dev].SchemeName;
  end;
begin
  if fMain.PageControl.ActivePageIndex<>0 then AlphaBlendValue:=180 else AlphaBlendValue:=0;
  case Dev of
    d2407:
       begin
         if f2407=nil then Application.CreateForm(Tf2407,f2407);
         f2407.Caption:=Cap(Dev);
         f2407.ShowModal;
       end;
    d24101,d24102:
       begin
         if f2410=nil then Application.CreateForm(Tf2410,f2410);
         f2410.Caption:=Cap(Dev);
         f2410.fNumber(INTEGER(dev)-INTEGER(d24101)+1);
         f2410.ShowModal;
       end;
    d24091, d24093, d24092:
       begin
         if f2409=nil then Application.CreateForm(Tf2409,f2409);
         f2409.Caption:=Cap(Dev);
         f2409.fNumber(INTEGER(Dev)-INTEGER(d24091)+1);
         f2409.ShowModal;
         f2409.Free;
         f2409:=nil;
       end;
    d72121,d72122:
      begin
        if fModulator=nil then
         Application.CreateForm(TfModulator,fModulator);
         fModulator.Caption:=Cap(Dev);
         fModulator.Device:=Dev;
         fModulator.ShowModal;
         fModulator.Free;
         fModulator:=nil;
      end;
    d73021,d73022:
      begin
        Application.CreateForm(TfKumo,fKumo);
        fKumo.Caption:=Cap(Dev);
        fKumo.fNumber(INTEGER(dev)-INTEGER(d73021)+1);
        fKumo.ShowModal;
      end;
    d24111,d24112,d24113,d24114,d24115:
           begin
             if f2411=nil then Application.CreateForm(Tf2411,f2411);
             f2411.Caption:=Cap(Dev);
             f2411.fNumbe(INTEGER(dev)-INTEGER(d24111)+1);
             f2411.ShowModal;
             f2411.Free;
             f2411:=nil;
           end;
    d2408: begin
             if f2408=nil then Application.CreateForm(Tf2408,f2408);
             f2408.Caption:=Cap(Dev);
             f2408.ShowModal;
           end;
    d2322: begin
             if fARM=nil then Application.CreateForm(TfARM,fARM);
             fARM.Caption:=Cap(Dev);
             fARM.ShowModal;
           end;
    d7303: ;
    d5401: begin if f5401=nil then Application.CreateForm(Tf5401,f5401);
                 f5401.Caption:=Cap(Dev);
                 f5401.ShowModal;
           end;
    d3401: begin if f3401=nil then Application.CreateForm(Tf3401,f3401);
                 f3401.Caption:=Cap(dev);
                 f3401.ShowModal;
           end;
    d24371,d24372,d24373,d24374:
           begin if f2437=nil then Application.CreateForm(Tf2437,f2437);
                 f2437.Caption:=Cap(Dev);
                 f2437.fNumber(INTEGER(Dev)-INTEGER(d24371)+1);
                 f2437.ShowModal;
                 f2437.Free;
                 f2437:=nil;
           end;

    d54021,d54022:
           begin if f5402=nil then Application.CreateForm(Tf5402,f5402);
                 f5402.Caption:=cAP(Dev);
                 f5402.name:=DeviceArr[Dev].FullName+#10#13+DeviceArr[Dev].Name+' '+DeviceArr[Dev].SchemeName;
                 if dev=d54021  then f5402.fNumber(1) else f5402.fNumber(2);
                 f5402.ShowModal;
                 f5402.Free;
                 f5402:=nil;
           end;
    dpsu1: ;
    dpsu2: ;
    dpsu3: ;
    dpsu4: ;
    dpsu5: ;
    dpsu6: ;
    dpsu7: ;
    dpsu8: ;
    dpsu9: ;
    d7402: ;
    d2404: ;
    d72131: ;
    d72132: ;
    d72133: ;
    d7305: ;
    dMTK1: begin
             if fLanding=nil then Application.CreateForm(TfLanding,fLanding);
             fLanding.ShowModal;
           end;
    dMTK2: ;
    d0401: ;
    dku   :
          begin
            if fKU=nil then Application.CreateForm(Tfku,fku);
            fku.fNumber(PostNumb);
            fku.ShowModal;
            fKU.Free;
            fKU:=nil;
          end;
    dzero:
          begin
            if f7210=nil then Application.CreateForm(Tf7210,f7210);
            f7210.PostNumber:=PostNumb;
            f7210.ShowModal;
            f7210.Free;
            f7210:=nil;
          end;
  end;
end;

procedure TUnd.FormActivate(Sender: TObject);
var Empty:boolean;
    d:^TDeviceNameArr;
    Form:^TDeviceNameArr;
    i:integer;
begin
  FormList:=TList.Create;
  New(Form);
  Form^:=Device;
  FormList.Add(Form);
  empty:=false;
  while not empty do
  begin
    NeedToDelete:=true;
    d:=(FormList.Items[FormList.Count-1]);
    ShowForm(d^);
    if NeedToDelete then
    begin
      FormList.Delete(FormList.Count-1);
      Dispose(d);
    end;
    empty:=FormList.Count=0;
  end;
  CloseTimer.Enabled:=true;
end;

procedure TUnd.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i,cn:integer;
       d:^TDeviceNameArr;
begin
  cn:=FormList.Count;
  if cn>0 then
  for i :=cn-1 downto 0 do
  begin
    d:=(FormList.Items[cn]);
    FormList.Delete(cn);
    Dispose(d);
  end;
  FormList.Free;
end;

end.
