unit InventarioController;

interface

uses
  SysUtils, fano, BaseController;

type
  TInventarioController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TInventarioController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  Result := JsonResponse(response,
    '{"message":"TODO: implementar listagem de inventario e troca de itens"}',
    501);
end;

end.