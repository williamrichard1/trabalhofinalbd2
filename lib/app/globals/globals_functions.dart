import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class GlobalsFunctions {
  BuildContext context;
  GlobalsFunctions(this.context);

  Future<bool> verificaInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.none) {
      //print("NAO TEM INTERNET");
      return true;
    } else {
      //print("TEM INTERNET");
      return false;
    }
  }
}
