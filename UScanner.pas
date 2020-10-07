unit UScanner;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TFScanner = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FScanner: TFScanner;

implementation

{$R *.DFM}

procedure TFScanner.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = 13 then ShowMessage('Enter pressed!');
end;

end.
