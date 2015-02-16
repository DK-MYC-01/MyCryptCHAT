unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TGroupMemberAction = class(TForm)
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GroupMemberAction: TGroupMemberAction;

implementation

{$R *.dfm}

procedure TGroupMemberAction.Button1Click(Sender: TObject);
begin
          MessageBeep(0) ;
end;

procedure TGroupMemberAction.RadioGroup1Click(Sender: TObject);
begin
          if RadioGroup1.ItemIndex = 0
          then CLOSE ;


          if RadioGroup1.ItemIndex = 5
          then begin  Edit2.Text := '   --- Enter CLEAR TEXT message here ---   ' ;
                      Edit2.Visible :=   true ;
                      Button1.Visible := true ;
                      GroupMemberAction.FocusControl(Edit2) ;
                      Edit2.SelectAll ;
               end;

end;

procedure TGroupMemberAction.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
          RadioGroup1.ItemIndex  := -1 ;
          Edit2.Visible :=   false ;
          Button1.Visible := false ;
end;

procedure TGroupMemberAction.FormShow(Sender: TObject);
begin
        GroupMemberAction.FocusControl(RadioGroup1) ;
end;

end.
