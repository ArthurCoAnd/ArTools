import 'dart:math';
import 'package:flutter/material.dart';
import 'package:artools/widgets/entradas.dart';

class CCCP extends StatefulWidget{
  const CCCP({super.key});

  @override
  CCCPState createState() => CCCPState();
}

class CCCPState extends State<CCCP>{
  final formKey = GlobalKey<FormState>();

  final ValueNotifier<String> tipoEnt = ValueNotifier('Cartesiano');
  final List<String> tipoEntOpt = ['Cartesiano', 'Polar'];

  final TextEditingController x = TextEditingController();
  final TextEditingController y = TextEditingController();
  final TextEditingController mod = TextEditingController();
  final TextEditingController ang = TextEditingController();
  final ValueNotifier<String> tipoAng = ValueNotifier('Grau');

  String rX = '-';
  String rY = '-';
  String rM = '-';
  String rG = '-';
  String rR = '-';

  bool calculado = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('CCCP'), centerTitle: true, backgroundColor: Colors.black, foregroundColor: const Color.fromARGB(255, 213, 213, 213)),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 500,
            child: Form(key: formKey, child: ListView(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              children: [
                SimpleP(child: Image.asset('assets/images/logos/CCCP.png', height: 131, width: 131)),
                const SimpleP(child: Center(child: Text('Conversor de Coordenadas Cartesianas/Polares', style: TextStyle(fontSize: 13)))),
                SimpleP(child: SimpleDD(tipoEnt, tipoEntOpt, 'Entrada', func: altTipoEnt)),
                // Entrada Cartesiana
                if(tipoEnt.value == 'Cartesiano') const SimpleP(child: Text('Cartesiano', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                if(tipoEnt.value == 'Cartesiano') SimpleP(child: SimpleTFF(x, 'X')),
                if(tipoEnt.value == 'Cartesiano') SimpleP(child: SimpleTFF(y, 'Y')),
                // Entrada Polar
                if(tipoEnt.value == 'Polar') const SimpleP(child: Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                if(tipoEnt.value == 'Polar') SimpleP(child: SimpleTFF(mod, 'Módulo')),
                if(tipoEnt.value == 'Polar') SimpleP(child: SimpleRLT(tipoAng, const ['Grau', 'Radiano'], func: altTipoAng)),
                if(tipoEnt.value == 'Polar') SimpleP(child: SimpleTFF(ang, 'Ângulo', sufTxt: tipoAng.value == 'Grau' ? '°' : 'rad')),
                // Calcular
                SimpleP(child: ElevatedButton.icon(
                  onPressed: (){if(formKey.currentState!.validate()){calcular();}},
                  style: ElevatedButton.styleFrom(minimumSize: const Size(0, 50), backgroundColor: calculado ? Colors.green : Colors.grey),
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular', style: TextStyle(fontSize: 20)),
                )),
                // Saída Cartesiana
                if(tipoEnt.value == 'Cartesiano') const SimpleP(child: Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                if(tipoEnt.value == 'Cartesiano') SimpleP(child: SelectableText('Módulo: $rM', textAlign: TextAlign.left, style: const TextStyle(fontSize: 20))),
                if(tipoEnt.value == 'Cartesiano') SimpleP(child: SelectableText('Grau: $rG', textAlign: TextAlign.left, style: const TextStyle(fontSize: 20))),
                if(tipoEnt.value == 'Cartesiano') SimpleP(child: SelectableText('Radiano: $rR', textAlign: TextAlign.left, style: const TextStyle(fontSize: 20))),
                // Saída Polar
                if(tipoEnt.value == 'Polar') const SimpleP(child: Text('Cartesiano', textAlign: TextAlign.center, style: TextStyle(fontSize: 31))),
                if(tipoEnt.value == 'Polar') SimpleP(child: SelectableText('X: $rX', textAlign: TextAlign.left, style: const TextStyle(fontSize: 20))),
                if(tipoEnt.value == 'Polar') SimpleP(child: SelectableText('Y: $rY', textAlign: TextAlign.left, style: const TextStyle(fontSize: 20))),
                const SimpleP(),
              ]
            ),
          )),
        ),
      ),
    );
  }

  void altTipoEnt(){setState((){
    x.text = ''; rX = '-'; y.text = ''; rY = '-';
    mod.text = ''; rM = '-'; ang.text = ''; rG = '-'; rR = '-'; tipoAng.value = 'Grau';
  });}

  void altTipoAng(){setState((){});}

  void calcular(){
    if(tipoEnt.value == 'Cartesiano'){
      final Map pol = car2pol({'x': x.text, 'y': y.text});
      setState((){
        // mod.text = pol['mod'];
        // ang.text = tipoAng.value == 'Grau' ? pol['angG'] : pol['angR'];
        rM = pol['mod'];
        rG = '${pol['angG']}°';
        rR = '${pol['angR']} rad';
      });
    } else if(tipoEnt.value == 'Polar'){
      final Map car = pol2car({'mod': mod.text, 'ang': ang.text, 'tipoAng': tipoAng.value});
      setState(() {
        // x.text = car['x'];
        // y.text = car['y'];
        rX = car['x'];
        rY = car['y'];
      });
    }
    setState((){});
  }
}

Map car2pol(Map car){
  Map pol = {'mod': '-', 'angG': '-', 'angR': '-'};
  try{
    final double x = double.parse(car['x'].replaceAll(',','.'));
    final double y = double.parse(car['y'].replaceAll(',','.'));
    final double mod = sqrt(x*x+y*y);
    final double angR = atan(y/x);
    final double angG = angR*360/(2*pi);
    pol['mod'] = mod.toStringAsFixed(3).replaceAll('.',',');
    pol['angG'] = angG.toStringAsFixed(3).replaceAll('.',',');
    pol['angR'] = angR.toStringAsFixed(3).replaceAll('.',',');
  }catch(_){}
  return pol;
}

Map pol2car(Map pol){
  Map car = {'x': '-', 'y': '-'};
  try{
    final double mod = double.parse(pol['mod'].replaceAll(',','.'));
    double ang = double.parse(pol['ang'].replaceAll(',','.'));
    if(pol['tipoAng'] == 'Grau'){ang = 2 * pi * ang / 360;}
    final double x = mod * cos(ang);
    final double y = mod * sin(ang);
    car['x'] = x.toStringAsFixed(3).replaceAll('.',',');
    car['y'] = y.toStringAsFixed(3).replaceAll('.',',');
  }catch(_){}
  return car;
}