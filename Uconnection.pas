unit Uconnection;

interface

uses SysUtils, Dialogs;

type TLogin = record
            rez : String;
            log : Boolean;
     end;

type Resident = class
              apartament : Integer;
              Surrname : String;
              function Info (): String;
      end;

type UserAuthorization = class
              apartament : Integer;
              Surrname : String;
              function Check (): String;
      end;


implementation

function Resident.Info;
begin
  Result := 'resident: ' + Surrname +
  ' apartament ¹: ' + IntToStr(apartament) + '.';
end;

function UserAuthorization.Check;
begin
end;

end.
