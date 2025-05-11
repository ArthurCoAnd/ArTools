// PACKAGES
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

// ██    ██  █████  ██      ██ ██████   █████  ██████   ██████  ██████  ███████ ███████ 
// ██    ██ ██   ██ ██      ██ ██   ██ ██   ██ ██   ██ ██    ██ ██   ██ ██      ██      
// ██    ██ ███████ ██      ██ ██   ██ ███████ ██   ██ ██    ██ ██████  █████   ███████ 
//  ██  ██  ██   ██ ██      ██ ██   ██ ██   ██ ██   ██ ██    ██ ██   ██ ██           ██ 
//   ████   ██   ██ ███████ ██ ██████  ██   ██ ██████   ██████  ██   ██ ███████ ███████ 

String? valIsTxt(String? txt){
  if(txt != ''){
    return null;
  }else{return 'Preencha com um valor!';}
}

String? valIsInt(String? txt){
  try{
    int.parse(txt!.replaceAll(',','.'));
    return null;
  }catch(_){return 'Preencha com um valor numérico inteiro válido!';}
}

String? valIsDouble(String? txt){
  try{
    double.parse(txt!.replaceAll(',','.'));
    return null;
  }catch(_){return 'Preencha com um valor numérico válido!';}
}

// ██████  ██████   ██████  ██████  ██████   ██████  ██     ██ ███    ██ 
// ██   ██ ██   ██ ██    ██ ██   ██ ██   ██ ██    ██ ██     ██ ████   ██ 
// ██   ██ ██████  ██    ██ ██████  ██   ██ ██    ██ ██  █  ██ ██ ██  ██ 
// ██   ██ ██   ██ ██    ██ ██      ██   ██ ██    ██ ██ ███ ██ ██  ██ ██ 
// ██████  ██   ██  ██████  ██      ██████   ██████   ███ ███  ██   ████ 

class SimpleDD extends StatefulWidget{
  const SimpleDD(this.ctrl, this.opt, this.nome, {super.key, this.func, this.txt});

  final ValueNotifier<String> ctrl;
  final List<String> opt;
  final String nome;
  final Function? func;
  final List<String>? txt;

  @override
  SimpleDDState createState() => SimpleDDState();
}

class SimpleDDState extends State<SimpleDD>{
  @override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: widget.ctrl,
      builder: (BuildContext context, String val, _) {
        return DropdownButtonFormField<String>(
          itemHeight: null,
          isExpanded: true,
          value: (val.isEmpty) ? null: val,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.nome),
          validator: (value) => value != null ? null : 'Escolha um valor!',
          onChanged: (escolha){setState((){widget.ctrl.value = escolha.toString();}); if(widget.func != null){widget.func!();}},
          items: widget.txt == null
            ? widget.opt.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList()
            : widget.opt.map((opt) => DropdownMenuItem(value: opt, child: Text(widget.txt!.elementAt(widget.opt.indexOf(opt))))).toList(),
        );
      }
    );
  }
}

// ██████   █████  ██████  ██████  ██ ███    ██  ██████  
// ██   ██ ██   ██ ██   ██ ██   ██ ██ ████   ██ ██       
// ██████  ███████ ██   ██ ██   ██ ██ ██ ██  ██ ██   ███ 
// ██      ██   ██ ██   ██ ██   ██ ██ ██  ██ ██ ██    ██ 
// ██      ██   ██ ██████  ██████  ██ ██   ████  ██████  

class SimpleP extends StatelessWidget{
  const SimpleP({super.key,
    this.child,
    this.p = const [13, 13, 13, 0],
  });

  final Widget? child;
  final List<double> p;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(p[0], p[1], p[2], p[3]),
      child: child,
    );
  }
}

// ██████   █████  ██████  ██  ██████        ██      ██ ███████ ████████       ████████ ██ ██      ███████ 
// ██   ██ ██   ██ ██   ██ ██ ██    ██       ██      ██ ██         ██             ██    ██ ██      ██      
// ██████  ███████ ██   ██ ██ ██    ██ █████ ██      ██ ███████    ██    █████    ██    ██ ██      █████   
// ██   ██ ██   ██ ██   ██ ██ ██    ██       ██      ██      ██    ██             ██    ██ ██      ██      
// ██   ██ ██   ██ ██████  ██  ██████        ███████ ██ ███████    ██             ██    ██ ███████ ███████ 

class SimpleRLT extends StatefulWidget{
  const SimpleRLT(this.ctrl, this.opt, {super.key, this.func});

  final ValueNotifier<String> ctrl;
  final List<String> opt;
  final Function? func;

  @override
  SimpleRLTState createState() => SimpleRLTState();
}

class SimpleRLTState extends State<SimpleRLT>{
  @override
  Widget build(BuildContext context){
    Widget radioOpt(ValueNotifier<String> ctrl, String nome){
      return Expanded(
        child: RadioListTile(
          title: Text(nome),
          value: nome,
          groupValue: ctrl.value,
          onChanged: (val){setState((){widget.ctrl.value = val!;}); widget.func!();},
        ),
      );
    }
    List<Widget> radios = [];
    for(int i=0; i<widget.opt.length; i++){radios.add(radioOpt(widget.ctrl, widget.opt[i]));}
    return Row(children: radios);
  }
}

// ███████ ██     ██ ██ ████████  ██████ ██   ██ 
// ██      ██     ██ ██    ██    ██      ██   ██ 
// ███████ ██  █  ██ ██    ██    ██      ███████ 
//      ██ ██ ███ ██ ██    ██    ██      ██   ██ 
// ███████  ███ ███  ██    ██     ██████ ██   ██ 

class SimpleS extends StatefulWidget{
  const SimpleS(this.val, {super.key, this.func});

  final ValueNotifier val;
  final Function? func;

  @override
  SimpleSState createState() => SimpleSState();
}

class SimpleSState extends State<SimpleS>{
  @override
  Widget build(BuildContext context){
    return Switch(
      value: widget.val.value,
      activeColor: Colors.green,
      activeTrackColor: Colors.green.shade200,
      inactiveThumbColor: Colors.grey,
      inactiveTrackColor: Colors.grey.shade300,
      onChanged: (bool v){setState((){widget.val.value = v;}); if(widget.func != null){widget.func!();}},
    );
  }
}

// ████████ ███████ ██   ██ ████████       ███████  ██████  ██████  ███    ███       ███████ ██ ███████ ██      ██████  
//    ██    ██       ██ ██     ██          ██      ██    ██ ██   ██ ████  ████       ██      ██ ██      ██      ██   ██ 
//    ██    █████     ███      ██    █████ █████   ██    ██ ██████  ██ ████ ██ █████ █████   ██ █████   ██      ██   ██ 
//    ██    ██       ██ ██     ██          ██      ██    ██ ██   ██ ██  ██  ██       ██      ██ ██      ██      ██   ██ 
//    ██    ███████ ██   ██    ██          ██       ██████  ██   ██ ██      ██       ██      ██ ███████ ███████ ██████  

class SimpleTFF extends StatefulWidget{
  const SimpleTFF(this.ctrl, this.nome, {super.key, this.kb = 'txt', this.enable = true, this.senha = false, this.func, this.validador = valIsTxt, this.focusNode, this.centralizado = false});

  final TextEditingController ctrl;
  final String nome;

  final String kb;
  final bool enable;
  final bool senha;
  final Function? func;
  final String? Function(String?) validador;
  final FocusNode? focusNode;
  final bool centralizado;

  @override
  SimpleTFFState createState() => SimpleTFFState();
}

class SimpleTFFState extends State<SimpleTFF>{
  @override
  Widget build(BuildContext context){
    TextInputType tit = TextInputType.text;
    if(widget.kb == 'num'){tit = TextInputType.number;}
    else if(widget.kb == 'obs'){tit = TextInputType.multiline;}
    
    return TextFormField(
      controller: widget.ctrl,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) {if(widget.func != null){widget.func!();}},
      decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.nome, floatingLabelAlignment: widget.centralizado ? FloatingLabelAlignment.center : null),
      textAlign: widget.centralizado ? TextAlign.center : TextAlign.start,
      focusNode: widget.focusNode,
      keyboardType: tit,
      enabled: widget.enable,
      obscureText: widget.senha,
      maxLines: widget.kb == 'obs' ? null : 1,
      validator: (value) => widget.validador(value),
    );
  }
}

// ████████ ██    ██ ██████  ███████        █████  ██   ██ ███████  █████  ██████  
//    ██     ██  ██  ██   ██ ██            ██   ██ ██   ██ ██      ██   ██ ██   ██ 
//    ██      ████   ██████  █████   █████ ███████ ███████ █████   ███████ ██   ██ 
//    ██       ██    ██      ██            ██   ██ ██   ██ ██      ██   ██ ██   ██ 
//    ██       ██    ██      ███████       ██   ██ ██   ██ ███████ ██   ██ ██████  

class SimpleTA extends StatefulWidget{
  const SimpleTA(this.ctrl, this.opt, this.nome, {super.key, this.kb = 'txt', this.enable = true, this.func, this.validador = valIsTxt, this.focusNode});

  final TextEditingController ctrl;
  final String nome;
  final List<String> opt;

  final String kb;
  final bool enable;
  final Function? func;
  final String? Function(String?) validador;
  final FocusNode? focusNode;

  @override
  SimpleTAState createState() => SimpleTAState();
}

class SimpleTAState extends State<SimpleTA>{
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
      builder: (context, controller, focusNode) => SimpleTFF(
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