import 'package:mobx/mobx.dart';
part 'requisicao_insercao_store.g.dart';

class RequisicaoInsercaoStore = _RequisicaoInsercaoStore
    with _$RequisicaoInsercaoStore;

abstract class _RequisicaoInsercaoStore with Store {
  ObservableList<String> listaSearchString = ObservableList<String>();

  ObservableList listaSearchOrigin = ObservableList();

  ObservableList jsonApi = ObservableList();

  @observable
  bool carregandoPagina = true;

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void addListaSearchOrigin(value) => listaSearchOrigin.addAll(value);

  @action
  void addListaSearchString(value) => listaSearchString.add(value);

  @action
  void addJsonApi(value) {
    jsonApi.clear();
    jsonApi.addAll(value);
  }
}
