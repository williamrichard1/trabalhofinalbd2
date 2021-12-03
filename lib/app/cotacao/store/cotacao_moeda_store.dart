import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'cotacao_moeda_store.g.dart';

class CotacaoMoedaStore = _CotacaoMoedaStore with _$CotacaoMoedaStore;

abstract class _CotacaoMoedaStore with Store {
  @observable
  bool carregandoPagina = false;

  @observable
  dynamic jsonCotacao;

  @observable
  String siglaMoedaSelec = '';

  @observable 
  String nomeMoedaSelec = '';

  @observable
  DateTimeRange? intervaloData;

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonCotacao(_value) => jsonCotacao = _value;

  @action
  void setMoedaSelec(_value) => siglaMoedaSelec = _value;

   @action
  void setNomeMoedaSelec(_value) => nomeMoedaSelec = _value;

  @action
  void setIntervaloData(_value) => intervaloData = _value;
}
