import 'package:flutter/material.dart';

//  ██████  ██████  ███    ██ ███████ ██ ██████  ███    ███ 
// ██      ██    ██ ████   ██ ██      ██ ██   ██ ████  ████ 
// ██      ██    ██ ██ ██  ██ █████   ██ ██████  ██ ████ ██ 
// ██      ██    ██ ██  ██ ██ ██      ██ ██   ██ ██  ██  ██ 
//  ██████  ██████  ██   ████ ██      ██ ██   ██ ██      ██ 

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

Future<bool> confirmAlertDialog(
  BuildContext context, {
    String ttl = 'Confirmar?',
    String txt = '',
    IconData iconN = Icons.close,
    String txtN = 'Cancelar',
    Color corN = Colors.red,
    IconData iconS = Icons.check,
    String txtS = 'Confirmar',
    Color corS = Colors.green
    }
  ) async {
  bool valor = false;

  void cancelar(){valor = false; Navigator.pop(context);}

  void confirmar(){valor = true; Navigator.pop(context);}

  await showDialog(barrierDismissible: false, context: context, builder: (BuildContext context){
    return AlertDialog(
      title: Text(ttl),
      content: txt != '' ? Text(txt) : null,
      actions: [
        TextButton.icon(
          onPressed: cancelar,
          icon: Icon(iconN, color: corN),
          label: Text(txtN, style: TextStyle(color: corN)),
        ),
        TextButton.icon(
          onPressed: confirmar,
          icon: Icon(iconS, color: corS),
          label: Text(txtS, style: TextStyle(color: corS)),
        ),
      ],
    );
  });

  return valor;
}