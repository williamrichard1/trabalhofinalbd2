import 'package:flutter/material.dart';
import 'package:trabalhofinalbd2/app/globals/globals_widgets.dart';

class GraficosPage extends StatefulWidget {
  const GraficosPage({Key? key}) : super(key: key);

  @override
  _GraficosPageState createState() => _GraficosPageState();
}

class _GraficosPageState extends State<GraficosPage> {
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
