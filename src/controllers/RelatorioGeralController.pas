unit RelatorioGeralController;

interface

uses
  SysUtils, fano, BaseController;

type
  TRelatorioGeralController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TRelatorioGeralController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  Result := JsonResponse(response,
    '{"message":"TODO: implementar relatorio geral"}',
    501);
end;

end.