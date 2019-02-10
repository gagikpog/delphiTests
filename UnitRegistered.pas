unit UnitRegistered;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB, Data.Win.ADODB;

type
  TFormRegistered = class(TForm)
    EditRegLogin: TEdit;
    EditRegPassword: TEdit;
    TRadioGroupPersonalDB: TRadioGroup;
    EditRegName: TEdit;
    EditRegFamily: TEdit;
    EditRegLastName: TEdit;
    ComboBoxRegSex: TComboBox;
    DateTimePickerRegBirthDay: TDateTimePicker;
    EditRegGroup: TEdit;
    ButtonStartRegistrated: TButton;
    ADOQueryStartRegistered: TADOQuery;
    procedure ButtonStartRegistratedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRegistered: TFormRegistered;

implementation

{$R *.dfm}

uses UnitAutor;

procedure TFormRegistered.ButtonStartRegistratedClick(Sender: TObject);
  var LogPass: array of string;
begin
// проверка на введенность текста
 if EditRegLogin.Text = '' then
 begin
 EditRegLogin.SetFocus;

 end;
  if EditRegPassword.Text = '' then
 begin
 EditRegPassword.SetFocus;

 end;
   if EditRegName.Text = '' then
  begin EditRegName.SetFocus;

  end;
   if EditRegFamily.Text = '' then
   begin EditRegFamily.SetFocus;

   end;
    if EditRegLastName.Text = '' then
    begin
    EditRegLastName.SetFocus;

    end;
     if EditRegGroup.Text = '' then
     begin
     EditRegGroup.SetFocus;

     end;


if (EditRegLogin.Text='')or (EditRegPassword.Text='')or(EditRegName.Text='')or(EditRegFamily.Text='')or
     (EditRegLastName.Text='')or (EditRegGroup.Text='')then
 begin
 MessageBox(Handle,'Заполните все поля, пожалуйста!', 'Ошибка заполнения! ', Mb_ok );
      exit;
 end;


if (EditRegLogin.Text <> '')and (EditRegPassword.Text <> '' ) then
begin
         LogPass[1]:=ADOQueryStartRegistered.FieldValues['UserName'];

ADOQueryStartRegistered.Parameters.ParamByName('RegUserName').Value:=EditRegLogin.Text;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserPassword').Value:=EditRegPassword.Text;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserNamePersonal').Value:=EditRegName.Text;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserFamilyPersonal').Value:=EditRegFamily.Text;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserLastNamePersonal').Value:=EditRegLastName.Text;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserSexPersonal').Value:=ComboBoxRegSex.ItemIndex;
ADOQueryStartRegistered.Parameters.ParamByName('RegUserBitrhDayPersonal').Value:=DateTimePickerRegBirthDay.Date;
ADOQueryStartRegistered.Parameters.ParamByName('RegUSerGroupPersonal').Value:=EditRegGroup.Text;
ADOQueryStartRegistered.ExecSQL;
close;
end;

end;

end.
