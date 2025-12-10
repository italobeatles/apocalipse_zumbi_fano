unit RelatorioGeralController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, FanoStub, BaseController;

type
  TRelatorioGeralController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TRelatorioGeralController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  if HandlePreflight(request, response) then
  begin
    Result := response;
    Exit;
  end;
  if request.method = 'GET' then
    Result := JsonResponse(response, '{"infectados":0.3,"nao_infectados":0.7,"media_recursos": {"agua":1,"comida":1}}', 200)
  else
    Result := JsonResponse(response, '{"message":"Metodo nao suportado"}', 405);
end;

end.
