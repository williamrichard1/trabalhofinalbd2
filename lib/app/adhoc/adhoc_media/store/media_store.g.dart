// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MediaStore on _MediaStore, Store {
  final _$visibilidadeListaMoedasAtom =
      Atom(name: '_MediaStore.visibilidadeListaMoedas');

  @override
  bool get visibilidadeListaMoedas {
    _$visibilidadeListaMoedasAtom.reportRead();
    return super.visibilidadeListaMoedas;
  }

  @override
  set visibilidadeListaMoedas(bool value) {
    _$visibilidadeListaMoedasAtom
        .reportWrite(value, super.visibilidadeListaMoedas, () {
      super.visibilidadeListaMoedas = value;
    });
  }

  final _$visibilidadeListaMoedasConversaoAtom =
      Atom(name: '_MediaStore.visibilidadeListaMoedasConversao');

  @override
  bool get visibilidadeListaMoedasConversao {
    _$visibilidadeListaMoedasConversaoAtom.reportRead();
    return super.visibilidadeListaMoedasConversao;
  }

  @override
  set visibilidadeListaMoedasConversao(bool value) {
    _$visibilidadeListaMoedasConversaoAtom
        .reportWrite(value, super.visibilidadeListaMoedasConversao, () {
      super.visibilidadeListaMoedasConversao = value;
    });
  }

  final _$tipoMoedaAtom = Atom(name: '_MediaStore.tipoMoeda');

  @override
  String get tipoMoeda {
    _$tipoMoedaAtom.reportRead();
    return super.tipoMoeda;
  }

  @override
  set tipoMoeda(String value) {
    _$tipoMoedaAtom.reportWrite(value, super.tipoMoeda, () {
      super.tipoMoeda = value;
    });
  }

  final _$_MediaStoreActionController = ActionController(name: '_MediaStore');

  @override
  void trocaVisibilidadeListaMoedas() {
    final _$actionInfo = _$_MediaStoreActionController.startAction(
        name: '_MediaStore.trocaVisibilidadeListaMoedas');
    try {
      return super.trocaVisibilidadeListaMoedas();
    } finally {
      _$_MediaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaVisibilidadeListaMoedasConversao() {
    final _$actionInfo = _$_MediaStoreActionController.startAction(
        name: '_MediaStore.trocaVisibilidadeListaMoedasConversao');
    try {
      return super.trocaVisibilidadeListaMoedasConversao();
    } finally {
      _$_MediaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoMoeda(dynamic _value) {
    final _$actionInfo = _$_MediaStoreActionController.startAction(
        name: '_MediaStore.setTipoMoeda');
    try {
      return super.setTipoMoeda(_value);
    } finally {
      _$_MediaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
visibilidadeListaMoedas: ${visibilidadeListaMoedas},
visibilidadeListaMoedasConversao: ${visibilidadeListaMoedasConversao},
tipoMoeda: ${tipoMoeda}
    ''';
  }
}
