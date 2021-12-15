
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/tiposgraficos.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';

class AdhocFunctions {
  BuildContext context;
  AdhocFunctions(this.context);

  List<double> teste = [
    10.0,
    50.0,
    30.0,
    60.0,
  ];

  List<String> teste2 = [
    'teste1',
    'teste2',
    'teste3',
    'teste4',
  ];

  List<charts.Series<DadosGraficoValorMax, String>> criaDadosValorMax() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    graficosStore.listaDadosGraficoValorMax.clear();
    graficosStore.listaSeriesValorAux = criaSeries();
    return graficosStore.listaSeriesValorAux;
  }

  List<charts.Series<DadosGraficoValorMax, String>> criaSeries() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    List<double> listaAux = [];

    print(" ENTRO CRIA SERIES !!!!!!");

    for (int i = 0; i < adhocStore.listaMoedasValores.length; i++) {
      print(" ENTRO CRIA SERIES PRIMEIRO FOR !!!!!!");
      print(' ELEMENTO $i ${adhocStore.listaMoedasValores[i].listaValores}');
      for (int j = 0;
          j < adhocStore.listaMoedasValores[i].listaValores.length;
          j++) {
        listaAux.add(double.parse(
            '${adhocStore.listaMoedasValores[i].listaValores[j]}'));

        if (j == adhocStore.listaMoedasValores[i].listaValores.length - 1) {
          // ignore: avoid_function_literals_in_foreach_calls
          listaAux.forEach((element) {
            graficosStore.listaDadosGraficoValorMax.add(
              DadosGraficoValorMax(
                  adhocStore.listaMoedasValores[i].nomeMoeda, element),
            );
          });
        }

        print(" ENTRO CRIA SERIES SEGUNDO FOR !!!!!!");
        print(
            "VALORES LISTA CRIEI>> ${adhocStore.listaMoedasValores[i].listaValores[j]} ");

        graficosStore.listaDadosGraficoValorMax.add(
          DadosGraficoValorMax(
              adhocStore.listaMoedasValores[i].nomeMoeda,
              double.parse(
                  '${adhocStore.listaMoedasValores[i].listaValores[j]}')),
        );
      }
      graficosStore.listaSeriesValorMax = [];
      graficosStore.listaSeriesValorMax.add(
        charts.Series<DadosGraficoValorMax, String>(
          id: 'Valores',
          domainFn: (DadosGraficoValorMax sales, _) => sales.moeda,
          measureFn: (DadosGraficoValorMax sales, _) => sales.valor,
          data: graficosStore.listaDadosGraficoValorMax,
          seriesColor:
              charts.ColorUtil.fromDartColor(Color.fromRGBO(162, 21, 2, 1)),
        ),
      );
    }

    return graficosStore.listaSeriesValorMax;
  }

  Future montaListaValorAux(jsonRecebido) async {
    print('JSON RECEBIDO >> ${jsonRecebido.length}');
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    adhocStore.listaMoedasValores.clear();
    adhocStore.listaDadosTabelaAux.clear();

    for (int i = 0; i < jsonRecebido.length; i++) {
      print("JSON FOR i >> ${jsonRecebido[i]['moeda_base']}");

      for (int j = 0; j < jsonRecebido[i]['valores'].length; j++) {
        //
        adhocStore.addDadosTabelaAux(
          TabelaValorMaxAux(
            "${jsonRecebido[i]['moeda_base']}", // nome
            "${jsonRecebido[i]['valores'][j]['data']}",
            double.parse('${jsonRecebido[i]['valores'][j]['valor']}'), // valor
          ),
        );
        print("LISTA AUXILIAR DADOS>>> ${adhocStore.listaDadosTabelaAux}");
        //
        List<double> listaAux = [];
        List<String> listaDAtaAux = [];
        listaAux.add(double.parse('${jsonRecebido[i]['valores'][j]['valor']}'));
        listaDAtaAux.add(DateFormat('dd/MM/yyyy').format(
            DateTime.parse('${jsonRecebido[i]['valores'][j]['data']}')));

        if (j == jsonRecebido[i]['valores'][j].length - 1) {
          adhocStore.addListaMoedaValores(DadosGraficoValorMaxAux(
              '${jsonRecebido[i]['moeda_base']}', listaDAtaAux, listaAux));
          print(
              'LISTA FINAL PRA MONTAR O GRAFICO >> ${adhocStore.listaMoedasValores[0].nomeMoeda} ${adhocStore.listaMoedasValores[0].listaValores.length}');
        }

        print("JSON FOR J >> ${jsonRecebido[i]['valores'][j]['valor']}");
      }
    }
  }
}
