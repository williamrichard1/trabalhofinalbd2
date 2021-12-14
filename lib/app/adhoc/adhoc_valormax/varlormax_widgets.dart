import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/store/valormax_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_widgets.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';

class ValorMaxWidgets {
  BuildContext context;
  ValorMaxWidgets(this.context);

  Widget corpoValorMax() {
    final adhocStoreT = Provider.of<AdhocStore>(context, listen: true);

    return Observer(
      builder: (_) {
        return !adhocStoreT.gerouAdhoc
            ? Column(
                children: [
                  selecionaMoedaBase('Base'),
                  SizedBox(
                    height: 30,
                  ),
                  listaMoedas('Base'),
                  SizedBox(
                    height: 10,
                  ),
                  selecionaMoedaBase('Conversao'),
                  SizedBox(
                    height: 30,
                  ),
                  listaMoedas('Conversao'),
                  SizedBox(
                    height: 10,
                  ),
                  AdhocWidgets(context).selecionaIntervalo(),
                  SizedBox(
                    height: 20,
                  ),
                  digitaValorMax(),
                  SizedBox(
                    height: 30,
                  ),
                  AdhocWidgets(context).botaoGerarAdhoc(),
                ],
              )
            : AdhocWidgets(context).graficoTabela();
      },
    );
  }

  Widget selecionaMoedaBase(String tipoMoeda) {
    final valorMaxStore = Provider.of<ValorMaxStore>(context, listen: false);
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    return Observer(
      builder: (_) {
        return GestureDetector(
          onTap: () {
            switch (tipoMoeda) {
              case 'Base':
                valorMaxStore.setTipoMoeda(tipoMoeda);
                valorMaxStore.trocaVisibilidadeListaMoedas();

                break;
              case 'Conversao':
                valorMaxStore.setTipoMoeda(tipoMoeda);
                valorMaxStore.trocaVisibilidadeListaMoedasConversao();

                break;
              default:
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
                margin: EdgeInsets.only(left: 10),
                child: TextField(
                  maxLines: null,
                  //controller: ,
                  textAlign: TextAlign.start,
                  enableInteractiveSelection: false,
                  enabled: false,
                  readOnly: true,
                  decoration: tipoMoeda == 'Base'
                      ? InputDecoration(
                          hintText: graficosStoreT.moedaBaseSelec == ''
                              ? "Selecione a Moeda base"
                              : graficosStoreT.nomeMoedaBaseSelec,
                          hintStyle: TextStyle(
                            color: GlobalsStyles(context).corPrimariaTexto,
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(FontAwesomeIcons.chevronCircleDown),
                        )
                      : InputDecoration(
                          hintText: graficosStoreT.moedaConversaoSelec == ''
                              ? "Selecione a Moeda de conversão"
                              : graficosStoreT.nomeMoedaConversaoSelec,
                          hintStyle: TextStyle(
                            color: GlobalsStyles(context).corPrimariaTexto,
                          ),
                          border: InputBorder.none,
                          suffixIcon: Icon(FontAwesomeIcons.chevronCircleDown),
                        ),
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

  Widget listaMoedas(tipoMoeda) {
    final graficosStoreT = Provider.of<GraficosStore>(context, listen: true);
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    final valorMaxStoreT = Provider.of<ValorMaxStore>(context, listen: true);
    final valorMaxStore = Provider.of<ValorMaxStore>(context, listen: false);
    return Observer(
      builder: (_) {
        return Visibility(
          visible: tipoMoeda == 'Base'
              ? valorMaxStoreT.visibilidadeListaMoedas
              : valorMaxStoreT.visibilidadeListaMoedasConversao,
          child: tipoMoeda == 'Base'
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: graficosStoreT.listaMoedasGrafico.length,
                  itemBuilder: (_, int index) {
                    return Container(
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
                )
              : ListView.builder(
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
                                  "MOEDA CONVERSAO SELEC>> ${graficosStoreT.listaMoedasGrafico[index]["sigla"]}");
                              graficosStore.setMoedaConversaoSelec(
                                  graficosStoreT.listaMoedasGrafico[index]
                                      ["sigla"]);
                              graficosStore.setNomeMoedaConversaoSelec(
                                  graficosStoreT.listaMoedasGrafico[index]
                                      ["nome"]);

                              valorMaxStore
                                  .trocaVisibilidadeListaMoedasConversao();
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
                    );
                  },
                ),
        );
      },
    );
  }

  Widget digitaValorMax() {
    final valorMaxStore = Provider.of<ValorMaxStore>(context, listen: false);
    return Container(
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
            controller: valorMaxStore.controllerValorMaximo,
            textAlign: TextAlign.start,
            enableInteractiveSelection: false,
            enabled: true,
            readOnly: false,
            decoration: InputDecoration(
              hintText: "Digite o valor máximo",
              hintStyle: TextStyle(
                color: GlobalsStyles(context).corPrimariaTexto,
              ),
              border: InputBorder.none,
              suffixIcon: Icon(
                FontAwesomeIcons.dollarSign,
                color: GlobalsStyles(context).corSecundariaText,
              ),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: GlobalsStyles(context).corPrimariaTexto,
              fontWeight: FontWeight.bold,
              fontSize: GlobalsStyles(context).tamanhoTextoMedio,
            ),
          ),
        ),
      ),
    );
  }
}
