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
import 'package:artools/pages/egs.dart';
// import 'package:artools/pages/vasco.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';

void main(){runApp(const ArTools());}

class ArTools extends StatelessWidget {
  const ArTools({super.key});
  @override
  Widget build(BuildContext context) {

    final String? fonte = GoogleFonts.ubuntu().fontFamily;

    return MaterialApp(
      localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, SfGlobalLocalizations.delegate],
      supportedLocales: const [Locale('pt','BR')],
      locale: const Locale('pt','BR'),
      title: 'ArTools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey), fontFamily: fonte),
      routes: {
        '/': (context) => const MENU(),
        '/CCCP': (context) => const CCCP(),
        '/EGS': (context) => const EGS(),
        // '/VASCO': (context) => const VASCO(),
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
  List<Map> entradas = [
    {'Título': 'CCCP', 'subTítulo': 'Conversor de Coordenadas\nCartesianas & Polares', 'cor': Colors.red, 'img': 'logos/CCCP.png', 'pg': '/CCCP'},
    {'Título': 'EGS', 'subTítulo': 'Estimador de Geração Solar', 'cor': Colors.yellow, 'img': 'logos/EGS.png', 'pg': '/EGS'},
    // {'Título': 'VASCO', 'subTítulo': 'VAriable tranSformer CalculatOr', 'cor': Colors.white, 'img': 'escudos/Vasco.png', 'pg': '/VASCO'},
    // {'Título': 'CS', 'subTítulo': 'Counter-Strike', 'cor': const Color.fromARGB(255,117,127,109), 'img': 'logos/CS16.png', 'pg': '/'},
  ];

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
            GridView.builder(
              physics: const ScrollPhysics(),
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