//  ██████╗ ██████╗ ██████╗██████╗ 
// ██╔════╝██╔════╝██╔════╝██╔══██╗
// ██║     ██║     ██║     ██████╔╝
// ██║     ██║     ██║     ██╔═══╝ 
// ╚██████╗╚██████╗╚██████╗██║     
//  ╚═════╝ ╚═════╝ ╚═════╝╚═╝     
// Conversor de Coordenadas Cartesianas & Polares

import 'package:artools/app/cccp/cccp_coordenadas.dart';
import 'package:artools/app/cccp/cccp_formulario.dart';
import 'package:artools/app/cccp/cccp_grafico.dart';
import 'package:artools/app/cccp/cccp_titulo.dart';
import 'package:flutter/material.dart';

class CCCP extends StatefulWidget{
  const CCCP({super.key});
  
  @override
  CCCPState createState() => CCCPState();
}

class CCCPState extends State<CCCP>{
  late CCCPCoordenadas _cccpCoordenadas;

 @override
  void initState() {
    super.initState();
    _cccpCoordenadas = CCCPCoordenadas();
  }

  // ██       █████  ██    ██  ██████  ██    ██ ████████ 
  // ██      ██   ██  ██  ██  ██    ██ ██    ██    ██    
  // ██      ███████   ████   ██    ██ ██    ██    ██    
  // ██      ██   ██    ██    ██    ██ ██    ██    ██    
  // ███████ ██   ██    ██     ██████   ██████     ██    

  @override
  Widget build(BuildContext context) => Theme(
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
          Padding(
            padding: const EdgeInsetsGeometry.all(13),
            child: Card(
              color: Colors.white.withAlpha(231),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(13),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 13,
                  children: [
                    const SizedBox(width: 500, child: CCCPTitulo()),
                    OverflowBar(
                      overflowAlignment: OverflowBarAlignment.center,
                      overflowSpacing: 13,
                      spacing: 13,
                      children: [
                        CCCPFormulario(_cccpCoordenadas),
                        CCCPGrafico(_cccpCoordenadas),
                      ].map((e) => SizedBox(width: 500, child: e)).toList(),
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