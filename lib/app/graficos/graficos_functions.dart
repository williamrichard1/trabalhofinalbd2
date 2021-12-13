import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/globals/globals_var.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosFunctions {
  BuildContext context;
  GraficosFunctions(this.context);

  Future getListaMoedas() async {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    graficosStore.listaMoedasGrafico.clear();
    graficosStore.listaValues.clear();
    graficosStore.listaValues2.clear();
    graficosStore.setCarregandoPagina(true);
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http
            .get(Uri.parse('${GlobalsVars(context).urlEp}/moeda.php'));
        var jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          graficosStore.setListaMoedaGraficos(jsonRequest);
          print("LISTA MOEDAS/.>>> ${graficosStore.listaMoedasGrafico}");
          for (int i = 0; i < graficosStore.listaMoedasGrafico.length; i++) {
            graficosStore.addListaValue(false);
            graficosStore.addListaValue2(false);
          }
          graficosStore.setCarregandoPagina(false);
        } else {
          graficosStore.setCarregandoPagina(false);
        }
      } catch (e) {
        print("ERRO GET MOEDAS GRAFICO >>> $e");
        GlobalsWidgets(context).alertErroEnvio();
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }

  Future getDadosGrafico() async {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    graficosStore.setCarregandoPagina(true);
    graficosStore.listaSeries.clear();
    dynamic request;
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        if (graficosStore.tipoGrafico == 1 || graficosStore.tipoGrafico == 2) {
          request = await http.get(
            Uri.parse(
                '${GlobalsVars(context).urlEp}/adhoc.php?inicio=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.start,
            )}&fim=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.end,
            )}&moeda_conversao=${graficosStore.moedaConversaoSelec}&moeda_base=${graficosStore.moedaBaseSelec}&tipo_adhoc=${graficosStore.tipoGrafico}'),
          );
        } else {
          print("VARIAVEL QUE VAI PRO ENVIO>> ${graficosStore.jsonFinalAux} ");

          request = await http.get(
            Uri.parse(
                '${GlobalsVars(context).urlEp}/adhoc.php?inicio=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.start,
            )}&fim=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.end,
            )}&moeda_conversao=${graficosStore.moedaConversaoSelec}&moeda_base1=${graficosStore.jsonEnvioMoedas}&tipo_adhoc=2'),
          );
        }
        var jsonData = await json.decode(request.body);
        if (jsonData != null && graficosStore.tipoGrafico == 1 ||
            jsonData != null && graficosStore.tipoGrafico == 2) {
          graficosStore.setDatasTabela(
              jsonData[0]['inicio'], jsonData[0]['fim']);
          graficosStore.setJsonTabela(jsonData[0]['valores']);
          await graficosStore.setDadosGrafico(jsonData);
          graficosStore.setCarregandoPagina(false);
          graficosStore.trocaVisibilidadeOpcoesGrafico(true);
        } else {
          graficosStore.setJsonTabelaMedia(jsonData);
          print("JSON TABELA MEDIA>> ${graficosStore.jsonTabelaMedia}");
          graficosStore.setCarregandoPagina(false);

          /*GlobalsWidgets(context).alertErroEnvio();*/
        }
      } catch (e) {
        print("ERRO GET DADOS GRAFICO >>> $e");
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }
}
