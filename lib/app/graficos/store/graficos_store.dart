import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'graficos_store.g.dart';

class GraficosStore = _GraficosStore with _$GraficosStore;

abstract class _GraficosStore with Store {
  ObservableList listaTiposDeDados = ObservableList();

  @observable
  bool carregandoPagina = true;

  @observable
  dynamic jsonGraficos;

  @observable
  dynamic pieData; // dados do grafico

  @observable
  var map = {};

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonGraficos(_value) => jsonGraficos = _value;

  @observable
  List<charts.Series<Task, String>> listaSeries =
      <charts.Series<Task, String>>[];

  @action
  void setPieData() {
    pieData = [
      Task(
          'Sem modalidade definida',
          double.parse('${listaJsonMap[0]['Sem modalidade definida']}'),
          Colors.red),
      Task(
          'Pregão presencial',
          double.parse('${listaJsonMap[0]['Pregão presencial']}'),
          Colors.yellow),
      Task(
          'Chamamento público',
          double.parse('${listaJsonMap[0]['Chamamento público']}'),
          Colors.blue),
      Task('Concorrência', double.parse('${listaJsonMap[0]['Concorrência']}'),
          Colors.purple),
      Task('Inexigibilidade',
          double.parse('${listaJsonMap[0]['Inexigibilidade']}'), Colors.orange),
      Task('Convite', double.parse('${listaJsonMap[0]['Convite']}'),
          Colors.green),
      Task('Pregão eletrônico',
          double.parse('${listaJsonMap[0]['Pregão eletrônico']}'), Colors.pink),
    ];
    listaSeries = [];
    listaSeries.add(
      charts.Series(
        data: pieData,
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorVal),
        id: 'Valores',
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
      ),
    );
  }

  @action
  void addListaTiposDados(_value) => listaTiposDeDados.add(_value);

  @observable
  // ignore: prefer_typing_uninitialized_variables
  var jsonMap;

  @observable
  dynamic jsonMapAux;

  @observable
  String jsonFinal = '';

  ObservableList listaJsonMap = ObservableList();

  @action
  void setMap() {
    listaJsonMap.clear();
    for (var x in listaTiposDeDados) {
      map[x] = !map.containsKey(x) ? (1) : (map[x] + 1);
    }

    jsonMapAux = json.encode(map);
    jsonFinal = '[$jsonMapAux]';

    listaJsonMap.addAll(json.decode(jsonFinal));

    // ignore: avoid_print
    print("JSONMAP>>> ${listaJsonMap[0]['Sem modalidade definida']}");
  }
}
