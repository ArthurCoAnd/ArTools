// PACKAGES
import 'dart:convert';

import 'package:artools/services/graficos.dart';
import 'package:artools/services/mapa.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ██       █████  ██    ██  █████  ██████      ██████   ██████  ██    ██ ██████   █████  ██████  
// ██      ██   ██ ██    ██ ██   ██ ██   ██     ██   ██ ██    ██ ██    ██ ██   ██ ██   ██      ██ 
// ██      ███████ ██    ██ ███████ ██████      ██████  ██    ██ ██    ██ ██████  ███████   ▄███  
// ██      ██   ██  ██  ██  ██   ██ ██   ██     ██   ██ ██    ██ ██    ██ ██      ██   ██   ▀▀    
// ███████ ██   ██   ████   ██   ██ ██   ██     ██   ██  ██████   ██████  ██      ██   ██   ██    

class LavarRoupa extends StatefulWidget {
  const LavarRoupa({super.key});

  @override
  State<LavarRoupa> createState() => _LavarRoupaState();
}

class _LavarRoupaState extends State<LavarRoupa> {
  LocationData? _position;
  Address? _address;
  List<Clima> _climas = [];

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
          seedColor: Colors.blue,
          primary: Colors.blue,
          surface: Colors.blue.shade100,
        ),
        fontFamily: GoogleFonts.sunflower().fontFamily,
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Lavar Roupa?'), centerTitle: true),
        body: SimpleP(
          p: const[13,13,13,13],
          child: Center(
            child: Card(
              child: SizedBox(
                width: 555,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleP(child: Image.asset('assets/images/logos/LavarRoupa.png', height: 131, width: 131)),
                    if(_address == null) SimpleP(child: FilledButton.icon(
                      onPressed: _obterLocal,
                      icon: const Icon(Icons.location_on),
                      label: const Text('Obter Localização', style: TextStyle(fontSize: 20)),
                    )),
                    if(_address != null) Column(
                      children: [
                        if(_address!.countryName == null) Text('${_position!.latitude}, ${_position!.longitude}', style: TextStyle(fontSize: 20)),
                        if(_address!.countryName != null) Text('${_address!.region ?? 'Município'}, ${_address!.countryName ?? 'País'}', style: TextStyle(fontSize: 20)),
                        _graficoTemperatura(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _graficoTemperatura(){
    return SfCartesianChart(
      title: ChartTitle(text: 'Temperatura (ºC)'),
      series: [serieLinhaDtVal('Temperatura', Colors.blue, [for(Clima c in _climas) DtVal(c.dt, c.temperatura)])],
      // tooltipBehavior: TooltipBehavior(enable: true),
      // trackballBehavior: TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap),
      // crosshairBehavior: CrosshairBehavior(enable: true, activationMode: ActivationMode.singleTap),
      primaryXAxis: const DateTimeAxis(),
      primaryYAxis: const NumericAxis(),
    );
  }

  Future<void> _obterLocal() async {
    _position = await obterLocal();
    if(_position == null){return;}
    if(_position!.latitude == null || _position!.longitude == null){return;}
    _address = await getAddress(_position!.latitude!, _position!.longitude!);
    await _obterClima();
    setState((){});
  }

  Future<void> _obterClima() async {
    if(_position!.latitude == null || _position!.longitude == null){return;}
    final Uri url = Uri.parse('https://api.open-meteo.com/v1/forecast?latitude=${_position!.latitude!}&longitude=${_position!.longitude!}&hourly=temperature_2m,relative_humidity_2m,dew_point_2m,precipitation_probability,weather_code,evapotranspiration,et0_fao_evapotranspiration&timeformat=unixtime&forecast_days=7');
    final Response response = await get(url);
    if(response.statusCode != 200){return;}
    final Map data = jsonDecode(response.body);
    
    _climas = [];
    for(int i=0; i<data['hourly']['time'].length; i++){
      _climas.add(Clima(
        dt: DateTime.fromMillisecondsSinceEpoch(data['hourly']['time'][i]*1000, isUtc: true),
        temperatura: data['hourly']['temperature_2m'][i],
        umidade: data['hourly']['relative_humidity_2m'][i],
        orvalho: data['hourly']['dew_point_2m'][i],
        chuva: data['hourly']['precipitation_probability'][i],
        codigo: data['hourly']['weather_code'][i],
        evaporacao: data['hourly']['evapotranspiration'][i],
      ));
    }

    final DateTime agora = DateTime.now();
    final DateTime futuro = DateTime.now().add(Duration(days: 3));
    _climas = _climas.where((c) => c.dt.compareTo(agora) == 1 && c.dt.compareTo(futuro) == -1).toList();
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
  final double orvalho;
  final int chuva;
  final int codigo;
  final double evaporacao;

  Clima({
    required this.dt,
    required this.temperatura,
    required this.umidade,
    required this.orvalho,
    required this.chuva,
    required this.codigo,
    required this.evaporacao,
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