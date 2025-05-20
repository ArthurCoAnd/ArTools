import 'package:artools/app/cccp/cccp_coordenadas.dart';
import 'package:artools/app/cccp/cccp_grafico.dart';
import 'package:flutter/material.dart';
import 'package:artools/widgets/entradas.dart';

class CCCP extends StatefulWidget{
  const CCCP({super.key});

  @override
  CCCPState createState() => CCCPState();
}

class CCCPState extends State<CCCP>{
  final CCCPcoordenadas _coordenadas = CCCPcoordenadas();

  final TextEditingController _x = TextEditingController();
  final TextEditingController _y = TextEditingController();
  final TextEditingController _mod = TextEditingController();
  final TextEditingController _angG = TextEditingController();
  final TextEditingController _angR = TextEditingController();

  late CCCPgrafico _grafico;

  @override
  void initState() {
    super.initState();
    _grafico = CCCPgrafico(_coordenadas);
  }

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
          seedColor: Colors.red,
          primary: Colors.red.shade700,
          surface: Colors.red.shade700,
        ),
        fontFamily: 'Konstruktor',
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('CCCP'), centerTitle: true),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/fundos/RedFlagBerlim.gif', fit: BoxFit.cover, height: double.infinity, width: double.infinity),
            SimpleP(
              p: const [13,13,13,13],
              child: Card(
                color: Colors.white.withAlpha(231),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 500,
                        child: Column(children: [
                          SimpleP(child: Image.asset('assets/images/logos/CCCP.png', height: 131, width: 131)),
                          const SimpleP(child: Center(child: Text('Conversor de Coordenadas Cartesianas e Polares', style: TextStyle(fontSize: 13)))),
                        ]),
                      ),
                      OverflowBar(
                        overflowAlignment: OverflowBarAlignment.center,
                        children: [
                          SizedBox(
                            width: 500,
                            child: Column(children: [
                              // Entrada Cartesiana
                              const SimpleP(child: Text('Cartesiano', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                              SimpleP(child: SimpleTFF(_x, 'X', func: altCar)),
                              SimpleP(child: SimpleTFF(_y, 'Y', func: altCar)),
                              // Entrada Polar
                              const SimpleP(child: Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                              SimpleP(child: SimpleTFF(_mod, 'Módulo', func: altPol)),
                              SimpleP(child: SimpleTFF(_angG, 'Ângulo Graus', func: altAngG)),
                              SimpleP(child: SimpleTFF(_angR, 'Ângulo Radianos', func: altAngR)),
                              const SimpleP(),
                            ]),
                          ),
                          SizedBox(
                            width: 400,
                            child: Column(children: [
                              const SimpleP(child: Text('Gráfico', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                              SimpleP(child: _grafico),
                            ]),
                          ),
                        ],
                      ),
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

  //  █████  ██      ████████ ███████ ██████   █████  ██████  
  // ██   ██ ██         ██    ██      ██   ██ ██   ██ ██   ██ 
  // ███████ ██         ██    █████   ██████  ███████ ██████  
  // ██   ██ ██         ██    ██      ██   ██ ██   ██ ██   ██ 
  // ██   ██ ███████    ██    ███████ ██   ██ ██   ██ ██   ██ 

  void altCar(){
    _coordenadas.altX(_x.text);
    _coordenadas.altY(_y.text);
    _coordenadas.car2pol();
    altEntradasPol();
  }

  void altPol(){
    _coordenadas.altMod(_mod.text);
    _coordenadas.pol2car();
    altEntradasCar();
  }

  void altAngG(){
    _coordenadas.altAngG(_angG.text);
    _coordenadas.grau2rag();
    setState(() {
      _angR.text = _coordenadas.angR?.toString().replaceAll('.',',') ?? '';
    });
    altPol();
  }

  void altAngR(){
    _coordenadas.altAngR(_angR.text);
    _coordenadas.rad2grau();
    setState(() {
      _angG.text = _coordenadas.angG?.toString().replaceAll('.',',') ?? '';
    });
    altPol();
  }

  void altEntradasCar(){
    _grafico = CCCPgrafico(_coordenadas);
    setState(() {
      _x.text = _coordenadas.x?.toString().replaceAll('.',',') ?? '';
      _y.text = _coordenadas.y?.toString().replaceAll('.',',') ?? '';
    });
  }

  void altEntradasPol(){
    _grafico = CCCPgrafico(_coordenadas);
    setState(() {
      _mod.text = _coordenadas.mod?.toString().replaceAll('.',',') ?? '';
      _angG.text = _coordenadas.angG?.toString().replaceAll('.',',') ?? '';
      _angR.text = _coordenadas.angR?.toString().replaceAll('.',',') ?? '';
    });
  }
}