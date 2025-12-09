program ApiControllersTest;

{$mode objfpc}{$H+}

uses
  SysUtils,
  FanoStub,
  SobreviventesController, InventarioController,
  InformarZumbificacaoController, RelatorioGeralController, SwaggerController;

procedure AssertTrue(const condition: Boolean; const msg: string);
begin
  if not condition then
  begin
    WriteLn('FAIL: ' + msg);
    Halt(1);
  end;
end;

procedure TestListSobreviventes;
var
  ctrl: TSobreviventesController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TSobreviventesController.Create;
  req := TMockRequest.Create('GET', '/sobreviventes', '');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 200, 'List survivors status');
  AssertTrue(Pos('Alice', res.body.getContent) > 0, 'List survivors body');
end;

procedure TestCreateSobrevivente;
var
  ctrl: TSobreviventesController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TSobreviventesController.Create;
  req := TMockRequest.Create('POST', '/sobreviventes', '{"nome":"Novo"}');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 201, 'Create survivor status');
end;

procedure TestInventarioLista;
var
  ctrl: TInventarioController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TInventarioController.Create;
  req := TMockRequest.Create('GET', '/inventario', '');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 200, 'Inventario list status');
end;

procedure TestTrocaItens;
var
  ctrl: TInventarioController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TInventarioController.Create;
  req := TMockRequest.Create('POST', '/inventario/troca', '{"sobrevivente_origem":1}');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 200, 'Troca status');
end;

procedure TestInformarZumbificacao;
var
  ctrl: TInformarZumbificacaoController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TInformarZumbificacaoController.Create;
  req := TMockRequest.Create('POST', '/informar-zumbificacao', '{"id_sobrevivente":1}');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 200, 'Zumbificacao status');
end;

procedure TestRelatorio;
var
  ctrl: TRelatorioGeralController;
  req: IRequest;
  res: IResponse;
begin
  ctrl := TRelatorioGeralController.Create;
  req := TMockRequest.Create('GET', '/relatorio-geral', '');
  res := TMockResponse.Create;
  res := ctrl.handleRequest(req, res);
  AssertTrue(res.statusCodeValue = 200, 'Relatorio status');
end;

begin
  TestListSobreviventes;
  TestCreateSobrevivente;
  TestInventarioLista;
  TestTrocaItens;
  TestInformarZumbificacao;
  TestRelatorio;
  WriteLn('OK');
end.