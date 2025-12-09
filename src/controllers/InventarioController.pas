unit InventarioController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, FanoStub, BaseController;

type
  TInventarioController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TInventarioController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
var
  path: string;
begin
  path := LowerCase(request.path);
  if request.method = 'GET' then
  begin
    if Pos('/inventario/', path) = 1 then
      Result := JsonResponse(response, '{"sobrevivente_id":1,"itens":[{"recurso":1,"quantidade":2}]}', 200)
    else
      Result := JsonResponse(response, '[{"sobrevivente_id":1,"itens":[]},{"sobrevivente_id":2,"itens":[]}]', 200);
  end
  else if (request.method = 'POST') and (Pos('/inventario/troca', path) = 1) then
  begin
    Result := JsonResponse(response, '{"message":"Troca registrada"}', 200);
  end
  else
    Result := JsonResponse(response, '{"message":"Metodo nao suportado"}', 405);
end;

end.