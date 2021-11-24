// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'globals_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalsStore on _GlobalsStore, Store {
  final _$tituloAppBarAtom = Atom(name: '_GlobalsStore.tituloAppBar');

  @override
  String get tituloAppBar {
    _$tituloAppBarAtom.reportRead();
    return super.tituloAppBar;
  }

  @override
  set tituloAppBar(String value) {
    _$tituloAppBarAtom.reportWrite(value, super.tituloAppBar, () {
      super.tituloAppBar = value;
    });
  }

  final _$_GlobalsStoreActionController =
      ActionController(name: '_GlobalsStore');

  @override
  void setTituloAppBar(dynamic _value) {
    final _$actionInfo = _$_GlobalsStoreActionController.startAction(
        name: '_GlobalsStore.setTituloAppBar');
    try {
      return super.setTituloAppBar(_value);
    } finally {
      _$_GlobalsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tituloAppBar: ${tituloAppBar}
    ''';
  }
}
