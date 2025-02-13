import 'package:flutter/material.dart';

// ███████ ██ ███    ███ ██████  ██      ███████ 
// ██      ██ ████  ████ ██   ██ ██      ██      
// ███████ ██ ██ ████ ██ ██████  ██      █████   
//      ██ ██ ██  ██  ██ ██      ██      ██      
// ███████ ██ ██      ██ ██      ███████ ███████ 

// ██████  ██████   ██████  ██████  
// ██   ██ ██   ██ ██    ██ ██   ██ 
// ██   ██ ██████  ██    ██ ██████  
// ██   ██ ██   ██ ██    ██ ██      
// ██████  ██   ██  ██████  ██      

// ██████   ██████  ██     ██ ███    ██ 
// ██   ██ ██    ██ ██     ██ ████   ██ 
// ██   ██ ██    ██ ██  █  ██ ██ ██  ██ 
// ██   ██ ██    ██ ██ ███ ██ ██  ██ ██ 
// ██████   ██████   ███ ███  ██   ████ 

class SDropDown extends StatefulWidget{
  const SDropDown(
    this.vn,
    this.optVal,
    this.nome,
    {
      super.key,
      this.func,
      this.obrigatorio = true,
      this.optTxt,
    }
  );

  final ValueNotifier<String> vn;
  final List<String> optVal;
  final String nome;
  final Function? func;
  final bool obrigatorio;
  final List<String>? optTxt;

  @override
  State<SDropDown> createState() => _SDropDownState();
}

class _SDropDownState extends State<SDropDown>{
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: widget.vn,
      builder: (BuildContext context, String val, _) {
        return DropdownButtonFormField<String>(
          itemHeight: null,
          isExpanded: true,
          value: (val.isEmpty) ? null : val,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.nome),
          validator: (value) => widget.obrigatorio ? value != null ? null : 'Escolha um valor!' : null,
          onChanged: (value) {setState((){widget.vn.value = value.toString();}); if(widget.func != null){widget.func!();}},
          items: widget.optTxt == null
            ? widget.optVal.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList()
            : widget.optVal.map((opt) => DropdownMenuItem(value: opt, child: Text(widget.optTxt!.elementAt(widget.optVal.indexOf(opt))))).toList(),
        );
      }
    );
  }
}