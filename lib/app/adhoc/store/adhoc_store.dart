import 'package:mobx/mobx.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/tiposgraficos.dart';

part 'adhoc_store.g.dart';

class AdhocStore = _AdhocStore with _$AdhocStore;

abstract class _AdhocStore with Store {
  @observable
  List<DadosGraficoValorMaxAux> listaMoedasValores = [];

  @observable 
  List<TabelaValorMaxAux> listaDadosTabelaAux = [];

  @observable
  int tipoAdhoc = 1;

  @observable
  bool gerouAdhoc = false;

  @action
  void setTipoAdhoc(_value) => tipoAdhoc = _value;

  @action
  void setGerouAdchoc(_value) => gerouAdhoc = _value;

  @action 
  void addListaMoedaValores(_value) => listaMoedasValores.add(_value);

  @action 
  void addDadosTabelaAux(_value) => listaDadosTabelaAux.add(_value);
}
