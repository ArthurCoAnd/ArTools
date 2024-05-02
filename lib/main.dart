import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:artools/pages/america.dart';
import 'package:artools/pages/cbf.dart';
import 'package:artools/pages/inter.dart';
import 'package:artools/pages/vasco.dart';

void main() {
  runApp(const ArTools());
}

class ArTools extends StatelessWidget {
  const ArTools({super.key});

  final String versao = '0.13';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArTools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, primarySwatch: Colors.green),
      home: MENU(versao: versao),
    );
  }
}

// ███    ███ ███████ ███    ██ ██    ██ 
// ████  ████ ██      ████   ██ ██    ██ 
// ██ ████ ██ █████   ██ ██  ██ ██    ██ 
// ██  ██  ██ ██      ██  ██ ██ ██    ██ 
// ██      ██ ███████ ██   ████  ██████  

class MENU extends StatefulWidget{
  const MENU({super.key, required this.versao});
                
  final String versao;
    
  @override
  MENUState createState() => MENUState();
}

class MENUState extends State<MENU>{
  late String _versao;

  List<Map> entradas = [
    {'sigla': 'AMÉRICA', 'nome': 'América Futebol Clube', 'cor': Colors.green, 'img': 'América', 'pg': const AMERICA()},
    {'sigla': 'CBF', 'nome': 'Estados Brasileiros', 'cor': Colors.yellow, 'img': 'CBF', 'pg': const CBF()},
    {'sigla': 'INTER', 'nome': 'INterative Transistor calculatER', 'cor': Colors.red, 'img': 'Inter', 'pg': const INTER()},
    {'sigla': 'VASCO', 'nome': 'VAriable tranSformer CalculatOr', 'cor': Colors.white, 'img': 'Vasco', 'pg': const VASCO()},
  ];

  @override
  void initState() {
    _versao = widget.versao;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('ArTools')), backgroundColor: Colors.black, foregroundColor: const Color.fromARGB(255, 213, 213, 213)),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/MG.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
              child: Image.asset('assets/images/Logo.png', height: 131, width: 131),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
              child: Center(child: Text('Versão $_versao', style: const TextStyle(fontSize: 13))),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: entradas.length,
              itemBuilder:(context, index) => gerarEntrada(index),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
          ]),
        ),
      ),
    );
  }

  Widget gerarEntrada(int i){
    return Padding(
      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
      child: Center(
        child: SizedBox(
          height: 313, width: 313,
          child: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => entradas[i]['pg']));},
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(131)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/escudos/${entradas[i]['img']}.png'), fit: BoxFit.contain, opacity: 0.13),
                    color: entradas[i]['cor'].withOpacity(0.31),
                  ),
                  // decoration: BoxDecoration(color: entradas[i]['cor'].withOpacity(0.31)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset('assets/images/escudos/${entradas[i]['img']}.png', height: 131, width: 131),
                      Text('${entradas[i]['sigla']}', style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      Text('${entradas[i]['nome']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    ]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}