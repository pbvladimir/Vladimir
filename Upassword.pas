unit Upassword;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Uconnection, ExtCtrls, FIBQuery, pFIBQuery, Db, FIBDataSet,
  pFIBDataSet, Mask, DBCtrls;

type
  TFlogin = class(TForm)
    Panel1: TPanel;
    Ed_login: TEdit;
    Ed_password: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    FIBDS1: TpFIBDataSet;
    ComboBox1: TComboBox;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ed_passwordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses Uproduct;

{$R *.DFM}

procedure TFlogin.Button1Click(Sender: TObject);
var
  Ivanov : Resident;
begin
  Ivanov := Resident.Create();
  Ivanov.apartament:=20;
  Ivanov.Surrname:='Ivanov';
  Showmessage(Ivanov.Info());
  Flogin.Close;
  FProduct.Close;
end;

procedure TFlogin.Button3Click(Sender: TObject);
var
  i : integer;
begin
  with FIBDS1 do begin
    if Active then Close;
    Params.ClearValues;
    SelectSQL.Text :='SELECT uo.id '+
      'FROM users us '+
      'LEFT JOIN user_and_org uo ON uo.user_id = us.id '+
      'LEFT JOIN organizations org ON org.id = uo.organization_id '+
      'WHERE us.username = :log AND us.pass = :pass AND org.name = :name_org ';
    ParamByName('log').AsString:= Ed_login.Text;
    ParamByName('pass').AsString:= Ed_password.Text;
    ParamByName('name_org').AsString:= ComboBox1.Text;
    CloseOpen(True);
    if RecordCountFromSrv > 0 then
      begin
        Uproduct.FProduct.Lb_org.Caption:= FieldByName('id').AsString;
        Flogin.Close;
      end
    else
      begin
        ShowMessage('Вы ошиблись, повторите вход!');
        Flogin.Close;
        FProduct.Close;
      end;

  end;

end;

procedure TFlogin.FormCreate(Sender: TObject);
begin

  with FIBDS1 do begin
    if Active then Close;
    SelectSQL.Text :='select NAME from organizations org ';
    CloseOpen(True);
  end;

  while not FIBDS1.Eof do
  begin
    ComboBox1.Items.Add(FIBDS1.FieldByName('NAME').AsString);
    FIBDS1.Next;
  end

end;

procedure TFlogin.Ed_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 13 then Button3Click(self);
end;

end.
