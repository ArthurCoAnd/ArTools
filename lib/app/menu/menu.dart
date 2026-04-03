import 'package:artools/app/menu/menu_botao.dart';
import 'package:artools/app/menu/menu_item.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
  const Menu({super.key});

  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu>{
  final List<MenuItem> _menu = [
    MenuItem('CCCP', subTitulo: 'Conversor de Coordenadas\nCartesianas & Polares', corBase: Colors.red, icone: 'logos/CCCP.png', pg: '/CCCP'),
    MenuItem('EGS', subTitulo: 'Estimador de Geração Solar', corBase: Colors.yellow, icone: 'logos/EGS.png', pg: '/EGS'),
    MenuItem('CS', subTitulo: 'Clima-Strike', corBase: const Color.fromARGB(255,117,127,109), icone: 'logos/CS16.png', pg: '/CS16'),
    MenuItem('Cocôladora', subTitulo: 'Sua 💩 em 💸', corBase: Colors.brown, icone: 'logos/Cocoladora.png', pg: '/Cocoladora'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/fundos/MG.jpg'), fit: BoxFit.cover)),
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13),
          child: Column(
            spacing: 13,
            children: [
              Image.asset('assets/images/Logo.png', height: 131, width: 131),
              const Center(child: Text('ArTools', style: TextStyle(fontSize: 31))),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 13,
                runSpacing: 13,
                children: _menu.map((e) => MenuBotao(e)).toList(),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}