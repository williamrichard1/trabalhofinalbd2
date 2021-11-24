import 'package:mobx/mobx.dart';
part 'globals_store.g.dart';

class GlobalsStore = _GlobalsStore with _$GlobalsStore;
abstract class _GlobalsStore with Store{
  @observable 
  String tituloAppBar = '';

  @action 
  void setTituloAppBar(_value) => tituloAppBar = _value;
}