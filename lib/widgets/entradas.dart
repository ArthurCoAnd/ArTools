//  ██████╗███████╗██╗      █████╗ 
// ██╔════╝██╔════╝██║     ██╔══██╗
// ██║     █████╗  ██║     ███████║
// ██║     ██╔══╝  ██║     ██╔══██║
// ╚██████╗███████╗███████╗██║  ██║
//  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝

// Desenvolvedores:
// - Arthur Cordeiro Andrade

// Colaboradores:
// - Guilherme Azevedo Rech
// - Harrison Argolo dos Santos
// - Ingridi dos Santos Kremer
// - Marcelo de Ramos Grenzel

// BIBLIOTECAS
import 'package:flutter/material.dart';

Widget simpleTFF(TextEditingController controle, String nome, {String tipoKB = 'text', String sufTxt = ''}){
  TextInputType tit = TextInputType.text;
  if(tipoKB == 'num'){tit = TextInputType.number;}
  else if(tipoKB == 'obs'){tit = TextInputType.multiline;}
  return TextFormField(
    controller: controle,
    decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome, suffixText: sufTxt),
    keyboardType: tit,
    maxLines: tipoKB == 'obs' ? null : 1,
    validator: (value) => value != '' ? null : 'Preencha com um valor!',
  );
}

Widget simpleDD(ValueNotifier<String> controle, List<String> controleOpt, String nome){
  return ValueListenableBuilder(
    valueListenable: controle,
    builder: (BuildContext context, String val, _) {
      return DropdownButtonFormField<String>(
        itemHeight: null,
        value: (val.isEmpty) ? null: val,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome),
        validator: (value) => value != null ? null : 'Escolha um valor!',
        onChanged: (escolha) => controle.value = escolha.toString(),
        items: controleOpt.map((opt) => DropdownMenuItem(
          value: opt,
          child: Text(opt),
        )).toList(),
      );
    }
  );
}

Widget completeDD(ValueNotifier<String> controle, List<String> controleOpt, String nome, Function func){
  return ValueListenableBuilder(
    valueListenable: controle,
    builder: (BuildContext context, String val, _) {
      return DropdownButtonFormField<String>(
        itemHeight: null,
        value: (val.isEmpty) ? null: val,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome),
        onChanged: (escolha){controle.value = escolha.toString(); func();},
        items: controleOpt.map((opt) => DropdownMenuItem(
          value: opt,
          child: Text(opt),
        )).toList(),
      );
    }
  );
}

Widget simpleRLT(ValueNotifier<String> controle, List<String> opt, Function func){
  Widget radioOpt(ValueNotifier<String> ctrl, String nome){
    return Expanded(
      child: RadioListTile(
        title: Text(nome),
        value: nome,
        groupValue: ctrl.value,
        onChanged: (val){controle.value = val!; func();},
      ),
    );
  }

  List<Widget> radios = [];

  for(int i=0; i<opt.length; i++){
    radios.add(radioOpt(controle, opt[i]));
  }
  
  return Row(children: radios);
}