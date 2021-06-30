unit SeConst;

interface

const
  INIT_KEY         = '\Software\NetUtils\SnmpEye\';
  HL_KEY           = 'History Lists\';
  HL_AGENT_KEY     = INIT_KEY + HL_KEY + 'hlAgent\';
  HL_COMMUNITY_KEY = INIT_KEY + HL_KEY + 'hlCommunity\';
  HL_OID_KEY       = INIT_KEY + HL_KEY + 'hlOid\';
  SPosition        = 'Position';
  SWindowState     = 'WindowState';
  SShowToolBar     = 'ShowToolBar';
  SShowStatusBar   = 'ShowStatusBar';
  SAction          = 'Action';
  STimeOut         = 'TimeOut';
  SRetries         = 'Retries';
  SAllOids         = 'all';
  SOidsSep         = ';';
  SDefExt          = '.txt';
  SFilter          = 'SnmpEye Files (*' + SDefExt + ')|*' + SDefExt + '|';

resourcestring
  SEmptyParams = 'Input parameters (Agent, Community, Oid) cannot be empty.';
  SInvalidOid = 'Invalid Oids, ''%s'', specified.';
  SSnmpMgrOpenErr = 'SnmpMgrOpen error: %d.';
  SSnmpMgrRequestErr = 'SnmpMgrRequest error: %d.';
  SSnmpMgrRequestErrStatus = 'SnmpMgrRequest: ErrorStatus = %d, ErrorIndex = %d.';
  SReady = 'Ready';
  SUpdating = 'Updating...';

implementation

end.
