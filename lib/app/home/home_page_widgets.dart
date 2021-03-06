import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_page.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/globals/store/globals_store.dart';
import 'package:trabalhofinalbd2/app/home/home_page_functions.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/requisicao_insercao_page.dart';

class HomePageWidgets {
  BuildContext context;
  HomePageWidgets(this.context);

  List<String> listaOpcoes = <String>[
    "Cotação Moeda",
    "Ad Hoc",
    "Deletar Banco"
  ];

  Widget corpoHome() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              GlobalsWidgets(context).logoUnifei(),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  "Trabalho Final COM231 - Banco de Dados II",
                  style: TextStyle(
                    fontSize: GlobalsStyles(context).tamanhoTitulo,
                    color: GlobalsStyles(context).corPrimariaTexto,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          _listViewOpcoes(),
        ],
      ),
    );
  }

  Widget _listViewOpcoes() {
    final globalsStore = Provider.of<GlobalsStore>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listaOpcoes.length,
      itemBuilder: (_, int index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                if (listaOpcoes[index] == "Cotação Moeda") {
                  globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RequisicaoInsercaoPage(),
                    ),
                  );
                } else if (listaOpcoes[index] == "Ad Hoc") {
                  globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AdhocPage(),
                    ),
                  );
                } else {
                  HomePageFunctions(context).limpaBancoDeDados();
                  // CotacaoMoedaFunctions(context).limpaBancoDeDados();
                  /*globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RelatoriosPage(),
                    ),
                  );*/
                }
              },
              child: Container(
                margin: GlobalsStyles(context).margemPadrao,
                child: Material(
                  elevation: GlobalsStyles(context).elevacaoContainers,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          listaOpcoes[index],
                          style: TextStyle(
                            fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                            color: GlobalsStyles(context).corPrimariaTexto,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
