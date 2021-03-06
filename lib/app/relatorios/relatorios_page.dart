import 'package:flutter/material.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class RelatoriosPage extends StatefulWidget {
  const RelatoriosPage({Key? key}) : super(key: key);

  @override
  _RelatoriosPageState createState() => _RelatoriosPageState();
}

class _RelatoriosPageState extends State<RelatoriosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            GlobalsWidgets(context).appBar(),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
