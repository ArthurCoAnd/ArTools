import 'dart:math';
import 'package:artools/services/graficos.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// SERVICES
import 'package:artools/services/conversores.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';

class CCCP extends StatefulWidget{
  const CCCP({super.key});

  @override
  CCCPState createState() => CCCPState();
}

class CCCPState extends State<CCCP>{
  Coordenada c = Coordenada();

  final TextEditingController x = TextEditingController();
  final TextEditingController y = TextEditingController();
  final TextEditingController mod = TextEditingController();
  final TextEditingController angG = TextEditingController();
  final TextEditingController angR = TextEditingController();

  List<CartesianSeries> seriesGrafico = [];

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
                          const SimpleP(child: Center(child: Text('Conversor de Coordenadas Cartesianas & Polares', style: TextStyle(fontSize: 13)))),
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
                              SimpleP(child: SimpleTFF(x, 'X', func: altCar)),
                              SimpleP(child: SimpleTFF(y, 'Y', func: altCar)),
                              // Entrada Polar
                              const SimpleP(child: Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                              SimpleP(child: SimpleTFF(mod, 'Módulo', func: altPol)),
                              SimpleP(child: SimpleTFF(angG, 'Ângulo Graus', func: altAngG)),
                              SimpleP(child: SimpleTFF(angR, 'Ângulo Radianos', func: altAngR)),
                              const SimpleP(),
                            ]),
                          ),
                          SizedBox(
                            width: 500,
                            child: Column(children: [
                              const SimpleP(child: Text('Gráfico', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                              SimpleP(child: SfCartesianChart(
                                series: seriesGrafico,
                                primaryXAxis: const NumericAxis(rangePadding: ChartRangePadding.normal),
                                primaryYAxis: const NumericAxis(rangePadding: ChartRangePadding.normal),
                              )),
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
    c.altX(x.text);
    c.altY(y.text);
    c.car2pol();
    altEntradasPol();
  }

  void altPol(){
    c.altMod(mod.text);
    c.pol2car();
    altEntradasCar();
  }

  void altAngG(){
    c.altAngG(angG.text);
    c.grau2rag();
    setState(() {
      angR.text = c.angR?.toString().replaceAll('.',',') ?? '';
    });
    altPol();
  }

  void altAngR(){
    c.altAngR(angR.text);
    c.rad2grau();
    setState(() {
      angG.text = c.angG?.toString().replaceAll('.',',') ?? '';
    });
    altPol();
  }

  void altEntradasCar(){
    gerarGrafico();
    setState(() {
      x.text = c.x?.toString().replaceAll('.',',') ?? '';
      y.text = c.y?.toString().replaceAll('.',',') ?? '';
    });
  }

  void altEntradasPol(){
    gerarGrafico();
    setState(() {
      mod.text = c.mod?.toString().replaceAll('.',',') ?? '';
      angG.text = c.angG?.toString().replaceAll('.',',') ?? '';
      angR.text = c.angR?.toString().replaceAll('.',',') ?? '';
    });
  }

  void gerarGrafico(){
    seriesGrafico = [];
    if(c.x != null && c.y != null){
      seriesGrafico.add(serieLinhaXY('X', Colors.black, [XY(-c.mod!,0),XY(c.mod!,0)]));
      seriesGrafico.add(serieLinhaXY('Y', Colors.black, [XY(0,-c.mod!),XY(0,c.mod!)]));
      seriesGrafico.add(serieLinhaXY('Módulo', Colors.red, [XY(0,0), XY(c.x!,c.y!)]));
    }
  }
}

  //  ██████  ██████   ██████  ██████  ██████  ███████ ███    ██  █████  ██████   █████  ███████ 
  // ██      ██    ██ ██    ██ ██   ██ ██   ██ ██      ████   ██ ██   ██ ██   ██ ██   ██ ██      
  // ██      ██    ██ ██    ██ ██████  ██   ██ █████   ██ ██  ██ ███████ ██   ██ ███████ ███████ 
  // ██      ██    ██ ██    ██ ██   ██ ██   ██ ██      ██  ██ ██ ██   ██ ██   ██ ██   ██      ██ 
  //  ██████  ██████   ██████  ██   ██ ██████  ███████ ██   ████ ██   ██ ██████  ██   ██ ███████ 

class Coordenada{
  Coordenada({this.x, this.y, this.mod, this.angG, this.angR});

  double? x;
  double? y;
  double? mod;
  double? angG;
  double? angR;

  void altX(String str){x = str2double(str);}
  void altY(String str){y = str2double(str);}
  void altMod(String str){mod = str2double(str);}
  void altAngG(String str){angG = str2double(str);}
  void altAngR(String str){angR = str2double(str);}

  void grau2rag(){
    try{angR = 2 * pi * angG! / 360;}
    catch(_){angR = null;}
  }

  void rad2grau(){
    try{angG = angR! * 360 / (2 * pi);}
    catch(_){angG = null;}
  }

  void car2pol(){
    try{
      mod = sqrt(x!*x!+y!*y!);
      angR = asin(y!/mod!);
      angG = angR!*360/(2*pi);
    }catch(_){
      mod = null;
      angR = null;
      angG = null;
    }
  }

  void pol2car(){
    try{
      x = mod! * cos(angR!);
      y = mod! * sin(angR!);
    }catch(_){
      x = null;
      y = null;
    }
  }
}