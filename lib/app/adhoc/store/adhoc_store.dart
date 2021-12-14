import 'package:mobx/mobx.dart';

part 'adhoc_store.g.dart';

class AdhocStore = _AdhocStore with _$AdhocStore;

abstract class _AdhocStore with Store {
  @observable
  int tipoAdhoc = 1;

  @observable
  bool gerouAdhoc = false;

  @action
  void setTipoAdhoc(_value) => tipoAdhoc = _value;

  @action
  void setGerouAdchoc(_value) => gerouAdhoc = _value;
}
