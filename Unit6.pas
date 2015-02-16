unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TIRClog = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IRClog: TIRClog;

implementation

{$R *.dfm}

procedure TIRClog.Button1Click(Sender: TObject);
begin
          Memo1.Lines.Clear ;
end;

procedure TIRClog.Memo1Change(Sender: TObject);
begin

           Memo1.SelStart :=  length(Memo1.Lines.Text)  ;

           // Memo1.SelLength := 1 ;

end;

end.
