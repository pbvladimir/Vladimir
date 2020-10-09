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
    BtnInput: TButton;
    FIBDS: TpFIBDataSet;
    ComboBox1: TComboBox;
    Label3: TLabel;
    procedure BtnInputClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ed_passwordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    SHUT: Boolean;
    { Private declarations }
  public
    ORG_AND_USER: integer;
    { Public declarations }
  end;

var
  Flogin: TFlogin;

implementation

uses Uproduct;

{$R *.DFM}

procedure TFlogin.BtnInputClick(Sender: TObject);
var
  i : integer;
begin
  with FIBDS do begin
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
        ORG_AND_USER:= FieldByName('id').AsInteger;
        SHUT:= False;
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
  FProduct.pFIBDbaseGeneral.DBName:= FProduct.FReads;

  if not FProduct.pFIBDbaseGeneral.Connected then
    FProduct.pFIBDbaseGeneral.Connected:= True;

  FProduct.FIBTrUpdata.Active:= True;
  FProduct.FIBTrRead.Active:= True;

  SHUT:= True;

  with FIBDS do begin
    if Active then Close;
    SelectSQL.Text :='select NAME from organizations org ';
    CloseOpen(True);
  end;

  while not FIBDS.Eof do
  begin
    ComboBox1.Items.Add(FIBDS.FieldByName('NAME').AsString);
    FIBDS.Next;
  end

end;

procedure TFlogin.Ed_passwordKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 13 then BtnInputClick(self);
end;

procedure TFlogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if SHUT then  FProduct.Close;
end;

end.
