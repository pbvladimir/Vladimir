unit Uproduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, pFIBDatabase, StdCtrls, Upassword, ExtCtrls, Menus, UScanner,
  UTechniqueByOrganization, Db, FIBDataSet, pFIBDataSet, FIBQuery, inifiles,
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
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function FReads: String;
    { Public declarations }
  end;

var
  FProduct: TFProduct;

implementation

{$R *.DFM}

procedure TFProduct.FormShow(Sender: TObject);
var
  text: String;
begin
  pFIBDbaseGeneral.DBName:= FReads;
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

function TFProduct.FReads;
var
  Ini: TIniFile;
  text: String;
begin
  text:='d:\PROJECT_BD' ;
  Ini:= TIniFile.Create('d:\PROJECT_BD\IniFile.ini');
  Result:=Ini.ReadString('opt', 'path', text);
  Ini.Free;
end;


procedure TFProduct.Button1Click(Sender: TObject);
begin
  ShowMessage( FReads);
end;

end.
