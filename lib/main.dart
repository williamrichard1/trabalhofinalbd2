import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_media/store/media_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_valormax/store/valormax_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_variacao/store/variacao_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/graficos/store/graficos_store.dart';
import 'package:trabalhofinalbd2/app/adhoc/store/adhoc_store.dart';
import 'package:trabalhofinalbd2/app/cotacao/store/cotacao_moeda_store.dart';
import 'package:trabalhofinalbd2/app/globals/store/globals_store.dart';
import 'package:trabalhofinalbd2/app/home/home_page.dart';
import 'package:trabalhofinalbd2/app/home/store/home_page_store.dart';
import 'package:trabalhofinalbd2/app/requisicaoInsercao/store/requisicao_insercao_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AdhocStore>(
          create: (_) => AdhocStore(),
        ),
        //
        Provider<HomePageStore>(
          create: (_) => HomePageStore(),
        ),
        //
        Provider<RequisicaoInsercaoStore>(
          create: (_) => RequisicaoInsercaoStore(),
        ),
        //
        Provider<GlobalsStore>(
          create: (_) => GlobalsStore(),
        ),
        //
        Provider<GraficosStore>(
          create: (_) => GraficosStore(),
        ),
        //
        Provider<CotacaoMoedaStore>(
          create: (_) => CotacaoMoedaStore(),
        ),
        //
        Provider<VariacaoStore>(
          create: (_) => VariacaoStore(),
        ),
        //
        Provider<MediaStore>(
          create: (_) => MediaStore(),
        ),
        //
        Provider<ValorMaxStore>(
          create: (_) => ValorMaxStore(),
        ),
        //
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
