import 'package:flutter/material.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';

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
    {'txt': 'Ensaio à Vazio', 'tipo': 'TXT'},
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
    {'txt': 'Tensão Secundário Base - V2b', 'tipo': 'TFF', 'val': TextEditingController(), 'sigla': 'V2b', 'un': 'V'},
  ];

  @override
  Widget build(BuildContext context){
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey,
          primary: Colors.red,
          surface: Colors.grey,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('VASCO'), centerTitle: true),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/estádios/SãoJanuário.jpeg', fit: BoxFit.cover, height: double.infinity, width: double.infinity),
            SimpleP(
              p: const[13,13,13,13],
              child: Card(
                color: Colors.white.withAlpha(213),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 777,
                        child: Column(children: [
                          SimpleP(child: Image.asset('assets/images/escudos/VASCO.png', height: 131, width: 131)),
                          const SimpleP(child: Center(child: Text('VAriable tranSformer CalculatOr', style: TextStyle(fontSize: 13)))),
                        ]),
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
            ),
          ],
        ),
      ),
    );
  }

  void fakeSetState(){setState((){});}

  Widget gerarEntrada(int idx){
    Widget entradaAux = Container();
    if(entradas[idx]['tipo'] == 'TXT'){entradaAux = Text(entradas[idx]['txt'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 31));}
    else if(entradas[idx]['tipo'] == 'TFF'){entradaAux = SimpleTFF(entradas[idx]['val'], entradas[idx]['txt']);}
    else if(entradas[idx]['tipo'] == 'RLT'){entradaAux = SimpleRLT(entradas[idx]['val'], entradas[idx]['opt'], func: fakeSetState);}

    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
      child: entradaAux,
    );
  }
}