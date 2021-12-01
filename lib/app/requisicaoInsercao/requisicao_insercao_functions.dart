import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoFunctions {
  BuildContext context;
  RequisicaoInsercaoFunctions(this.context);

  Future<dynamic> getDadosApi() async {
    dynamic jsonRequest;
    final requisicaoInsercaoStore =
        Provider.of<RequisicaoInsercaoStore>(context, listen: false);

    requisicaoInsercaoStore.setCarregandoPagina(true);
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http.get(
          Uri.parse('http://10.0.2.2/moeda.php'),
        );
        jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          requisicaoInsercaoStore.setJsonApi(jsonRequest);

          print("JSONAPI>>> ${requisicaoInsercaoStore.jsonApi}");
          requisicaoInsercaoStore.setCarregandoPagina(false);
        } else {
          postMoeda();
        }
      } catch (e) {
        print("ERRO GET DADOS API >> $e");
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
    return jsonRequest;
  }

  Future postMoeda() async {
    try {
      var response = await http.post(
        Uri.parse('http://10.0.2.2/moeda.php'),
      );
      if (response.statusCode == 200) {
        GlobalsWidgets(context).alertSucesso(getDadosApi);
      }
    } catch (e) {
      print("ERRO POST DADOS API >> $e");
      GlobalsWidgets(context).alertErroEnvio();
    }
  }
}
