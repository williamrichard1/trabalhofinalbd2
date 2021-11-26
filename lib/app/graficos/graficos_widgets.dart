import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosWidgets {
  BuildContext context;
  GraficosWidgets(this.context);

  Widget corpoGraficos() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Center(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                return Expanded(
                  child: charts.PieChart<String>(
                    graficosStore.listaSeries,
                    animate: true,
                    animationDuration: Duration(seconds: 2),
                    behaviors: [
                      charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: graficosStore.jsonMapFinal.length,
                        cellPadding: EdgeInsets.only(right: 4, bottom: 4),
                        entryTextStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.purple.shadeDefault,
                          fontFamily: 'Georgia',
                          fontSize: 11,
                        ),
                      ),
                    ],
                    defaultRenderer: charts.ArcRendererConfig(
                      arcWidth: 100,
                      arcRendererDecorators: [
                        charts.ArcLabelDecorator(
                          labelPosition: charts.ArcLabelPosition.outside,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DadosGrafico {
  String legendaGrafico = '';
  double valorGrafico;
  Color corMostrada = Colors.transparent;

  DadosGrafico(this.legendaGrafico, this.valorGrafico, this.corMostrada);
}
