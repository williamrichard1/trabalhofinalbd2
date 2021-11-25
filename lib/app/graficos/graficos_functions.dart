import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_functions.dart';
import 'package:http/http.dart' as http;
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosFunctions {
  BuildContext context;
  GraficosFunctions(this.context);

  Future getDadosGraficos() async {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);

    graficosStore.setCarregandoPagina(true);
    graficosStore.listaTiposDeDados.clear();
    graficosStore.map.clear();
    if (!(await GlobalsFunctions(context).verificaInternet())) {
      try {
        var request = await http.get(
          Uri.parse(
              'https://alertalicitacao.com.br/api/v1/licitacoesAbertas/?uf=MG&token=abcdefabcdefabcdefabcdefabcdef99'),
        );
        var jsonRequest = await json.decode(request.body);
        if (jsonRequest != null) {
          graficosStore.setJsonGraficos(jsonRequest['licitacoes']);
          for (int i = 0; i < graficosStore.jsonGraficos.length; i++) {
            graficosStore
                .addListaTiposDados(graficosStore.jsonGraficos[i]['tipo']);
          }

          graficosStore.setMap();
          graficosStore.setPieData();

          // ignore: avoid_print
          print(" OCRRENCIA DE DADOS >>> ${graficosStore.map}");
          // ignore: avoid_print
          print("JSONAPI>>> ${graficosStore.jsonGraficos}");
          graficosStore.setCarregandoPagina(false);

          // ignore: avoid_print
          print("LISTA DE TIPOS>>> ${graficosStore.listaTiposDeDados}");
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
