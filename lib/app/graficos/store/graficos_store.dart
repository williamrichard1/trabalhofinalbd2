import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'graficos_store.g.dart';

class GraficosStore = _GraficosStore with _$GraficosStore;

abstract class _GraficosStore with Store {
  ObservableList listaTiposDeDados = ObservableList();

  ObservableList listaJsonMap = ObservableList();

  @observable
  bool carregandoPagina = true;

  @observable
  dynamic jsonGraficos;

  @observable
  dynamic dadosGrafico;

  @observable
  var map = {};

  @observable
  dynamic jsonMapAux;

  @observable
  String jsonMapFinal = '';

  @observable
  int tipoGrafico = 1;

  List listaTeste = [
    "2021-10-01-105",
    "2021-10-02-90",
    "2021-10-03-75",
    "2021-10-04-110",
    "2021-10-05-125",
    "2021-10-06-130",
    "2021-10-07-65",
    "2021-10-08-50",
    "2021-10-10-35",
    "2021-10-11-150",
    "2021-10-12-143",
    "2021-10-13-92",
  ];

  List<DadosGrafico> listaDadosGrafico = [];

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonGraficos(_value) => jsonGraficos = _value;

  @observable
  List<charts.Series<DadosGrafico, DateTime>> listaSeries = [];

  @action
  void setDadosGrafico() {
    listaDadosGrafico.clear();
    for (int i = 0; i < listaTeste.length; i++) {
      var splitDados = listaTeste[i].split('-');
      listaDadosGrafico.add(
        DadosGrafico(
          DateTime(
            int.parse(splitDados[0]),
            int.parse(splitDados[1]),
            int.parse(splitDados[2]),
          ),
          int.parse(splitDados[3]),
        ),
      );
    }

    listaSeries = [];
    listaSeries.add(
      charts.Series<DadosGrafico, DateTime>(
        id: 'Valores',
        data: listaDadosGrafico,
        domainFn: (DadosGrafico row, _) => row.timeStamp,
        measureFn: (DadosGrafico row, _) => row.valor,
        seriesColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(162, 21, 2, 1)),
      ),
    );
  }

  @action
  void addListaTiposDados(_value) => listaTiposDeDados.add(_value);

  @action
  void setMap() {
    listaJsonMap.clear();
    for (var x in listaTiposDeDados) {
      map[x] = !map.containsKey(x) ? (1) : (map[x] + 1);
    }

    jsonMapAux = json.encode(map);
    jsonMapFinal = '[$jsonMapAux]';

    listaJsonMap.addAll(json.decode(jsonMapFinal));

    // ignore: avoid_print
    print("JSONMAP>>> ${listaJsonMap[0]['Sem modalidade definida']}");
  }

  @action
  void setTipoGrafico(_value) => tipoGrafico = _value;
}
