; Quick and dirty installer for smartmontools for Windows
; This stuff is licensed under GPLv2.

#define AppName "smartmontools for Windows"
#define AppShortName "smartmontools-win"
#define MajorVersion "6.1"
#define MinorVersion "4"
#define SubBuild "1"
#define AppPublisher "Ozy de Jong"
#define AppURL "http://www.netpower.fr"

#define BaseDir "C:\PRJ\BTC\Smartmontools for Windows"
#define SmartmonToolsDir "smartmontools-6.1-1.win32-setup"
#define SendmailDir "sendEmail-v156"
#define GzipDir "gzip-1.3.12-1-bin"
#define SmartServiceName "smartd"
#define OldSmartServiceName "SmartHDDLifeGuard"
#define AppGUID "{487E2D86-AB76-467B-8EC0-0AF89EC38F5C}"

[Setup]
; Aribtrary chosen GUID
AppId={{#AppGUID}
AppName={#AppName}
AppVersion={#MajorVersion}-{#MinorVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
AppUpdatesURL={#AppURL}
DefaultDirName={pf32}\{#AppName}
DefaultGroupName=smartmontools for Windows
LicenseFile={#BaseDir}\{#SmartmonToolsDir}\doc\COPYING.txt
OutputDir={#BaseDir}
OutputBaseFilename={#AppShortName}-{#MajorVersion}-{#MinorVersion}
Compression=lzma2/max
SolidCompression=yes
VersionInfoCopyright=Written in 2012-2013 by Orsiris "Ozy" de Jong http://www.netpower.fr
VersionInfoVersion="{#MajorVersion}.{#MinorVersion}.{#SubBuild}"
MinVersion=0,5.0
CloseApplications=no

[Languages]
Name: en; MessagesFile: "compiler:Default.isl"; InfoBeforeFile: "{#BaseDir}\README-EN.TXT";
Name: fr; MessagesFile: "compiler:Languages\French.isl"; InfoBeforeFile: "{#BaseDir}\README-FR.TXT";
Name: de; MessagesFile: "compiler:Languages\German.isl"; InfoBeforeFile: "{#BaseDir}\README-DE.TXT";

[CustomMessages]
#include "smartmontools for windows strings.iss"

[Types]
Name: full; Description: "{cm:FullInstall}";
Name: custom; Description: "{cm:CustomInstall}"; Flags: iscustom; 

[Components]
Name: core; Description: "{cm:coredescription}"; Types: full custom; Flags: fixed
Name: core\64bits; Description: "{cm:core64bits}"; Types: custom;
Name: core\service; Description: "{cm:coreservice}"; Types: full custom;
Name: core\service\mailsupport; Description: "{cm:mailsupport}"; Types: full custom;
Name: core\service\localsupport; Description: "{cm:localsupport}"; Types: custom;
Name: regext; Description: "{cm:regext}"; Types: full custom;
Name: regext\info; Description: "{cm:smartinfo}"; Types: Full custom;
Name: regext\tests; Description: "{cm:smarttests}"; Types: Full custom;
Name: updatedb; Description: "{cm:updatedb}"; Types: Full custom;
Name: links; Description: "{cm:authorlinks}"; Types: full custom;

[Files]
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\drivedb.h"; DestDir: "{app}\bin"; Components: core;
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\runcmda.exe.manifest"; DestDir: "{app}\bin"; Components: core;
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\runcmdu.exe.manifest"; DestDir: "{app}\bin"; Components: core;
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\update-smart-drivedb.exe"; DestDir: "{app}\bin"; Components: core;
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\smartd_warning.cmd"; DestDir: "{app}\bin"; Components: core;
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\smartd.conf"; DestDir: "{app}\bin"; DestName: smartd.conf.example; Components: core; BeforeInstall: UninstallService('{#SmartServiceName}'); Flags: ignoreversion
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\runcmda.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\runcmdu.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\smartctl.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\smartctl-nc.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\smartd.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin\wtssendmsg.exe"; DestDir: "{app}\bin"; Components: core; Check: AMD64InstallNotSelected()
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\runcmda.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\runcmdu.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\smartctl.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\smartctl-nc.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\smartd.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\bin64\wtssendmsg.exe"; DestDir: "{app}\bin"; Components: core\64bits; Flags: 64bit; Check: IsWin64
Source: "{#BaseDir}\{#SmartmontoolsDir}\doc\*"; DestDir: "{app}\doc\smartmontools"; Components: core; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#BaseDir}\{#SendmailDir}\README.TXT"; DestDir: "{app}\doc\sendmail"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#SendmailDir}\README-BR.TXT"; DestDir: "{app}\doc\sendmail"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#SendmailDir}\CHANGELOG.TXT"; DestDir: "{app}\doc\sendmail"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#SendmailDir}\TODO.TXT"; DestDir: "{app}\doc\sendmail"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#SendmailDir}\sendEmail.exe"; DestDir: "{app}\bin"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#SendmailDir}\sendEmail.pl"; DestDir: "{app}\bin"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#GzipDir}\bin\gzip.exe"; DestDir: "{app}\bin"; Components: core\service\mailsupport;
Source: "{#BaseDir}\{#GzipDir}\man\cat1\gzip.1.txt"; DestDir: "{app}\doc\gzip"; Components: core\service\mailsupport;
Source: "{#BaseDir}\README-EN.TXT"; DestDir: "{app}\doc\Smartmontools for Windows installer"; Components: core;
Source: "{#BaseDir}\README-FR.TXT"; DestDir: "{app}\doc\Smartmontools for Windows installer"; Components: core;
Source: "{#BaseDir}\README-DE.TXT"; DestDir: "{app}\doc\Smartmontools for Windows installer"; Components: core;
Source: "{#BaseDir}\erroraction.cmd"; DestDir: "{app}\bin"; Components: core\service;

[Run]
;Filename: {sys}\sc.exe; Parameters: "create ""{#SmartServiceName}"" binPath= ""\""{app}\bin\smartd.exe\"" --service -c \""{app}\bin\smartd.conf\"""" start= auto DisplayName= ""S.M.A.R.T. Harddisk lifeguard for Windows service"""; Components: core\service; OnlyBelowVersion: 6.0; Flags: runhidden
;Filename: {sys}\sc.exe; Parameters: "create ""{#SmartServiceName}"" binPath= ""\""{app}\bin\smartd.exe\"" --service -c \""{app}\bin\smartd.conf\"""" start= delayed-auto DisplayName= ""S.M.A.R.T. Harddisk lifeguard for Windows service"""; Components: core\service; MinVersion: 6.0; Flags: runhidden
Filename: {sys}\sc.exe; Parameters: "delete {#OldSmartServiceName}"; Components: core\service; Check: IsUpdateInstall(); Flags: runhidden waituntilterminated
Filename: {sys}\sc.exe; Parameters: "delete {#SmartServiceName}"; Components: core\service; Check: IsUpdateInstall(); Flags: runhidden waituntilterminated
Filename: {app}\bin\update-smart-drivedb.exe; Parameters: "/S"; Components: updatedb; Flags: waituntilterminated
Filename: {app}\bin\smartd.exe; Parameters: "install -c ""{app}\bin\smartd.conf"""; Components: core\service; Flags: runhidden

[Icons]
Name: {group}\Visit NetPower.fr; Filename: http://www.netpower.fr; Components: links;
Name: {group}\Visit smartmontools Site; Filename: http://smartmontools.sourceforge.net; Components: links;
Name: {group}\Manually configure Smart options; Filename: "{win}\notepad.exe"; Parameters: """{app}\bin\smartd.conf"""; Components: core;
Name: "{group}\{cm:UninstallProgram, {#=AppName}}"; Filename: {uninstallexe}; 

[Registry]
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctlinfo\; ValueType: String; ValueData: {cm:smartinfo}; Components: regext\info; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctlinfo\command; ValueType: String; ValueData: """{pf32}\smartmontools for Windows\bin\runcmda.exe"" ""{pf32}\smartmontools for Windows\bin\smartctl.exe"" -a %L"; Components: regext\info; Flags: uninsdeletevalue
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctlshorttest\; ValueType: String; ValueData: {cm:smarttestshort}; Components: regext\tests; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctlshorttest\command; ValueType: String; ValueData: """{pf32}\smartmontools for Windows\bin\runcmda.exe"" ""{pf32}\smartmontools for Windows\bin\smartctl.exe"" -t short %L"; Components: regext\tests; Flags: uninsdeletevalue
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctllongtest\; ValueType: String; ValueData: {cm:smarttestlong}; Components: regext\tests; Flags: uninsdeletekey
Root: HKLM; Subkey: SOFTWARE\Classes\Drive\shell\smartctllongtest\command; ValueType: String; ValueData: """{pf32}\smartmontools for Windows\bin\runcmda.exe"" ""{pf32}\smartmontools for Windows\bin\smartctl.exe"" -t long %L"; Components: regext\tests; Flags: uninsdeletevalue

[UninstallRun]
Filename: {sys}\sc.exe; Parameters: "delete ""{#SmartServiceName}"""; Components: core\service; Flags: runhidden

[UninstallDelete]
Type: Files; Name: "{app}\bin\erroraction.cmd";
Type: Files; Name: "{app}\bin\erroraction_config.cmd";
Type: Files; Name: "{app}\bin\smartd.conf";
Type: Files; Name: "{app}\bin\drivedb.h.old";
Type: dirifempty; Name: "{app}\bin";
Type: dirifempty; Name: "{app}";

[Code]
var 
  //// smartd parameters
  hddautodetection: Boolean;
  hddlist: String;                      // device list passed as "/dev/pd0;/dev/pd1;/dev/csmi0,4"
  hddlistexploded: TArrayOfString;      // Array containing devices 
  hddlistimploded: String;              // device list parsed as "/dev/pd0" + CRLF + "/dev/pd1" + CRLF + "/dev/csmi0,4" + CRLF
  
  autotestlong, autotestshort: Boolean;            // enable or disable autotests
  autotestlongregex, autotestshortregex: String;   // autotest regex
  
  checkhealth, checkataerrors, reportselftesterrors, checkfailureusage: Boolean;
  reportcurrentpendingsect, reportofflinependingsect, trackchangeusageprefail, ignoretemperature: Boolean;
  powermode, maxskiptests: String;
  
  //// alert parameters
  localmessages, keepfirstlog: Boolean;
  warningmessage: String;
  sourcemail, destinationmail, smtpserver, tls, smtpserveruser, smtpserverpass: String;
  compresslogs, sendtestmessage: Boolean;
  
  //// Gui-only smartd parameters
  guihddautodetection: TNewCheckListBox;
  guihddlist: TMemo;
  
  LMonday, LTuesday, LWednesday, LThursday, LFriday, LSaturday, LSunday: TCheckBox;
  SMonday, STuesday, SWednesday, SThursday, SFriday, SSaturday, SSunday: TCheckBox;
  guilongtesthour, guishorttesthour: TComboBox;
  
  guicheckhealth,  guicheckataerrors, guireportselftesterrors, guicheckfailureusage: TCheckBox;
  guireportcurrentpendingsect, guireportofflinependingsect, guitrackchangesusageprefail, guiignoretemperature: TCheckbox;

  guipowermode, guimaxskiptests: TComboBox;
  
  //// Gui-only alert parameters
  guilocalmessages, guikeepfirstlog: TCheckBox;
  guiwarningmessage: Tmemo;
  guisourcemail, guidestinationmail, guismtpserver, guismtpserveruser: TEdit;
  guismtpserverpass: TPasswordEdit;
  guitls: TComboBox;
  // guilocalmessage: TMemo;
  guicompresslogs: TCheckBox;
  guisendtestmessage: TButton;
  
  //// Static texts
  statictext1, statictext2, statictext3, statictext4, statictext5, statictext6, statictext7, statictext8: TNewStaticText;
  statictext100, statictext101, statictext102, statictext103, statictext104, statictext105, statictext106, statictext107: TNewStaticText;

#include "smartmontools for Windows includes.iss"

//// Create a file called smart.(version).log including info about all disks
function CreateInitialLog(): Boolean;
var ResultCode: Integer;
begin
  SaveStringToFile(ExpandConstant('{app}\smartmontools-install-{#MajorVersion}-{#MinorVersion}.log'), '# Smartmontools for Windows installed on ' + GetDateTimeString('dd mmm yyyy hh:nn:ss', #0, #0) + #13#10 + #13#10, False);
  Exec(ExpandConstant('{cmd}') ,ExpandConstant('/c for /f "delims= " %i in (' + #39 + '"{app}\bin\smartctl" --scan' + #39 +') do "{app}\bin\smartctl.exe" -a %i >> "{app}\smartmontools-install-{#MajorVersion}-{#MinorVersion}.log"'), '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;

//// Get commandline arguments
function InitializeSetup(): Boolean;
begin

  // Stop the smartd service before upgrading
  if (IsUpdateInstall() = true) then
  begin
    UnloadService('{#SmartServiceName}');
    UnloadService('{#OldSmartServiceName}');
  end;

  // Get smartd parameters from commandline
  autotestshortregex := GetCommandlineParam('--short');
  if (Length(autotestshortregex) > 2) then
    autotestshort := True
  else if (autotestshortregex = 'no') then
    autotestshort := false
  else
  begin
    autotestshortregex := 'S/../.././08';
    autotestshort := true;
  end;
  autotestlongregex := GetCommandlineParam('--long');
  if (Length(autotestlongregex) > 2) then
    autotestlong := True
  else if (autotestshortregex = 'no') then
    autotestlong := false
  else
  begin
    autotestlongregex := 'L/../../5/12';
    autotestlong := true;
  end;
  hddlist := GetCommandlineParam('--hddlist');
  if (Length(hddlist) > 1) then
  begin
    hddautodetection := false;
    hddlistexploded := Explode(hddlist, ';');
  end else
    hddautodetection := true;
  if (GetCommandlineParam('--checkhealth') = 'no') then
    checkhealth := false
  else
    checkhealth := true;
  if (GetCommandlineParam('--checkataerrors') = 'no') then
    checkataerrors := false
  else
    checkataerrors := true;
  if (GetCommandlineParam('--checkfailureusage') = 'no') then
    checkfailureusage := false
  else
    checkfailureusage := true;
  if (GetCommandlineParam('--reportselftesterrors') = 'no') then
    reportselftesterrors := false
  else
    reportselftesterrors := true;
  if (GetCommandlineParam('--reportcurrentpendingsect') = 'no') then
    reportcurrentpendingsect := false
  else
    reportcurrentpendingsect := true;
  if (GetCommandlineParam('--reportofflinependingsect') = 'no') then
    reportofflinependingsect := false
  else
    reportofflinependingsect := true;
  if (GetCommandlineParam('--trackchangeusageprefail') = 'no') then
    trackchangeusageprefail := false
  else
    trackchangeusageprefail := true;
  if (GetCommandlineParam('--ignoretemperature') = 'no') then
    ignoretemperature := false
  else
    ignoretemperature := true;  
  powermode := GetCommandlineParam('--powermode');
  if (powermode = '') then
    powermode := 'sleep';
  maxskiptests := GetCommandlineParam('--maxskips');
 if (maxskiptests = '') then
    maxskiptests := '7';
  
  // Get local & mail messages parameters from commandline
  sourcemail := GetCommandlineParam('-f');
  destinationmail := GetCommandlineParam('-t');
  smtpserver := GetCommandlineParam('-s');
  smtpserveruser := GetCommandlineParam('-u');
  smtpserverpass := GetCommandlineParam('-p');
  tls := GetCommandlineParam('--tls');
  if (tls = '') then
    tls := 'no';
  if (GetCommandlineParam('--localmessages') = 'yes') then
    localmessages := true
  else
    localmessages := false;
  warningmessage := GetCommandlineParam('--warningmessage');
  if (Length(warningmessage) < 1) then
    warningmessage := ExpandConstant('{cm:warningmessage}');
  if (GetCommandlineParam('--compresslogs') = 'no') then
    compresslogs := false
  else
    compresslogs := true;
  if (GetCommandlineParam('--keepfirstlog') = 'no') then
    keepfirstlog := false
  else
    keepfirstlog := true;
  if (GetCommandlineParam('--sendtestmessage') = 'no') then
    sendtestmessage := false
  else
    sendtestmessage := true;
  
  result := true;
end;

//// Import GUI config into CLI parameters
function GetGuiConfig():Boolean;
var autotestshortdays: String;
var autotestlongdays: String;

begin
  if (Wizardsilent = false) then
  begin    
    if guihddautodetection.Checked[0] = true then
      hddautodetection := true
    else
    begin
      hddlistexploded := Explode(guihddlist.text, #13#10);
      hddautodetection := false;
    end;
    if guicheckhealth.Checked = true then
      checkhealth := true
    else
      checkhealth := false;
    if guicheckataerrors.Checked = true then
      checkataerrors := true
    else
      checkataerrors := false;
    if guicheckfailureusage.Checked = true then
      checkfailureusage := true
    else
      checkfailureusage := false;
    if guireportselftesterrors.Checked = true then
      reportselftesterrors := true
    else
      reportselftesterrors := false;
    if guireportcurrentpendingsect.Checked = true then
      reportcurrentpendingsect := true
    else
      reportcurrentpendingsect := false;
    if guireportofflinependingsect.Checked = true then
      reportofflinependingsect := true
    else
      reportofflinependingsect := false;
    if guiignoretemperature.Checked = true then
      ignoretemperature := true
    else
      ignoretemperature := false;
    powermode := guipowermode.Text;
    maxskiptests := guimaxskiptests.Text;
    
    sourcemail := guisourcemail.Text;
    destinationmail := guidestinationmail.Text;
    smtpserver := guismtpserver.Text;
    smtpserveruser := guismtpserveruser.Text;
    smtpserverpass := guismtpserverpass.Text;
    tls := guitls.Text;
    localmessages := guilocalmessages.Checked;
    warningmessage := guiwarningmessage.Text;
    compresslogs := guicompresslogs.Checked;
    keepfirstlog := guikeepfirstlog.Checked;

    // Make accurate regex out of checkboxes, if not CLI defined
    // I admit it, it's horribily coded
    autotestshortdays := '[';
    if SMonday.Checked = true then
      autotestshortdays := autotestshortdays + '1';
    if STuesday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '2'
      else
        autotestshortdays := autotestshortdays + ',2';
    if SWednesday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '3'
      else
        autotestshortdays := autotestshortdays + ',3';
    if SThursday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '4'
      else
        autotestshortdays := autotestshortdays + ',4';
    if SFriday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '5'
      else
        autotestshortdays := autotestshortdays + ',5';
    if SSaturday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '6'
      else
        autotestshortdays := autotestshortdays + ',6';
    if SSunday.Checked = true then
      if (LastChar(autotestshortdays) = ',') or (LastChar(autotestshortdays) = '[') then
        autotestshortdays := autotestshortdays + '7'
      else
        autotestshortdays := autotestshortdays + ',7';
  
    autotestshortdays := autotestshortdays + ']';
    if (Length(autotestshortdays) = 2) then
      autotestshort := false
    else
      autotestshort := true;
    if (Length(autotestshortdays) = 15) then
      autotestshortdays := '.';
    
    autotestshortregex := 'S/../../' + autotestshortdays + '/' + guishorttesthour.Text;
    
    autotestlongdays := '[';
    if LMonday.Checked = true then
      autotestlongdays := autotestlongdays + '1';
    if LTuesday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '2'
      else
        autotestlongdays := autotestlongdays + ',2';
    if LWednesday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '3'
      else
        autotestlongdays := autotestlongdays + ',3';
    if LThursday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '4'
      else
        autotestlongdays := autotestlongdays + ',4';
    if LFriday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '5'
      else
        autotestlongdays := autotestlongdays + ',5';
    if LSaturday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '6'
      else
        autotestlongdays := autotestlongdays + ',6';
    if LSunday.Checked = true then
      if (LastChar(autotestlongdays) = ',') or (LastChar(autotestlongdays) = '[') then
        autotestlongdays := autotestlongdays + '7'
      else
        autotestlongdays := autotestlongdays + ',7';
  
    autotestlongdays := autotestlongdays + ']';
    if (Length(autotestlongdays) = 2) then
      autotestlong := false
    else
      autotestlong := true;

   if (Length(autotestlongdays) = 2) then
      autotestlong := false
    else
      autotestlong := true;
    if (Length(autotestlongdays) = 15) then
      autotestlongdays := '.';

    autotestlongregex := 'L/../../' + autotestlongdays + '/' + guilongtesthour.Text;

    result := true;
  end else
  begin
    result := false;
  end;
end;

//// Write smartd.conf and erroraction.cmd files
function WriteConfigFiles(): Boolean;
var 
  i: integer;
begin
  //// Create smartd.conf file
  i := 0;
  SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), '# This file was generated on ' + GetDateTimeString('dd mmm yyyy', #0, #0) + ' by smartmontools for Windows package' + #13#10, False);
  SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), '# http://www.netpower.fr' + #13#10, True);
  repeat
    if (hddautodetection = true) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), 'DEVICESCAN', True)
    else
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), hddlistexploded[i], True);
    if (checkhealth) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -H', True);
    if (checkataerrors) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -l error', True);
    if (checkfailureusage) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -f', True);
    if (trackchangeusageprefail) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -t', True); 
    if (reportselftesterrors) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -l selftest', True);
    if (ignoretemperature) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -I 194', True);
    SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -m ', True);
    SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), '<nomailer>', True);
    SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ExpandConstant(' -M exec "{app}\bin\erroraction.cmd"'), True);
    SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -n ' + powermode + ',' + maxskiptests + ',q', True);
    if (autotestshort or autotestlong) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ' -s ', True);
    if (autotestshort and autotestlong) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), '(', True);
    if (autotestshort) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), autotestshortregex, True);
    if (autotestshort and autotestlong) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), '|', True);
    if (autotestlong) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), autotestlongregex, True);
    if (autotestshort and autotestlong) then
      SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), ')', True);
    SaveStringToFile(ExpandConstant('{app}\bin\smartd.conf'), #13#10, True);
    i := i + 1;
  until ((i >= GetArrayLength(hddlistexploded)) or (hddautodetection = true));
  
  //// Create erroraction configuration file
  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), ':: This file was generated on ' + GetDateTimeString('dd mmm yyyy', #0, #0) + ' by smartmontools for Windows package' + #13#10, False);
  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), ':: http://www.netpower.fr' + #13#10#13#10, True);
  if (smtpserver <> '') and IsComponentSelected('core\service\mailsupport') then
  begin
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set MAIL_ALERT=yes' + #13#10, True); 
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set MAILER=sendemail' + #13#10, True);
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set SOURCE_MAIL=' + sourcemail + #13#10, True);
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set DESTINATION_MAIL=' + destinationmail + #13#10, True);
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set SMTP_SERVER=' + smtpserver + #13#10, True);
    if (smtpserverpass <> '') then
    begin
      SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set SMTP_USER=' + smtpserveruser + #13#10, True);
      SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set SMTP_PASSWORD=' + smtpserverpass + #13#10, True);
    end;
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set TLS=' + tls + #13#10, True);
  end
  else
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set MAIL_ALERT=no' + #13#10, True);
  if (localmessages = true) then
  begin
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set LOCAL_ALERT=yes' + #13#10, True);
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set LOCAL_ALERT_TYPE=connected' + #13#10, True);
  end
  else
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set LOCAL_ALERT=no' + #13#10, True);
  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set WARNING_MESSAGE=' + warningmessage + #13#10, True);
  if (compresslogs = true) then
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set COMPRESS_LOGS=yes' + #13#10, True)
  else
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set COMPRESS_LOGS=no' + #13#10, True);
  if (hddautodetection = true) then
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set DEVICE_LIST=DEVICESCAN' + #13#10, True)
  else
    SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), 'set DEVICE_LIST=' + Implode(hddlistexploded, ' ') + #13#10, True);

  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), ExpandConstant('set SMART_LOG_FILE={app}\smart.log') + #13#10, True);
  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), ExpandConstant('set ERROR_LOG_FILE={app}\erroraction.log') + #13#10, True);
  SaveStringToFile(ExpandConstant('{app}\bin\erroraction_config.cmd'), ExpandConstant('set PROGRAM_PATH={app}') + #13#10, True);
end;

Procedure UpdateReg();
begin
  RegWriteDwordValue(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Services\Smartd', 'Type', 16);
end;

//// Send test mail
Procedure SendTestMail(Sender: TObject);
var
  resultcode: Integer;
  parameters: String;
begin
  GetGuiConfig();
  Parameters := ExpandConstant('/c ' + '"{app}\bin\sendemail.exe"' + ' -f ' + sourcemail + ' -t ' + destinationmail + ' -u ' + 'Smartmontools for Windows setup test mail on %COMPUTERNAME%.%USERDOMAIN% (DNS: %USERDNSDOMAIN%)' + ' -m ' + ExpandConstant('{cm:testmessage}') + ' -s ' + smtpserver + ' -o tls=' + tls);
  if (smtpserverpass <> '') then
    Parameters := Parameters + ' -o username=' + smtpserveruser + ' -o password=' + smtpserverpass;
  // Timeout 4 seconds
  Parameters := Parameters + ExpandConstant(' & ping 127.0.0.1 > nul');
  Exec(ExpandConstant('{cmd}'), parameters, '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
end;

#include "smartmontools for Windows smart gui.iss"
#include "smartmontools for Windows alert gui.iss"

//// After installation execution hook
procedure CurStepChanged(CurStep: TSetupStep);
var Sender: TObject;
begin
  if CurStep = ssPostInstall then
  begin
    smartd_conf_CreatePage(wpInfoAfter);
    mail_options_CreatePage(wpInfoAfter);  
  end;
  if CurStep = ssDone then
  begin
    GetGuiConfig();
    WriteConfigFiles();
    if (keepfirstlog) then
      CreateInitialLog();
    if ((sendtestmessage) and (Wizardsilent = true)) then
      SendTestMail(Sender);
//// Update smartd service type before upstream fixes the glitch
    UpdateReg();
    LoadService('{#SmartServiceName}');
    
  end;
end;

//// Before uninstallation execution hook
procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then
    UnloadService('{#SmartServiceName}');
end;