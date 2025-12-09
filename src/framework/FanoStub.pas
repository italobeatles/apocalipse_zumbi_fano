unit FanoStub;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Classes, Generics.Collections;

type
  IRequest = interface
    ['{B57157A3-06AB-4C4E-B84A-59EC20333A8D}']
    function method: string;
    function path: string;
    function bodyAsString: string;
  end;

  IHeaders = interface
    ['{0F2C569C-400F-4685-9598-EB5411944C35}']
    procedure setHeader(const key, value: string);
    function getHeader(const key: string): string;
  end;

  IBody = interface
    ['{37A3E5A5-0A06-454F-94DF-28C23ACE71E0}']
    procedure setContent(const content: string);
    function getContent: string;
  end;

  IResponse = interface
    ['{DA93A653-0345-4F0C-8B1D-A38FCB59713F}']
    function headers: IHeaders;
    function body: IBody;
    procedure statusCode(const code: Integer);
    function statusCodeValue: Integer;
  end;

  IRequestHandler = interface
    ['{4C308295-7BE0-4BF6-AC18-4BBADFE9E832}']
    function handleRequest(const request: IRequest; const response: IResponse): IResponse;
  end;

  TMockRequest = class(TInterfacedObject, IRequest)
  private
    fMethod: string;
    fPath: string;
    fBody: string;
  public
    constructor Create(const AMethod, APath, ABody: string);
    function method: string;
    function path: string;
    function bodyAsString: string;
  end;

  TMockHeaders = class(TInterfacedObject, IHeaders)
  private
    fValues: specialize TDictionary<string, string>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure setHeader(const key, value: string);
    function getHeader(const key: string): string;
  end;

  TMockBody = class(TInterfacedObject, IBody)
  private
    fContent: string;
  public
    procedure setContent(const content: string);
    function getContent: string;
  end;

  TMockResponse = class(TInterfacedObject, IResponse)
  private
    fHeaders: IHeaders;
    fBody: IBody;
    fStatus: Integer;
  public
    constructor Create;
    function headers: IHeaders;
    function body: IBody;
    procedure statusCode(const code: Integer);
    function statusCodeValue: Integer;
  end;

implementation

{ TMockRequest }

constructor TMockRequest.Create(const AMethod, APath, ABody: string);
begin
  fMethod := UpperCase(AMethod);
  fPath := APath;
  fBody := ABody;
end;

function TMockRequest.method: string;
begin
  Result := fMethod;
end;

function TMockRequest.path: string;
begin
  Result := fPath;
end;

function TMockRequest.bodyAsString: string;
begin
  Result := fBody;
end;

{ TMockHeaders }

constructor TMockHeaders.Create;
begin
  fValues := specialize TDictionary<string, string>.Create;
end;

destructor TMockHeaders.Destroy;
begin
  fValues.Free;
  inherited Destroy;
end;

procedure TMockHeaders.setHeader(const key, value: string);
begin
  fValues.AddOrSetValue(LowerCase(key), value);
end;

function TMockHeaders.getHeader(const key: string): string;
begin
  if not fValues.TryGetValue(LowerCase(key), Result) then
    Result := '';
end;

{ TMockBody }

procedure TMockBody.setContent(const content: string);
begin
  fContent := content;
end;

function TMockBody.getContent: string;
begin
  Result := fContent;
end;

{ TMockResponse }

constructor TMockResponse.Create;
begin
  fHeaders := TMockHeaders.Create;
  fBody := TMockBody.Create;
  fStatus := 200;
end;

function TMockResponse.headers: IHeaders;
begin
  Result := fHeaders;
end;

function TMockResponse.body: IBody;
begin
  Result := fBody;
end;

procedure TMockResponse.statusCode(const code: Integer);
begin
  fStatus := code;
end;

function TMockResponse.statusCodeValue: Integer;
begin
  Result := fStatus;
end;

end.