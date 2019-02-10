unit UnitProgramm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormProgramm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgramm: TFormProgramm;

implementation

{$R *.dfm}

uses UnitTest;

procedure TFormProgramm.Button1Click(Sender: TObject);
begin
  Unittest.Test.ShowModal;
end;

end.
