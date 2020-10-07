unit Uproduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, pFIBDatabase, StdCtrls, Upassword, ExtCtrls, Menus, UScanner;
var
  ORGANIZATION_ID : integer;
  
type
  TFProduct = class(TForm)
    pFIBDatabase1: TpFIBDatabase;
    FIBTrUpdata: TpFIBTransaction;
    FIBTrRead: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    Lb_org: TLabel;
    MainMenu1: TMainMenu;
    EXIT1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
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
  Lb_org.caption:= '0';
  pFIBDatabase1.Connected:= True;
  Flogin.ShowModal;
  ORGANIZATION_ID := StrToInt(Lb_org.caption);
  Lb_org.caption:= '';
end;

procedure TFProduct.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  pFIBDatabase1.Connected:=False;
end;

procedure TFProduct.EXIT1Click(Sender: TObject);
begin
  FProduct.Close;
end;

procedure TFProduct.N1Click(Sender: TObject);
begin
  FScanner.ShowModal;
end;

end.