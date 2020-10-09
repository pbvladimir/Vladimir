unit Uproduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, pFIBDatabase, StdCtrls, Upassword, ExtCtrls, Menus, UScanner,
  UTechniqueByOrganization, Db, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery;

type
  TFProduct = class(TForm)
    pFIBDbaseGeneral: TpFIBDatabase;
    FIBTrUpdata: TpFIBTransaction;
    FIBTrRead: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    Lb_org: TLabel;
    MainMenu1: TMainMenu;
    EXIT1: TMenuItem;
    N1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EXIT1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProduct: TFProduct;

implementation

{$R *.DFM}

procedure TFProduct.FormShow(Sender: TObject);
begin
  pFIBDbaseGeneral.Connected:= True;
  Flogin.ShowModal;
end;

procedure TFProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pFIBDbaseGeneral.Connected:=False;
end;

procedure TFProduct.EXIT1Click(Sender: TObject);
begin
  FProduct.Close;
end;

procedure TFProduct.N1Click(Sender: TObject);
begin
  FTechniqueByOrganization.ShowModal;
end;

end.
