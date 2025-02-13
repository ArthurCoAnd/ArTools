import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<List<Map>> loadCSV(String nome) async {
  final String rawCSV = await rootBundle.loadString((kIsWeb && kDebugMode) ? '/data/$nome.csv' : 'assets/data/$nome.csv');
  final List<List> csv = const CsvToListConverter(fieldDelimiter: ';', shouldParseNumbers: false).convert(rawCSV);
  List<Map> list = [];
  for(int l=1; l<csv.length; l++){
    Map map = {};
    for(int c=0; c<csv[0].length; c++){
      map[csv[0][c]] = csv[l][c];
    }
    list.add(map);
  }
  return list;
}