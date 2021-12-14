import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'valormax_store.g.dart';

class ValorMaxStore = _ValorMaxStore with _$ValorMaxStore;

abstract class _ValorMaxStore with Store {
  TextEditingController controllerValorMaximo = TextEditingController();
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
