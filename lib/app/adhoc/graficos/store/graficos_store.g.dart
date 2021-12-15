// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graficos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GraficosStore on _GraficosStore, Store {
  final _$listaDadosGraficoAtom =
      Atom(name: '_GraficosStore.listaDadosGrafico');

  @override
  List<DadosGrafico> get listaDadosGrafico {
    _$listaDadosGraficoAtom.reportRead();
    return super.listaDadosGrafico;
  }

  @override
  set listaDadosGrafico(List<DadosGrafico> value) {
    _$listaDadosGraficoAtom.reportWrite(value, super.listaDadosGrafico, () {
      super.listaDadosGrafico = value;
    });
  }

  final _$listaDadosGraficoMediaAtom =
      Atom(name: '_GraficosStore.listaDadosGraficoMedia');

  @override
  List<DadosGraficoMedia> get listaDadosGraficoMedia {
    _$listaDadosGraficoMediaAtom.reportRead();
    return super.listaDadosGraficoMedia;
  }

  @override
  set listaDadosGraficoMedia(List<DadosGraficoMedia> value) {
    _$listaDadosGraficoMediaAtom
        .reportWrite(value, super.listaDadosGraficoMedia, () {
      super.listaDadosGraficoMedia = value;
    });
  }

  final _$listaDadosGraficoValorMaxAtom =
      Atom(name: '_GraficosStore.listaDadosGraficoValorMax');

  @override
  List<DadosGraficoValorMax> get listaDadosGraficoValorMax {
    _$listaDadosGraficoValorMaxAtom.reportRead();
    return super.listaDadosGraficoValorMax;
  }

  @override
  set listaDadosGraficoValorMax(List<DadosGraficoValorMax> value) {
    _$listaDadosGraficoValorMaxAtom
        .reportWrite(value, super.listaDadosGraficoValorMax, () {
      super.listaDadosGraficoValorMax = value;
    });
  }

  final _$listaSeriesAtom = Atom(name: '_GraficosStore.listaSeries');

  @override
  List<charts.Series<DadosGrafico, DateTime>> get listaSeries {
    _$listaSeriesAtom.reportRead();
    return super.listaSeries;
  }

  @override
  set listaSeries(List<charts.Series<DadosGrafico, DateTime>> value) {
    _$listaSeriesAtom.reportWrite(value, super.listaSeries, () {
      super.listaSeries = value;
    });
  }

  final _$listaSeriesMediaAtom = Atom(name: '_GraficosStore.listaSeriesMedia');

  @override
  List<charts.Series<DadosGraficoMedia, String>> get listaSeriesMedia {
    _$listaSeriesMediaAtom.reportRead();
    return super.listaSeriesMedia;
  }

  @override
  set listaSeriesMedia(List<charts.Series<DadosGraficoMedia, String>> value) {
    _$listaSeriesMediaAtom.reportWrite(value, super.listaSeriesMedia, () {
      super.listaSeriesMedia = value;
    });
  }

  final _$listaSeriesValorMaxAtom =
      Atom(name: '_GraficosStore.listaSeriesValorMax');

  @override
  List<charts.Series<DadosGraficoValorMax, String>> get listaSeriesValorMax {
    _$listaSeriesValorMaxAtom.reportRead();
    return super.listaSeriesValorMax;
  }

  @override
  set listaSeriesValorMax(
      List<charts.Series<DadosGraficoValorMax, String>> value) {
    _$listaSeriesValorMaxAtom.reportWrite(value, super.listaSeriesValorMax, () {
      super.listaSeriesValorMax = value;
    });
  }

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

  final _$dataInicioGraficoAtom =
      Atom(name: '_GraficosStore.dataInicioGrafico');

  @override
  String get dataInicioGrafico {
    _$dataInicioGraficoAtom.reportRead();
    return super.dataInicioGrafico;
  }

  @override
  set dataInicioGrafico(String value) {
    _$dataInicioGraficoAtom.reportWrite(value, super.dataInicioGrafico, () {
      super.dataInicioGrafico = value;
    });
  }

  final _$dataFimGraficoAtom = Atom(name: '_GraficosStore.dataFimGrafico');

  @override
  String get dataFimGrafico {
    _$dataFimGraficoAtom.reportRead();
    return super.dataFimGrafico;
  }

  @override
  set dataFimGrafico(String value) {
    _$dataFimGraficoAtom.reportWrite(value, super.dataFimGrafico, () {
      super.dataFimGrafico = value;
    });
  }

  final _$nomeMoedaBaseSelecAtom =
      Atom(name: '_GraficosStore.nomeMoedaBaseSelec');

  @override
  String get nomeMoedaBaseSelec {
    _$nomeMoedaBaseSelecAtom.reportRead();
    return super.nomeMoedaBaseSelec;
  }

  @override
  set nomeMoedaBaseSelec(String value) {
    _$nomeMoedaBaseSelecAtom.reportWrite(value, super.nomeMoedaBaseSelec, () {
      super.nomeMoedaBaseSelec = value;
    });
  }

  final _$moedaBaseSelecAtom = Atom(name: '_GraficosStore.moedaBaseSelec');

  @override
  String get moedaBaseSelec {
    _$moedaBaseSelecAtom.reportRead();
    return super.moedaBaseSelec;
  }

  @override
  set moedaBaseSelec(String value) {
    _$moedaBaseSelecAtom.reportWrite(value, super.moedaBaseSelec, () {
      super.moedaBaseSelec = value;
    });
  }

  final _$moedaConversaoSelecAtom =
      Atom(name: '_GraficosStore.moedaConversaoSelec');

  @override
  String get moedaConversaoSelec {
    _$moedaConversaoSelecAtom.reportRead();
    return super.moedaConversaoSelec;
  }

  @override
  set moedaConversaoSelec(String value) {
    _$moedaConversaoSelecAtom.reportWrite(value, super.moedaConversaoSelec, () {
      super.moedaConversaoSelec = value;
    });
  }

  final _$nomeMoedaConversaoSelecAtom =
      Atom(name: '_GraficosStore.nomeMoedaConversaoSelec');

  @override
  String get nomeMoedaConversaoSelec {
    _$nomeMoedaConversaoSelecAtom.reportRead();
    return super.nomeMoedaConversaoSelec;
  }

  @override
  set nomeMoedaConversaoSelec(String value) {
    _$nomeMoedaConversaoSelecAtom
        .reportWrite(value, super.nomeMoedaConversaoSelec, () {
      super.nomeMoedaConversaoSelec = value;
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

  final _$visibilidadeListaMoedasAtom =
      Atom(name: '_GraficosStore.visibilidadeListaMoedas');

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

  final _$visibilidadeListaMoedas2Atom =
      Atom(name: '_GraficosStore.visibilidadeListaMoedas2');

  @override
  bool get visibilidadeListaMoedas2 {
    _$visibilidadeListaMoedas2Atom.reportRead();
    return super.visibilidadeListaMoedas2;
  }

  @override
  set visibilidadeListaMoedas2(bool value) {
    _$visibilidadeListaMoedas2Atom
        .reportWrite(value, super.visibilidadeListaMoedas2, () {
      super.visibilidadeListaMoedas2 = value;
    });
  }

  final _$jsonTabelaAtom = Atom(name: '_GraficosStore.jsonTabela');

  @override
  dynamic get jsonTabela {
    _$jsonTabelaAtom.reportRead();
    return super.jsonTabela;
  }

  @override
  set jsonTabela(dynamic value) {
    _$jsonTabelaAtom.reportWrite(value, super.jsonTabela, () {
      super.jsonTabela = value;
    });
  }

  final _$jsonTabelaMediaAtom = Atom(name: '_GraficosStore.jsonTabelaMedia');

  @override
  dynamic get jsonTabelaMedia {
    _$jsonTabelaMediaAtom.reportRead();
    return super.jsonTabelaMedia;
  }

  @override
  set jsonTabelaMedia(dynamic value) {
    _$jsonTabelaMediaAtom.reportWrite(value, super.jsonTabelaMedia, () {
      super.jsonTabelaMedia = value;
    });
  }

  final _$jsonTabelaValorMaxAtom =
      Atom(name: '_GraficosStore.jsonTabelaValorMax');

  @override
  dynamic get jsonTabelaValorMax {
    _$jsonTabelaValorMaxAtom.reportRead();
    return super.jsonTabelaValorMax;
  }

  @override
  set jsonTabelaValorMax(dynamic value) {
    _$jsonTabelaValorMaxAtom.reportWrite(value, super.jsonTabelaValorMax, () {
      super.jsonTabelaValorMax = value;
    });
  }

  final _$dataInicioTabelaAtom = Atom(name: '_GraficosStore.dataInicioTabela');

  @override
  String get dataInicioTabela {
    _$dataInicioTabelaAtom.reportRead();
    return super.dataInicioTabela;
  }

  @override
  set dataInicioTabela(String value) {
    _$dataInicioTabelaAtom.reportWrite(value, super.dataInicioTabela, () {
      super.dataInicioTabela = value;
    });
  }

  final _$dataFimTabelaAtom = Atom(name: '_GraficosStore.dataFimTabela');

  @override
  String get dataFimTabela {
    _$dataFimTabelaAtom.reportRead();
    return super.dataFimTabela;
  }

  @override
  set dataFimTabela(String value) {
    _$dataFimTabelaAtom.reportWrite(value, super.dataFimTabela, () {
      super.dataFimTabela = value;
    });
  }

  final _$jsonEnvioMoedasAtom = Atom(name: '_GraficosStore.jsonEnvioMoedas');

  @override
  String get jsonEnvioMoedas {
    _$jsonEnvioMoedasAtom.reportRead();
    return super.jsonEnvioMoedas;
  }

  @override
  set jsonEnvioMoedas(String value) {
    _$jsonEnvioMoedasAtom.reportWrite(value, super.jsonEnvioMoedas, () {
      super.jsonEnvioMoedas = value;
    });
  }

  final _$setDadosGraficoAsyncAction =
      AsyncAction('_GraficosStore.setDadosGrafico');

  @override
  Future<dynamic> setDadosGrafico(dynamic jsonRecebido) {
    return _$setDadosGraficoAsyncAction
        .run(() => super.setDadosGrafico(jsonRecebido));
  }

  final _$setDadosGraficoMediaAsyncAction =
      AsyncAction('_GraficosStore.setDadosGraficoMedia');

  @override
  Future<dynamic> setDadosGraficoMedia(dynamic jsonRecebido) {
    return _$setDadosGraficoMediaAsyncAction
        .run(() => super.setDadosGraficoMedia(jsonRecebido));
  }

  final _$setDadosGraficoValorMaxAsyncAction =
      AsyncAction('_GraficosStore.setDadosGraficoValorMax');

  @override
  Future<dynamic> setDadosGraficoValorMax(dynamic jsonRecebido) {
    return _$setDadosGraficoValorMaxAsyncAction
        .run(() => super.setDadosGraficoValorMax(jsonRecebido));
  }

  final _$setJsonMoedasBaseAsyncAction =
      AsyncAction('_GraficosStore.setJsonMoedasBase');

  @override
  Future<dynamic> setJsonMoedasBase() {
    return _$setJsonMoedasBaseAsyncAction.run(() => super.setJsonMoedasBase());
  }

  final _$montaJsonEnvioPesquisaAsyncAction =
      AsyncAction('_GraficosStore.montaJsonEnvioPesquisa');

  @override
  Future<dynamic> montaJsonEnvioPesquisa() {
    return _$montaJsonEnvioPesquisaAsyncAction
        .run(() => super.montaJsonEnvioPesquisa());
  }

  final _$_GraficosStoreActionController =
      ActionController(name: '_GraficosStore');

  @override
  void setDatasTabela(dynamic _value1, dynamic _value2) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setDatasTabela');
    try {
      return super.setDatasTabela(_value1, _value2);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void addListaAuxiliarMoedas(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.addListaAuxiliarMoedas');
    try {
      return super.addListaAuxiliarMoedas(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addJsonFinal(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.addJsonFinal');
    try {
      return super.addJsonFinal(_value);
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
  void setListaMoedaGraficos(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setListaMoedaGraficos');
    try {
      return super.setListaMoedaGraficos(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataInicioGrafico(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setDataInicioGrafico');
    try {
      return super.setDataInicioGrafico(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDataFimGrafico(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setDataFimGrafico');
    try {
      return super.setDataFimGrafico(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoedaBaseSelec(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setMoedaBaseSelec');
    try {
      return super.setMoedaBaseSelec(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeMoedaBaseSelec(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setNomeMoedaBaseSelec');
    try {
      return super.setNomeMoedaBaseSelec(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMoedaConversaoSelec(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setMoedaConversaoSelec');
    try {
      return super.setMoedaConversaoSelec(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNomeMoedaConversaoSelec(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setNomeMoedaConversaoSelec');
    try {
      return super.setNomeMoedaConversaoSelec(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListaValue(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.addListaValue');
    try {
      return super.addListaValue(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addListaValue2(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.addListaValue2');
    try {
      return super.addListaValue2(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaValue(dynamic index, dynamic value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.trocaValue');
    try {
      return super.trocaValue(index, value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaValue2(dynamic index, dynamic value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.trocaValue2');
    try {
      return super.trocaValue2(index, value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaVisibilidade1() {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.trocaVisibilidade1');
    try {
      return super.trocaVisibilidade1();
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void trocaVisibilidade2() {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.trocaVisibilidade2');
    try {
      return super.trocaVisibilidade2();
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJsonTabela(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setJsonTabela');
    try {
      return super.setJsonTabela(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJsonTabelaMedia(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setJsonTabelaMedia');
    try {
      return super.setJsonTabelaMedia(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setJsonTabelaValorMax(dynamic _value) {
    final _$actionInfo = _$_GraficosStoreActionController.startAction(
        name: '_GraficosStore.setJsonTabelaValorMax');
    try {
      return super.setJsonTabelaValorMax(_value);
    } finally {
      _$_GraficosStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaDadosGrafico: ${listaDadosGrafico},
listaDadosGraficoMedia: ${listaDadosGraficoMedia},
listaDadosGraficoValorMax: ${listaDadosGraficoValorMax},
listaSeries: ${listaSeries},
listaSeriesMedia: ${listaSeriesMedia},
listaSeriesValorMax: ${listaSeriesValorMax},
carregandoPagina: ${carregandoPagina},
dataInicioGrafico: ${dataInicioGrafico},
dataFimGrafico: ${dataFimGrafico},
nomeMoedaBaseSelec: ${nomeMoedaBaseSelec},
moedaBaseSelec: ${moedaBaseSelec},
moedaConversaoSelec: ${moedaConversaoSelec},
nomeMoedaConversaoSelec: ${nomeMoedaConversaoSelec},
jsonGraficos: ${jsonGraficos},
dadosGrafico: ${dadosGrafico},
tipoGrafico: ${tipoGrafico},
visibilidadeListaMoedas: ${visibilidadeListaMoedas},
visibilidadeListaMoedas2: ${visibilidadeListaMoedas2},
jsonTabela: ${jsonTabela},
jsonTabelaMedia: ${jsonTabelaMedia},
jsonTabelaValorMax: ${jsonTabelaValorMax},
dataInicioTabela: ${dataInicioTabela},
dataFimTabela: ${dataFimTabela},
jsonEnvioMoedas: ${jsonEnvioMoedas}
    ''';
  }
}
