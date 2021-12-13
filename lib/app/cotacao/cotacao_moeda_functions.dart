import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/globals/globals_var.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class CotacaoMoedaFunctions {
  BuildContext context;
  CotacaoMoedaFunctions(this.context);

  Future getCotacao() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    cotacaoMoedaStore.setCarregandoPagina(true);

    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http.get(
          Uri.parse(
              '${GlobalsVars(context).urlEp}/conversao.php?moeda_base=${cotacaoMoedaStore.siglaMoedaSelec}'),
        );
        var jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          cotacaoMoedaStore.setJsonCotacao(jsonRequest);

          print("JSONAPI>>> ${cotacaoMoedaStore.jsonCotacao}");
          cotacaoMoedaStore.setCarregandoPagina(false);
        } else {
          cotacaoMoedaStore.setCarregandoPagina(false);
        }
      } catch (e) {
        print("ERRO GET COTACAO>> $e");
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }

  Future postCotacao() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    cotacaoMoedaStore.setCarregandoPagina(true);
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var response = await http.post(
            Uri.parse(
              '${GlobalsVars(context).urlEp}/conversao.php',
            ),
            body: {
              'moeda': cotacaoMoedaStore.siglaMoedaSelec,
              'inicio': DateFormat('yyyy-MM-dd').format(
                cotacaoMoedaStore.intervaloData!.start,
              ),
              'fim': DateFormat('yyyy-MM-dd').format(
                cotacaoMoedaStore.intervaloData!.end,
              ),
            });
        if (response.statusCode == 200) {
          GlobalsWidgets(context).alertSucesso(getCotacao);
        }
      } catch (e) {
        print("ERRO GET COTACAO>> $e");
        GlobalsWidgets(context).alertErroEnvio();
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }

  Future pickDateRange() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);

    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now(),
    );
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: cotacaoMoedaStore.intervaloData ?? initialDateRange);

    if (newDateRange == null) {
      return;
    } else {
      // ignore: avoid_print
      print("DATA NOVA >>> $newDateRange");

      cotacaoMoedaStore.setIntervaloData(newDateRange);
    }
  }
}
