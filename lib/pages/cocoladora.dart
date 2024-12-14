import 'package:artools/services/conversores.dart';
import 'package:artools/widgets/entradas.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cocoladora extends StatefulWidget{
  const Cocoladora({super.key});

  @override
  CocoladoraState createState() => CocoladoraState();
}

class CocoladoraState extends State<Cocoladora>{

  final TextEditingController _salarioTEC = TextEditingController();
  final TextEditingController _horasTEC = TextEditingController();
  final TextEditingController _minutosTEC = TextEditingController();

  double? _salario;
  double? _horas;
  double? _minutos;
  double? _dinheiro;

  // ██       █████  ██    ██  ██████  ██    ██ ████████ 
  // ██      ██   ██  ██  ██  ██    ██ ██    ██    ██    
  // ██      ███████   ████   ██    ██ ██    ██    ██    
  // ██      ██   ██    ██    ██    ██ ██    ██    ██    
  // ███████ ██   ██    ██     ██████   ██████     ██    

  @override
  Widget build(BuildContext context){
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          primary: Colors.white,
          surface: Colors.brown,
          onSurface: Colors.white
        ),
        fontFamily: GoogleFonts.dynaPuff().fontFamily,
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Cocôladora'), centerTitle: true),
        body: Center(
          child: SimpleP(
            p: const [13,13,13,13],
            child: Card(
              color: Colors.brown.shade200,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 500,
                      child: Column(children: [
                        SimpleP(child: Image.asset('assets/images/logos/Cocoladora.png', height: 131, width: 131)),
                        const SimpleP(child: Center(child: Text('Cocôladora', style: TextStyle(fontSize: 31)))),
                        SimpleP(child: SimpleTFF(_salarioTEC, 'Média Salarial Mensal (R\$/mês)', validador: valIsDouble, func: _calcular, centralizado: true, kb: 'num')),
                        SimpleP(child: SimpleTFF(_horasTEC, 'Carga Horária Semanal (h/semana)', validador: valIsDouble, func: _calcular, centralizado: true, kb: 'num')),
                        SimpleP(child: SimpleTFF(_minutosTEC, 'Média de Tempo no Troninho (min/💩)', validador: valIsDouble, func: _calcular, centralizado: true, kb: 'num')),
                        if(_dinheiro != null) SimpleP(child: SelectableText('Sua 💩 lhe rende R\$${_dinheiro!.toStringAsFixed(2).replaceAll('.',',')}', style: TextStyle(fontSize: 20), textAlign: TextAlign.center)),
                        const SimpleP(),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _calcular(){
    _salario = str2double(_salarioTEC.text);
    _horas = str2double(_horasTEC.text);
    _minutos = str2double(_minutosTEC.text);
    if(_salario != null && _horas != null && _minutos != null){
      _dinheiro = _minutos! * _salario! / ( 60 * _horas! * 4);
    } else { _dinheiro = null; }
    setState((){});
  }
}