import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_functions.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';

class CotacaoMoedaWidgets {
  BuildContext context;
  CotacaoMoedaWidgets(this.context);

  Widget corpoCotacao() {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Selecione o intervalo (em dias) para obter os valores",
              style: TextStyle(
                color: GlobalsStyles(context).corPrimariaTexto,
                fontSize: GlobalsStyles(context).tamanhoTextoMedio,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 35,
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Observer(
                      builder: (_) {
                        return Text(
                          cotacaoMoedaStoreT.intervaloData == null
                              ? 'Início'
                              : DateFormat('dd/MM/yyyy').format(
                                  cotacaoMoedaStoreT.intervaloData!.start),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GlobalsStyles(context).corPrimariaTexto,
                            fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              onTap: () => pickDateRange(),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.blue),
            SizedBox(width: 8),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 35,
                    width: MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Observer(
                      builder: (_) {
                        return Text(
                          cotacaoMoedaStoreT.intervaloData == null
                              ? 'Fim'
                              : DateFormat('dd/MM/yyyy').format(
                                  cotacaoMoedaStoreT.intervaloData!.end,
                                ),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: GlobalsStyles(context).corPrimariaTexto,
                            fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              onTap: () => pickDateRange(),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Material(
            elevation: 5,
            color: GlobalsStyles(context).corPrimariaTexto,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextButton(
              onPressed: () async {
                await CotacaoMoedaFunctions(context).postCotacao();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cadastrar Valores",
                    style: TextStyle(
                      color: GlobalsStyles(context).corQuaternaria,
                      fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    FontAwesomeIcons.search,
                    color: GlobalsStyles(context).corQuaternaria,
                    size: GlobalsStyles(context).tamanhoTextoMedio,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future pickDateRange() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);

    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(
        Duration(hours: 24 * 3),
      ),
    );
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: cotacaoMoedaStore.intervaloData ?? initialDateRange);

    if (newDateRange == null) {
      return;
    } else {
      // ignore: avoid_print
      print("DATA NOVA >>> $newDateRange");

      cotacaoMoedaStore.setIntervaloData(newDateRange);
    }
  }
}
