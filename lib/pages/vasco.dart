import 'package:artools/widgets/entradas.dart';
import 'package:flutter/material.dart';

class VASCO extends StatefulWidget{
  const VASCO({super.key});

  @override
  VASCOState createState() => VASCOState();
}

class VASCOState extends State<VASCO>{
  List<Map> entradas = [
    {'txt': 'Potência Nominal - Pn', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Pn', 'un': 'VA'},
    {'txt': 'Tensão Primário - V1', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'V1', 'un': 'V'},
    {'txt': 'Tensão Secundário - V2', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'V2', 'un': 'V'},
    {'txt': 'Ensaio a Vazio', 'tipo': 'RLT', 'val': ValueNotifier('Primário'), 'opt': ['Primário', 'Secundário']},
    {'txt': 'Tensão - Vvz', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Vvz', 'un': 'V'},
    {'txt': 'Corrente - Ivz', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Ivz', 'un': 'A'},
    {'txt': 'Potência - Pvz', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Pvz', 'un': 'W'},
    {'txt': 'Ensaio de Curto-Circuito', 'tipo': 'TXT'},
    {'txt': 'Tensão - Vcc', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Vcc', 'un': 'V'},
    {'txt': 'Corrente - Icc', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Icc', 'un': 'A'},
    {'txt': 'Potência - Pcc', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Pcc', 'un': 'W'},
    {'txt': 'Fator de Potência - FP', 'tipo': 'RLT', 'val': ValueNotifier('Indutivo/Atrasado'), 'opt': ['Indutivo/Atrasado', 'Capacitivo/Adiantado']},
    {'txt': 'Potência de Operção - Pop', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Pop', 'un': 'W'},
    {'txt': 'Tensão de Operção - Vop', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Vop', 'un': 'V'},
    {'txt': 'Potência Base - Pb', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'Pb', 'un': 'W'},
    {'txt': 'Tensão Secundária Base - V2b', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'V2b', 'un': 'V'},
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('VASCO'), backgroundColor: Colors.black, foregroundColor: const Color.fromARGB(255, 213, 213, 213)),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/estádios/SãoJanuário.jpeg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                child: Image.asset('assets/images/escudos/Vasco.png', height: 131, width: 131),
              ),
              SizedBox(
                width: 777,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: entradas.length,
                  itemBuilder:(context, index) => gerarEntrada(index),
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
            ],
          ),
        ),
      ),
    );
  }

  void fakeSetState(){setState((){});}

  Widget gerarEntrada(int idx){
    Widget entradaAux = Container();
    if(entradas[idx]['tipo'] == 'TXT'){entradaAux = Text(entradas[idx]['txt'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 31));}
    else if(entradas[idx]['tipo'] == 'TFF'){entradaAux = simpleTFF(entradas[idx]['val'], entradas[idx]['txt'], sufTxt: entradas[idx]['un']);}
    else if(entradas[idx]['tipo'] == 'RLT'){entradaAux = simpleRLT(entradas[idx]['val'], entradas[idx]['opt'], fakeSetState);}

    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
      child: entradaAux,
    );
  }
}