unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TStart = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Start: TStart;

implementation

uses Unit1;

{$R *.dfm}

procedure TStart.Button1Click(Sender: TObject);
begin   MyCryptCHAT.siLang1.Tag := 1 ; // 1. start done
        MyCryptCHAT.siLang1.ActiveLanguage := 2 ;
        Close ;
end;

procedure TStart.Button2Click(Sender: TObject);
begin   MyCryptCHAT.siLang1.Tag := 1 ; // 1. start done
        MyCryptCHAT.siLang1.ActiveLanguage := 1 ;
        Close ;
end;

end.
