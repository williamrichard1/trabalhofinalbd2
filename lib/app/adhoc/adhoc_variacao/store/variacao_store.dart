import 'package:mobx/mobx.dart';

part 'variacao_store.g.dart';

class VariacaoStore = _VariacaoStore with _$VariacaoStore;

abstract class _VariacaoStore with Store {
  @observable
  bool visibilidadeListaMoedas = false;

  @observable
  bool visibilidadeListaMoedasConversao = false;

  @observable
  String tipoMoeda = '';

  @action
  void trocaVisibilidadeListaMoedas() =>
      visibilidadeListaMoedas = !visibilidadeListaMoedas;

  @action
  void trocaVisibilidadeListaMoedasConversao() =>
      visibilidadeListaMoedasConversao = !visibilidadeListaMoedasConversao;

  @action
  void setTipoMoeda(_value) => tipoMoeda = '';
}
