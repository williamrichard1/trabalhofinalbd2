import 'package:flutter/material.dart';

class HomePageWidgets {
  BuildContext context;
  HomePageWidgets(this.context);

  Widget corpoHome() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          Text("TESTE"),
          Text("OUTRO TESTE"),
        ],
      ),
    );
  }
}
