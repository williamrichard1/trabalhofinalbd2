import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_page.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/requisicao_insercao_functions.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoWidgets {
  BuildContext context;
  RequisicaoInsercaoWidgets(this.context);
  final TextEditingController _controller = TextEditingController();

  Widget corpoRequisicaoInsercao() {
    final requisicaoInsercaoStoreT =
        Provider.of<RequisicaoInsercaoStore>(context, listen: true);
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    return Column(
      children: [
        barraDePesquisa(),
        SizedBox(
          height: 20,
        ),
        Observer(
          builder: (_) {
            return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: requisicaoInsercaoStoreT.jsonApi.length,
              itemBuilder: (_, int index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        print(
                            "SIGLA MOEDA SELEC >>> ${requisicaoInsercaoStoreT.jsonApi[index]['sigla']}");

                        cotacaoMoedaStore.setMoedaSelec(
                            "${requisicaoInsercaoStoreT.jsonApi[index]['sigla']}");

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CotacaoMoedaPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 15,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  "${requisicaoInsercaoStoreT.jsonApi[index]['nome']}",
                                  style: TextStyle(
                                    color:
                                        GlobalsStyles(context).corPrimariaTexto,
                                    fontSize: GlobalsStyles(context)
                                        .tamanhoTextoMedio,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${requisicaoInsercaoStoreT.jsonApi[index]['sigla']}",
                                  style: TextStyle(
                                    color: GlobalsStyles(context)
                                        .corSecundariaText,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget barraDePesquisa() {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            textAlign: TextAlign.start,
            controller: _controller,
            onChanged: RequisicaoInsercaoFunctions(context).filterSearchResults,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                FontAwesomeIcons.search,
                color: GlobalsStyles(context).corSecundariaText,
              ),
              hintText: "Filtrar por nome",
              hintStyle: TextStyle(
                color: GlobalsStyles(context).corPrimariaTexto,
                fontWeight: FontWeight.bold,
                fontFamily: "raleway",
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
