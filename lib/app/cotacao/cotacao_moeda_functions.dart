import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;

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
          Uri.parse('http://10.0.2.2/conversao.php'),
        );
        var jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          cotacaoMoedaStore.setJsonCotacao(jsonRequest);

          // ignore: avoid_print
          print("JSONAPI>>> ${cotacaoMoedaStore.jsonCotacao}");
          cotacaoMoedaStore.setCarregandoPagina(false);
        }
      } catch (e) {
        // ignore: avoid_print
        print("ERRO GET COTACAO>> $e");
      }
    } else {}
  }

  Future postCotacao() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    cotacaoMoedaStore.setCarregandoPagina(true);
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http.post(
            Uri.parse(
              'http://10.0.2.2/conversao.php',
            ),
            body: {
              'moeda': cotacaoMoedaStore.moedaSelec,
              'inicio': DateFormat('yyyy-MM-dd').format(
                cotacaoMoedaStore.intervaloData!.start,
              ),
              'fim': DateFormat('yyyy-MM-dd').format(
                cotacaoMoedaStore.intervaloData!.end,
              ),
            });
      } catch (e) {
        // ignore: avoid_print
        print("ERRO GET COTACAO>> $e");
      }
    } else {}
  }
}
