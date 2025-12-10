unit BaseController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, FanoStub;

type
  TBaseController = class(TInterfacedObject, IRequestHandler)
  protected
    procedure ApplyCorsHeaders(const response: IResponse);
    function HandlePreflight(const request: IRequest; const response: IResponse): Boolean;
    function JsonResponse(const response: IResponse; const payload: string; const status: Integer = 200): IResponse;
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; virtual;
  end;

implementation

procedure TBaseController.ApplyCorsHeaders(const response: IResponse);
begin
  response.headers().setHeader('Access-Control-Allow-Origin', '*');
  response.headers().setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE, OPTIONS');
  response.headers().setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization, X-Requested-With');
end;

function TBaseController.HandlePreflight(const request: IRequest; const response: IResponse): Boolean;
begin
  ApplyCorsHeaders(response);
  Result := UpperCase(request.method) = 'OPTIONS';
  if Result then
  begin
    response.statusCode(204);
    response.body().setContent('');
  end;
end;

function TBaseController.JsonResponse(const response: IResponse; const payload: string; const status: Integer = 200): IResponse;
begin
  ApplyCorsHeaders(response);
  response.headers().setHeader('Content-Type', 'application/json');
  response.statusCode(status);
  response.body().setContent(payload);
  Result := response;
end;

function TBaseController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
begin
  if HandlePreflight(request, response) then
  begin
    Result := response;
    Exit;
  end;
  Result := JsonResponse(response, '{"message":"Not implemented"}', 501);
end;

end.
