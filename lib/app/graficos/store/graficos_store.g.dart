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

  final _$dadosGraficoAtom = Atom(name: '_GraficosStore.dadosGrafico');

  @override
  dynamic get dadosGrafico {
    _$dadosGraficoAtom.reportRead();
    return super.dadosGrafico;
  }

  @override
  set dadosGrafico(dynamic value) {
    _$dadosGraficoAtom.reportWrite(value, super.dadosGrafico, () {
      super.dadosGrafico = value;
    });
  }

  final _$mapAtom = Atom(name: '_GraficosStore.map');

  @override
  Map<dynamic, dynamic> get map {
    _$mapAtom.reportRead();
    return super.map;
  }

  @override
  set map(Map<dynamic, dynamic> value) {
    _$mapAtom.reportWrite(value, super.map, () {
      super.map = value;
    });
  }

  final _$jsonMapAuxAtom = Atom(name: '_GraficosStore.jsonMapAux');

  @override
  dynamic get jsonMapAux {
    _$jsonMapAuxAtom.reportRead();
    return super.jsonMapAux;
  }

  @override
  set jsonMapAux(dynamic value) {
    _$jsonMapAuxAtom.reportWrite(value, super.jsonMapAux, () {
      super.jsonMapAux = value;
    });
  }

  final _$jsonMapFinalAtom = Atom(name: '_GraficosStore.jsonMapFinal');

  @override
  String get jsonMapFinal {
    _$jsonMapFinalAtom.reportRead();
    return super.jsonMapFinal;
  }

  @override
  set jsonMapFinal(String value) {
    _$jsonMapFinalAtom.reportWrite(value, super.jsonMapFinal, () {
      super.jsonMapFinal = value;
    });
  }

  final _$tipoGraficoAtom = Atom(name: '_GraficosStore.tipoGrafico');

  @override
  int get tipoGrafico {
    _$tipoGraficoAtom.reportRead();
    return super.tipoGrafico;
  }

  @override
  set tipoGrafico(int value) {
    _$tipoGraficoAtom.reportWrite(value, super.tipoGrafico, () {
      super.tipoGrafico = value;
    });
  }

  final _$listaSeriesAtom = Atom(name: '_GraficosStore.listaSeries');

  @override
  List<charts.Series<DadosGrafico, String>> get listaSeries {
    _$listaSeriesAtom.reportRead();
    return super.listaSeries;
  }

  @override
  set listaSeries(List<charts.Series<DadosGrafico, String>> value) {
    _$listaSeriesAtom.reportWrite(value, super.listaSeries, () {
      super.listaSeries = value;
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
  void setPieData() {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setPieData');
    try {
      return super.setPieData();
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListaTiposDados(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.addListaTiposDados');
    try {
      return super.addListaTiposDados(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMap() {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setMap');
    try {
      return super.setMap();
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTipoGrafico(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setTipoGrafico');
    try {
      return super.setTipoGrafico(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carregandoPagina: ${carregandoPagina},
jsonGraficos: ${jsonGraficos},
dadosGrafico: ${dadosGrafico},
map: ${map},
jsonMapAux: ${jsonMapAux},
jsonMapFinal: ${jsonMapFinal},
tipoGrafico: ${tipoGrafico},
listaSeries: ${listaSeries}
    ''';
  }
}
