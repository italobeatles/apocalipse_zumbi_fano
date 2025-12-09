unit SobreviventeModel;

interface

uses
  SysUtils, Generics.Collections;

type
  TSobreviventeRecurso = record
    IdRecurso: Integer;
    Quantidade: Integer;
  end;

  TSobrevivente = record
    Id: Integer;
    Nome: string;
    Sexo: string;
    Idade: Integer;
    Latitude: Double;
    Longitude: Double;
    Zumbi: Boolean;
    Recursos: TList<TSobreviventeRecurso>;
  end;

implementation

end.