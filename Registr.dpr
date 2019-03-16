program Registr;

uses
  Vcl.Forms,
  UnitAutor in 'UnitAutor.pas' {FormAutor},
  UnitRegistered in 'UnitRegistered.pas' {FormRegistered},
  UnitProgramm in 'UnitProgramm.pas' {FormProgramm},
  UnitTest in 'UnitTest.pas' {Test},
  UnitUtility in 'UnitUtility.pas',
  UnitTable in 'UnitTable.pas' {FormTable};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.CreateForm(TFormProgramm, FormProgramm);
  Application.CreateForm(TFormAutor, FormAutor);
  Application.Run;
end.
