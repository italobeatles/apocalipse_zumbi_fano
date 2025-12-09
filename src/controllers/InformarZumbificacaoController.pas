unit InformarZumbificacaoController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, FanoStub, BaseController;

type
  TInformarZumbificacaoController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TInformarZumbificacaoController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  if request.method = 'POST' then
    Result := JsonResponse(response, '{"message":"Aviso registrado"}', 200)
  else
    Result := JsonResponse(response, '{"message":"Metodo nao suportado"}', 405);
end;

end.