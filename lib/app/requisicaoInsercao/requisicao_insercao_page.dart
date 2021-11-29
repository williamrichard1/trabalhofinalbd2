import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
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
