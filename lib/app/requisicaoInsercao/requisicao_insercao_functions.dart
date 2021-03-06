import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/globals/globals_var.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
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
        var request = await http
            .get(Uri.parse('${GlobalsVars(context).urlEp}/moeda.php'));
        var jsonRequest = await json.decode(request.body);
        requisicaoInsercaoStore.setJsonRequest(jsonRequest);

        if (requisicaoInsercaoStore.jsonRequest != null) {
          requisicaoInsercaoStore
              .addListaSearchOrigin(requisicaoInsercaoStore.jsonRequest);
          requisicaoInsercaoStore
              .addJsonApi(requisicaoInsercaoStore.jsonRequest);

          requisicaoInsercaoStore.jsonRequest.forEach((element) {
            requisicaoInsercaoStore.addListaSearchString(element['nome']);
          });

          print("JSONAPI>>> ${requisicaoInsercaoStore.jsonApi}");
          requisicaoInsercaoStore.setCarregandoPagina(false);
        } else {
          print(
              'REQUEST QND CAI NO POST >>> ${requisicaoInsercaoStore.jsonRequest}');
          postMoeda();
        }
      } catch (e) {
        print("ERRO GET DADOS API MOEDA >> $e");
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }

  Future postMoeda() async {
    try {
      var response = await http.post(
        Uri.parse('${GlobalsVars(context).urlEp}/moeda.php'),
      );
      if (response.body == '1') {
        GlobalsWidgets(context).alertSucesso(getDadosApi);
      }
    } catch (e) {
      print("ERRO POST DADOS API >> $e");
      GlobalsWidgets(context).alertErroEnvio();
    }
  }

  Future filterSearchResults(String query) async {
    final requisicaoInsercaoStore =
        Provider.of<RequisicaoInsercaoStore>(context, listen: false);

    List searchListAux = [];

    searchListAux.addAll(requisicaoInsercaoStore.listaSearchString);
    if (query.isNotEmpty) {
      List searchListData = [];

      searchListData = await comparaQuery(searchListAux, query);

      requisicaoInsercaoStore.addJsonApi(searchListData);
      return;
    } else {
      requisicaoInsercaoStore
          .addJsonApi(requisicaoInsercaoStore.listaSearchOrigin);
    }
  }

  Future<dynamic> comparaQuery(searchListAux, query) async {
    final requisicaoInsercaoStore =
        Provider.of<RequisicaoInsercaoStore>(context, listen: false);
    List searchListData2 = [];

    for (int i = 0; i < searchListAux.length; i++) {
      if (searchListAux[i].toLowerCase().contains(query.toLowerCase())) {
        searchListData2.add(requisicaoInsercaoStore.listaSearchOrigin[i]);
      }
    }
    return searchListData2;
  }
}
