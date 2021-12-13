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
                    FontAwesomeIcons.table,
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
                    FontAwesomeIcons.ruler,
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
                    if (graficosStoreT.tipoGrafico == 1 ||
                        graficosStoreT.tipoGrafico == 2) {
                      await GraficosFunctions(context).getDadosGrafico();
                    } else {
                      await graficosStore.setJsonMoedasBase();
                      await graficosStore.montaJsonEnvioPesquisa();
                      await GraficosFunctions(context).getDadosGrafico();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gerar Adhoc",
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
                : graficosStoreT.tipoGrafico == 2 && graficosStoreT.jsonTabela != null
                    ? tabelaAdhoc()
                    : graficosStoreT.tipoGrafico == 3 &&
                            graficosStoreT.jsonTabelaMedia != null
                        ? tabelaAdhocMedia()
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
              return graficosStoreT.tipoGrafico == 1 ||
                      graficosStoreT.tipoGrafico == 2
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
                          Observer(
                            builder: (_) {
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
                            },
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

  Widget tabelaAdhoc() {
    final graficoStoreT = Provider.of<GraficosStore>(context, listen: true);
    final DadosTabelaAdhoc _dadosTabela =
        DadosTabelaAdhoc(graficoStoreT.jsonTabela.length, context);
    return Observer(builder: (_) {
      return graficoStoreT.jsonTabela != null
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
          : Container();
    });
  }

  Widget tabelaAdhocMedia() {
    final graficoStoreT = Provider.of<GraficosStore>(context, listen: true);
    final DadosTabelaMedia _dadosTabela =
        DadosTabelaMedia(graficoStoreT.jsonTabelaMedia.length, context);
    return Observer(
      builder: (_) {
        return graficoStoreT.jsonTabelaMedia != null
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
                        colunasMedia('Inicio'),
                        colunasMedia('Fim'),
                        colunasMedia('M. Base'),
                        /*colunas('M. Conversão'),*/
                        colunasMedia('Valor'),
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

  DataColumn colunasMedia(String titulo) {
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
}

class DadosGrafico {
  DateTime timeStamp;
  double valor;
  DadosGrafico(this.timeStamp, this.valor);
}

class DadosTabelaAdhoc extends DataTableSource {
  int tamanhoJson;
  final int _selectRowCount = 0;
  var formatCurrency = NumberFormat.decimalPattern();
  BuildContext context;
  DadosTabelaAdhoc(this.tamanhoJson, this.context);

  @override
  int get rowCount => tamanhoJson;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectRowCount;

  @override
  DataRow getRow(int index) {
    final graficoStoreT = Provider.of<GraficosStore>(context, listen: true);
    return DataRow.byIndex(
      index: index,
      cells: [
        celulas(
          DateFormat('dd/MM/yyyy')
              .format(DateTime.parse(graficoStoreT.jsonTabela[index]['data'])),
        ),
        celulas(graficoStoreT.moedaBaseSelec),
        celulas(graficoStoreT.moedaConversaoSelec),
        celulas(
          formatCurrency
              .format(double.parse(graficoStoreT.jsonTabela[index]['valor'])),
        ),
      ],
    );
  }

  DataCell celulas(String dadoCelula) {
    return DataCell(
      Text(
        dadoCelula,
        style: TextStyle(
          color: GlobalsStyles(context).corPrimariaTexto,
          fontSize: GlobalsStyles(context).tamanhoTextoMedio,
        ),
      ),
    );
  }
}

class DadosTabelaMedia extends DataTableSource {
  int tamanhoJson;
  final int _selectRowCount = 0;
  var formatCurrency = NumberFormat.decimalPattern();
  BuildContext context;
  DadosTabelaMedia(this.tamanhoJson, this.context);

  @override
  int get rowCount => tamanhoJson;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectRowCount;

  @override
  DataRow getRow(int index) {
    final graficoStoreT = Provider.of<GraficosStore>(context, listen: true);
    return DataRow.byIndex(
      index: index,
      cells: [
        celulas(
          DateFormat('dd/MM/yyyy').format(
              DateTime.parse(graficoStoreT.jsonTabelaMedia[index]['inicio'])),
        ),
        celulas(
          DateFormat('dd/MM/yyyy').format(
              DateTime.parse(graficoStoreT.jsonTabelaMedia[index]['fim'])),
        ),
        celulas("${graficoStoreT.jsonTabelaMedia[index]['moeda_base']}"),
        /*celulas("${graficoStoreT.jsonTabela[index]['moeda_conversao']}"),*/
        celulas(
          '${graficoStoreT.jsonTabelaMedia[index]['valores']}',
        ),
      ],
    );
  }

  DataCell celulas(String dadoCelula) {
    return DataCell(
      Text(
        dadoCelula,
        style: TextStyle(
          color: GlobalsStyles(context).corPrimariaTexto,
          fontSize: GlobalsStyles(context).tamanhoTextoMedio,
        ),
      ),
    );
  }
}
