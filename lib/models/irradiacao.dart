// ██ ██████  ██████   █████  ██████  
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██████  ██████  ███████ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██████  

import 'package:artools/services/graficos.dart';

class Irradiacao{
  final int id;
  final double lat;
  final double lon;
  final String estado;
  final String municipio;

  List<MesVal> irradiacao = [];

  Irradiacao({
    required this.id,
    required this.lat,
    required this.lon,
    required this.estado,
    required this.municipio,
  });

  factory Irradiacao.fromMap(Map map) => Irradiacao(
    id: int.parse(map['ID']),
    lat: double.parse(map['LATITUDE']),
    lon: double.parse(map['LONGITUDE']),
    estado: map['ESTADO'].toString().toUpperCase(),
    municipio: map['MUNICÍPIO'].toString().toUpperCase(),
  )..irradiacao = ['JAN','FEV','MAR','ABR','MAI','JUN','JUL','AGO','SET','OUT','NOV','DEZ'].map((mes) => MesVal(mes, int.parse(map[mes]))).toList();
}