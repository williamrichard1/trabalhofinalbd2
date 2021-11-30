import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_page.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoWidgets {
  BuildContext context;
  RequisicaoInsercaoWidgets(this.context);

  Widget corpoRequisicaoInsercao() {
    final requisicaoInsercaoStoreT =
        Provider.of<RequisicaoInsercaoStore>(context, listen: true);
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
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
                            color: GlobalsStyles(context).corPrimariaTexto,
                            fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${requisicaoInsercaoStoreT.jsonApi[index]['sigla']}",
                          style: TextStyle(
                            color: GlobalsStyles(context).corSecundariaText,
                            fontSize: 13,
                            /*fontWeight: FontWeight.bold,*/
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
  }
}
