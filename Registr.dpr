program Registr;

uses
  Vcl.Forms,
  UnitAutor in 'UnitAutor.pas' {FormAutor},
  UnitRegistered in 'UnitRegistered.pas' {FormRegistered},
  UnitProgramm in 'UnitProgramm.pas' {FormProgramm},
  UnitTest in 'UnitTest.pas' {Test},
  UnitUtility in 'UnitUtility.pas',
  UnitTable in 'UnitTable.pas' {FormTable},
  UnitTestSelect in 'UnitTestSelect.pas' {testSelect};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.CreateForm(TFormProgramm, FormProgramm);
  Application.CreateForm(TFormAutor, FormAutor);
  Application.CreateForm(TtestSelect, testSelect);
  Application.Run;
end.
