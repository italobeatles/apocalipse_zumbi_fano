unit SwaggerController;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, FanoStub, BaseController;

type
  TSwaggerController = class(TBaseController)
  public
    function handleRequest(const request: IRequest; const response: IResponse): IResponse; override;
  end;

implementation

function TSwaggerController.handleRequest(const request: IRequest; const response: IResponse): IResponse;
var
  SwaggerText: TStringList;
begin
  SwaggerText := TStringList.Create;
  try
    if FileExists('swagger/openapi.json') then
    begin
      SwaggerText.LoadFromFile('swagger/openapi.json');
      Result := JsonResponse(response, SwaggerText.Text, 200);
    end
    else
    begin
      Result := JsonResponse(response, '{"message":"Swagger file not found"}', 404);
    end;
  finally
    SwaggerText.Free;
  end;
end;

end.