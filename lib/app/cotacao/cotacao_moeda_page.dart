import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_functions.dart';
import 'package:trabalhofinalbd2/app/cotacao/cotacao_moeda_widgets.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class CotacaoMoedaPage extends StatefulWidget {
  const CotacaoMoedaPage({Key? key}) : super(key: key);

  @override
  _CotacaoMoedaPageState createState() => _CotacaoMoedaPageState();
}

class _CotacaoMoedaPageState extends State<CotacaoMoedaPage> {
  /*Future carregaDados() async {
    await CotacaoMoedaFunctions(context).getCotacao();
  }*/

  @override
  void initState() {
    super.initState();
    //carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    final cotacaoMoedaStoreT =
        Provider.of<CotacaoMoedaStore>(context, listen: true);
    return SafeArea(
      child: Observer(
        builder: (_) {
          return Scaffold(
            body: cotacaoMoedaStoreT.carregandoPagina
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GlobalsWidgets(context).estruturaPaginas(
                    CotacaoMoedaWidgets(context).corpoCotacao(),
                  ),
          );
        },
      ),
    );
  }
}
