import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

class RequisicaoInsercaoWidgets {
  BuildContext context;
  RequisicaoInsercaoWidgets(this.context);

  Widget corpoRequisicaoInsercao() {
    final requisicaoInsercaoStoreT =
        Provider.of<RequisicaoInsercaoStore>(context, listen: true);
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: requisicaoInsercaoStoreT.jsonApi.length,
      itemBuilder: (_, int index) {
        return Column(
          children: [
            Text("${requisicaoInsercaoStoreT.jsonApi[index]['nome']}"),
            SizedBox(
              height: 10,
            ),
          ],
        );
      },
    );
  }
}
