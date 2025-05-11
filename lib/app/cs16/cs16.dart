import 'package:artools/app/cs16/cs_cores.dart';
import 'package:artools/app/cs16/cs_mapa.dart';
import 'package:artools/app/cs16/cs_mapa_card.dart';
import 'package:artools/widgets/s_padding.dart';
import 'package:flutter/material.dart';

//  ██████ ███████        ██     ██████  
// ██      ██            ███    ██       
// ██      ███████ █████  ██    ███████  
// ██           ██        ██    ██    ██ 
//  ██████ ███████        ██ ██  ██████  

class CS16 extends StatefulWidget {
  const CS16({super.key});

  @override
  State<CS16> createState() => _CS16State();
}

class _CS16State extends State<CS16> {
  final List<CSMapa> _mapas = [
    CSMapa(nome: 'ANCIENT', cidade: 'Palenque', pais: 'México', lat: 17.4840104, lon: -92.0465804),
    CSMapa(nome: 'ANUBIS', cidade: 'Suez', pais: 'Egito', lat: 29.9771312, lon: 32.4702954),
    CSMapa(nome: 'CACHE', cidade: 'Chernobil', pais: 'Ucrânia', lat: 51.3893142, lon: 30.1031226),
    CSMapa(nome: 'DUST II', cidade: 'Uarzazate', pais: 'Marrocos', lat: 30.9355895, lon: -6.9737889),
    CSMapa(nome: 'INFERNO', cidade: 'San Gimignano', pais: 'Itália', lat: 43.4683254, lon: 11.0262895),
    CSMapa(nome: 'MIRAGE', cidade: 'Marrakesh', pais: 'Marrocos', lat: 31.6347411, lon: -8.0902538),
    CSMapa(nome: 'NUKE', cidade: 'North Anna', pais: 'EUA', lat: 38.060556, lon: -77.789444),
    CSMapa(nome: 'OVERPASS', cidade: 'Berlin', pais: 'Alemanha', lat: 52.5069386, lon: 13.2599275),
    CSMapa(nome: 'TRAIN', cidade: 'Donetsk', pais: 'Ucrânia', lat: 47.9901174, lon: 37.7615206),
    CSMapa(nome: 'VERTIGO', cidade: 'Nova Iorque', pais: 'EUA', lat: 40.6976312, lon: -74.1444874),
  ];

  // ██       █████  ██    ██  ██████  ██    ██ ████████ 
  // ██      ██   ██  ██  ██  ██    ██ ██    ██    ██    
  // ██      ███████   ████   ██    ██ ██    ██    ██    
  // ██      ██   ██    ██    ██    ██ ██    ██    ██    
  // ███████ ██   ██    ██     ██████   ██████     ██    

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: CSCores().c1,
          primary: CSCores().c1,
          surface: CSCores().c4,
        ),
        fontFamily: 'CS',
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Clima-Strike 1.6'), centerTitle: true),
        body: SingleChildScrollView(
          child: SPadding(
            fim: true,
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [for(CSMapa mapa in _mapas) CSMapaCard(mapa)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}