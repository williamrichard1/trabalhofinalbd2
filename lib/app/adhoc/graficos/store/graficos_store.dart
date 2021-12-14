import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/tiposgraficos.dart';
import 'package:charts_flutter/flutter.dart' as charts;
part 'graficos_store.g.dart';

class GraficosStore = _GraficosStore with _$GraficosStore;

abstract class _GraficosStore with Store {
  ObservableList listaMoedasGrafico = ObservableList();

  ObservableList jsonFinalAux = ObservableList();

  ObservableList<String> listaAuxiliarMoedas = ObservableList<String>();

  ObservableList<bool> listaValues = ObservableList<bool>();

  ObservableList<bool> listaValues2 = ObservableList<bool>();

  @observable
  List<DadosGrafico> listaDadosGrafico = [];

  @observable
  List<DadosGraficoMedia> listaDadosGraficoMedia = [];

  @observable
  List<DadosGraficoValorMax> listaDadosGraficoValorMax = [];

  @observable
  List<charts.Series<DadosGrafico, DateTime>> listaSeries = [];

  @observable
  List<charts.Series<DadosGraficoMedia, String>> listaSeriesMedia = [];

  @observable
  List<charts.Series<DadosGraficoValorMax, String>> listaSeriesValorMax = [];

  @observable
  bool carregandoPagina = true;

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
  dynamic jsonGraficos;

  @observable
  dynamic dadosGrafico;

  @observable
  int tipoGrafico = 1;

  @observable
  bool visibilidadeListaMoedas = false;

  @observable
  bool visibilidadeListaMoedas2 = false;

  @observable
  dynamic jsonTabela;

  @observable
  dynamic jsonTabelaMedia;

  @observable
  dynamic jsonValorMax;

  @observable
  String dataInicioTabela = '';

  @observable
  String dataFimTabela = '';

  @observable
  String jsonEnvioMoedas = '';

  @action
  void setDatasTabela(_value1, _value2) {
    dataInicioTabela = _value1;
    dataFimTabela = _value2;
  }

  @action
  void setCarregandoPagina(_value) => carregandoPagina = _value;

  @action
  void setJsonGraficos(_value) => jsonGraficos = _value;

  @action
  Future setDadosGrafico(jsonRecebido) async {
    listaDadosGrafico.clear();
    for (int i = 0; i < jsonRecebido[0]['valores'].length; i++) {
      var splitDados = jsonRecebido[0]['valores'][i]['data'].split('-');
      listaDadosGrafico.add(
        DadosGrafico(
          DateTime(
            int.parse(splitDados[0]),
            int.parse(splitDados[1]),
            int.parse(splitDados[2]),
          ),
          double.parse(jsonRecebido[0]['valores'][i]['valor']),
        ),
      );
    }

    listaSeries = [];
    listaSeries.add(
      charts.Series<DadosGrafico, DateTime>(
        id: 'Valores',
        data: listaDadosGrafico,
        domainFn: (DadosGrafico row, _) => row.periodo,
        measureFn: (DadosGrafico row, _) => row.valor,
        seriesColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(162, 21, 2, 1)),
      ),
    );
  }

  @action
  Future setDadosGraficoMedia(jsonRecebido) async {
    listaDadosGraficoMedia.clear();
    for (int i = 0; i < jsonRecebido.length; i++) {
      listaDadosGraficoMedia.add(
        DadosGraficoMedia(
          '${jsonRecebido[i]['moeda_base']}',
          double.parse('${jsonRecebido[i]['valores']}'),
        ),
      );
    }
    listaSeriesMedia = [];
    listaSeriesMedia.add(
      charts.Series<DadosGraficoMedia, String>(
        id: 'Valores',
        data: listaDadosGraficoMedia,
        domainFn: (DadosGraficoMedia row, _) => row.moeda,
        measureFn: (DadosGraficoMedia row, _) => row.valor,
        seriesColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(162, 21, 2, 1)),
      ),
    );
  }

  @action
  Future setDadosGraficoValorMax(jsonRecebido) async {
    listaDadosGraficoValorMax.clear();
    for (int i = 0; i < jsonRecebido.length; i++) {
      listaDadosGraficoMedia.add(
        DadosGraficoMedia(
          '${jsonRecebido[i]['moeda_base']}',
          double.parse('${jsonRecebido[i]['valores']}'),
        ),
      );
    }
    listaSeriesValorMax = [];
    listaSeriesValorMax.add(
      charts.Series<DadosGraficoValorMax, String>(
        id: 'Valores',
        data: listaDadosGraficoValorMax,
        domainFn: (DadosGraficoValorMax row, _) => row.moeda,
        measureFn: (DadosGraficoValorMax row, _) => row.valor,
        seriesColor:
            charts.ColorUtil.fromDartColor(Color.fromRGBO(162, 21, 2, 1)),
      ),
    );
  }

  @action
  void addListaAuxiliarMoedas(_value) {
    listaAuxiliarMoedas.add(_value);
    print("LISTA AUXILIAR >> $listaAuxiliarMoedas");
  }

  @action
  Future setJsonMoedasBase() async {
    for (int i = 0; i < listaAuxiliarMoedas.length; i++) {
      var jsonMoedasBase = {};
      // ignore: unnecessary_string_interpolations
      jsonMoedasBase['"moeda"'] = "\"${listaAuxiliarMoedas[i]}\"";
      addJsonFinal(jsonMoedasBase);
      print("JSON MOEDAS>> $jsonMoedasBase");
      print("OUTRO JSON>> $jsonFinalAux");
    }
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

  @action
  void setJsonTabela(_value) => jsonTabela = _value;

  @action
  void setJsonTabelaMedia(_value) => jsonTabelaMedia = _value;
}
