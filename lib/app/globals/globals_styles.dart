import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GlobalsStyles {
  BuildContext context;
  GlobalsStyles(this.context);

  //TAMANHO DAS FONTES
  var tamanhoTitulo = 18.0;
  var tamanhoTextoMedio = 15.0;

  //CORES APP
  var corBackGround = Colors.grey[100];
  var corPrimariaTexto = Color.fromRGBO(99, 98, 99, 1);
  var corSecundariaText = Color.fromRGBO(162, 21, 2, 1);
  var corTerciaria = Color.fromRGBO(229, 225, 220, 1);
  var corQuaternaria = Colors.white;

  //CONFIGURAÇÕES DE LAYOUT
  var elevacaoContainers = kIsWeb ? 15.0 : 5.0;
  var margemPadrao = kIsWeb
      ? EdgeInsets.symmetric(horizontal: 100)
      : EdgeInsets.symmetric(horizontal: 10);
  var margemBotao = kIsWeb
      ? EdgeInsets.symmetric(horizontal: 500)
      : EdgeInsets.symmetric(horizontal: 50);

  double tamanhoBotao() {
    return kIsWeb
        ? MediaQuery.of(context).size.height / 25
        : MediaQuery.of(context).size.height / 15;
  }
}
