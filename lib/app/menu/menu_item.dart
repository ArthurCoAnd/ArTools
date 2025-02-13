import 'package:flutter/material.dart';

class MenuItem {
  final String titulo;
  
  String? subTitulo;
  String? icone;
  String? pg;

  Color corBase = Colors.white;
  Color corTxt = Colors.black;

  MenuItem(this.titulo, {
    this.subTitulo,
    this.icone,
    this.corBase = Colors.white,
    this.corTxt = Colors.black,
    this.pg,
  }){_setCorTxt();}

  void _setCorTxt(){
    if(corBase.computeLuminance() < 0.5){
      corTxt = Colors.white;
    }
  }
}