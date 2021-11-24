import 'package:mobx/mobx.dart';
part 'requisicao_insercao_store.g.dart';

class RequisicaoInsercaoStore = _RequisicaoInsercaoStore
    with _$RequisicaoInsercaoStore;

abstract class _RequisicaoInsercaoStore with Store {
  @observable
  dynamic jsonApi;

  @observable
  bool carregandoPagina = true;

  @action
  void setJsonApi(_value) => jsonApi = _value;

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;
}
