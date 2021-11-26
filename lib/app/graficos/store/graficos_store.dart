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

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonGraficos(_value) => jsonGraficos = _value;

  @observable
  List<charts.Series<DadosGrafico, String>> listaSeries =
      <charts.Series<DadosGrafico, String>>[];

  @action
  void setPieData() {
    dadosGrafico = [
      DadosGrafico(
          'Sem modalidade definida',
          double.parse('${listaJsonMap[0]['Sem modalidade definida']}'),
          Colors.red),
      DadosGrafico(
          'Pregão presencial',
          double.parse('${listaJsonMap[0]['Pregão presencial']}'),
          Colors.yellow),
      DadosGrafico(
          'Chamamento público',
          double.parse('${listaJsonMap[0]['Chamamento público']}'),
          Colors.blue),
      DadosGrafico('Concorrência',
          double.parse('${listaJsonMap[0]['Concorrência']}'), Colors.purple),
      DadosGrafico('Inexigibilidade',
          double.parse('${listaJsonMap[0]['Inexigibilidade']}'), Colors.orange),
      DadosGrafico('Convite', double.parse('${listaJsonMap[0]['Convite']}'),
          Colors.green),
      DadosGrafico('Pregão eletrônico',
          double.parse('${listaJsonMap[0]['Pregão eletrônico']}'), Colors.pink),
    ];
    listaSeries = [];
    listaSeries.add(
      charts.Series(
        data: dadosGrafico,
        domainFn: (DadosGrafico dadosGrafico, _) => dadosGrafico.legendaGrafico,
        measureFn: (DadosGrafico dadosGrafico, _) => dadosGrafico.valorGrafico,
        colorFn: (DadosGrafico dadosGrafico, _) =>
            charts.ColorUtil.fromDartColor(dadosGrafico.corMostrada),
        id: 'Valores',
        labelAccessorFn: (DadosGrafico row, _) => '${row.valorGrafico}',
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
