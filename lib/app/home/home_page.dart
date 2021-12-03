import 'package:flutter/material.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/home/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalsStyles(context).corBackGround,
        body: SingleChildScrollView(
          child: Container(
            child: HomePageWidgets(context).corpoHome(),
          ),
        ),
      ),
    );
  }
}
