import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_media/media_page.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/varlormax_page.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_variacao/variacao_page.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/graficos_functions.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/tiposgraficos.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_functions.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AdhocWidgets {
  BuildContext context;
  AdhocWidgets(this.context);

  List<String> listaOpcoesAdhoc = [
    "Variação",
    "Média",
    "Valor Máximo",
  ];

  Widget corpoAdhoc() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Selecione o tipo de pesquisa",
              style: TextStyle(
                color: GlobalsStyles(context).corPrimariaTexto,
                fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        listaOpcoes(),

        ////
      ],
    );
  }

  Widget listaOpcoes() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: listaOpcoesAdhoc.length,
      itemBuilder: (_, int index) {
        return Column(
          children: [
            _selecionaOpcao(listaOpcoesAdhoc[index]),
            SizedBox(
              height: 30,
            ),
          ],
        );
      },
    );
  }

  Widget _selecionaOpcao(titulo) {
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    return GestureDetector(
      onTap: () {
        switch (titulo) {
          case 'Variação':
            adhocStore.setTipoAdhoc(1);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VariacaoPage(),
              ),
            );
            break;
          case 'Média':
            adhocStore.setTipoAdhoc(2);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MediaPage(),
              ),
            );
            break;
          case 'Valor Máximo':
            adhocStore.setTipoAdhoc(3);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ValorMaxPage(),
              ),
            );
            break;
          default:
            null;
        }
      },
      child: Container(
        margin: GlobalsStyles(context).margemPadrao,
        child: Material(
          elevation: GlobalsStyles(context).elevacaoContainers,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
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
                    Text(
                      titulo,
                      style: TextStyle(
                        color: GlobalsStyles(context).corPrimariaTexto,
                        fontSize: GlobalsStyles(context).tamanhoTextoMedio,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      titulo == 'Variação'
                          ? FontAwesomeIcons.chartLine
                          : titulo == 'Média'
                              ? FontAwesomeIcons.ruler
                              : FontAwesomeIcons.arrowUp,
                      color: GlobalsStyles(context).corSecundariaText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selecionaIntervalo() {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    return Row(
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
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Observer(
                  builder: (_) {
                    return Text(
                      cotacaoMoedaStoreT.intervaloData == null
                          ? 'Início'
                          : DateFormat('dd/MM/yyyy')
                              .format(cotacaoMoedaStoreT.intervaloData!.start),
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
          onTap: () => CotacaoMoedaFunctions(context).pickDateRange(),
        ),
      ],
    );
  }

  Widget botaoGerarAdhoc() {
    final adhocStoreT = Provider.of<AdhocStore>(context, listen: true);
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    return Container(
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
            if (adhocStoreT.tipoAdhoc == 1) {
              await GraficosFunctions(context).getDadosGrafico();
              adhocStore.setGerouAdchoc(true);
            } else {
              await graficosStore.setJsonMoedasBase();
              await graficosStore.montaJsonEnvioPesquisa();
              await GraficosFunctions(context).getDadosGrafico();
              adhocStore.setGerouAdchoc(true);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Gerar",
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
    );
  }

  Widget _graficoAdhoc() {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    final adhocStoreT = Provider.of<AdhocStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return graficosStoreT.listaSeries.isNotEmpty &&
                adhocStoreT.tipoAdhoc == 1
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
            : graficosStoreT.listaSeriesMedia.isNotEmpty &&
                    adhocStoreT.tipoAdhoc == 2
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: charts.BarChart(
                              graficosStoreT.listaSeriesMedia,
                              animate: true,
                              domainAxis: charts.OrdinalAxisSpec(
                                showAxisLine: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : graficosStoreT.listaSeriesValorMax.isNotEmpty &&
                        adhocStoreT.tipoAdhoc == 3
                    ? Container()
                    : Container();
      },
    );
  }

  Widget _tabelaAdhoc() {
    final graficoStoreT = Provider.of<GraficosStore>(context, listen: true);
    final adhocStore = Provider.of<AdhocStore>(context, listen: true);
    final DadosTabelaAdhoc _dadosTabela = DadosTabelaAdhoc(
        adhocStore.tipoAdhoc == 1
            ? graficoStoreT.jsonTabela.length
            : adhocStore.tipoAdhoc == 2
                ? graficoStoreT.jsonTabelaMedia.length
                : graficoStoreT.jsonValorMax.length,
        context);
    return Observer(
      builder: (_) {
        return graficoStoreT.jsonTabela != null && adhocStore.tipoAdhoc == 1
            ? Row(
                children: [
                  Expanded(
                    child: PaginatedDataTable(
                      header: Text(
                        'Variação',
                        style: TextStyle(
                          color: GlobalsStyles(context).corPrimariaTexto,
                          fontSize: GlobalsStyles(context).tamanhoTitulo,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      source: _dadosTabela,
                      columns: [
                        colunas('Data'),
                        colunas('M. Base'),
                        colunas('M. Conversão'),
                        colunas('Valor'),
                      ],
                    ),
                  ),
                ],
              )
            : graficoStoreT.jsonTabelaMedia != null && adhocStore.tipoAdhoc == 2
                ? Row(
                    children: [
                      Expanded(
                        child: PaginatedDataTable(
                          header: Text(
                            'Média',
                            style: TextStyle(
                              color: GlobalsStyles(context).corPrimariaTexto,
                              fontSize: GlobalsStyles(context).tamanhoTitulo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          source: _dadosTabela,
                          columns: [
                            colunas('Inicio'),
                            colunas('Fim'),
                            colunas('M. Base'),
                            colunas('Valor'),
                          ],
                        ),
                      ),
                    ],
                  )
                : Container();
      },
    );
  }

  DataColumn colunas(String titulo) {
    return DataColumn(
      label: Text(
        titulo,
        style: TextStyle(
          color: GlobalsStyles(context).corSecundariaText,
          fontSize: GlobalsStyles(context).tamanhoTextoMedio,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget graficoTabela() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
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
                FontAwesomeIcons.table,
                color: graficosStoreT.tipoGrafico == 2
                    ? GlobalsStyles(context).corSecundariaText
                    : GlobalsStyles(context).corPrimariaTexto,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        graficosStoreT.tipoGrafico == 1 ? _graficoAdhoc() : _tabelaAdhoc(),
      ],
    );
  }
}
