import 'package:flutter/material.dart';

// ██████  ███████ ██      ███████ ████████ ███████ 
// ██   ██ ██      ██      ██         ██    ██      
// ██   ██ █████   ██      █████      ██    █████   
// ██   ██ ██      ██      ██         ██    ██      
// ██████  ███████ ███████ ███████    ██    ███████ 

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

Future<bool> deleteAlertDialog(BuildContext context) async {
  bool valor = false;
  
  void cancelar(){
    valor = false;
    Navigator.pop(context);
  }
  
  void deletar(){
    valor = true;
    Navigator.pop(context);
  }

  await showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      title: const Center(child: Text('Deletar?')),
      actions: [
        TextButton.icon(
          onPressed: cancelar,
          icon: const Icon(Icons.close, color: Colors.black),
          label: const Text('Cancelar', style: TextStyle(color: Colors.black)),
        ),
        TextButton.icon(
          onPressed: deletar,
          icon: const Icon(Icons.delete, color: Colors.red),
          label: const Text('Deletar', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  });

  return valor;
}