import 'package:flutter/material.dart';

// ███████ ██ ███    ███ ██████  ██      ███████ 
// ██      ██ ████  ████ ██   ██ ██      ██      
// ███████ ██ ██ ████ ██ ██████  ██      █████   
//      ██ ██ ██  ██  ██ ██      ██      ██      
// ███████ ██ ██      ██ ██      ███████ ███████ 

//  █████  ██      ███████ ██████  ████████ 
// ██   ██ ██      ██      ██   ██    ██    
// ███████ ██      █████   ██████     ██    
// ██   ██ ██      ██      ██   ██    ██    
// ██   ██ ███████ ███████ ██   ██    ██    

// ██████  ██  █████  ██       ██████   ██████  
// ██   ██ ██ ██   ██ ██      ██    ██ ██       
// ██   ██ ██ ███████ ██      ██    ██ ██   ███ 
// ██   ██ ██ ██   ██ ██      ██    ██ ██    ██ 
// ██████  ██ ██   ██ ███████  ██████   ██████  

void simpleAlertDialog(BuildContext context, {String txt = 'ALERTA!!!', Color corTxt = Colors.black, Color? corBg}) {
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text(txt, style: TextStyle(color: corTxt), textAlign: TextAlign.center),
      backgroundColor: corBg,
    );
  });
}