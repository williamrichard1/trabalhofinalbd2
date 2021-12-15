import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_functions.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/store/valormax_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/globals/globals_var.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

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
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    final valorMaxStore = Provider.of<ValorMaxStore>(context, listen: false);
    graficosStore.setCarregandoPagina(true);
    graficosStore.listaSeries.clear();
    dynamic request;
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        if (adhocStore.tipoAdhoc == 1) {
          request = await http.get(
            Uri.parse(
                '${GlobalsVars(context).urlEp}/adhoc.php?inicio=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.start,
            )}&fim=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.end,
            )}&moeda_conversao=${graficosStore.moedaConversaoSelec}&moeda_base=${graficosStore.moedaBaseSelec}&tipo_adhoc=${adhocStore.tipoAdhoc}'),
          );
        } else if (adhocStore.tipoAdhoc == 2) {
          print("VARIAVEL QUE VAI PRO ENVIO>> ${graficosStore.jsonFinalAux} ");

          request = await http.get(
            Uri.parse(
                '${GlobalsVars(context).urlEp}/adhoc.php?inicio=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.start,
            )}&fim=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.end,
            )}&moeda_conversao=${graficosStore.moedaConversaoSelec}&moeda_base1=${graficosStore.jsonEnvioMoedas}&tipo_adhoc=${adhocStore.tipoAdhoc}'),
          );
        } else {
          print("VARIAVEL QUE VAI PRO ENVIO>> ${graficosStore.jsonFinalAux} ");

          request = await http.get(
            Uri.parse(
                '${GlobalsVars(context).urlEp}/adhoc.php?inicio=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.start,
            )}&fim=${DateFormat('yyyy-MM-dd').format(
              cotacaoMoedaStore.intervaloData!.end,
            )}&moeda_conversao=${graficosStore.moedaConversaoSelec}&tipo_adhoc=${adhocStore.tipoAdhoc}&valor_max=${valorMaxStore.controllerValorMaximo.text}'),
          );
        }
        var jsonData = await json.decode(request.body);
        if (jsonData != null && adhocStore.tipoAdhoc == 1) {
          graficosStore.setDatasTabela(
              jsonData[0]['inicio'], jsonData[0]['fim']);
          graficosStore.setJsonTabela(jsonData[0]['valores']);
          await graficosStore.setDadosGrafico(jsonData);
          graficosStore.setCarregandoPagina(false);
        } else if (jsonData != null && adhocStore.tipoAdhoc == 2) {
          graficosStore.setJsonTabelaMedia(jsonData);
          graficosStore.setDadosGraficoMedia(jsonData);
          print("JSON TABELA MEDIA>> ${graficosStore.jsonTabelaMedia}");
          graficosStore.setCarregandoPagina(false);
        } else {
          print('JSONDATA REQ>> $jsonData');
          await AdhocFunctions(context).montaListaValorAux(jsonData);
          AdhocFunctions(context).criaDadosValorMax();

          print("JSON TABELA VALOR MAX>> ${graficosStore.jsonTabelaValorMax}");
          graficosStore.setCarregandoPagina(false);
        }
      } catch (e) {
        print("ERRO GET DADOS GRAFICO >>> $e");
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }
}
