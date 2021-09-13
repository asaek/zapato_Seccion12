import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'assets/azul.png';
  double _talla = 9.0;

  String get assetImage => this._assetImage;
  set assetImage(String dato) {
    this._assetImage = dato;
    notifyListeners();
  }

  double get talla => this._talla;
  set talla(double dato) {
    this._talla = dato;
    notifyListeners();
  }
}
