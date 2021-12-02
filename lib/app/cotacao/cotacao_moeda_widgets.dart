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
              onTap: () => CotacaoMoedaFunctions(context).pickDateRange(),
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
                    FontAwesomeIcons.share,
                    color: GlobalsStyles(context).corQuaternaria,
                    size: GlobalsStyles(context).tamanhoTextoMedio,
                  ),
                ],
              ),
            ),
          ),
        ),
        Observer(
          builder: (_) {
            return cotacaoMoedaStoreT.jsonCotacao != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      tabelaCotacao(),
                    ],
                  )
                : Container();
          },
        ),
      ],
    );
  }

  Widget tabelaCotacao() {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    final DadosTabela _dadosTabela =
        DadosTabela(cotacaoMoedaStoreT.jsonCotacao.length, context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PaginatedDataTable(
            header: Text(
              'Conversão Moeda',
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
}

class DadosTabela extends DataTableSource {
  int tamanhoJson;
  final int _selectRowCount = 0;
  var formatCurrency = NumberFormat.decimalPattern();
  BuildContext context;
  DadosTabela(this.tamanhoJson, this.context);

  @override
  int get rowCount => tamanhoJson;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectRowCount;

  @override
  DataRow getRow(int index) {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(
            DateFormat('dd/MM/yyyy').format(
                DateTime.parse(cotacaoMoedaStore.jsonCotacao[index]['data'])),
            style: TextStyle(
              color: GlobalsStyles(context).corPrimariaTexto,
              fontSize: GlobalsStyles(context).tamanhoTextoMedio,
            ),
          ),
        ),
        DataCell(
          Text(
            "${cotacaoMoedaStore.jsonCotacao[index]['moeda_base']}",
            style: TextStyle(
              color: GlobalsStyles(context).corPrimariaTexto,
              fontSize: GlobalsStyles(context).tamanhoTextoMedio,
            ),
          ),
        ),
        DataCell(
          Text(
            "${cotacaoMoedaStore.jsonCotacao[index]['moeda_conversao']}",
            style: TextStyle(
              color: GlobalsStyles(context).corPrimariaTexto,
              fontSize: GlobalsStyles(context).tamanhoTextoMedio,
            ),
          ),
        ),
        DataCell(
          Text(
            formatCurrency.format(
                double.parse(cotacaoMoedaStore.jsonCotacao[index]['valor'])),
            style: TextStyle(
              color: GlobalsStyles(context).corPrimariaTexto,
              fontSize: GlobalsStyles(context).tamanhoTextoMedio,
            ),
          ),
        ),
      ],
    );
  }
}
