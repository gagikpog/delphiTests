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
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAutor, FormAutor);
  Application.CreateForm(TFormProgramm, FormProgramm);
  Application.CreateForm(TFormRegistered, FormRegistered);
  //Application.CreateForm(TFormTable, FormTable);
  Application.Run;
end.
