import 'dart:convert';
import 'package:artools/app/cs16/cs_clima.dart';
import 'package:http/http.dart';

//  ██████ ███████       ███    ███  █████  ██████   █████  
// ██      ██            ████  ████ ██   ██ ██   ██ ██   ██ 
// ██      ███████ █████ ██ ████ ██ ███████ ██████  ███████ 
// ██           ██       ██  ██  ██ ██   ██ ██      ██   ██ 
//  ██████ ███████       ██      ██ ██   ██ ██      ██   ██ 

class CSMapa{
  final String nome;
  final String cidade;
  final String pais;
  final double lat;
  final double lon;

  List<CSClima> climas = [];
  CSClima? agora;
  double? max;
  double? min;

  CSMapa({
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
      climas.add(CSClima(
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