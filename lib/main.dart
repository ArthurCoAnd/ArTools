//  █████╗ ██████╗ ████████╗ ██████╗  ██████╗ ██╗     ███████╗
// ██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
// ███████║██████╔╝   ██║   ██║   ██║██║   ██║██║     ███████╗
// ██╔══██║██╔══██╗   ██║   ██║   ██║██║   ██║██║     ╚════██║
// ██║  ██║██║  ██║   ██║   ╚██████╔╝╚██████╔╝███████╗███████║
// ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝

// PACKAGES
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

// PAGES
import 'package:artools/pages/cccp.dart';
import 'package:artools/pages/cocoladora.dart';
import 'package:artools/pages/cs16.dart';
import 'package:artools/pages/egs.dart';
// import 'package:artools/pages/lavar_roupa.dart';
// import 'package:artools/pages/vasco.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';

void main(){runApp(const ArTools());}

class ArTools extends StatelessWidget {
  const ArTools({super.key});
  @override
  Widget build(BuildContext context) {

    final String? fonte = GoogleFonts.oswald().fontFamily;

    return MaterialApp(
      localizationsDelegates: const [GlobalCupertinoLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, SfGlobalLocalizations.delegate],
      supportedLocales: const [Locale('pt','BR')],
      locale: const Locale('pt','BR'),
      title: 'ArTools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.black), fontFamily: fonte),
      routes: {
        '/': (context) => const MENU(),
        '/CCCP': (context) => const CCCP(),
        '/Cocoladora': (context) => const Cocoladora(),
        '/CS16': (context) => const CS16(),
        '/EGS': (context) => const EGS(),
        // '/LavarRoupa': (context) => const LavarRoupa(),
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
  const MENU({super.key});

  @override
  MENUState createState() => MENUState();
}

class MENUState extends State<MENU>{
  final List<MENUitem> _menu = [
    MENUitem(titulo: 'CCCP', subTitulo: 'Conversor de Coordenadas\nCartesianas & Polares', corBase: Colors.red, icone: 'logos/CCCP.png', pg: '/CCCP'),
    MENUitem(titulo: 'EGS', subTitulo: 'Estimador de Geração Solar', corBase: Colors.yellow, icone: 'logos/EGS.png', pg: '/EGS'),
    MENUitem(titulo: 'CS', subTitulo: 'Clima-Strike', corBase: Color.fromARGB(255,117,127,109), icone: 'logos/CS16.png', pg: '/CS16'),
    // MENUitem(titulo: 'Lavar Roupa?', subTitulo: 'Devo lavar minhas\nroupas agora?', corBase: Colors.blue, icone: 'logos/LavarRoupa.png', pg: '/LavarRoupa'),
    MENUitem(titulo: 'Cocôladora', subTitulo: 'Sua 💩 em 💸', corBase: Colors.brown, icone: 'logos/Cocoladora.png', pg: '/Cocoladora'),
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
              children: [for(MENUitem i in _menu) MENUitemBotao(i)],
            ),
            const SimpleP(),
          ]),
        ),
      ),
    );
  }
}

class MENUitem{
  final String titulo;
  final String subTitulo;
  final Color corBase;
  final String icone;
  final String pg;

  Color corTxt = Colors.black;

  MENUitem({
    required this.titulo,
    required this.subTitulo,
    required this.corBase,
    required this.icone,
    required this.pg,
  }){if(corBase.computeLuminance() < 0.5){corTxt = Colors.white;}}
}

class MENUitemBotao extends StatelessWidget{
  const MENUitemBotao(this.menuItem, {super.key});

  final MENUitem menuItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 313, width: 313,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, menuItem.pg),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(131)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.1, sigmaY: 3.1),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/${menuItem.icone}'), fit: BoxFit.contain, opacity: 0.13),
                color: menuItem.corBase.withOpacity(0.31),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/${menuItem.icone}', height: 131, width: 131),
                  Text(menuItem.titulo, style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold, color: menuItem.corTxt), textAlign: TextAlign.center),
                  Text(menuItem.subTitulo, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: menuItem.corTxt), textAlign: TextAlign.center),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}