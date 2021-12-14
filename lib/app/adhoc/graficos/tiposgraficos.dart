import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';

class DadosGrafico {
  DateTime periodo;
  double valor;
  DadosGrafico(this.periodo, this.valor);
}

class DadosGraficoMedia {
  String moeda;
  double valor;
  DadosGraficoMedia(this.moeda, this.valor);
}

class DadosGraficoValorMax {
  String moeda;
  double valor;
  DadosGraficoValorMax(this.moeda, this.valor);
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
    final adhocStoreT = Provider.of<AdhocStore>(context, listen: true);
    return adhocStoreT.tipoAdhoc == 1
        ? DataRow.byIndex(
            index: index,
            cells: [
              celulas(
                DateFormat('dd/MM/yyyy').format(
                    DateTime.parse(graficoStoreT.jsonTabela[index]['data'])),
              ),
              celulas(graficoStoreT.moedaBaseSelec),
              celulas(graficoStoreT.moedaConversaoSelec),
              celulas(
                formatCurrency.format(
                    double.parse(graficoStoreT.jsonTabela[index]['valor'])),
              ),
            ],
          )
        : DataRow.byIndex(
            index: index,
            cells: [
              celulas(
                DateFormat('dd/MM/yyyy').format(DateTime.parse(
                    graficoStoreT.jsonTabelaMedia[index]['inicio'])),
              ),
              celulas(
                DateFormat('dd/MM/yyyy').format(DateTime.parse(
                    graficoStoreT.jsonTabelaMedia[index]['fim'])),
              ),
              celulas("${graficoStoreT.jsonTabelaMedia[index]['moeda_base']}"),
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

/*class DadosTabelaMedia extends DataTableSource {
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
}*/
