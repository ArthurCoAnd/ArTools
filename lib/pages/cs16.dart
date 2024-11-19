// PACKAGES
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
  final List<CSmapa> _mapas = [
    CSmapa(nome: 'ANCIENT', cidade: 'Palenque', pais: 'México', lat: 17.4840104, lon: -92.0465804),
    CSmapa(nome: 'ANUBIS', cidade: 'Suez', pais: 'Egito', lat: 29.9771312, lon: 32.4702954),
    CSmapa(nome: 'CACHE', cidade: 'Chernobil', pais: 'Ucrânia', lat: 51.3893142, lon: 30.1031226),
    CSmapa(nome: 'DUST II', cidade: 'Uarzazate', pais: 'Marrocos', lat: 30.9355895, lon: -6.9737889),
    CSmapa(nome: 'INFERNO', cidade: 'San Gimignano', pais: 'Itália', lat: 43.4683254, lon: 11.0262895),
    CSmapa(nome: 'MIRAGE', cidade: 'Marrakesh', pais: 'Marrocos', lat: 31.6347411, lon: -8.0902538),
    CSmapa(nome: 'NUKE', cidade: 'North Anna', pais: 'EUA', lat: 38.060556, lon: -77.789444),
    CSmapa(nome: 'OVERPASS', cidade: 'Berlin', pais: 'Alemanha', lat: 52.5069386, lon: 13.2599275),
    CSmapa(nome: 'TRAIN', cidade: 'Donetsk', pais: 'Ucrânia', lat: 47.9901174, lon: 37.7615206),
    CSmapa(nome: 'VERTIGO', cidade: 'Nova Iorque', pais: 'EUA', lat: 40.6976312, lon: -74.1444874),
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
          seedColor: Color.fromARGB(255,76,88,68),
          primary: Color.fromARGB(255,76,88,68),
          surface: Color.fromARGB(255,117,127,109),
        ),
        fontFamily: 'CS',
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('CS 1.6'), centerTitle: true),
        body: SingleChildScrollView(
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: [for(CSmapa mapa in _mapas) CSmapaCard(mapa)],
            ),
          ),
        ),
      ),
    );
  }
}

//  ██████ ███████       ███    ███  █████  ██████   █████  
// ██      ██            ████  ████ ██   ██ ██   ██ ██   ██ 
// ██      ███████ █████ ██ ████ ██ ███████ ██████  ███████ 
// ██           ██       ██  ██  ██ ██   ██ ██      ██   ██ 
//  ██████ ███████       ██      ██ ██   ██ ██      ██   ██ 

class CSmapa{
  final String nome;
  final String cidade;
  final String pais;
  final double lat;
  final double lon;

  List<Clima> climas = [];
  Clima? agora;
  double? max;
  double? min;

  CSmapa({
    required this.nome,
    required this.cidade,
    required this.pais,
    required this.lat,
    required this.lon,
  });

  Future<bool> clima() async {
    // https://open-meteo.com/en/docs
    final Response response = await get(Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,weather_code&timeformat=unixtime&forecast_days=1'));
    if(response.statusCode != 200){return false;}
    final Map data = jsonDecode(response.body);

    climas = [];
    for(int i=0; i<data['hourly']['time'].length; i++){
      climas.add(Clima(
        dt: DateTime.fromMillisecondsSinceEpoch(data['hourly']['time'][i]*1000, isUtc: true),
        temperatura: data['hourly']['temperature_2m'][i],
        umidade: data['hourly']['relative_humidity_2m'][i],
        chuva: data['hourly']['precipitation_probability'][i],
        codigo: data['hourly']['weather_code'][i],
      ));
    }

    final DateTime dtAgora = DateTime.now();
    agora = climas.reduce((ant,nxt) => ant.dt.difference(dtAgora).abs() < nxt.dt.difference(dtAgora).abs() ? ant : nxt);
    max = climas.reduce((a, b) => a.temperatura > b.temperatura ? a : b).temperatura;
    min = climas.reduce((a, b) => a.temperatura < b.temperatura ? a : b).temperatura;
    return true;
  }
}

//  ██████ ███████       ███    ███  █████  ██████   █████         ██████  █████  ██████  ██████  
// ██      ██            ████  ████ ██   ██ ██   ██ ██   ██       ██      ██   ██ ██   ██ ██   ██ 
// ██      ███████ █████ ██ ████ ██ ███████ ██████  ███████ █████ ██      ███████ ██████  ██   ██ 
// ██           ██       ██  ██  ██ ██   ██ ██      ██   ██       ██      ██   ██ ██   ██ ██   ██ 
//  ██████ ███████       ██      ██ ██   ██ ██      ██   ██        ██████ ██   ██ ██   ██ ██████  

class CSmapaCard extends StatefulWidget{
  const CSmapaCard(this.mapa, {super.key});

  final CSmapa mapa;

  @override
  State<CSmapaCard> createState() => _CSmapaCardState();
}

class _CSmapaCardState extends State<CSmapaCard>{
  late CSmapa _mapa;

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
                          Row(children: [
                            Icon(Icons.add),
                            Text('${_mapa.max?.toString().replaceAll('.',',') ?? '-'}°', style: TextStyle(fontSize: 16)),
                          ]),
                          Row(children: [
                            Icon(Icons.remove),
                            Text('${_mapa.min?.toString().replaceAll('.',',') ?? '-'}°', style: TextStyle(fontSize: 16)),
                          ]),
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

//  ██████ ██      ██ ███    ███  █████  
// ██      ██      ██ ████  ████ ██   ██ 
// ██      ██      ██ ██ ████ ██ ███████ 
// ██      ██      ██ ██  ██  ██ ██   ██ 
//  ██████ ███████ ██ ██      ██ ██   ██ 

class Clima{
  final DateTime dt;
  final double temperatura;
  final int umidade;
  final int chuva;
  final int codigo;

  Clima({
    required this.dt,
    required this.temperatura,
    required this.umidade,
    required this.chuva,
    required this.codigo,
  });

  String? codigo2txt(){
    final Map txt = {0: 'Céu Limpo', 1: 'Parcialmente Nublado', 2: 'Parcialmente Nublado', 3: 'Parcialmente Nublado', 45: 'Nublado', 48: 'Nublado', 51: 'Chuva Leve', 53: 'Chuva Leve', 55: 'Chuva Leve', 56: 'Chuva Leve Congelante', 57: 'Chuva Leve Congelante', 61: 'Chuva', 63: 'Chuva', 65: 'Chuva', 66: 'Chuva Congelante', 67: 'Chuva Congelante', 71: 'Nevando', 73: 'Nevando', 75: 'Nevando', 77: 'Flocos de Neve', 80: 'Pancada de Chuva', 81: 'Pancada de Chuva', 82: 'Pancada de Chuva', 85: 'Pancada de Neve', 86: 'Pancada de Neve', 95: 'Tempestade', 96: 'Tempestade com Granizo', 99: 'Tempestade com Granizo'};
    return txt[codigo];
  }

  String? codigo2img(){
    final Map img = {0: "http://openweathermap.org/img/wn/01n@2x.png",1: "http://openweathermap.org/img/wn/01n@2x.png",2: "http://openweathermap.org/img/wn/02n@2x.png",3: "http://openweathermap.org/img/wn/03n@2x.png",45: "http://openweathermap.org/img/wn/50n@2x.png",48: "http://openweathermap.org/img/wn/50n@2x.png",51: "http://openweathermap.org/img/wn/09n@2x.png",53: "http://openweathermap.org/img/wn/09n@2x.png",55: "http://openweathermap.org/img/wn/09n@2x.png",56: "http://openweathermap.org/img/wn/09n@2x.png",57: "http://openweathermap.org/img/wn/09n@2x.png",61: "http://openweathermap.org/img/wn/10n@2x.png",63: "http://openweathermap.org/img/wn/10n@2x.png",65: "http://openweathermap.org/img/wn/10n@2x.png",66: "http://openweathermap.org/img/wn/10n@2x.png",67: "http://openweathermap.org/img/wn/10n@2x.png",71: "http://openweathermap.org/img/wn/13n@2x.png",73: "http://openweathermap.org/img/wn/13n@2x.png",75: "http://openweathermap.org/img/wn/13n@2x.png",77: "http://openweathermap.org/img/wn/13n@2x.png",80: "http://openweathermap.org/img/wn/09n@2x.png",81: "http://openweathermap.org/img/wn/09n@2x.png",82: "http://openweathermap.org/img/wn/09n@2x.png",85: "http://openweathermap.org/img/wn/13n@2x.png",86: "http://openweathermap.org/img/wn/13n@2x.png",95: "http://openweathermap.org/img/wn/11n@2x.png",96: "http://openweathermap.org/img/wn/11n@2x.png",99: "http://openweathermap.org/img/wn/11n@2x.png"};
    return img[codigo];
  }
}

// #4C5844 (255,76,88,68)
// #3E4637 (255,62,70,55)
// #5A6A50 (255,90,106,80)
// #757F6D (255,117,127,109)

// FONTE: https://www.reddit.com/r/GlobalOffensive/comments/14f92hi/locations_of_csgo_maps_in_real_life/
// Agency: New York NY, US
// Ancient: Palenque, Mexico (Aztec Pyramids)
// Anubis: Suez, Egypt (Suez Canal)
// Assault: Chicago IL, US
// Baggage: Frankfurt, Germany
// Bank: Detroit MI, US (Midwest US)
// Breach: Denver CO, US (West US)
// Cache: Pripyat, Ukraine (Chernobyl Power Plant)
// Canals: Venice, Italy
// Cobblestone: Tignes, France (French Alps)
// Dust II: Quarzazate, Morocco (Mainland Morocco)
// Inferno: San Gimignano, Italy (Mountainous Area of Italy)
// Italy: Verona, Italy
// Lake: Shreveport LA, US (South US)
// Lunacy: Los Angeles CA, US
// Militia: Alamosa CO, US (West US)
// Mirage: Marakesh, Morocco
// Monastery: Thimphu, Bhutan (Himalayas)
// Nuke: North Anna Nuclear Station VA, US (East US)
// Office: Boston MA, US
// Overpass: Berlin, Germany
// Safehouse: Shreveport LA, US (South US)
// Shoots: Bao Loc, Vietnam (Southeast Asia - Indochina)
// St. Marc: St. Marc, Haiti
// Train: Donetsk, Ukraine (Southeast Europe - Soviet like)
// Tuscan: Manarola, Italy (West Italy Coast)
// Vertigo: New York NY, US

// weather_code
// '0': 'Céu Limpo',
// '1, 2, 3': 'Parcialmente Nublado',
// '45, 48': 'Nublado',
// '51, 53, 55': 'Chuva Leve',
// '56, 57': 'Chuva Leve Congelante',
// '61, 63, 65': 'Chuva',
// '66, 67': 'Chuva Congelante',
// '71, 73, 75': 'Nevando',
// '77': 'Flocos de Neve',
// '80, 81, 82': 'Pancada de Chuva',
// '85, 86': 'Pancada de Neve',
// '95': 'Tempestade',
// '96, 99': 'Tempestade com Granizo',