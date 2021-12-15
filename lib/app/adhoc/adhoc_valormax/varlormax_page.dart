import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/store/valormax_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/varlormax_widgets.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/graficos_functions.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class ValorMaxPage extends StatefulWidget {
  const ValorMaxPage({Key? key}) : super(key: key);

  @override
  _ValorMaxPageState createState() => _ValorMaxPageState();
}

class _ValorMaxPageState extends State<ValorMaxPage> {
  Future carregaDados() async {
    final adhocStore = Provider.of<AdhocStore>(context, listen: false);
    final graficoStore = Provider.of<GraficosStore>(context, listen: false);
    final valorMaxStore = Provider.of<ValorMaxStore>(context, listen: false);
    adhocStore.setGerouAdchoc(false);
    graficoStore.setMoedaBaseSelec('');
    graficoStore.setMoedaConversaoSelec('');
    valorMaxStore.controllerValorMaximo.clear();
    graficoStore.setTipoGrafico(1);

    await GraficosFunctions(context).getListaMoedas();
  }

  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: false);
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
                    ValorMaxWidgets(context).corpoValorMax(),
                  ),
          );
        },
      ),
    );
  }
}
