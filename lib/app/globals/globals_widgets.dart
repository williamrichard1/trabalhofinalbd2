import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
    return Container(
      height: 65,
      padding: EdgeInsets.fromLTRB(5, 8, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Container(
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
    );
  }

  Widget estruturaPaginas(Widget corpoPagina) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GlobalsWidgets(context).appBar(),
            SizedBox(
              height: 20,
            ),
            corpoPagina,
          ],
        ),
      ),
    );
  }

  Future alertSucesso(Function funcaoRecebida) async {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(color: GlobalsStyles(context).corPrimariaTexto),
      titleTextAlign: TextAlign.center,
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 400),
      alertElevation: 0,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      alertAlignment: Alignment.center,
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.success,
      title: "Dados Enviados ",
      desc: "Dados enviados com Sucesso, clique em OK para continuar",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: GlobalsStyles(context).corTerciaria,
              fontSize: 20,
            ),
          ),
          onPressed: () async {
            Navigator.of(context).pop();
            await funcaoRecebida();
          },
          color: GlobalsStyles(context).corPrimariaTexto,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }

  Future alertSemInternet() async {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(color: GlobalsStyles(context).corPrimariaTexto),
      titleTextAlign: TextAlign.center,
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 400),
      alertElevation: 0,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      alertAlignment: Alignment.center,
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: "Sem Internet",
      desc: "Você precisa estar conectado à internet",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: GlobalsStyles(context).corTerciaria,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: GlobalsStyles(context).corPrimariaTexto,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }

  Future alertErroEnvio() async {
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(color: GlobalsStyles(context).corPrimariaTexto),
      titleTextAlign: TextAlign.center,
      descTextAlign: TextAlign.center,
      animationDuration: Duration(milliseconds: 400),
      alertElevation: 0,
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titleStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      alertAlignment: Alignment.center,
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: "Algo inesperado aconteceu",
      desc: "Verifique a disponibilidade dos dados na API base",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(
              color: GlobalsStyles(context).corTerciaria,
              fontSize: 20,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: GlobalsStyles(context).corPrimariaTexto,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show();
  }
}
