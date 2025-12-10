unit SobreviventesController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, FanoStub, BaseController;

type
  TSobreviventesController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TSobreviventesController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
var
  path: string;
begin
  if HandlePreflight(request, response) then
  begin
    Result := response;
    Exit;
  end;
  path := LowerCase(request.path);
  case request.method of
    'GET':
      begin
        if Pos('/sobreviventes/', path) = 1 then
          Result := JsonResponse(response, '{"id":1,"nome":"Alice","idade":30,"sexo":"F","zumbi":false}', 200)
        else
          Result := JsonResponse(response, '[{"id":1,"nome":"Alice"},{"id":2,"nome":"Bruno"}]', 200);
      end;
    'POST':
      Result := JsonResponse(response, '{"message":"Sobrevivente criado","dados":' + request.bodyAsString + '}', 201);
    'PUT':
      Result := JsonResponse(response, '{"message":"Localizacao atualizada"}', 200);
    'DELETE':
      Result := JsonResponse(response, '{"message":"Removido"}', 204);
  else
    Result := JsonResponse(response, '{"message":"Metodo nao suportado"}', 405);
  end;
end;

end.
