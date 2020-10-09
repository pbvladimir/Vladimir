unit UTechniqueByOrganization;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, Grids, DBGridEh, FIBDataSet, pFIBDataSet, Menus, Upassword,
  UScanner, pFIBQuery, FIBQuery, FIBDatabase, pFIBDatabase, StdCtrls;

type
  TFTechniqueByOrganization = class(TForm)
    Panel1: TPanel;
    FIBDS: TpFIBDataSet;
    DBGridEh1: TDBGridEh;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    FIBQUpdate: TpFIBQuery;
    FIBQRead: TpFIBQuery;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTechniqueByOrganization: TFTechniqueByOrganization;
procedure AddProduct;
implementation

uses Uproduct;

{$R *.DFM}

procedure TFTechniqueByOrganization.FormShow(Sender: TObject);
begin
  FIBDS.ParamByName('us_org_id').AsInteger:= Flogin.ORG_AND_USER;
  FIBDS.Active:= True;
  FIBDS.CloseOpen(True);
end;

procedure AddProduct;
var
  barcoode, org_and_user_id, buttonSelected: integer;

begin
  FScanner.ShowModal;

  barcoode:= FScanner.BARCODE_SCANNER;
  org_and_user_id:= Flogin.ORG_AND_USER;

  with FTechniqueByOrganization do begin
    FIBQRead.ParamByName('barcoode').AsInteger:= barcoode;
    FIBQRead.ExecQuery;
    if(FIBQRead.RecordCount < 1) then
      begin
        ShowMessage('Нет такого штрихкода на складе!');
        Exit;
      end;

    if(FIBQRead.FieldByName('user_and_org_id').AsString <> Null) then
      begin
        buttonSelected := MessageDlg('Такой штрихкод закреплён за пользователем '+
        'на складе, принять?', mtError, mbOKCancel, 0);

        if buttonSelected = mrCancel then Exit;
      end;

    FIBQUpdate.ParamByName('user_and_org_id').AsInteger:= org_and_user_id;
    FIBQUpdate.ParamByName('barcode').AsInteger:= barcoode;
    FIBQUpdate.ExecQuery;

    FIBDS.CloseOpen(True);
  end;

end;

procedure TFTechniqueByOrganization.N1Click(Sender: TObject);
begin
  AddProduct;
end;

procedure TFTechniqueByOrganization.DBGridEh1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Ord(Key) = 27 then FTechniqueByOrganization.Close;
end;

end.
