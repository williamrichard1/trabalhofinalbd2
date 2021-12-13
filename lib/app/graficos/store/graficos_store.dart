import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_widgets.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'graficos_store.g.dart';

class GraficosStore = _GraficosStore with _$GraficosStore;

abstract class _GraficosStore with Store {
  /*ObservableList listaTiposDeDados = ObservableList();

  ObservableList listaJsonMap = ObservableList();*/

  ObservableList listaMoedasGrafico = ObservableList();

  @observable
  String dataInicioGrafico = '';

  @observable
  String dataFimGrafico = '';

  @observable
  String nomeMoedaBaseSelec = '';

  @observable
  String moedaBaseSelec = '';

  @observable
  String moedaConversaoSelec = '';

  @observable
  String nomeMoedaConversaoSelec = '';

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

  @observable
  bool visibilidadeListaMoedas = false;

  @observable
  bool visibilidadeListaMoedas2 = false;

  ObservableList<bool> listaValues = ObservableList<bool>();
  ObservableList<bool> listaValues2 = ObservableList<bool>();

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
    "2021-10-14-145",
    "2021-10-15-55",
    "2021-10-16-230",
    "2021-10-17-71",
    "2021-10-18-39",
    "2021-10-19-40",
    "2021-10-20-45",
  ];

  List<DadosGrafico> listaDadosGrafico = [];

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonGraficos(_value) => jsonGraficos = _value;

  @observable
  List<charts.Series<DadosGrafico, DateTime>> listaSeries = [];

  @action
  Future setDadosGrafico(jsonRecebido) async {
    listaDadosGrafico.clear();
    for (int i = 0; i < jsonRecebido['valores'].length; i++) {
      var splitDados = jsonRecebido['valores'][i]['data'].split('-');
      listaDadosGrafico.add(
        DadosGrafico(
          DateTime(
            int.parse(splitDados[0]),
            int.parse(splitDados[1]),
            int.parse(splitDados[2]),
          ),
          double.parse(jsonRecebido['valores'][i]['valor']),
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

  @observable
  bool visibilidadeOpcoesGrafico = false;

  @observable
  ObservableList jsonFinalAux = ObservableList();

  ObservableList<String> listaAuxiliarMoedas = ObservableList<String>();

  @action
  void addListaAuxiliarMoedas(_value) {
    listaAuxiliarMoedas.add(_value);
    print("LISTA AUXILIAR >> $listaAuxiliarMoedas");
  }

  @observable
  String jsonEnvioMoedas = '';

  @action
  Future setJsonMoedasBase(/*String _moedaRecebida*/) async {
    for (int i = 0; i < listaAuxiliarMoedas.length; i++) {
      String jsonAux = "{\"$i\":\"${listaAuxiliarMoedas[i]}\"}";

      addJsonFinal(jsonAux);
      print("JSON FINAL AUX>>> $jsonFinalAux");
      /*var jsonMoedasBase = {};
      // ignore: unnecessary_string_interpolations
      jsonMoedasBase['"moeda"'] = "${listaAuxiliarMoedas[i]}";
      addJsonFinal(jsonMoedasBase);
      print("JSON MOEDAS>> $jsonMoedasBase");
      print("OUTRO JSON>> $jsonFinalAux");*/
    }

    /*addJsonFinal(jsonMoedasBase);*/
  }

  @action
  void addJsonFinal(_value) {
    jsonFinalAux.add(_value);
  }

  @action
  Future montaJsonEnvioPesquisa() async {
    print("entrou monta json >> $jsonFinalAux");
    String jsonEnvioValoresPesquisaAux = jsonEncode(jsonFinalAux.toString());

    jsonEnvioValoresPesquisaAux =
        jsonEnvioValoresPesquisaAux.replaceAll('\\"', '"');

    jsonEnvioMoedas = jsonEnvioValoresPesquisaAux.substring(
        1, jsonEnvioValoresPesquisaAux.length - 1);

    print(" STRING QUE VAI PRO ENVIO >>>> $jsonEnvioMoedas");
  }

  @action
  void trocaVisibilidadeOpcoesGrafico(_value) =>
      visibilidadeOpcoesGrafico = _value;

  @action
  void setTipoGrafico(_value) => tipoGrafico = _value;

  @action
  void setListaMoedaGraficos(_value) => listaMoedasGrafico.addAll(_value);

  @action
  void setDataInicioGrafico(_value) => dataInicioGrafico = _value;

  @action
  void setDataFimGrafico(_value) => dataFimGrafico = _value;

  @action
  void setMoedaBaseSelec(_value) => moedaBaseSelec = _value;

  @action
  void setNomeMoedaBaseSelec(_value) => nomeMoedaBaseSelec = _value;

  @action
  void setMoedaConversaoSelec(_value) => moedaConversaoSelec = _value;

  @action
  void setNomeMoedaConversaoSelec(_value) => nomeMoedaConversaoSelec = _value;

  @action
  void addListaValue(_value) => listaValues.add(_value);

  @action
  void addListaValue2(_value) => listaValues2.add(_value);

  @action
  void trocaValue(index, value) => listaValues[index] = value;

  @action
  void trocaValue2(index, value) => listaValues2[index] = value;

  @action
  void trocaVisibilidade1() =>
      visibilidadeListaMoedas = !visibilidadeListaMoedas;

  @action
  void trocaVisibilidade2() =>
      visibilidadeListaMoedas2 = !visibilidadeListaMoedas2;
}
