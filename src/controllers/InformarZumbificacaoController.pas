unit InformarZumbificacaoController;

interface

uses
  SysUtils, fano, BaseController;

type
  TInformarZumbificacaoController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TInformarZumbificacaoController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  Result := JsonResponse(response,
    '{"message":"TODO: implementar notificacao de zumbificacao"}',
    501);
end;

end.