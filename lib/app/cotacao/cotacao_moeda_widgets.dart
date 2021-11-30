import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';

class CotacaoMoedaWidgets {
  BuildContext context;
  CotacaoMoedaWidgets(this.context);

  Widget corpoCotacao() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Text("Selecione o intervalo (em dias) para saber os valores"),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                child: Text(getFrom()),
                onTap: () => pickDateRange(context),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, color: Colors.white),
            SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                child: Text(getUntil()),
                onTap: () => pickDateRange(context),
              ),
            ),
          ],
        )
      ],
    );
  }

  Future pickDateRange(BuildContext context) async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);

    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
        initialDateRange: cotacaoMoedaStore.intervaloData ?? initialDateRange);

    if (newDateRange == null) return;

    cotacaoMoedaStore.setIntervaloData(newDateRange);
  }

  String getFrom() {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);

    if (cotacaoMoedaStoreT.intervaloData == null) {
      return 'From';
    } else {
      return DateFormat('dd/MM/yyyy')
          .format(cotacaoMoedaStoreT.intervaloData!.start);
    }
  }

  String getUntil() {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    if (cotacaoMoedaStoreT.intervaloData == null) {
      return 'Until';
    } else {
      return DateFormat('dd/MM/yyyy')
          .format(cotacaoMoedaStoreT.intervaloData!.end);
    }
  }
}
