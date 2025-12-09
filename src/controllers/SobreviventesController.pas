unit SobreviventesController;

interface

uses
  SysUtils, fano, BaseController;

type
  TSobreviventesController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TSobreviventesController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  Result := JsonResponse(response,
    '{"message":"TODO: implementar CRUD de sobreviventes (listar, criar, atualizar localizacao, excluir)"}',
    501);
end;

end.