unit Unit1;


interface
                           

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, WinSkinData, ExtCtrls, DCPcrypt2,
  DCPblockciphers, DCPrijndael, DCPsha256, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdTelnet, IdIRC, siComp,
  IdIOHandler, IdIOHandlerSocket, Gauges;

type
  TMyCryptCHAT = class(TForm)
    MainMenu1: TMainMenu;
    Connect1: TMenuItem;
    Settings1: TMenuItem;
    Setup1: TMenuItem;
    StatusBar1: TStatusBar;
    Disconnect1: TMenuItem;
    ExitProgram1: TMenuItem;
    SkinData1: TSkinData;
    Panel1: TPanel;
    ListBox1: TListBox;
    Panel2: TPanel;
    Edit2: TEdit;
    SeePacketsflow1: TMenuItem;
    Panel4: TPanel;
    DCP_rijndael1: TDCP_rijndael;
    Timer1: TTimer;
    IdTelnet1: TIdTelnet;
    DCP_rijndael2: TDCP_rijndael;
    IdIRC1: TIdIRC;
    SeeIRClog1: TMenuItem;
    Printform1: TMenuItem;
    gbUsers: TGroupBox;
    lbUsers: TListBox;
    siLang1: TsiLang;
    ChangeLanguage1: TMenuItem;
    Englisj1: TMenuItem;
    Danish1: TMenuItem;
    IdTCPClient1: TIdTCPClient;
    Panel3: TPanel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Timer2: TTimer;
    Gauge1: TGauge;
    Image1: TImage;
    Image2: TImage;
    Button7: TButton;
    Button6: TButton;
    Button3: TButton;
    procedure ExitProgram1Click(Sender: TObject);
    procedure Setup1Click(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure SeePacketsflow1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CryptB4send;
    procedure Timer1Timer(Sender: TObject);
    procedure Connect1Click(Sender: TObject);
    procedure Disconnect1Click(Sender: TObject);
    procedure IdHTTP1Connected(Sender: TObject);
    procedure IdHTTP1Disconnected(Sender: TObject);
    procedure IdTelnet1DataAvailable(Sender: TIdTelnet;
      const Buffer: String);
    procedure IdTelnet1Connect(Sender: TObject);
    procedure IdTelnet1Disconnected(Sender: TObject);

    procedure SplitStringS(const Instr: String; SplitAt: String; var Lefts,
                     Rights: String ) ;
    procedure SplitString(const InStr: String; SplitAt: Char;
                var Lefts,Rights: string);

    function Decrypt: string;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SeeIRClog1Click(Sender: TObject);
    procedure IdIRC1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdIRC1Notice(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Content: String);
    procedure IdIRC1Raw(Sender: TObject; AUser: TIdIRCUser; ACommand,
      AContent: String; var Suppress: Boolean);
    procedure IdIRC1Parted(Sender: TObject; AChannel: TIdIRCChannel);
    procedure IdIRC1Joined(Sender: TObject; AChannel: TIdIRCChannel);
    procedure IdIRC1Message(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Content: String);
    procedure IdIRC1Join(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Quit(Sender: TObject; AUser: TIdIRCUser);
    procedure IdIRC1Disconnected(Sender: TObject);
    procedure IdIRC1Connected(Sender: TObject);
    procedure IdIRC1CTCPQuery(Sender: TObject; User: TIdIRCUser;
      AChannel: TIdIRCChannel; Command, Args: String;
      var ASuppress: Boolean);
    procedure IdIRC1Part(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Action(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; Content: String);
    procedure CheckBox2Click(Sender: TObject);
    procedure Printform1Click(Sender: TObject);
    function CRC32(Buffer:String;Polynom,Initial:Cardinal):Cardinal;
    procedure Englisj1Click(Sender: TObject);
    procedure Danish1Click(Sender: TObject);
    procedure lbUsersClick(Sender: TObject);
    procedure IdIRC1Kicked(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel);
    procedure IdIRC1Ban(Sender: TObject; AUser: TIdIRCUser;
      AChannel: TIdIRCChannel; AHostmask: String);
    procedure FormShow(Sender: TObject);
    procedure IdIRC1DCCSend(Sender: TObject; ANick, AIp, APort, AFileName,
      AFileSize: String);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure IdTCPClient1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: String);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure IdIOHandlerSocket1Status(ASender: TObject;
      const AStatus: TIdStatus; const AStatusText: String);
    procedure Timer2Timer(Sender: TObject);
    procedure IdTCPClient1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdTCPClient1Work(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdTCPClient1WorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure Panel4DblClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyCryptCHAT: TMyCryptCHAT;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, ClipBrd, Unit7;
                                               
{$R *.dfm}

{  CRC32 Cyclic Redundancy Check

The following polynomial are used:

Normal $04C11DB7

Inverted/reversed/reflected $EDB88320

CRC32 bit, normal code below:
}


function TMyCryptCHAT.CRC32(Buffer:String;Polynom,Initial:Cardinal):Cardinal;
var  i,j  : Integer;
begin
Result:=Initial;
for i:=1 to Length(Buffer) do begin
  Result:=Result xor (ord(buffer[i]) shl 24);
  for j:=0 to 7 do begin
    if (Result and $80000000)<>0 then
Result:=(Result shl 1) xor Polynom
    else Result:=Result shl 1;
    end;
  end;
end;


procedure TMyCryptCHAT.SplitStringS(const Instr: String; SplitAt: String; var Lefts,
     Rights: String ) ;
var n: integer ;

    TempS: string ;
    TempSL: integer ;

begin { 98-05-23: }
                  TempS := Instr ;
                  TempSL := length(TempS);
     { 98-05-23; }
     n:= Pos(SplitAt,InStr) ;
     if n = 0 then begin Lefts := Instr ; rights := '' ;
                   end
     else begin Lefts := Copy(Instr,1,(n -1 )) ;
                Rights :=
                Copy(Instr,(n + length(SplitAt)),TempSL -n + length(SplitAt) );
          end;
end;

procedure TMyCryptCHAT.SplitString(const Instr: String; SplitAt: Char; var Lefts,
     Rights: String ) ;
var n: integer ;

    TempS: string ;
    TempSL: integer ;

begin { 98-05-23: }
                  TempS := Instr ;
                  TempSL := length(TempS);
     { 98-05-23; }
     n:= Pos(SplitAt,InStr) ;
     if n = 0 then begin Lefts := Instr ; rights := '' ;
                   end
     else begin Lefts := Copy(Instr,1,(n -1 )) ;
                Rights := Copy(Instr,(n+1),TempSL   -n );
          end;
end;

procedure TMyCryptCHAT.ExitProgram1Click(Sender: TObject);
begin
      Close ;
end;

procedure TMyCryptCHAT.Setup1Click(Sender: TObject);
begin
    MyCryptCHATsetup.ShowModal ;
end;

procedure TMyCryptCHAT.Settings1Click(Sender: TObject);
begin
          MyCryptCHATabout.ShowModal ;
end;

procedure TMyCryptCHAT.SeePacketsflow1Click(Sender: TObject);
begin
            MyCryptCHATdataflow.Show ;

            Focuscontrol(Edit2) ;
            Edit2.SelStart := length(Edit2.text) ;
end;

procedure TMyCryptCHAT.Button1Click(Sender: TObject);
var tempString, CrLf, CRCstring : string ;
     I : integer ;
     CRCcardinal: Cardinal ;
begin

 if length(Edit2.Text) >0 then
 begin

        if not CheckBox2.Checked then
        CryptB4send ;   // crypt to end up in MyCryptCHATdataflow.Memo1


        tempString := '' ;
        CrLf       := char(13) + char(10) ;

        for I := 1 to length(MyCryptCHATdataflow.Memo1.lines.Text)
        do
        if  MyCryptCHATdataflow.Memo1.lines.Text[I] = char(10)
        then // CR char is skipped
        else if MyCryptCHATdataflow.Memo1.lines.Text[I] = char(13)
             then tempString := tempString + '/' //  = "lineshift"
             else tempString := tempString +
                                    MyCryptCHATdataflow.Memo1.lines.Text[I] ;

 end;

 if MyCryptCHATsetup.rgServerType.ItemIndex = 1 // MyCryptCHATserver:
 then
 begin

  if NOT IdTelnet1.Connected then Connect1Click(nil);


  if length(Edit2.Text) >0 then
  begin
        if not CheckBox2.Checked then
        IdTelnet1.Write('MyCryptCHAT '
                      + MyCryptCHATsetup.Edit3.Text   + ' '  // Group
                      + MyCryptCHATsetup.Edit0.Text   + ' /' // Alias  + LF
                      + tempString                           // crypt block
                      + '[MyCryptCHAT-EOD]/'                 // EOD marker
                      +  CrLf ) ;                            // EOCommand

      if CheckBox2.Checked then IdTelnet1.Write(' *** CLEAR TEXT: ' +Edit2.Text) ;

  end;
 end

 else   // IRC server in use: **************************************************
 begin
    if (IdIRC1.Connected = true) and (length(Edit2.Text) >0 )
    then
    begin

          if not CheckBox2.Checked then
          begin   CRCcardinal := CRC32(tempstring,$04C11DB7,0) ;
                  CRCstring   := '***CRC:' + IntToStr(CRCcardinal) + '***' ;

                  idIRC1.Say('#' + MyCryptCHATsetup.Edit3.Text, tempString
                                                    + CRCstring ) ;
          end;

          if CheckBox2.Checked then
           idIRC1.Say('#' + MyCryptCHATsetup.Edit3.Text,
                              ' *** CLEAR TEXT: ' + Edit2.Text) ;


          if not Checkbox2.Checked then
          ListBox1.Items.Add(FormatDateTime('HH:NN:SS ', Now)
                                 +'<' + IdIRC1.Nick + '> '+ Edit2.Text);
          if Checkbox2.Checked then
          ListBox1.Items.Add(FormatDateTime('HH:NN:SS ', Now)
                                 +'<' + IdIRC1.Nick + '>  *** CLEAR TEXT: '
                                 + Edit2.Text);

          ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

    end;

 end;

 Edit2.Text := '' ;
 Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.Button2Click(Sender: TObject);
begin
        ListBox1.Items.Clear ;

        Focuscontrol(Edit2) ;
        Edit2.SelStart := length(Edit2.text) ;

end;

procedure TMyCryptCHAT.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
          if (Key = char(13)) and (CheckBox1.Checked = true)
          then  Button1.Click ;

          if (Key = char(13))
          then  Key := char(0) ;

end;

procedure TMyCryptCHAT.Button3Click(Sender: TObject);
begin

        Timer2.Enabled := false ;

        IdTCPClient1.Disconnect ;

        Focuscontrol(Edit2) ;
        Edit2.SelStart := length(Edit2.text) ;

end;

procedure TMyCryptCHAT.CheckBox1Click(Sender: TObject);
begin

        Focuscontrol(Edit2) ;
        Edit2.SelStart := length(Edit2.text) ;

end;


procedure TMyCryptCHAT.CryptB4send;
var CryptString, S, S2, SALTString, CryptType : string ;
    I, I2, I3 : integer ;
    OutputStringList: TStringlist ;
begin

  CryptType := 'encrypt' ;

    SALTstring := MyCryptCHATsetup.RandomPassword(15)
                  + FormatDateTime('YYYYMMDDHHNNSSZZZ',now) ;  // + 17 bytes
                 // '123456789012345'
                 //+ 'YYYYMMDDHHNNSSZZZ' ;
    // length(SALT) = 32 bytes


    try DCP_rijndael1.InitStr(MyCryptCHATsetup.Edit4.Text + SALTstring, TDCP_sha256);
        // Initialize the cipher with a SHA-256 hash of the SALTed passphrase
        DCP_rijndael1.Reset ;

        CryptString := DCP_rijndael1.EncryptString(Edit2.Text
                              + SALTstring ) ;

        OutputStringList:= Tstringlist.Create ;

        // OutputStringList.Add('***MyCrypt.DK***') ;
//      OutputStringList.Add('SALT[' + SALTstring +']') ;
        OutputStringList.Add(SALTstring) ;


        I2 := 0 ;
        I3 := 0 ;
        S2 := '' ; // used to build new lines in output window

        For I := 1 to length(CryptString) do
        begin    S := IntToHex(Ord(CryptString[I]),2) ;

                 S2 := S2 + S ;

                 Inc(I2) ;
                 Inc(I3) ;

                 if I2 = 20  // 20 bytes handled, make a new line:
                 then begin  // Memo2.Lines.Add('') ;
                            OutputStringList.Add(S2) ;
                            S2 := '' ;
                            I2 := 0 ;
                            I3 := 0 ;
                      end;

                 if I3 = 2 then // for each 2 bytes make an '-' spearator:
                 begin   I3 := 0 ;
                      // S2 := S2 + '-'  ;
                 end;
        end;

        OutputStringList.Add('***EndOfTestData***') ;
        // OutputStringList.Add('') ;

    finally   DCP_rijndael1.Burn;
    end;

    MyCryptCHATdataflow.Memo1.Text := OutputStringList.Text ;

    OutputStringList.Free ;

end;


procedure TMyCryptCHAT.Timer1Timer(Sender: TObject);
begin
            Panel4.Caption := FormatDateTime('HH:NN:SS', Now);
end;

procedure TMyCryptCHAT.Connect1Click(Sender: TObject);
begin

  if not (
     (MyCryptCHATsetup.Edit0.Color = clLime) and
     (MyCryptCHATsetup.Edit3.Color = clLime) and
     (MyCryptCHATsetup.Edit4.Color = clLime) )
  then
  begin

        if siLang1.ActiveLanguage = 1 then
        MessageDlg('You have to set up your DATA (Menu: Setup) - "3 greens!"',
                           mtError,[mbOK], 0);

        if siLang1.ActiveLanguage = 2 then
        MessageDlg('G�r til Menupunkt: "Ops�tning" - kr�ver "3 gr�nne" input felter!',
                           mtError,[mbOK], 0);

        Setup1Click(nil) ;

          EXIT ; //<******************************************************
  end;


  if      MyCryptCHATsetup.rgServerType.ItemIndex = 1 // MyCryptCHATserver
  then
  try     IdTelnet1.Connect(-1);  // <****************************************

          Statusbar1.Panels.Items[4].Text  := ' Alias: '
                +  MyCryptCHATsetup.Edit0.Text ;

          Statusbar1.Panels.Items[1].Text  := ' Group/Channel: '
                +  '#' + MyCryptCHATsetup.Edit3.Text ;

          IdTelnet1.Write('MyCryptCONNECT '
                          + MyCryptCHATsetup.Edit3.Text
                          + ' '
                          + MyCryptCHATsetup.Edit0.Text   + char(13) + char(10)
                        ) ;

  except    Statusbar1.Panels.Items[2].Text  := ' Status: '
                +  'Connection Failed' ;
  end

  else // Server is IRC type // <************************************

  if   IdIRC1.Connected = false
  then
  begin

        IdIRC1.Host :=    MyCryptCHATsetup.Edit1.Text ;
        IdIRC1.Port :=    StrToInt(MyCryptCHATsetup.Edit2.Text) ;
        IdIRC1.Nick :=    MyCryptCHATsetup.Edit0.Text ;
        IdIRC1.AltNick:=  MyCryptCHATsetup.Edit0.Text +  'x1';
        IdIRC1.Username:= 'No Username';
        IdIRC1.RealName := 'NoReal Name' ;

        try idIRC1.Connect;

            IRClog.Memo1.Lines.Add('Connected to ' + idIRC1.Host);


            Statusbar1.Panels.Items[4].Text  := ' Alias: '
                                              +  MyCryptCHATsetup.Edit0.Text ;

            Statusbar1.Panels.Items[1].Text  := ' Group/Channel: '
                                              +  MyCryptCHATsetup.Edit3.Text ;
            Statusbar1.Panels.Items[0].Text  := ' Server: '
                                              +  MyCryptCHATsetup.Edit1.Text ;


            IdIRC1.Join('#' + MyCryptCHATsetup.Edit3.Text); // <**********

        except  if not idIRC1.Connected
                then  MessageDlg('Error connecting to ' + idIRC1.Host,
                                                        mtError,[mbOK], 0);
                IRClog.Memo1.Lines.Add('Error connecting to ' + idIRC1.Host);
                 Edit1.Color := clYellow ;
        end;
  end;

  Edit2.Text := '' ;
  Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.Disconnect1Click(Sender: TObject);
begin

  if        MyCryptCHATsetup.rgServerType.ItemIndex = 1 // MyCryptCHATserver
  then
  try       IdTelnet1.Disconnect ;

            Statusbar1.Panels.Items[2].Text  := ' Status: '
                +  'DisConnected' ;

  except    Statusbar1.Panels.Items[2].Text  := ' Status: '
                +  'DisConnect Failed' ;
  end

  else // IRC server  <************************************************
  if   IdIRC1.Connected = true
  then
  try       IdIRC1.Part( MyCryptCHATsetup.Edit3.Text); // <*******************

            IdIRC1.Quit('No reason'); // <******************************

            IRClog.Memo1.Lines.Add('Quit(Disconnect)');

            Statusbar1.Panels.Items[2].Text  := ' Status: '
                +  'DisConnecting';
           // Edit1.Color := clRed ;

           lbUsers.Items.Clear ; // can't follow group/channel anymore!

  except    IRClog.Memo1.Lines.Add('Disconnect FAILED');

            Statusbar1.Panels.Items[2].Text  := ' Status: '
                +  'DisConnect Failed' ;
            Edit1.Color := clYellow ;
  end;

end;

procedure TMyCryptCHAT.IdHTTP1Connected(Sender: TObject);
begin
    Statusbar1.Panels.Items[2].Text  := ' Status: CONNECTED' ;
    Statusbar1.Panels.Items[0].Text  := ' Server: '
                                            +  MyCryptCHATsetup.Edit1.Text ;

    Edit1.Color := clLime ;

end;

procedure TMyCryptCHAT.IdHTTP1Disconnected(Sender: TObject);
begin
    Statusbar1.Panels.Items[2].Text  := ' Status: Disconnected' ;
    Edit1.Color := clRed ;

end;


function TMyCryptCHAT.Decrypt: string ;
var ClearString, L, R, S, S2, SALTString, SALTstringShort : string ;
    I, I2 : integer ;
begin

  if pos('***EndOfTestData***', MyCryptCHATdataflow.Memo2.Lines.Text) = 0
  then EXIT ;

    SplitStringS(MyCryptCHATdataflow.Memo2.Lines.Text,'***EndOfTestData***' ,L,R);
    // L = content R=rest

    SplitStringS(L,char(13) + char(10),L,R); // L= SALT R=REST

    SALTstring := L ;
    SALTstringShort := copy(SaltString,1,8) ;

    S := '';
    for I := 1 to length(R) do
    if (R[I] <> char(10))  and  (R[I] <> char(13)) and  (R[I] <> '-' )
    then S := S + R[I] ;    // S = Crypted string, each 2 "hex" chars = 1 char

    S2 := '' ;
    I := 1 ;
    try
      repeat L := S[I]   ;
             R := S[I+1] ;
            // StrToInt('$1E');    // Hexadecimal values start with a '$'

            if (L = '*') or (R = '*')
            then
            begin MessageBeep(0) ;
                  Exit
            end;

            I2 := StrToInt('$' + L + R) ;
            S2 := S2 +  char(I2) ;
            Inc(I) ;
            Inc(I) ;
      until I > length(S) ;
    except  MessageBeep(0) ;
    end;

    try DCP_rijndael2.InitStr(MyCryptCHATsetup.Edit4.Text + SALTstring, TDCP_sha256);

        // Initialize the cipher with a SHA-256 hash of the SALTed passphrase
        DCP_rijndael2.Reset ;

        ClearString := DCP_rijndael2.DecryptString(S2) ;

        SplitStringS(ClearString,SALTstringShort,L,R);

        Result :=  L ;

    finally   DCP_rijndael2.Burn;
    end;

end;

procedure TMyCryptCHAT.IdTelnet1DataAvailable(Sender: TIdTelnet;
  const Buffer: String);
var fromGroup, fromAlias, dataLine, cryptCommand, L, R : string ;
    I : integer ;
begin
{
MyCryptCHAT OZ OZ8MS �            // rest is on one and same line! :
***MyCrypt.DK***�
SALT[1usbn8Skg7FYTkD20141228221037134]�
5344-694C-692F-7A59-4179-704E-4537-424A-4B74-794F�
7952-3163-3563-366B-4A70-3578-656B-3969-4A62-6C4D�
***MyCrypt.DK***�
�
[MyCryptCHAT-EOD]�
---------------------------------------
MyCryptCHAT OZ OZ8MS
***MyCrypt.DK***
SALT[0t4fSAwLT8JP1Uh20141229153226528]
5231-546B-6551-7438-6C32-6B41-414C-5A61-6573-6E6B
4677-4534-4849-776A-5357-3352-5067-2B62-5A4A-4279
7065-7649-4375-6D64-5261-3077-7179-4751-4B67-3D3D
***MyCrypt.DK***

[MyCryptCHAT-EOD]

-----------------------------------------

MyCryptBEEP OZ OZ3K-Kenneth BEEPING

}

        MyCryptCHATdataflow.Memo2.Lines.Text := Buffer ;

// MyCryptCHAT OZ OZ8MS �..........................................

        fromAlias :=  MyCryptCHATdataflow.Memo2.Lines.Text ;
        SplitString(fromAlias,' ',L,R) ; // L='MyCryptCHAT' R='OZ OZ8MS �....'
        cryptCommand := L ;
        SplitString(R,' ',fromGroup,R) ;
        SplitString(R,' ',fromAlias,R) ;

        dataLine := '' ; // change '�' to CrLf chars:
        for I := 1 to length(MyCryptCHATdataflow.Memo2.Lines.Text)
        do if   MyCryptCHATdataflow.Memo2.Lines.Text[I] = '�'
           then dataLine := dataLine + char(13) + char(10)
           else dataLine := dataLine + MyCryptCHATdataflow.Memo2.Lines.Text[I];

        MyCryptCHATdataflow.Memo2.Lines.Text := dataLine ;

        dataLine := DeCrypt ;

        if cryptCommand = 'MyCryptCHAT' // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        then      ListBox1.Items.Add(FormatDateTime('HH:NN:SS',Now)
                      +  ' <'  +  fromAlias  +  '>: ' + dataLine)
        else
          if    cryptCommand = 'MyCryptBEEP'  // <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
          then
              begin  ListBox1.Items.Add(FormatDateTime('HH:NN:SS',Now)
                      +  ' <'  +  fromAlias  +  '>: ***BEEPING***') ;
                      MessageBeep(0) ;
              end
          else     ListBox1.Items.Add(FormatDateTime('HH:NN:SS',Now)
                      +  ' <MyCryptCHATserver>: '
                      +  MyCryptCHATdataflow.Memo2.Lines[0] ) ;

        ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

end;

procedure TMyCryptCHAT.IdTelnet1Connect(Sender: TObject);
begin

    Statusbar1.Panels.Items[2].Text  := ' Status: CONNECTED' ;
    Statusbar1.Panels.Items[0].Text  := ' Server: '
                                            +  MyCryptCHATsetup.Edit1.Text ;
    Edit1.Color := clLime ;

end;

procedure TMyCryptCHAT.IdTelnet1Disconnected(Sender: TObject);
begin

    ListBox1.Items.Add(FormatDateTime('HH:NN:SS ',Now) + '<'
                                      + MyCryptCHATsetup.Edit0.Text + '>'
                                      + '*** Disconnected ***'  ) ;

    Statusbar1.Panels.Items[2].Text  := ' Status: Disconnected' ;
    Edit1.Color := clRed ;

end;

procedure TMyCryptCHAT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
          if   Edit1.Color = clLime // = connected
          then
            begin Disconnect1Click(nil) ;
                  CanClose := false ;
            end
          else  CanClose := true ;
end;

procedure TMyCryptCHAT.Edit2Change(Sender: TObject);
begin
        StatusBar1.Panels.Items[3].Text :=
                                  IntToStr(Length(Edit2.Text)) + ' / 100' ;
end;

procedure TMyCryptCHAT.Button4Click(Sender: TObject);
begin

  if    IdTelnet1.Connected then
  begin //******

        MyCryptCHATdataflow.Memo1.Text :=
                      'MyCryptBEEP '
                      + MyCryptCHATsetup.Edit3.Text   + ' ' // Group
                      + MyCryptCHATsetup.Edit0.Text   ;     // Alias

        IdTelnet1.Write('MyCryptBEEP '
                      + MyCryptCHATsetup.Edit3.Text   + ' ' // Group
                      + MyCryptCHATsetup.Edit0.Text   + ' ' // Alias
                      + char(13) + char(10) ) ;             // EOCommand

        Edit2.Text := '' ;
  end;

  if      iDIRC1.Connected then
  begin  //******

        MyCryptCHATdataflow.Memo1.Text :=
                      'MyCryptBEEP '
                      + MyCryptCHATsetup.Edit3.Text   + ' ' // Group
                      + MyCryptCHATsetup.Edit0.Text   ;     // Alias

         idIRC1.Say('#' + MyCryptCHATsetup.Edit3.Text,
                      'MyCryptBEEP '
                      + MyCryptCHATsetup.Edit3.Text   + ' '     // Group
                      + MyCryptCHATsetup.Edit0.Text   + ' ' ) ; // Alias

        Edit2.Text := '' ;
        MessageBeep(0) ;
  end;

  Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.Button5Click(Sender: TObject);
var I : integer ;
begin

  if gbUsers.Visible = true then
  begin gbUsers.Visible := false ;
        EXIT ; // ********************
  end;

  gbUsers.Visible := true ;

  if IdTelnet1.Connected then
  begin

        MyCryptCHATdataflow.Memo1.Text :=
                      'MyCryptSHOWGROUP '
                      + MyCryptCHATsetup.Edit3.Text   + ' ' // Group
                      + MyCryptCHATsetup.Edit0.Text   ;     // Alias

        IdTelnet1.Write('MyCryptSHOWGROUP '
                      + MyCryptCHATsetup.Edit3.Text   + ' ' // Group
                      + MyCryptCHATsetup.Edit0.Text   + ' ' // Alias
                      + char(13) + char(10) ) ;             // EOCommand
  end;


  if iDIRC1.Connected then
  begin Listbox1.Items.Add(FormatDateTime('HH:NN:SS',Now)
                      + ' Active in Channel/Group:') ;

        lbUsers.Items.Clear ;

        for I := 0 to IdIRC1.Users.Count  -1
        do
        begin     Listbox1.Items.Add('<' + IdIRC1.Users.Items[I].Nick + '>' ) ;
                  lbUsers.Items.Add(IdIRC1.Users.Items[I].Nick) ;
        end;

        ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

  end;

  Edit2.Text := '' ;
  Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.ListBox1Click(Sender: TObject);
var S, L, R : string ;
begin

  Clipboard.AsText := ListBox1.Items.Strings[ListBox1.ItemIndex] ;


 EXIT ;

  S := ListBox1.Items.Strings[ListBox1.ItemIndex] ;

  if (pos('<',S) <> 0 ) and   (pos('>',S) <> 0 ) then
  begin
          SplitString(S, '<',L,R) ;
          SplitString(R,'>',L,R) ;
          GroupMemberAction.Edit1.Text := L ;

          GroupMemberAction.ShowModal ;
  end;

  Edit2.Text := '' ;
  Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.SeeIRClog1Click(Sender: TObject);
begin
          IRClog.Show ;
end;

procedure TMyCryptCHAT.IdIRC1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
          IRClog.Memo1.Lines.Add(AStatusText);
end;
                      
procedure TMyCryptCHAT.IdIRC1Notice(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Content: String);
begin
      IRClog.Memo1.lines.add('Notice: ' + Content);
end;

procedure TMyCryptCHAT.IdIRC1Raw(Sender: TObject; AUser: TIdIRCUser;
  ACommand, AContent: String; var Suppress: Boolean);
begin
  IRClog.Memo1.Lines.Add(FormatDateTime('HH:NN:SS',Now) + ' RAW: ' + AContent);
end;

procedure TMyCryptCHAT.IdIRC1Parted(Sender: TObject;
  AChannel: TIdIRCChannel);
begin
  IRClog.Memo1.Lines.Add('ON Parted (Left channel): : ' + AChannel.Name );
end;

procedure TMyCryptCHAT.IdIRC1Joined(Sender: TObject;
  AChannel: TIdIRCChannel);
begin
     IRClog.Memo1.Lines.Add('Joined channel: ' + AChannel.Name );


end;

procedure TMyCryptCHAT.IdIRC1Message(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Content: String);
var dataLine, L, R, CRCstringSent, CRCstringCheck: string ;
    I : integer ;
    CRCcardinalCheck : cardinal ;
begin

  if pos('***EndOfTestData***',Content) <> 0 // crypted text block?
  then
    begin
        SplitStringS(Content,'***CRC:',L,R) ;  // L=data minus CRC part
        SplitString(R,'*',CRCstringSent,R);

        CRCcardinalCheck := CRC32(L,$04C11DB7,0) ; // check data part
        CRCstringCheck   := IntToStr(CRCcardinalCheck) ;

        if CRCstringSent =  CRCstringCheck // CRC32 check OK
        then
         begin MyCryptCHATdataflow.Memo2.Lines.Text := Content ;

              dataLine := '' ; // change '/' to CrLf chars:
              for I := 1 to length(MyCryptCHATdataflow.Memo2.Lines.Text)
              do if   MyCryptCHATdataflow.Memo2.Lines.Text[I] = '/'
                then dataLine := dataLine + char(13) + char(10)
                else dataLine := dataLine +
                                      MyCryptCHATdataflow.Memo2.Lines.Text[I];

              MyCryptCHATdataflow.Memo2.Lines.Text := dataLine ;

              dataLine := DeCrypt ;
         end
        else  dataLine := ' *** CRC32 ERROR in DATA received *** ' ;
    end
  else        dataLine := Content ;


  if
         pos('MyCryptBEEP',dataLine) <> 0
          then
              begin  ListBox1.Items.Add(FormatDateTime('HH:NN:SS',Now)
                      +  ' <' + AUser.Nick  +  '>: ***BEEPING***') ;
                      MessageBeep(0) ;
                      MyCryptCHATdataflow.Memo2.Lines.Add(dataLine) ;
              end
          else      ListBox1.Items.Add(FormatDateTime('HH:NN:SS ', Now)
                          + '<' + AUser.Nick + '> ' + dataLine) ;

  ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

end;

procedure TMyCryptCHAT.IdIRC1Join(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
begin

  IRClog.Memo1.Lines.Add('Join :'   + AChannel.Name
                   +' Nick: '  + AUser.Nick    );

  ListBox1.Items.Add(FormatDateTime('HH:NN:SS <', Now)
            +  AUser.Nick + '> *** Joined Channel/Group ***' ) ;

  ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

  lbUsers.Items.Add(AUser.Nick) ;
  
end;

procedure TMyCryptCHAT.IdIRC1Quit(Sender: TObject; AUser: TIdIRCUser);
var I: integer ;
begin
  IRClog.Memo1.Lines.Add('Quit :'   + AUser.Nick );

  ListBox1.Items.Add(FormatDateTime('HH:NN:SS <', Now)
            +  AUser.Nick + '> *** Quitted Channel/Group + Disconnected ***' ) ;

  ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

  for  I := 0 to lbUsers.Items.Count -1 do
  if lbUsers.Items.Strings[I] = AUser.Nick
  then  begin   lbUsers.Items.Delete(I);
                EXIT ;
        end;

end;

procedure TMyCryptCHAT.IdIRC1Disconnected(Sender: TObject);
begin
            IRClog.Memo1.Lines.Add('Disconnected');
            Statusbar1.Panels.Items[2].Text  := ' Status: '+  'DisConnected';
            Edit1.Color := clRed ;
end;

procedure TMyCryptCHAT.IdIRC1Connected(Sender: TObject);
begin
            IRClog.Memo1.Lines.Clear ;

            IRClog.Memo1.Lines.Add('Connected');
            
            Statusbar1.Panels.Items[2].Text  := ' Status: Connected';
            Edit1.Color := clLime ;

            ListBox1.Items.Add(FormatDateTime('HH:NN:SS <', Now)
            +  MyCryptCHATsetup.EDit0.text + '> *** Connected ***' ) ;

            ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

end;

procedure TMyCryptCHAT.IdIRC1CTCPQuery(Sender: TObject; User: TIdIRCUser;
  AChannel: TIdIRCChannel; Command, Args: String; var ASuppress: Boolean);
begin

  IRClog.Memo1.Lines.Add(  'CTCPQuery To: '  + User.Nick
                    + ' Channel: '// + AChannel.Name  CHRASHES!!!!!!!!!
                    + ' Command: '  + Command   //       VERSION
                    + ' Args: '  + Args);


end;

procedure TMyCryptCHAT.IdIRC1Part(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
var    I: integer ;
begin
            ListBox1.Items.Add(FormatDateTime('HH:NN:SS ', now) + '<' +
                     AUser.Nick  + '> *** Has left this Channel/Group ***') ;

            for I := 0 to lbUsers.Items.Count -1 do
            if pos(AUser.Nick,lbUsers.Items.Strings[I]) <> 0
            then  begin  lbUsers.Items.Delete(I);
                         Break;
                  end;

end;

procedure TMyCryptCHAT.IdIRC1Action(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; Content: String);
begin
        ListBox1.Items.Add('ACTION event - User: ' + Auser.Nick
                    + '  Content: ' + Content  ) ;
end;

procedure TMyCryptCHAT.CheckBox2Click(Sender: TObject);
begin

        Focuscontrol(Edit2) ;
        Edit2.SelStart := length(Edit2.text) ;


        if Checkbox2.Checked
        then  Edit2.Color := clRed
        else  Edit2.Color := clWindow ;

        if Checkbox2.Checked
        then  Image2.Visible  := true
        else  Image2.Visible  := false ;

        if Checkbox2.Checked
        then  Image1.Visible  := false
        else  Image1.Visible  := true ;

        if siLang1.ActiveLanguage = 1 then
        begin
        if Checkbox2.Checked
        then  MessageBox(Handle,'TEXT lines will be send in PLAIN/CLEAR TEXT!',
                           ' *** WARNING - ENCRYPTION OFF *** ' , mb_OK)
        else  MessageBox(Handle,'TEXT lines will be send in ENCRYPTED blocks :-)',
                           ' *** OK - ENCRYPTION ACTIVE *** ' , mb_OK);
        end;

        if siLang1.ActiveLanguage = 2 then
        begin
        if Checkbox2.Checked
        then  MessageBox(Handle,'Tekst linier bliver sendt som KLAR TEKST!',
                           ' *** ADVARSEL - INGEN KRYPTERING *** ' , mb_OK)
        else  MessageBox(Handle,'Tekst linier sendes i KRYPTEREDE blokke :-)',
                           ' *** OK - KRYPTERING AKTIVERET *** ' , mb_OK);
        end;

end;

procedure TMyCryptCHAT.Printform1Click(Sender: TObject);
begin
       MyCryptCHAT.Print ;
end;

procedure TMyCryptCHAT.Englisj1Click(Sender: TObject);
begin
          siLang1.ActiveLanguage := 1 ;
end;

procedure TMyCryptCHAT.Danish1Click(Sender: TObject);
begin
          siLang1.ActiveLanguage := 2 ;
end;

procedure TMyCryptCHAT.lbUsersClick(Sender: TObject);
begin

  Edit2.Text := '' ;
  Focuscontrol(Edit2) ;

end;

procedure TMyCryptCHAT.IdIRC1Kicked(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel);
begin
             ListBox1.Items.Add(FormatDateTime('HH:NN:SS', now) +
                 ' *** Kicked event - User: ' + Auser.Nick) ;
             MessageBeep(0) ;
end;

procedure TMyCryptCHAT.IdIRC1Ban(Sender: TObject; AUser: TIdIRCUser;
  AChannel: TIdIRCChannel; AHostmask: String);
begin
    ListBox1.Items.Add(FormatDateTime('HH:NN:SS', now)
     + ' *** Ban event - User: ' + Auser.Nick + ' HostMark: ' + AHostmask  ) ;
    MessageBeep(0) ;
    
end;

procedure TMyCryptCHAT.FormShow(Sender: TObject);
begin

  if   siLang1.Tag = 0 // language not yet selected. 1st. start!
  then Start.ShowModal ;

end;

procedure TMyCryptCHAT.IdIRC1DCCSend(Sender: TObject; ANick, AIp, APort,
  AFileName, AFileSize: String);
var

    N1,N2,N3,N4: integer ;
    HexIP, DottedString : string ;

    xyz: array [1..4] of byte ;

    IPadrLongword, IPremainderLongword : longword ;   // a integer

    // Longword	0..4294967295	unsigned 32-bit

begin

      IPadrLongword := StrToInt(AIp) ; // FF FF FF FF  4 bytes longword
      // 256^3 256^2 256^1 256^0



    N1 := IPadrLongWord div 256 div 256 div 256 ;

    N2 :=  (IPadrLongWord -(N1 * 256 * 256 * 256)) ;
    N2 :=  N2 div 256 div 256  ;

    N3 := (IPadrLongWord -(N1 * 256 * 256 * 256)) ;
    N3 := N3 -(N2 * 256 * 256) ;
    N4 := N3 ;
    N3 := N3 div 256 ;

    N4 := N4 - (N3 * 256) ;

    DottedString := IntToStr(N1) + '.' +
                    IntToStr(N2) + '.' +
                    IntToStr(N3) + '.' +
                    IntToStr(N4) ;

      ListBox1.Items.Add('*** DCCSend Nick:' + ANick +
                          ' IP:' + AIp +
                          ' (' + DottedString + ')' +
                          ' Port:' + APort +
                          ' Filename:' + AFilename +
                          ' Size:' + AFileSize +
                          ' *** ' ) ;

      if Messagedlg('Receive File/Modtag fil: ' + AFilename  + ' ?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes

      then
      begin Gauge1.MaxValue := StrToInt(AFileSize) ;
            Gauge1.Progress := 0 ;
            Edit2.Visible   := false ;
            Gauge1.Visible  := true ;

            IdTCPClient1.Host := DottedString ; //'localhost' ; // AIp
            IdTCPClient1.Port := StrToINt(APort) ;
            IdTCPClient1.Connect(-1);

            // Timer2.Enabled := true ; // done in connected event!
      end
      else
      begin Focuscontrol(Edit2) ;
            Edit2.SelStart := length(Edit2.text) ;
      end;

end;

procedure TMyCryptCHAT.IdTCPClient1Connected(Sender: TObject);
begin
       ListBox1.Items.Add('Connected for SEND file') ;

       // Timer2.Enabled := true ;
end;

procedure TMyCryptCHAT.IdTCPClient1Disconnected(Sender: TObject);
begin
       ListBox1.Items.Add('DisConnected for SEND file') ;
end;

procedure TMyCryptCHAT.IdTCPClient1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
       ListBox1.Items.Add('Status for SEND file: '+ AStatustext) ;
end;

procedure TMyCryptCHAT.Button6Click(Sender: TObject);
begin

      Timer2.Enabled := true ;
      
end;

procedure TMyCryptCHAT.Button7Click(Sender: TObject);
begin
       try  IdTCPClient1.Connect(-1)  ;
       except
       end;

end;

procedure TMyCryptCHAT.IdIOHandlerSocket1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
    ListBox1.Items.Add('Status for Handler file: '+ AStatustext) ;
end;

procedure TMyCryptCHAT.Timer2Timer(Sender: TObject);
var SENDstring: widestring ;
    BytesRead : integer ;
begin

  Timer2.Enabled := False;

       SENDstring := '' ;

       if IdTCPClient1.Connected = false
       then EXIT ;

  TRY  BytesRead := IdTCPClient1.ReadFromStack(true, -1, false);

       // while
       if (IdTCPClient1.InputBuffer.Size > 0) and (BytesRead > 0)
       then
       //do
       begin
          Application.ProcessMessages ; // *********************************
          // read one complete frame and process as needed ...
          SENDstring :=   IdTCPClient1.CurrentReadBuffer ;

          ListBox1.Items.Add('Bytes Read: ' + IntToStr(length(SENDstring)) ) ;
          ListBox1.Selected[ListBox1.Items.Count -1]  := true ;


          Gauge1.Progress := Gauge1.Progress +  length(SENDstring) ;

          Application.ProcessMessages ; // *********************************

          if Gauge1.Progress = Gauge1.MaxValue then
          begin Edit2.Visible   := true ;
                Gauge1.Visible  := false ;
                IdTCPClient1.Disconnect ;

                ListBox1.Items.Add('*** File received OK! / Fil modtaget OK! ***' ) ;
                ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

                EXIT ;
          end

       end;

  Application.ProcessMessages ; // *********************************

  EXCEPT  Edit2.Visible   := true ;
          Gauge1.Visible  := false ;
          TRY IdTCPClient1.Disconnect ; EXCEPT ; END;

          ListBox1.Items.Add('*** File Read Problem ***' ) ;
          ListBox1.Selected[ListBox1.Items.Count -1]  := true ;

          EXIT ;
  END;

  Timer2.Enabled := True;

end;

procedure TMyCryptCHAT.IdTCPClient1WorkEnd(Sender: TObject;
  AWorkMode: TWorkMode);
begin
 ListBox1.Items.Add('WorkEnd') ;
end;

procedure TMyCryptCHAT.IdTCPClient1Work(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
 ListBox1.Items.Add('OnWork') ;
end;

procedure TMyCryptCHAT.IdTCPClient1WorkBegin(Sender: TObject;
  AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
 ListBox1.Items.Add('WorkBegin') ;
end;

procedure TMyCryptCHAT.Panel4DblClick(Sender: TObject);
begin

  Button3.Visible := not Button3.Visible ;
  Button6.Visible := not Button6.Visible ;
  Button7.Visible := not Button7.Visible ;

end;

procedure TMyCryptCHAT.Image2Click(Sender: TObject);
begin
          Checkbox2.Checked := not CheckBox2.Checked ;
end;

procedure TMyCryptCHAT.Image1Click(Sender: TObject);
begin
          Checkbox2.Checked := not CheckBox2.Checked ;
end;

end.
