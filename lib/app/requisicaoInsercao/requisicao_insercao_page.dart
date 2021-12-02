import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/requisicao_insercao_functions.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/requisicao_insercao_widgets.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoPage extends StatefulWidget {
  const RequisicaoInsercaoPage({Key? key}) : super(key: key);

  @override
  _RequisicaoInsercaoPageState createState() => _RequisicaoInsercaoPageState();
}

class _RequisicaoInsercaoPageState extends State<RequisicaoInsercaoPage> {
  Future carregaDados() async {
    final cotacaoMoedaStore =
        Provider.of<CotacaoMoedaStore>(context, listen: false);
    final requisicaoInsercaoStore =
        Provider.of<RequisicaoInsercaoStore>(context, listen: false);
    requisicaoInsercaoStore.listaSearchOrigin.clear();
    requisicaoInsercaoStore.listaSearchString.clear();
    requisicaoInsercaoStore.jsonApi.clear();
    cotacaoMoedaStore.moedaSelec = '';

    await RequisicaoInsercaoFunctions(context).getDadosApi();
  }

  @override
  void initState() {
    super.initState();
    carregaDados();
  }

  @override
  Widget build(BuildContext context) {
    final requisicaoInsercaoStoreT =
        Provider.of<RequisicaoInsercaoStore>(context, listen: true);
    return SafeArea(
      child: Observer(
        builder: (_) {
          return Scaffold(
            body: requisicaoInsercaoStoreT.carregandoPagina
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GlobalsWidgets(context).estruturaPaginas(
                    RequisicaoInsercaoWidgets(context)
                        .corpoRequisicaoInsercao(),
                  ),
          );
        },
      ),
    );
  }
}
