unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMyCryptCHATdataflow = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Label2: TLabel;
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
  MyCryptCHATdataflow: TMyCryptCHATdataflow;

implementation

{$R *.dfm}

procedure TMyCryptCHATdataflow.Button1Click(Sender: TObject);
begin
      Memo1.Lines.Clear ;
end;

procedure TMyCryptCHATdataflow.Button2Click(Sender: TObject);
begin
      Memo2.Lines.Clear ;
end;

end.
