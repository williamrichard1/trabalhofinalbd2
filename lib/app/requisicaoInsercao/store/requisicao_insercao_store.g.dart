// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requisicao_insercao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequisicaoInsercaoStore on _RequisicaoInsercaoStore, Store {
  final _$carregandoPaginaAtom =
      Atom(name: '_RequisicaoInsercaoStore.carregandoPagina');

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

  final _$_RequisicaoInsercaoStoreActionController =
      ActionController(name: '_RequisicaoInsercaoStore');

  @override
  void setCarregandoPagina(dynamic _value) {
    final _$actionInfo = _$_RequisicaoInsercaoStoreActionController.startAction(
        name: '_RequisicaoInsercaoStore.setCarregandoPagina');
    try {
      return super.setCarregandoPagina(_value);
    } finally {
      _$_RequisicaoInsercaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListaSearchOrigin(dynamic value) {
    final _$actionInfo = _$_RequisicaoInsercaoStoreActionController.startAction(
        name: '_RequisicaoInsercaoStore.addListaSearchOrigin');
    try {
      return super.addListaSearchOrigin(value);
    } finally {
      _$_RequisicaoInsercaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListaSearchString(dynamic value) {
    final _$actionInfo = _$_RequisicaoInsercaoStoreActionController.startAction(
        name: '_RequisicaoInsercaoStore.addListaSearchString');
    try {
      return super.addListaSearchString(value);
    } finally {
      _$_RequisicaoInsercaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addJsonApi(dynamic value) {
    final _$actionInfo = _$_RequisicaoInsercaoStoreActionController.startAction(
        name: '_RequisicaoInsercaoStore.addJsonApi');
    try {
      return super.addJsonApi(value);
    } finally {
      _$_RequisicaoInsercaoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoPagina: ${carregandoPagina}
    ''';
  }
}
