import 'package:artools/app/cs16/cs_mapa.dart';
import 'package:artools/services/conversores.dart';
import 'package:flutter/material.dart';

//  ██████ ███████       ███    ███  █████  ██████   █████         ██████  █████  ██████  ██████  
// ██      ██            ████  ████ ██   ██ ██   ██ ██   ██       ██      ██   ██ ██   ██ ██   ██ 
// ██      ███████ █████ ██ ████ ██ ███████ ██████  ███████ █████ ██      ███████ ██████  ██   ██ 
// ██           ██       ██  ██  ██ ██   ██ ██      ██   ██       ██      ██   ██ ██   ██ ██   ██ 
//  ██████ ███████       ██      ██ ██   ██ ██      ██   ██        ██████ ██   ██ ██   ██ ██████  

class CSMapaCard extends StatefulWidget{
  const CSMapaCard(this.mapa, {super.key});

  final CSMapa mapa;

  @override
  State<CSMapaCard> createState() => _CSMapaCardState();
}

class _CSMapaCardState extends State<CSMapaCard>{
  late CSMapa _mapa;

  @override
  void initState() {
    super.initState();
    _mapa = widget.mapa;
  }
  
  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 400,
      width: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(_mapa.nome, style: const TextStyle(fontSize: 32)),
              FutureBuilder(
                future: _mapa.clima(),
                builder: (context, snapshot) => !snapshot.hasData
                ? const Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Positioned(top: 13, left: 13, child: Row(children: [
                        const Icon(Icons.thermostat),
                        Text('${doubleN2strN(_mapa.agora?.temperatura) ?? 'X'}°', style: const TextStyle(fontSize: 20)),
                      ])),
                      Positioned(top: 13, right: 13, child: Column(
                        children: [
                          Text('Max: ${doubleN2strN(_mapa.max) ?? 'X'}°', style: const TextStyle(fontSize: 16)),
                          Text('Min: ${doubleN2strN(_mapa.min) ?? 'X'}°', style: const TextStyle(fontSize: 16)),
                        ],
                      )),
                      Positioned(bottom: 13, left: 13, child: Row(children: [
                        const Icon(Icons.cloudy_snowing),
                        Text('${_mapa.agora?.chuva ?? 'X'}%', style: const TextStyle(fontSize: 20)),
                      ])),
                      Positioned(bottom: 13, right: 13, child: Row(children: [
                        Text('${_mapa.agora?.umidade ?? 'X'}%', style: const TextStyle(fontSize: 20)),
                        const Icon(Icons.water_drop),
                      ])),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 50, backgroundColor: Theme.of(context).colorScheme.surface, child: Image.network(_mapa.agora?.codigo2img() ?? '')),
                          Text(_mapa.agora?.codigo2txt() ?? 'X', style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text('${_mapa.cidade} | ${_mapa.pais}', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}