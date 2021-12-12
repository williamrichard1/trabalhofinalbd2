import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_functions.dart';
import 'package:trabalhofinalbd2/app/graficos/graficos_widgets.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosPage extends StatefulWidget {
  const GraficosPage({Key? key}) : super(key: key);

  @override
  _GraficosPageState createState() => _GraficosPageState();
}

class _GraficosPageState extends State<GraficosPage> {
  Future carregaDados() async {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    graficosStore.setTipoGrafico(1);
    await GraficosFunctions(context).getDadosGraficos();

    graficosStore.setDadosGrafico();
  }

  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return SafeArea(
      child: Observer(
        builder: (_) {
          return Scaffold(
            backgroundColor: GlobalsStyles(context).corBackGround,
            body: graficosStoreT.carregandoPagina
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GlobalsWidgets(context).estruturaPaginas(
                    GraficosWidgets(context).corpoGraficos(),
                  ),
          );
        },
      ),
    );
  }
}
