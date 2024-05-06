import 'package:flutter/material.dart';

import 'package:artools/services/car2pol.dart';

import 'package:artools/widgets/entradas.dart';

class CAR2POL extends StatefulWidget{
  const CAR2POL({super.key});

  @override
  CAR2POLState createState() => CAR2POLState();
}

class CAR2POLState extends State<CAR2POL>{
  final TextEditingController x = TextEditingController();
  final TextEditingController y = TextEditingController();
  final TextEditingController mod = TextEditingController();
  final TextEditingController ang = TextEditingController();
  final ValueNotifier<String> tipoAng = ValueNotifier('Grau');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Car2Pol'), backgroundColor: Colors.black, foregroundColor: const Color.fromARGB(255, 213, 213, 213)),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 13, 13, 13),
                child: Image.asset('assets/images/logos/Polar.png', height: 131, width: 131),
              ),
              SizedBox(
                width: 777,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: Text('Cartesiano', textAlign: TextAlign.center, style: TextStyle(fontSize: 31)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: completeTFF(x, 'X', altCar),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: completeTFF(y, 'Y', altCar),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: completeTFF(mod, 'Módulo', altPol),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: simpleRLT(tipoAng, ['Grau', 'Radiano'], altTipoAng),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(13, 13, 13, 0),
                      child: completeTFF(ang, 'Ângulo', altPol, sufTxt: tipoAng.value == 'Grau' ? '°' : 'rad'),
                    ),
                  ]
                ),
              ),
              const Padding(padding: EdgeInsets.fromLTRB(13, 13, 13, 0)),
            ],
          ),
        ),
      ),
    );
  }

  void altTipoAng(){setState((){});}

  void altCar(){
    final Map pol = car2pol({'x': x.text, 'y': y.text});
  }

  void altPol(){}
}