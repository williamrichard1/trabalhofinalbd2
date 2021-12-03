import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
//import 'package:trabalhofinalbd2/app/home/home_page_functions.dart';
import 'package:trabalhofinalbd2/app/home/home_page_widgets.dart';
import 'package:trabalhofinalbd2/app/home/store/home_page_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*Future iniciaHome() async {
    await HomePageFunctions(context).limpaBancoDeDados();
  }*/

  @override
  void initState() {
    super.initState();
    //iniciaHome();
  }

  @override
  Widget build(BuildContext context) {
    final homePageStoreT = Provider.of<HomePageStore>(context, listen: true);
    return SafeArea(
      child: Observer(
        builder: (_) {
          return Scaffold(
            backgroundColor: GlobalsStyles(context).corBackGround,
            body: homePageStoreT.carregandoPagina
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Container(
                      child: HomePageWidgets(context).corpoHome(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
