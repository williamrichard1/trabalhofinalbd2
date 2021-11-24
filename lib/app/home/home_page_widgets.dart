import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/globals/store/globals_store.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_page.dart';
import 'package:trabalhofinalbd2/app/relatorios/relatorios_page.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/requisicao_insercao_page.dart';

class HomePageWidgets {
  BuildContext context;
  HomePageWidgets(this.context);

  List<String> listaOpcoes = <String>[
    "Requisição API e Insere no banco",
    "Gerar Gráficos",
    "Gerar Relatórios Ad-Hoc"
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
            height: 10,
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
                if (listaOpcoes[index] == "Requisição API e Insere no banco") {
                  globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RequisicaoInsercaoPage(),
                    ),
                  );
                } else if (listaOpcoes[index] == "Gerar Gráficos") {
                  globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GraficosPage(),
                    ),
                  );
                } else {
                  globalsStore.setTituloAppBar(listaOpcoes[index]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RelatoriosPage(),
                    ),
                  );
                }
                /*print("OPCAOSELEC>>>> ${listaOpcoes[index]}");*/
              },
              child: Material(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
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
            SizedBox(
              height: 20,
            ),
          ],
        );
      },
    );
  }
}
