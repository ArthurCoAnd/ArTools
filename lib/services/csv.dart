// PACKAGES
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<List<List>> loadCSV(String nome, {bool parseNum = false}) async {
  late String rawCSV;
  if(kIsWeb){
    if(kDebugMode){rawCSV = await rootBundle.loadString('/data/$nome.csv');}
    else{rawCSV = await rootBundle.loadString('assets/data/$nome.csv');}
  } else{rawCSV = await rootBundle.loadString('assets/data/$nome.csv');}
  return CsvToListConverter(fieldDelimiter:';', shouldParseNumbers: parseNum).convert(rawCSV);
}

Future<Map> loadCSV2Map(String nome, String col) async {
  List<List> csv = await loadCSV(nome);
  Map map = {};
  if(csv[0].contains(col)){
    final int idxCol = csv[0].indexOf(col);
    for(int l=1; l<csv.length; l++){
      map[csv[l][idxCol]] = {};
      for(int c=0; c<csv[0].length; c++){
        if(c != idxCol){
          map[csv[l][idxCol]][csv[0][c]] = csv[l][c];
        }
      }
    }
  }
  return map;
}

Future<Map> loadCSV2Map2col(String nome, String col1, String col2, {String sep='-'}) async {
  List<List> csv = await loadCSV(nome);
  Map map = {};
  if(csv[0].contains(col1) && csv[0].contains(col2)){
    final int idxCol1 = csv[0].indexOf(col1);
    final int idxCol2 = csv[0].indexOf(col2);
    for(int l=1; l<csv.length; l++){
      final String k = '${csv[l][idxCol1]}$sep${csv[l][idxCol2]}';
      map[k] = {};
      for(int c=0; c<csv[0].length; c++){
        map[k][csv[0][c]] = csv[l][c];
      }
    }
  }
  return map;
}