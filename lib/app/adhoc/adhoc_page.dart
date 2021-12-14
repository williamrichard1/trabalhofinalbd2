import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalhofinalbd2/app/adhoc/adhoc_widgets.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class AdhocPage extends StatefulWidget {
  const AdhocPage({Key? key}) : super(key: key);

  @override
  _AdhocPageState createState() => _AdhocPageState();
}

class _AdhocPageState extends State<AdhocPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) {
          return Scaffold(
            backgroundColor: GlobalsStyles(context).corBackGround,
            body: GlobalsWidgets(context).estruturaPaginas(
              AdhocWidgets(context).corpoAdhoc(),
            ),
          );
        },
      ),
    );
  }
}
