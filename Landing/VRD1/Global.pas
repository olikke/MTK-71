unit Global;

interface
uses Graphics;

const
    Color_G : TColor = $0000FF00;
    Color_R : TColor = $000000FF;
    Color_Y : TColor = clYellow;
    Color_S : TColor = clSilver;
    Color_W : TColor = clWhite;
    IP_BroadCast:string = '192.168.1.255';

TYPE HDD = record HDD_NAME:char; TotalSpace,FreeSpace:Single; end;
     THDDEnum=array [1..4] of HDD;

TYPE LAN = record LanIP:String[15];State:boolean; end;
     TLanEnum=array [1..2] of LAN;

var  LanCount:word;
     HDDCount:word;
     HDDEnum:THDDEnum;
     LanEnum:TLanEnum;
     fSize:int64=0;

TYPE TvSMS=record
     HOST     :word;
     HDDCount :word;
     HDDEnum  :THDDEnum;
     LanCount :word;
     LanEnum  :TLANEnum;
     Video    :boolean;
     fl_VRD   :byte;
     Size     :int64;
end;

var vSMS:TvSMS;
  //из базы данных
  IP_SrvWSC1: String;
  IP_SrvWSC2: String;
  IP_SrvVRD1: String;
  IP_SrvVRD2: String;
  fl_Synchro:boolean=false;

type
  TLA=record
    LA_ID:byte;
    Name:string;
    XE,YE,ZE,         //отклонение положения глаза
    XF,YF,ZF,         //отклонение положения фары
    XG,YG,ZG:double;  //отклонение положения гака
  end;

var LASet:array of TLA;
    Aircraft:integer;

implementation

end.
