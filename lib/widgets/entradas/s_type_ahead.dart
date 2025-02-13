import 'package:artools/widgets/entradas/s_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// ███████ ██ ███    ███ ██████  ██      ███████ 
// ██      ██ ████  ████ ██   ██ ██      ██      
// ███████ ██ ██ ████ ██ ██████  ██      █████   
//      ██ ██ ██  ██  ██ ██      ██      ██      
// ███████ ██ ██      ██ ██      ███████ ███████ 

// ████████ ██    ██ ██████  ███████ 
//    ██     ██  ██  ██   ██ ██      
//    ██      ████   ██████  █████   
//    ██       ██    ██      ██      
//    ██       ██    ██      ███████ 

//  █████  ██   ██ ███████  █████  ██████  
// ██   ██ ██   ██ ██      ██   ██ ██   ██ 
// ███████ ███████ █████   ███████ ██   ██ 
// ██   ██ ██   ██ ██      ██   ██ ██   ██ 
// ██   ██ ██   ██ ███████ ██   ██ ██████  

class STypeAhead extends StatefulWidget{
  const STypeAhead(this.ctrl, this.opt, this.nome, {super.key, this.kb = 'txt', this.enable = true, this.func, this.validador});

  final TextEditingController ctrl;
  final String nome;
  final List<String> opt;

  final String kb;
  final bool enable;
  final Function? func;
  final String? Function(String?)? validador;

  @override
  STypeAheadState createState() => STypeAheadState();
}

class STypeAheadState extends State<STypeAhead>{
  @override
  Widget build(BuildContext context){
    return TypeAheadField(
      controller: widget.ctrl,
      itemBuilder: (context, opt) => ListTile(title: Text(opt)),
      onSelected: (String escolha){setState((){widget.ctrl.text = escolha;}); if(widget.func != null){widget.func!();}},
      suggestionsCallback: (procura){
        if(procura != ''){return widget.opt.where((e) => e.toLowerCase().contains(procura.toLowerCase())).toList();}
        return null;
      },
      emptyBuilder:(context) => Text(''),
      builder: (context, controller, focusNode) => STextFormField(
        controller,
        widget.nome,
        kb: widget.kb,
        enable: widget.enable,
        func: widget.func,
        validador: widget.validador,
        focusNode: focusNode,
      ),
    );
  }
}