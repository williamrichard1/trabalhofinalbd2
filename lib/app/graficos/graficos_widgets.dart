import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/graficos/store/graficos_store.dart';

class GraficosWidgets {
  BuildContext context;
  GraficosWidgets(this.context);

  Widget corpoGraficos() {
    final graficosStore = Provider.of<GraficosStore>(context, listen: false);
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height/4,
      child: Center(
        child: Column(
          children: [
            Observer(builder: (_){
              return Expanded(
              child: charts.PieChart(
                graficosStore.listaSeries,
                animate: true,
                animationDuration: Duration(seconds: 2),
              ),
            );
            },),
          ],
        ),
      ),
    );
  }
}

class Task {
  String task = '';
  double taskValue;
  Color colorVal = Colors.transparent;

  Task(this.task, this.taskValue, this.colorVal);
}
