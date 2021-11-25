// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graficos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GraficosStore on _GraficosStore, Store {
  final _$carregandoPaginaAtom = Atom(name: '_GraficosStore.carregandoPagina');

  @override
  bool get carregandoPagina {
    _$carregandoPaginaAtom.reportRead();
    return super.carregandoPagina;
  }

  @override
  set carregandoPagina(bool value) {
    _$carregandoPaginaAtom.reportWrite(value, super.carregandoPagina, () {
      super.carregandoPagina = value;
    });
  }

  final _$jsonGraficosAtom = Atom(name: '_GraficosStore.jsonGraficos');

  @override
  dynamic get jsonGraficos {
    _$jsonGraficosAtom.reportRead();
    return super.jsonGraficos;
  }

  @override
  set jsonGraficos(dynamic value) {
    _$jsonGraficosAtom.reportWrite(value, super.jsonGraficos, () {
      super.jsonGraficos = value;
    });
  }

  final _$_GraficosStoreActionController =
      ActionController(name: '_GraficosStore');

  @override
  void setCarregandoPagina(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setCarregandoPagina');
    try {
      return super.setCarregandoPagina(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJsonGraficos(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setJsonGraficos');
    try {
      return super.setJsonGraficos(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoPagina: ${carregandoPagina},
jsonGraficos: ${jsonGraficos}
    ''';
  }
}
