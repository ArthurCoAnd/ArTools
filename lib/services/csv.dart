// PACKAGES
import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<List<Map>> loadCSV(String nome, {bool parseNum = false}) async {
  late String raw;
  if(kIsWeb){
    if(kDebugMode){raw = await rootBundle.loadString('/data/$nome.csv');}
    else{raw = await rootBundle.loadString('assets/data/$nome.csv');}
  } else{raw = await rootBundle.loadString('assets/data/$nome.csv');}
  final List<List> list = CsvToListConverter(fieldDelimiter:';', shouldParseNumbers: parseNum).convert(raw);
  
  List<Map> csv = [];
  for(int l=1; l<list.length; l++){
    Map csvL = {};
    for(int c=0; c<list[0].length; c++){csvL[list[0][c]] = list[l][c];}
    csv.add(csvL);
  }
  return csv;
}