import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosWidgets {
  BuildContext context;
  GraficosWidgets(this.context);

  Widget corpoGraficos() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    graficosStore.setTipoGrafico(1);
                  },
                  child: Icon(
                    FontAwesomeIcons.chartPie,
                    color: graficosStoreT.tipoGrafico == 1
                        ? GlobalsStyles(context).corSecundariaText
                        : GlobalsStyles(context).corPrimariaTexto,
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    graficosStore.setTipoGrafico(2);
                  },
                  child: Icon(
                    FontAwesomeIcons.chartBar,
                    color: graficosStoreT.tipoGrafico == 2
                        ? GlobalsStyles(context).corSecundariaText
                        : GlobalsStyles(context).corPrimariaTexto,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            graficosStoreT.tipoGrafico == 1
                ? _graficoPizza()
                : _graficoBarras(),
          ],
        );
      },
    );
  }

  Widget _graficoPizza() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.8,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: charts.PieChart<String>(
                graficosStoreT.listaSeries,
                animate: true,
                animationDuration: Duration(seconds: 2),
                behaviors: [
                  charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: graficosStoreT.jsonMapFinal.length,
                    cellPadding: EdgeInsets.only(right: 4, bottom: 4),
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.gray.shade900,
                      fontFamily: 'Georgia',
                      fontSize: 12,
                    ),
                  ),
                ],
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 100,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      outsideLabelStyleSpec: charts.TextStyleSpec(
                        fontSize: 15,
                      ),
                      labelPosition: charts.ArcLabelPosition.outside,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _graficoBarras() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                graficosStoreT.listaSeries,
                animate: true,
                barGroupingType: charts.BarGroupingType.stacked,
                barRendererDecorator: charts.BarLabelDecorator(
                  labelAnchor: charts.BarLabelAnchor.middle,
                  outsideLabelStyleSpec: charts.TextStyleSpec(
                    color: charts.MaterialPalette.white,
                  ),
                ),
                animationDuration: Duration(seconds: 2),
                primaryMeasureAxis: charts.NumericAxisSpec(
                  renderSpec: charts.NoneRenderSpec(),
                ),
                domainAxis: charts.OrdinalAxisSpec(
                  // Make sure that we draw the domain axis line.
                  showAxisLine: true,
                  // But don't draw anything else.
                  renderSpec: charts.NoneRenderSpec(),
                ),
                behaviors: [
                  charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    showMeasures: false,
                    desiredMaxRows: graficosStoreT.jsonMapFinal.length,
                    cellPadding: EdgeInsets.only(right: 4, bottom: 4),
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.gray.shade900,
                      fontFamily: 'Georgia',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
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
