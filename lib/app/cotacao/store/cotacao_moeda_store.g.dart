// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_moeda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CotacaoMoedaStore on _CotacaoMoedaStore, Store {
  final _$carregandoPaginaAtom =
      Atom(name: '_CotacaoMoedaStore.carregandoPagina');

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

  final _$jsonCotacaoAtom = Atom(name: '_CotacaoMoedaStore.jsonCotacao');

  @override
  dynamic get jsonCotacao {
    _$jsonCotacaoAtom.reportRead();
    return super.jsonCotacao;
  }

  @override
  set jsonCotacao(dynamic value) {
    _$jsonCotacaoAtom.reportWrite(value, super.jsonCotacao, () {
      super.jsonCotacao = value;
    });
  }

  final _$siglaMoedaSelecAtom =
      Atom(name: '_CotacaoMoedaStore.siglaMoedaSelec');

  @override
  String get siglaMoedaSelec {
    _$siglaMoedaSelecAtom.reportRead();
    return super.siglaMoedaSelec;
  }

  @override
  set siglaMoedaSelec(String value) {
    _$siglaMoedaSelecAtom.reportWrite(value, super.siglaMoedaSelec, () {
      super.siglaMoedaSelec = value;
    });
  }

  final _$nomeMoedaSelecAtom = Atom(name: '_CotacaoMoedaStore.nomeMoedaSelec');

  @override
  String get nomeMoedaSelec {
    _$nomeMoedaSelecAtom.reportRead();
    return super.nomeMoedaSelec;
  }

  @override
  set nomeMoedaSelec(String value) {
    _$nomeMoedaSelecAtom.reportWrite(value, super.nomeMoedaSelec, () {
      super.nomeMoedaSelec = value;
    });
  }

  final _$intervaloDataAtom = Atom(name: '_CotacaoMoedaStore.intervaloData');

  @override
  DateTimeRange? get intervaloData {
    _$intervaloDataAtom.reportRead();
    return super.intervaloData;
  }

  @override
  set intervaloData(DateTimeRange? value) {
    _$intervaloDataAtom.reportWrite(value, super.intervaloData, () {
      super.intervaloData = value;
    });
  }

  final _$_CotacaoMoedaStoreActionController =
      ActionController(name: '_CotacaoMoedaStore');

  @override
  void setCarregandoPagina(dynamic _value) {
    final _$actionInfo = _$_CotacaoMoedaStoreActionController.startAction(
        name: '_CotacaoMoedaStore.setCarregandoPagina');
    try {
      return super.setCarregandoPagina(_value);
    } finally {
      _$_CotacaoMoedaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJsonCotacao(dynamic _value) {
    final _$actionInfo = _$_CotacaoMoedaStoreActionController.startAction(
        name: '_CotacaoMoedaStore.setJsonCotacao');
    try {
      return super.setJsonCotacao(_value);
    } finally {
      _$_CotacaoMoedaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoedaSelec(dynamic _value) {
    final _$actionInfo = _$_CotacaoMoedaStoreActionController.startAction(
        name: '_CotacaoMoedaStore.setMoedaSelec');
    try {
      return super.setMoedaSelec(_value);
    } finally {
      _$_CotacaoMoedaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeMoedaSelec(dynamic _value) {
    final _$actionInfo = _$_CotacaoMoedaStoreActionController.startAction(
        name: '_CotacaoMoedaStore.setNomeMoedaSelec');
    try {
      return super.setNomeMoedaSelec(_value);
    } finally {
      _$_CotacaoMoedaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIntervaloData(dynamic _value) {
    final _$actionInfo = _$_CotacaoMoedaStoreActionController.startAction(
        name: '_CotacaoMoedaStore.setIntervaloData');
    try {
      return super.setIntervaloData(_value);
    } finally {
      _$_CotacaoMoedaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoPagina: ${carregandoPagina},
jsonCotacao: ${jsonCotacao},
siglaMoedaSelec: ${siglaMoedaSelec},
nomeMoedaSelec: ${nomeMoedaSelec},
intervaloData: ${intervaloData}
    ''';
  }
}
