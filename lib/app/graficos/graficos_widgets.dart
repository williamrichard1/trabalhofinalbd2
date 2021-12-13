import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_functions.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_functions.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosWidgets {
  BuildContext context;
  GraficosWidgets(this.context);

  Widget corpoGraficos() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
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
                    FontAwesomeIcons.chartLine,
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
                SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: () {
                    graficosStore.setTipoGrafico(3);
                  },
                  child: Icon(
                    FontAwesomeIcons.table,
                    color: graficosStoreT.tipoGrafico == 3
                        ? GlobalsStyles(context).corSecundariaText
                        : GlobalsStyles(context).corPrimariaTexto,
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
                      elevation: GlobalsStyles(context).elevacaoContainers,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 35,
                        width: MediaQuery.of(context).size.width / 4,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                fontSize:
                                    GlobalsStyles(context).tamanhoTextoMedio,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  onTap: () => CotacaoMoedaFunctions(context).pickDateRange(),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward,
                    color: GlobalsStyles(context).corSecundariaText),
                SizedBox(width: 8),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Material(
                      elevation: GlobalsStyles(context).elevacaoContainers,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 35,
                        width: MediaQuery.of(context).size.width / 4,
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                fontSize:
                                    GlobalsStyles(context).tamanhoTextoMedio,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  onTap: () => CotacaoMoedaFunctions(context).pickDateRange(),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            selecionaMoedaBase(),
            SizedBox(
              height: 20,
            ),
            listaMoedas(),
            SizedBox(
              height: 20,
            ),
            selecionaMoedaConversao(),
            SizedBox(
              height: 20,
            ),
            listaMoedasConversao(),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: GlobalsStyles(context).margemBotao,
              height: GlobalsStyles(context).tamanhoBotao(),
              child: Material(
                elevation: GlobalsStyles(context).elevacaoContainers,
                color: GlobalsStyles(context).corPrimariaTexto,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextButton(
                  onPressed: () async {
                    if (graficosStoreT.tipoGrafico == 1) {
                      await GraficosFunctions(context).getDadosGrafico();
                    } else if (graficosStoreT.tipoGrafico == 2) {
                      await graficosStore.setJsonMoedasBase();
                      //await graficosStore.montaJsonEnvioPesquisa();
                      await GraficosFunctions(context).getDadosGrafico();
                    } else {}
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Criar Gráfico",
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
            SizedBox(
              height: 20,
            ),
            graficosStoreT.tipoGrafico == 1
                ? _graficoLinhas()
                : graficosStoreT.tipoGrafico == 2
                    ? _tabela()
                    : Container()
          ],
        );
      },
    );
  }

  Widget _graficoLinhas() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return graficosStoreT.listaSeries.isNotEmpty
            ? Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height / 1.5,
                child: Center(
                  child: Column(
                    children: [
                      Expanded(
                        child: charts.TimeSeriesChart(
                          graficosStoreT.listaSeries,
                          animate: true,
                          primaryMeasureAxis: charts.NumericAxisSpec(
                            tickProviderSpec:
                                charts.BasicNumericTickProviderSpec(
                                    desiredTickCount: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container();
      },
    );
  }

  Widget _tabela() {
    return Container();
  }

  Widget selecionaMoedaBase() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            graficosStore.trocaVisibilidade1();
          },
          child: Container(
            margin: GlobalsStyles(context).margemPadrao,
            child: Material(
              elevation: GlobalsStyles(context).elevacaoContainers,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextField(
                  maxLines: null,
                  //controller: ,
                  textAlign: TextAlign.start,
                  enableInteractiveSelection: false,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: graficosStoreT.moedaBaseSelec == ''
                          ? "Selecione a Moeda base"
                          : graficosStoreT.nomeMoedaBaseSelec,
                      hintStyle: TextStyle(
                        color: GlobalsStyles(context).corPrimariaTexto,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(FontAwesomeIcons.chevronCircleDown)),
                  style: TextStyle(
                    color: GlobalsStyles(context).corPrimariaTexto,
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget selecionaMoedaConversao() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            graficosStore.trocaVisibilidade2();
          },
          child: Container(
            margin: GlobalsStyles(context).margemPadrao,
            child: Material(
              elevation: GlobalsStyles(context).elevacaoContainers,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: TextField(
                  maxLines: null,
                  //controller: ,
                  textAlign: TextAlign.start,
                  enableInteractiveSelection: false,
                  enabled: false,
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: graficosStoreT.moedaConversaoSelec == ''
                          ? "Selecione a moeda de conversão"
                          : graficosStoreT.nomeMoedaConversaoSelec,
                      hintStyle: TextStyle(
                        color: GlobalsStyles(context).corPrimariaTexto,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(FontAwesomeIcons.chevronCircleDown)),
                  style: TextStyle(
                    color: GlobalsStyles(context).corPrimariaTexto,
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listaMoedas() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Visibility(
          visible: graficosStoreT.visibilidadeListaMoedas,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: graficosStoreT.listaMoedasGrafico.length,
            itemBuilder: (_, int index) {
              return graficosStoreT.tipoGrafico == 1
                  ? Container(
                      margin: GlobalsStyles(context).margemPadrao,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print(
                                  "MOEDA BASE SELEC>> ${graficosStoreT.listaMoedasGrafico[index]["sigla"]}");
                              graficosStore.setMoedaBaseSelec(graficosStoreT
                                  .listaMoedasGrafico[index]["sigla"]);
                              graficosStore.setNomeMoedaBaseSelec(graficosStoreT
                                  .listaMoedasGrafico[index]["nome"]);

                              graficosStore.trocaVisibilidade1();
                            },
                            child: Row(
                              children: [
                                Text(
                                  graficosStoreT.listaMoedasGrafico[index]
                                      ["nome"],
                                  style: TextStyle(
                                    color:
                                        GlobalsStyles(context).corPrimariaTexto,
                                    fontSize: GlobalsStyles(context)
                                        .tamanhoTextoMedio,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: GlobalsStyles(context).margemPadrao,
                      child: Column(
                        children: [
                          Observer(builder: (_) {
                            return CheckboxListTile(
                              title: Text(graficosStoreT
                                  .listaMoedasGrafico[index]['nome']),
                              value: graficosStoreT.listaValues[index],
                              onChanged: (value) {
                                graficosStore.addListaAuxiliarMoedas(
                                    graficosStoreT.listaMoedasGrafico[index]
                                        ['sigla']);
                                graficosStore.trocaValue(index, value);
                              },
                            );
                          }),
                        ],
                      ),
                    );
            },
          ),
        );
      },
    );
  }

  Widget listaMoedasConversao() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Visibility(
          visible: graficosStoreT.visibilidadeListaMoedas2,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: graficosStoreT.listaMoedasGrafico.length,
            itemBuilder: (_, int index) {
              return Container(
                margin: GlobalsStyles(context).margemPadrao,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(
                            "MOEDA BASE SELEC>> ${graficosStoreT.listaMoedasGrafico[index]["sigla"]}");
                        graficosStore.setMoedaConversaoSelec(
                            graficosStoreT.listaMoedasGrafico[index]["sigla"]);
                        graficosStore.setNomeMoedaConversaoSelec(
                            graficosStoreT.listaMoedasGrafico[index]["nome"]);

                        graficosStore.trocaVisibilidade2();
                      },
                      child: Row(
                        children: [
                          Text(
                            graficosStoreT.listaMoedasGrafico[index]["nome"],
                            style: TextStyle(
                              color: GlobalsStyles(context).corPrimariaTexto,
                              fontSize:
                                  GlobalsStyles(context).tamanhoTextoMedio,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DadosGrafico {
  DateTime timeStamp;
  double valor;
  DadosGrafico(this.timeStamp, this.valor);
}


/*Widget _graficoPizza() {
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
  }*/

  /*Widget _graficoBarras() {
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
  }*/