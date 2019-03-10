unit UnitTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ExtCtrls;

type
  TFormTable = class(TForm)
    DBGrid1: TDBGrid;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTable: TFormTable;

implementation

{$R *.dfm}

uses UnitAutor;

procedure TFormTable.FormCreate(Sender: TObject);
var s:String;
begin
  s := 'SELECT * FROM Testing WHERE [User] = ' + IntToStr(FormAutor.AuthUserID)+';';
  ADOQuery1.Active := false;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add(s);
  ADOQuery1.Active := true;
end;

end.
