import 'package:mobx/mobx.dart';

part 'media_store.g.dart';

class MediaStore = _MediaStore with _$MediaStore;

abstract class _MediaStore with Store {
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
