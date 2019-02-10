unit UnitAutor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TFormAutor = class(TForm)
    ADOConnectionGeneral: TADOConnection;
    EditLogin: TEdit;
    EditPassword: TEdit;
    ButtonEnter: TButton;
    ButtonRegistration: TButton;
    ADODataSetUserTable: TADODataSet;
    DataSourceUserTable: TDataSource;
    LabelInfoNone: TLabel;
    procedure ButtonRegistrationClick(Sender: TObject);
    procedure ButtonEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAutor: TFormAutor;

implementation

{$R *.dfm}

uses UnitRegistered, UnitProgramm;

procedure TFormAutor.ButtonEnterClick(Sender: TObject);
var I:integer;
Login,Password,ResultLogPass,TempLoginPass:string;
begin
 Login:= Trim(EditLogin.Text);
 Password:= Trim(EditPassword.Text);
 ResultLogPass:= Trim(EditLogin.Text) + ' ' + Trim(EditPassword.Text);

 ADODataSetUserTable.First;

 for I := 0 to ADODataSetUserTable.RecordCount -1  do       // обработка лог и пароля пользователя
 begin
   TempLoginPass := ADODataSetUserTable.FieldValues['UserName'] + ' ' + ADODataSetUserTable.FieldValues['UserPass'] ;
   if  ResultLogPass = TempLoginPass then
   begin
      Hide;
      FormProgramm.ShowModal;
      close;
   end;
   ADODataSetUserTable.Next;
 end;
  LabelInfoNone.Caption:='Не верный логин или пароль';
end;

procedure TFormAutor.ButtonRegistrationClick(Sender: TObject);
begin
  FormRegistered.ShowModal;
  ADODataSetUserTable.Active := false;
  ADODataSetUserTable.Active := true;
end;

end.
