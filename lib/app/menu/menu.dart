import 'package:artools/app/menu/menu_botao.dart';
import 'package:artools/app/menu/menu_item.dart';
import 'package:artools/widgets/entradas.dart';
import 'package:flutter/material.dart';

class MENU extends StatefulWidget{
  const MENU({super.key});

  @override
  MENUState createState() => MENUState();
}

class MENUState extends State<MENU>{
  final List<MenuItem> _menu = [
    MenuItem('CCCP', subTitulo: 'Conversor de Coordenadas\nCartesianas & Polares', corBase: Colors.red, icone: 'logos/CCCP.png', pg: '/CCCP'),
    MenuItem('EGS', subTitulo: 'Estimador de Geração Solar', corBase: Colors.yellow, icone: 'logos/EGS.png', pg: '/EGS'),
    MenuItem('CS', subTitulo: 'Clima-Strike', corBase: Color.fromARGB(255,117,127,109), icone: 'logos/CS16.png', pg: '/CS16'),
    // MenuItem('Lavar Roupa?', 'Devo lavar minhas\nroupas agora?', Colors.blue, 'logos/LavarRoupa.png', pg: '/LavarRoupa'),
    MenuItem('Cocôladora', subTitulo: 'Sua 💩 em 💸', corBase: Colors.brown, icone: 'logos/Cocoladora.png', pg: '/Cocoladora'),
    // MenuItem('VASCO', subTitulo: 'VAriable tranSformer CalculatOr', corBase: Colors.black, icone: 'escudos/Vasco.png', pg: '/VASCO'),
    // MenuItem('Estados\nBrasileiros', corBase: Colors.yellow, icone: 'logos/MapaBrasil.png'),
    // MenuItem('INTER', corBase: Colors.red, icone: 'escudos/Inter.png'),
    // MenuItem('AMÉRICA', corBase: Colors.green, icone: 'escudos/América.png'),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/fundos/MG.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(children: [
            SimpleP(child: Image.asset('assets/images/Logo.png', height: 131, width: 131)),
            const SimpleP(child: Center(child: Text('ArTools', style: TextStyle(fontSize: 31)))),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 13,
              runSpacing: 13,
              children: [for(MenuItem i in _menu) MenuBotao(i)],
            ),
            const SimpleP(),
          ]),
        ),
      ),
    );
  }
}