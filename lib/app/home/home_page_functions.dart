import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:trabalhofinalbd2/app/globals/globals_var.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/home/store/home_page_store.dart';

class HomePageFunctions {
  BuildContext context;
  HomePageFunctions(this.context);

  Future limpaBancoDeDados() async {
    final homePageStore = Provider.of<HomePageStore>(context, listen: false);
    homePageStore.setCarregandoPagina(true);

    dynamic response;

    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        response = await http.delete(
          Uri.parse(
            '${GloblasVars(context).urlEp}/moeda.php',
          ),
        );
        if (response.body == '1') {
          print('RESPONSEBODYDELETE>>> ${response.body}');
          homePageStore.setCarregandoPagina(false);
          /*GlobalsWidgets(context).alertSucesso(getCotacao);*/
        } else {
          homePageStore.setCarregandoPagina(false);
        }
      } catch (e) {
        print("ERRO GET COTACAO>> $e");
        print("RESPONSE ERRO>> $response");
        GlobalsWidgets(context).alertErroEnvio();
      }
    } else {
      GlobalsWidgets(context).alertSemInternet();
    }
  }
}
