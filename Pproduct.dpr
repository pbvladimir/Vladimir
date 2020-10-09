program Pproduct;

uses
  Forms,
  Uproduct in 'Uproduct.pas' {FProduct},
  Upassword in 'Upassword.pas' {Flogin},
  Uconnection in 'Uconnection.pas',
  UScanner in 'UScanner.pas' {FScanner},
  UTechniqueByOrganization in 'UTechniqueByOrganization.pas' {FTechniqueByOrganization};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFProduct, FProduct);
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TFScanner, FScanner);
  Application.CreateForm(TFTechniqueByOrganization, FTechniqueByOrganization);
  Application.Run;
end.
