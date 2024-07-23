// BIBLIOTECAS
import 'package:flutter/material.dart';

// ██████  ██████   ██████  ██████  ██████   ██████  ██     ██ ███    ██ 
// ██   ██ ██   ██ ██    ██ ██   ██ ██   ██ ██    ██ ██     ██ ████   ██ 
// ██   ██ ██████  ██    ██ ██████  ██   ██ ██    ██ ██  █  ██ ██ ██  ██ 
// ██   ██ ██   ██ ██    ██ ██      ██   ██ ██    ██ ██ ███ ██ ██  ██ ██ 
// ██████  ██   ██  ██████  ██      ██████   ██████   ███ ███  ██   ████ 

class SimpleDD extends StatefulWidget{
  const SimpleDD(this.ctrl, this.opt, this.nome, {super.key, this.func});

  final ValueNotifier<String> ctrl;
  final List<String> opt;
  final String nome;
  final Function? func;

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
          value: (val.isEmpty) ? null: val,
          decoration: InputDecoration(border: const OutlineInputBorder(), labelText: widget.nome),
          validator: (value) => value != null ? null : 'Escolha um valor!',
          onChanged: (escolha){setState((){widget.ctrl.value = escolha.toString();}); widget.func!();},
          items: widget.opt.map((opt) => DropdownMenuItem(value: opt, child: Text(opt))).toList(),
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

class SimpleP extends StatefulWidget{
  const SimpleP({super.key,
    this.child,
    this.p = const [13, 13, 13, 0],
  });

  final Widget? child;
  final List<double> p;

  @override
  SimplePState createState() => SimplePState();
}

class SimplePState extends State<SimpleP>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.p[0], widget.p[1], widget.p[2], widget.p[3]),
      child: widget.child,
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

// ValueNotifier<String> controle, List<String> opt, Function func

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
      onChanged: (bool v){setState((){widget.val.value = v;}); widget.func!();},
    );
  }
}

// ████████ ███████ ██   ██ ████████       ███████  ██████  ██████  ███    ███       ███████ ██ ███████ ██      ██████  
//    ██    ██       ██ ██     ██          ██      ██    ██ ██   ██ ████  ████       ██      ██ ██      ██      ██   ██ 
//    ██    █████     ███      ██    █████ █████   ██    ██ ██████  ██ ████ ██ █████ █████   ██ █████   ██      ██   ██ 
//    ██    ██       ██ ██     ██          ██      ██    ██ ██   ██ ██  ██  ██       ██      ██ ██      ██      ██   ██ 
//    ██    ███████ ██   ██    ██          ██       ██████  ██   ██ ██      ██       ██      ██ ███████ ███████ ██████  

class SimpleTFF extends StatefulWidget{
  const SimpleTFF(this.ctrl, this.nome, {super.key,
    this.enable = true,
    this.kb = 'txt',
    this.senha = false,
    this.sufTxt = '',
  });

  final TextEditingController ctrl;
  final String nome;

  final bool enable;
  final String kb;
  final bool senha;
  final String sufTxt;

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
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: widget.nome,
        suffixText: widget.sufTxt,
      ),
      keyboardType: tit,
      enabled: widget.enable,
      obscureText: widget.senha,
      maxLines: widget.kb == 'obs' ? null : 1,
      validator: (value) => (value != '' || widget.kb == 'obs') ? null : 'Preencha com um valor!',
    );
  }
}

// Widget simpleP({double p = 13, bool f = false, required Widget child}){
//   return Padding(
//     padding: EdgeInsets.fromLTRB(p, p, p, f ? p : 0),
//     child: child,
//   );
// }

// Widget simpleTFF(TextEditingController controle, String nome, {String tipoKB = 'text', String sufTxt = ''}){
//   TextInputType tit = TextInputType.text;
//   if(tipoKB == 'num'){tit = TextInputType.number;}
//   else if(tipoKB == 'obs'){tit = TextInputType.multiline;}
//   return TextFormField(
//     controller: controle,
//     decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome, suffixText: sufTxt),
//     keyboardType: tit,
//     maxLines: tipoKB == 'obs' ? null : 1,
//     validator: (value) => value != '' ? null : 'Preencha com um valor!',
//   );
// }

// Widget completeTFF(TextEditingController controle, String nome, Function func, {String tipoKB = 'text', String sufTxt = ''}){
//   TextInputType tit = TextInputType.text;
//   if(tipoKB == 'num'){tit = TextInputType.number;}
//   else if(tipoKB == 'obs'){tit = TextInputType.multiline;}
//   return TextFormField(
//     controller: controle,
//     onChanged: (value){controle.text = value; func();},
//     decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome, suffixText: sufTxt),
//     keyboardType: tit,
//     maxLines: tipoKB == 'obs' ? null : 1,
//     validator: (value) => value != '' ? null : 'Preencha com um valor!',
//   );
// }

// Widget simpleDD(ValueNotifier<String> controle, List<String> controleOpt, String nome){
//   return ValueListenableBuilder(
//     valueListenable: controle,
//     builder: (BuildContext context, String val, _) {
//       return DropdownButtonFormField<String>(
//         itemHeight: null,
//         value: (val.isEmpty) ? null: val,
//         decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome),
//         validator: (value) => value != null ? null : 'Escolha um valor!',
//         onChanged: (escolha) => controle.value = escolha.toString(),
//         items: controleOpt.map((opt) => DropdownMenuItem(
//           value: opt,
//           child: Text(opt),
//         )).toList(),
//       );
//     }
//   );
// }

// Widget completeDD(ValueNotifier<String> controle, List<String> controleOpt, String nome, Function func){
//   return ValueListenableBuilder(
//     valueListenable: controle,
//     builder: (BuildContext context, String val, _) {
//       return DropdownButtonFormField<String>(
//         itemHeight: null,
//         value: (val.isEmpty) ? null: val,
//         decoration: InputDecoration(border: const OutlineInputBorder(), labelText: nome),
//         onChanged: (escolha){controle.value = escolha.toString(); func();},
//         items: controleOpt.map((opt) => DropdownMenuItem(
//           value: opt,
//           child: Text(opt),
//         )).toList(),
//       );
//     }
//   );
// }

// Widget simpleRLT(ValueNotifier<String> controle, List<String> opt, Function func){
//   Widget radioOpt(ValueNotifier<String> ctrl, String nome){
//     return Expanded(
//       child: RadioListTile(
//         title: Text(nome),
//         value: nome,
//         groupValue: ctrl.value,
//         onChanged: (val){controle.value = val!; func();},
//       ),
//     );
//   }
//   List<Widget> radios = [];
//   for(int i=0; i<opt.length; i++){radios.add(radioOpt(controle, opt[i]));}
//   return Row(children: radios);
// }