import 'package:flutter/material.dart';

// ███████ ██ ███    ███ ██████  ██      ███████ 
// ██      ██ ████  ████ ██   ██ ██      ██      
// ███████ ██ ██ ████ ██ ██████  ██      █████   
//      ██ ██ ██  ██  ██ ██      ██      ██      
// ███████ ██ ██      ██ ██      ███████ ███████ 

// ████████ ███████ ██   ██ ████████ 
//    ██    ██       ██ ██     ██    
//    ██    █████     ███      ██    
//    ██    ██       ██ ██     ██    
//    ██    ███████ ██   ██    ██    

// ███████  ██████  ██████  ███    ███ 
// ██      ██    ██ ██   ██ ████  ████ 
// █████   ██    ██ ██████  ██ ████ ██ 
// ██      ██    ██ ██   ██ ██  ██  ██ 
// ██       ██████  ██   ██ ██      ██ 

// ███████ ██ ███████ ██      ██████  
// ██      ██ ██      ██      ██   ██ 
// █████   ██ █████   ██      ██   ██ 
// ██      ██ ██      ██      ██   ██ 
// ██      ██ ███████ ███████ ██████  

class STextFormField extends StatefulWidget{
  const STextFormField(
    this.tec,
    this.nome,
    {
      super.key,
      this.enable = true,
      this.focusNode,
      this.func,
      this.kb,
      this.senha = false,
      this.unidade,
      this.validador,
    }
  );

  final TextEditingController tec;
  final String nome;

  final bool enable;
  final FocusNode? focusNode;
  final Function? func;
  final String? kb;
  final bool senha;
  final String? unidade;
  final String? Function(String?)? validador;

  @override
  State<STextFormField> createState() => _STextFormFieldState();
}

class _STextFormFieldState extends State<STextFormField>{
  TextInputType? _tit(){
    if(widget.kb == 'num'){return TextInputType.number;}
    if(widget.kb == 'obs'){return TextInputType.multiline;}
    return null;
  }

  @override
  Widget build(BuildContext context){
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.tec,
      decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.nome, suffixText: widget.unidade),
      enabled: widget.enable,
      focusNode: widget.focusNode,
      keyboardType: _tit(),
      maxLines: widget.kb == 'obs' ? null : 1,
      obscureText: widget.senha,
      onChanged: (value) {if(widget.func != null){widget.func!();}},
      validator: (value) => widget.validador == null ? null : widget.validador!(value),
    );
  }
}