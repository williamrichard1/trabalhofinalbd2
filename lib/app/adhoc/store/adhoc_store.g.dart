// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'adhoc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AdhocStore on _AdhocStore, Store {
  final _$tipoAdhocAtom = Atom(name: '_AdhocStore.tipoAdhoc');

  @override
  int get tipoAdhoc {
    _$tipoAdhocAtom.reportRead();
    return super.tipoAdhoc;
  }

  @override
  set tipoAdhoc(int value) {
    _$tipoAdhocAtom.reportWrite(value, super.tipoAdhoc, () {
      super.tipoAdhoc = value;
    });
  }

  final _$gerouAdhocAtom = Atom(name: '_AdhocStore.gerouAdhoc');

  @override
  bool get gerouAdhoc {
    _$gerouAdhocAtom.reportRead();
    return super.gerouAdhoc;
  }

  @override
  set gerouAdhoc(bool value) {
    _$gerouAdhocAtom.reportWrite(value, super.gerouAdhoc, () {
      super.gerouAdhoc = value;
    });
  }

  final _$_AdhocStoreActionController = ActionController(name: '_AdhocStore');

  @override
  void setTipoAdhoc(dynamic _value) {
    final _$actionInfo = _$_AdhocStoreActionController.startAction(
        name: '_AdhocStore.setTipoAdhoc');
    try {
      return super.setTipoAdhoc(_value);
    } finally {
      _$_AdhocStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGerouAdchoc(dynamic _value) {
    final _$actionInfo = _$_AdhocStoreActionController.startAction(
        name: '_AdhocStore.setGerouAdchoc');
    try {
      return super.setGerouAdchoc(_value);
    } finally {
      _$_AdhocStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoAdhoc: ${tipoAdhoc},
gerouAdhoc: ${gerouAdhoc}
    ''';
  }
}
