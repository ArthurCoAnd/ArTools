// ██ ██████  ██████   █████  ██████  
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██████  ██████  ███████ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██████  

import 'package:artools/services/graficos.dart';

class IRRAD{
  final int id;
  final double lat;
  final double lon;
  final String estado;
  final String municipio;

  List<MesVal> irrad = [];

  IRRAD({
    required this.id,
    required this.lat,
    required this.lon,
    required this.estado,
    required this.municipio,
  });

  factory IRRAD.fromMap(Map map){
    return IRRAD(
      id: int.parse(map['ID']),
      lat: double.parse(map['LAT']),
      lon: double.parse(map['LON']),
      estado: map['EST'].toString().toUpperCase(),
      municipio: map['MUN'].toString().toUpperCase(),
    )..irrad = [for(String mes in ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']) MesVal(mes, int.parse(map[mes]))];
  }
}