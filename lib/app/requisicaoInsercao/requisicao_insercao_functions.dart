import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoFunctions {
  BuildContext context;
  RequisicaoInsercaoFunctions(this.context);

  Future getDadosApi() async {
    final requisicaoInsercaoStore =
        Provider.of<RequisicaoInsercaoStore>(context, listen: false);
    requisicaoInsercaoStore.setCarregandoPagina(true);
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http.get(
          Uri.parse(
              'https://api.proconvoce.com.br/api/ordem.php?fiscal_id=9&procon_id=1'),
        );
        var jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          requisicaoInsercaoStore.setJsonApi(jsonRequest);
          // ignore: avoid_print
          print("JSONAPI>>> ${requisicaoInsercaoStore.jsonApi}");
          requisicaoInsercaoStore.setCarregandoPagina(false);
        }
      } catch (e) {
        // ignore: avoid_print
        print("ERRO GET DADOS API >> $e");
      }
    } else {
      // ignore: avoid_print
      print("SEM INTERNET");
    }
  }
}
