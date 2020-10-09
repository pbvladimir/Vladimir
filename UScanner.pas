unit UScanner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TFScanner = class(TForm)
    Panel1: TPanel;
    EBarcode: TEdit;
    procedure EBarcodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    BARCODE_SCANNER: integer;
    { Public declarations }
  end;

var
  FScanner: TFScanner;

Procedure Barcode;

implementation

uses Uproduct;

{$R *.DFM}

procedure TFScanner.EBarcodeKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 13 then Barcode;

  if Key = #27 then FScanner.Close;

  if not(Key in ['0' .. '9', decimalseparator]) then
    Key := #0;

end;

Procedure Barcode;
begin
  with FScanner do begin
    BARCODE_SCANNER:= StrToInt(EBarcode.text);
    EBarcode.text:= '';
    Close;
  end;
end;



procedure TFScanner.FormShow(Sender: TObject);
begin
  BARCODE_SCANNER:=0;
end;

end.
