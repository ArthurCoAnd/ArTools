import 'dart:ui';
import 'package:artools/widgets/entradas.dart';
import 'package:flutter/material.dart';

// import 'package:artools/pages/america.dart';
import 'package:artools/pages/cccp.dart';
// import 'package:artools/pages/cbf.dart';
// import 'package:artools/pages/inter.dart';
// import 'package:artools/pages/vasco.dart';

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
      routes: {
        '/': (context) => MENU(versao: versao),
        '/CCCP': (context) => const CCCP(),
      },
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
    // {'Título': 'AMÉRICA', 'subTítulo': 'América Futebol Clube', 'cor': Colors.green, 'img': 'escudos/América.png', 'pg': const AMERICA()},
    {'Título': 'CCCP', 'subTítulo': 'Conversor de Coordenadas\nCartesianas/Polares', 'cor': Colors.blue, 'img': 'logos/CCCP.png', 'pg': '/CCCP'},
    // {'Título': 'Estados Brasileiros', 'subTítulo': '', 'cor': Colors.yellow, 'img': 'logos/MapaBrasil.png', 'pg': const CBF()},
    // {'Título': 'INTER', 'subTítulo': 'INterative Transistor calculatER', 'cor': Colors.red, 'img': 'escudos/Inter.png', 'pg': const INTER()},
    // {'Título': 'VASCO', 'subTítulo': 'VAriable tranSformer CalculatOr', 'cor': Colors.white, 'img': 'escudos/Vasco.png', 'pg': const VASCO()},
  ];

  @override
  void initState() {
    _versao = widget.versao;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(title: const Text('ArTools'), centerTitle: true, backgroundColor: Colors.black, foregroundColor: const Color.fromARGB(255, 213, 213, 213)),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/fundos/MG.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            SimpleP(child: Image.asset('assets/images/Logo.png', height: 131, width: 131)),
            const SimpleP(child: Center(child: Text('ArTools', style: TextStyle(fontSize: 31)))),
            SimpleP(child: Center(child: Text('Versão $_versao', style: const TextStyle(fontSize: 13)))),
            GridView.builder(
              shrinkWrap: true,
              itemCount: entradas.length,
              itemBuilder:(context, index) => gerarEntrada(index),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.sizeOf(context).width~/313, mainAxisExtent: 313)
            ),
            const SimpleP(),
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
            onTap: (){Navigator.pushNamed(context, entradas[i]['pg']);},
            // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => entradas[i]['pg']));},
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(131)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.1, sigmaY: 3.1),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/${entradas[i]['img']}'), fit: BoxFit.contain, opacity: 0.13),
                    color: entradas[i]['cor'].withOpacity(0.31),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/${entradas[i]['img']}', height: 131, width: 131),
                      Text('${entradas[i]['Título']}', style: const TextStyle(fontSize: 31, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      Text('${entradas[i]['subTítulo']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
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