unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Registry, siComp;

type
  TMyCryptCHATsetup = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Edit0: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    CheckBox2: TCheckBox;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Button5: TButton;
    rgServerType: TRadioGroup;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    Label9: TLabel;
    siLang1: TsiLang;
    Edit5: TEdit;
    procedure Button4Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    
    function FourPasswordRulesOK: bool ;
    function RandomPassword(PLen: Integer): string;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit0Change(Sender: TObject);
    procedure Edit0KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyCryptCHATsetup: TMyCryptCHATsetup;

implementation

uses Unit1, Unit7;

{$R *.dfm}

function TMyCryptCHATsetup.FourPasswordRulesOK: bool ;
var I: integer ;
    B: byte ;
    Upper, Lower,Special,Number : integer ;
begin
    Upper   := 0 ;
    Lower   := 0 ;
    Special := 0 ;
    Number  := 0 ;

    if   length(Edit4.Text) > 0
    then begin
          for     I := 1 to length(Edit4.Text)   do
            begin B := byte(Edit4.Text[I]) ;

                  if (B > 31) and (B < 48) then Special   := 1 ;
                  if (B > 47) and (B < 58) then Number    := 1 ;
                  if (B > 57) and (B < 65) then Special   := 1 ;
                  if (B > 64) and (B < 91) then Upper     := 1 ;
                  if (B > 90) and (B < 97) then Special   := 1 ;
                  if (B > 96) and (B < 123) then Lower    := 1 ;
                  if (B > 122) and (B < 127) then Special := 1 ;
                  if (B > 160) and (B < 173) then Special := 1 ;
                  if (B > 191) and (B < 224) then Upper   := 1 ;
                  if (B > 223) and (B < 247) then Lower   := 1 ;
                  if  B = 247                then Special := 1 ;
                  if (B > 247) and (B < 256) then Lower   := 1 ;
            end;
                  if   (Upper + Lower + Special + Number = 4)
                        and (length(Edit4.Text) > 7)
                  then Result := true
                  else Result := false;
         end
    else               Result := false;
 {
 if Upper   = 1 then cbUpper.Checked   := true else cbUpper.Checked   := false ;
 if Lower   = 1 then cbLower.Checked   := true else cbLower.Checked   := false ;
 if Special = 1 then cbSpecial.Checked := true else cbSpecial.Checked := false ;
 if Number  = 1 then cbNumber.Checked  := true else cbNumber.Checked  := false ;
  }

end;


function  TMyCryptCHATsetup.RandomPassword(PLen: Integer): string;
var
  str: string;
begin
  Randomize;
  // string with "all" possible chars
  str    := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = PLen)
end;
{ E.g.: generate a password with 10 chars + datetime string w. milliseconds
label1.Caption := RandomPassword(10) + FormatDateTime('YYYYMMDDHHNNSSZZZ',now);
}


procedure TMyCryptCHATsetup.Button4Click(Sender: TObject);
begin
        Edit0.Text := '' ;
        Edit1.Text := '' ;
        Edit2.Text := '' ;
        Edit3.Text := '' ;
        Edit4.Text := '' ;
end;

procedure TMyCryptCHATsetup.Edit4Change(Sender: TObject);
begin

  if   FourPasswordRulesOK = true
  then Edit4.Color := clLime
  else Edit4.Color := clRed ;

end;

procedure TMyCryptCHATsetup.CheckBox1Click(Sender: TObject);
begin
        if CheckBox1.Checked = true
        then    Edit4.PasswordChar := char('*')
        else    EDit4.PasswordChar := char(0) ;
end;

procedure TMyCryptCHATsetup.FormShow(Sender: TObject);
begin

  if MyCryptCHAT.Edit1.Color = clLime
  then Panel1.Enabled := false
  else Panel1.Enabled := true ;

  if  MyCryptCHAT.Edit1.Color = clLime
  then Label6.Visible := true
  else Label6.Visible := false ;

  Edit0Change(nil) ;
  Edit3Change(nil) ;
  Edit4Change(nil) ;

  siLang1.ActiveLanguage := MyCryptCHAT.siLang1.ActiveLanguage ;

end;

procedure TMyCryptCHATsetup.Edit3Change(Sender: TObject);
begin

  if   length(Edit3.Text) > 3
  then Edit3.Color := clLime
  else Edit3.Color := clRed ;

end;

procedure TMyCryptCHATsetup.Edit0Change(Sender: TObject);
begin

  if   length(Edit0.Text) > 3
  then Edit0.Color := clLime
  else Edit0.Color := clRed ;

  Edit5.Color := Edit0.Color ;

end;

procedure TMyCryptCHATsetup.Edit0KeyPress(Sender: TObject; var Key: Char);
begin                 // User/Alias/Name
        if Key = char(' ') then Key := char(0) ; // space NOT allowed!
        if Key = char(',') then Key := char(0) ; // comma NOT allowed!
        if Key = char('<') then Key := char(0) ;
        if Key = char('>') then Key := char(0) ;
end;

procedure TMyCryptCHATsetup.Edit3KeyPress(Sender: TObject; var Key: Char);
begin                    // Group name
        if Key = char(' ') then Key := char(0) ; // space NOT allowed!
        if Key = char(',') then Key := char(0) ; // space NOT allowed!

end;


procedure TMyCryptCHATsetup.Button1Click(Sender: TObject);
var  MyIniFile: TRegistryIniFile;
begin

  MyIniFile := TRegistryIniFile.Create('MyCryptCHAT.INI');
  with MyIniFile do
  begin

    WriteString('Server','Name', Edit1.Text);
    WriteString('Server','Port', Edit2.Text);
    WriteString('User','Alias',  Edit0.Text);
    WriteString('Group','Name',  Edit3.Text);

    WriteBool('CheckBox','DoNotSavePW',CheckBox2.Checked );

    WriteBool('CheckBox','HidePassword',CheckBox1.Checked ) ;

    WriteInteger('Server','Type', rgServerType.ItemIndex  ) ;

    if CheckBox2.Checked = true //don't save
    then   WriteString('Password','Key', '' )
    else   WriteString('Password','Key', Edit4.Text);

  end;

  MyIniFile.Free;

  MessageBox(Handle,'OK', ' Data --->  Registry ', mb_OK);

end;

procedure TMyCryptCHATsetup.FormCreate(Sender: TObject);
var  MyIniFile: TRegistryIniFile;
begin

  MyIniFile := TRegistryIniFile.Create('MyCryptCHAT.INI');
  with MyIniFile do
  begin
    Edit1.Text := ReadString('Server','Name', 'IRC.INET.TELE.DK');
    Edit2.Text := ReadString('Server','Port', '6667');
    Edit0.Text := ReadString('User','Alias',  '');
    Edit3.Text := ReadString('Group','Name',  'Default-MYC-01');

    CheckBox2.Checked := ReadBool('CheckBox','DoNotSavePW',  false );
    CheckBox1.Checked := ReadBool('CheckBox','HidePassword', false );

    Edit4.Text := ReadString('Password','Key', 'Default-KEY-1' ) ;

    rgServerType.ItemIndex :=  ReadInteger('Server','Type', 0 ) ;

    MyCryptCHAT.siLang1.ActiveLanguage := ReadInteger('Language','Number', 2 ) ;
                                                                  // Dansk
    MyCryptCHAT.siLang1.Tag := ReadInteger('Language','Selected', 0 ) ;
    // 1 = start language selection done

  end;

  MyIniFile.Free;

end;

procedure TMyCryptCHATsetup.Button3Click(Sender: TObject);
var CB1, CB2 : string ;
begin

        if CheckBox1.Checked
        then CB1 := 'true'
        else CB1 := 'false' ;

        if CheckBox2.Checked
        then CB2 := 'true'
        else CB2 := 'false' ;

        SaveDialog1.Filter := 'Setup file (*.MCS)|*.MCS' ;

 if SaveDialog1.Execute = true
 then
 begin  Memo1.Lines.Clear ;
        Memo1.Lines.Add(IntToStr(rgServerType.ItemIndex)) ;
        Memo1.Lines.Add(Edit1.Text) ;
        Memo1.Lines.Add(Edit2.Text) ;
        Memo1.Lines.Add(Edit0.Text) ;
        Memo1.Lines.Add(Edit3.Text) ;

        if CB2 = 'false'
        then    Memo1.Lines.Add(Edit4.Text)
        else    Memo1.Lines.Add('') ;

        Memo1.Lines.Add(CB1) ;
        Memo1.Lines.Add(CB2) ;

        Memo1.Lines.Add('***MyCryptCHAT***') ;


        Memo1.Lines.SaveToFile(SaveDialog1.FileName);

        MessageBox(Handle,' Data ---> File','OK', mb_OK);
 end;

end;

procedure TMyCryptCHATsetup.Button5Click(Sender: TObject);
begin
        FormCreate(nil);

        MessageBox(Handle,'OK', ' Data <--- Registry ', mb_OK);
end;

procedure TMyCryptCHATsetup.Button2Click(Sender: TObject);
begin

 OpenDialog1.Filter := 'Setup file (*.MCS)|*.MCS' ;

 if OpenDialog1.Execute = true
 then
 begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);

    if  Memo1.Lines[8] =  '***MyCryptCHAT***'
    then
    begin
        rgServerType.ItemIndex := StrToInt(Memo1.Lines[0]) ;

        Edit1.Text := Memo1.Lines[1] ;
        Edit2.Text := Memo1.Lines[2] ;
        Edit0.Text := Memo1.Lines[3] ;
        Edit3.Text := Memo1.Lines[4] ;

        if   Memo1.Lines[7] =  'false'
        then Edit4.Text := Memo1.Lines[5] ;

        if  Memo1.Lines[6] =  'true'
        then  CheckBox1.checked := true
        else  CheckBox1.checked := false ;

        if  Memo1.Lines[7] =  'true'
        then  CheckBox2.checked := true
        else  CheckBox2.checked := false ;

        MessageBox(Handle,' Data <--- File','OK', mb_OK);
    end
    else MessageBox(Handle,'Settings loading from File FAILED!','Format Error i file!', mb_OK);
 end;

end;

procedure TMyCryptCHATsetup.FormDestroy(Sender: TObject);
var  MyIniFile: TRegistryIniFile;
begin

  MyIniFile := TRegistryIniFile.Create('MyCryptCHAT.INI');
  with MyIniFile do
  begin
      WriteInteger('Language','Number', MyCryptCHAT.siLang1.ActiveLanguage ) ;

      WriteInteger('Language','Selected', MyCryptCHAT.siLang1.Tag )  ;
      // 1 = start language selection done
  end;

  MyIniFile.Free;

end;



end.

