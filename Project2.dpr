program Project2;

uses
  Forms,
  Unit1 in 'Unit1.pas' {MyCryptCHAT},
  Unit2 in 'Unit2.pas' {MyCryptCHATsetup},
  Unit3 in 'Unit3.pas' {MyCryptCHATabout},
  Unit4 in 'Unit4.pas' {MyCryptCHATdataflow},
  Unit5 in 'Unit5.pas' {GroupMemberAction},
  Unit6 in 'Unit6.pas' {IRClog},
  Unit7 in 'Unit7.pas' {Start};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMyCryptCHAT, MyCryptCHAT);
  Application.CreateForm(TMyCryptCHATsetup, MyCryptCHATsetup);
  Application.CreateForm(TMyCryptCHATabout, MyCryptCHATabout);
  Application.CreateForm(TMyCryptCHATdataflow, MyCryptCHATdataflow);
  Application.CreateForm(TGroupMemberAction, GroupMemberAction);
  Application.CreateForm(TIRClog, IRClog);
  Application.CreateForm(TStart, Start);
  Application.Run;
end.
