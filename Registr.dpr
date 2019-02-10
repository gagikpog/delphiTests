program Registr;

uses
  Vcl.Forms,
  UnitAutor in 'UnitAutor.pas' {FormAutor},
  UnitRegistered in 'UnitRegistered.pas' {FormRegistered},
  UnitProgramm in 'UnitProgramm.pas' {FormProgramm},
  UnitTest in 'UnitTest.pas' {Form1},
  UnitTestMove in 'UnitTestMove.pas' {Form2},
  UnitTest2 in 'UnitTest2.pas' {Form3},
  UnitTestAdd in 'UnitTestAdd.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormAutor, FormAutor);
  Application.CreateForm(TFormRegistered, FormRegistered);
  Application.CreateForm(TFormProgramm, FormProgramm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
