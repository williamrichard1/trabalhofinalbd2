import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        Provider<HomePageStore>(
          create: (_) => HomePageStore(),
        ),
        Provider<RequisicaoInsercaoStore>(
          create: (_) => RequisicaoInsercaoStore(),
        ),
        Provider<GlobalsStore>(
          create: (_) => GlobalsStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
