unit IpConfig;

interface
USES Windows,IpTypes;
     
const
MAX_INTERFACE_NAME_LEN = 256;
MAX_ADAPTER_NAME = 127;
MAXLEN_PHYSADDR = 8;
MAXLEN_IFDESCR = 256;
MIB_IF_ADMIN_STATUS_UP = 1;
MIB_IF_ADMIN_STATUS_DOWN = 2;
MAX_ADAPTER_NAME_LENGTH = 256;
MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
MAX_ADAPTER_ADDRESS_LENGTH = 8;
IPHelper = 'iphlpapi.dll';
MAX_HOSTNAME_LEN = 127;
MAX_DOMAIN_NAME_LEN = 127;
MAX_SCOPE_ID_LEN = 256;

MIB_IF_TYPE_OTHER = 1;
MIB_IF_TYPE_ETHERNET = 6;
MIB_IF_TYPE_TOKENRING = 9;
MIB_IF_TYPE_FDDI = 15;
MIB_IF_TYPE_PPP = 23;
MIB_IF_TYPE_LOOPBACK = 24;
MIB_IF_TYPE_SLIP = 28;

type
PMIB_IFROW = ^MIB_IFROW;
MIB_IFROW = record
wszName : array[1..MAX_INTERFACE_NAME_LEN]of WCHAR;
dwIndex : DWORD;
dwType : DWORD;
dwMtu : DWORD;
dwSpeed : DWORD;
dwPhysAddrLen : DWORD;
bPhysAddr : array[1..MAXLEN_PHYSADDR]of BYTE;
dwAdminStatus : DWORD ;
dwOperStatus : DWORD;
dwLastChange : DWORD;
dwInOctets : DWORD;
dwInUcastPkts : DWORD;
dwInNUcastPkts : DWORD;
dwInDiscards : DWORD;
dwInErrors : DWORD;
dwInUnknownProtos : DWORD;
dwOutOctets : DWORD;
dwOutUcastPkts : DWORD;
dwOutNUcastPkts : DWORD;
dwOutDiscards : DWORD;
dwOutErrors : DWORD;
dwOutQLen : DWORD;
dwDescrLen : DWORD;
bDescr : array[1..MAXLEN_IFDESCR]of BYTE;
end;

var IFROW: MIB_IFROW;

type
time_t = Longint;

{IP_ADDRESS_STRING = record
S : array [0..15] of Char;
end;    }

IP_MASK_STRING = IP_ADDRESS_STRING;
PIP_MASK_STRING = ^IP_MASK_STRING;

PIP_ADDR_STRING = ^IP_ADDR_STRING;
IP_ADDR_STRING = record
Next: PIP_ADDR_STRING;
IpAddress: IP_ADDRESS_STRING;
IpMask: IP_MASK_STRING;
Context: DWORD;
end;

{PIP_ADAPTER_INFO = ^IP_ADAPTER_INFO;
IP_ADAPTER_INFO = record
Next: PIP_ADAPTER_INFO;
ComboIndex: DWORD;
AdapterName: array [0..MAX_ADAPTER_NAME_LENGTH + 3] of Char;
Description: array [0..MAX_ADAPTER_DESCRIPTION_LENGTH + 3] of Char;
AddressLength: UINT;
Address: array [0..MAX_ADAPTER_ADDRESS_LENGTH - 1] of BYTE;
Index: DWORD;
Type_: UINT;
DhcpEnabled: UINT;
CurrentIpAddress: PIP_ADDR_STRING;
IpAddressList: IP_ADDR_STRING;
GatewayList: IP_ADDR_STRING;
DhcpServer: IP_ADDR_STRING;
HaveWins: BOOL;
PrimaryWinsServer: IP_ADDR_STRING;
SecondaryWinsServer: IP_ADDR_STRING;
LeaseObtained: time_t;
LeaseExpires: time_t;
end;     }

type
PFIXED_INFO = ^FIXED_INFO;
FIXED_INFO = record
HostName : array [0..MAX_HOSTNAME_LEN + 4] of char;
DomainName : array [0..MAX_DOMAIN_NAME_LEN + 4] of char;
CurrentDnsServer : PIP_ADDR_STRING;
DnsServerList : IP_ADDR_STRING;
NodeType : UINT;
ScopeId : array [0..MAX_SCOPE_ID_LEN + 4] of char;
EnableRouting : UINT;
EnableProxy : UINT;
EnableDns : UINT;
end;

type
PIP_ADAPTER_INDEX_MAP = ^IP_ADAPTER_INDEX_MAP;
IP_ADAPTER_INDEX_MAP = record
Index : ULONG;
Name : array [0..MAX_ADAPTER_NAME] of wchar;
end;

type
PIP_INTERFACE_INFO = ^IP_INTERFACE_INFO;
IP_INTERFACE_INFO = record
NumAdapters : longint;
Adapter : array[0..1-1] of IP_ADAPTER_INDEX_MAP;
end;

function GetAdaptersInfo(pAdapterInfo: PIP_ADAPTER_INFO; var pOutBufLen: ULONG): DWORD; stdcall; external IPHelper;
function GetIfEntry(pIfRow : PMIB_IFROW): DWORD; stdcall; external 'Iphlpapi.dll' name 'GetIfEntry';
function SetIfEntry(pIfRow : PMIB_IFROW): DWORD; stdcall; external 'Iphlpapi.dll' name 'SetIfEntry';
function GetNetworkParams(pFixedInfo : pFIXED_INFO; var pOutBufLen : ULONG): DWORD; stdcall; external 'Iphlpapi.dll' name 'GetNetworkParams';
function IpReleaseAddress(pAdapterInfo : IP_ADAPTER_INDEX_MAP): DWORD; stdcall; external 'Iphlpapi.dll' name 'IpReleaseAddress';
function IpRenewAddress(pAdapterInfo : IP_ADAPTER_INDEX_MAP): DWORD; stdcall; external 'Iphlpapi.dll' name 'IpRenewAddress';
function GetInterfaceInfo(pIfTable : PIP_INTERFACE_INFO; dwOutBufLen : PULONG): DWORD; stdcall; external 'Iphlpapi.dll' name 'GetInterfaceInfo';

implementation

end.
 