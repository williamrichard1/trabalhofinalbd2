import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trabalhofinalbd2/app/globals/globals_styles.dart';
import 'package:trabalhofinalbd2/app/globals/store/globals_store.dart';

class GlobalsWidgets {
  BuildContext context;
  GlobalsWidgets(this.context);

  Widget logoUnifei() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Image.asset('assets/logoUnifei.png'),
    );
  }

  Widget appBar() {
    final globalsStoreT = Provider.of<GlobalsStore>(context, listen: true);
    return SafeArea(
      child: Container(
        height: 65,
        padding: EdgeInsets.fromLTRB(5, 8, 10, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 250, 255, 0.9),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.transparent,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                          offset: Offset(1, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(90.0),
                      ),
                    ),
                    child: IconButton(
                      iconSize: 20,
                      icon: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: GlobalsStyles(context).corPrimariaTexto,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
              child: Center(
                child: Text(
                  globalsStoreT.tituloAppBar,
                  style: TextStyle(
                    color: GlobalsStyles(context).corPrimariaTexto,
                    fontWeight: FontWeight.bold,
                    fontSize: GlobalsStyles(context).tamanhoTitulo,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget estruturaPaginas(Widget corpoPagina) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        GlobalsWidgets(context).appBar(),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          child: corpoPagina,
        ),
      ],
    );
  }
}
