import 'package:artools/app/cs16/cs_mapa.dart';
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
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(_mapa.nome, style: TextStyle(fontSize: 32)),
              FutureBuilder(
                future: _mapa.clima(),
                builder: (context, snapshot) => !snapshot.hasData
                ? Expanded(child: const Center(child: CircularProgressIndicator()))
                : Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Positioned(top: 13, left: 13, child: Row(children: [
                        Icon(Icons.thermostat),
                        Text('${_mapa.agora?.temperatura.toString().replaceAll('.',',') ?? '-'}°', style: TextStyle(fontSize: 20)),
                      ])),
                      Positioned(top: 13, right: 13, child: Column(
                        children: [
                          Text('Max: ${_mapa.max?.toString().replaceAll('.',',') ?? '-'}°', style: TextStyle(fontSize: 16)),
                          Text('Min: ${_mapa.min?.toString().replaceAll('.',',') ?? '-'}°', style: TextStyle(fontSize: 16)),
                        ],
                      )),
                      Positioned(bottom: 13, left: 13, child: Row(children: [
                        Icon(Icons.cloudy_snowing),
                        Text('${_mapa.agora?.chuva ?? '-'}%', style: TextStyle(fontSize: 20)),
                      ])),
                      Positioned(bottom: 13, right: 13, child: Row(children: [
                        Text('${_mapa.agora?.umidade ?? '-'}%', style: TextStyle(fontSize: 20)),
                        Icon(Icons.water_drop),
                      ])),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(radius: 50, backgroundColor: Theme.of(context).colorScheme.surface, child: Image.network(_mapa.agora?.codigo2img() ?? '')),
                          Text(_mapa.agora?.codigo2txt() ?? '-', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text('${_mapa.cidade} | ${_mapa.pais}', style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}