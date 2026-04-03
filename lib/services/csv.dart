import 'package:csv/csv.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<List<Map>> loadCSV(String nome) async {
  final String csvSTRING = await rootBundle.loadString((kIsWeb && kDebugMode) ? '/data/$nome.csv' : 'assets/data/$nome.csv');
  final Csv csv = Csv(fieldDelimiter: ";");
  List<List<dynamic>> csvLIST = csv.decode(csvSTRING);
  final List<dynamic> csvHEADER = csvLIST.first;
  List<Map> csvDATA = [];
  for(int l=1; l<csvLIST.length; l++){csvDATA.add({
    for(int c=0; c<csvHEADER.length; c++)
    csvHEADER[c] : csvLIST[l][c]
  });}
  return csvDATA;
}