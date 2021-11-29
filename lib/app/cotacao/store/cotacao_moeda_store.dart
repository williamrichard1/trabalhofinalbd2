import 'package:mobx/mobx.dart';

part 'cotacao_moeda_store.g.dart';

class CotacaoMoedaStore = _CotacaoMoedaStore with _$CotacaoMoedaStore;

abstract class _CotacaoMoedaStore with Store {
  @observable
  bool carregandoPagina = true;

  @observable
  dynamic jsonCotacao;

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonCotacao(_value) => jsonCotacao = _value;
}
