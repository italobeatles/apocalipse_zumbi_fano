unit BaseController;

interface

uses
  SysUtils, fano;

type
  TBaseController = class(TInterfacedObject, IRequestHandler)
  protected
    function JsonResponse(const response: IResponse; const payload: string; const status: Integer = 200): IResponse;
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; virtual;
  end;

implementation

function TBaseController.JsonResponse(const response: IResponse; const payload: string; const status: Integer = 200): IResponse;
begin
  response.headers().setHeader('Content-Type', 'application/json');
  response.statusCode(status);
  response.body().setContent(payload);
  Result := response;
end;

function TBaseController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  Result := JsonResponse(response, '{"message":"Not implemented"}', 501);
end;

end.