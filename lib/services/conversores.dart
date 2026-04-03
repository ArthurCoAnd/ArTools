import 'dart:math';
import 'package:intl/intl.dart';

// ███████ ████████ ██████  ██ ███    ██  ██████  
// ██         ██    ██   ██ ██ ████   ██ ██       
// ███████    ██    ██████  ██ ██ ██  ██ ██   ███ 
//      ██    ██    ██   ██ ██ ██  ██ ██ ██    ██ 
// ███████    ██    ██   ██ ██ ██   ████  ██████  

String strN2str(String? str) => str ?? "";
String? strN2strN(String? str) => str == null ? null : str == "" ? null : str;

// ██████  ████████ 
// ██   ██    ██    
// ██   ██    ██    
// ██   ██    ██    
// ██████     ██    

String dt2str(DateTime dt, [String parseStr = "dd/MM/yyyy HH:mm"]) => DateFormat(parseStr).format(dt);
String dtN2str(DateTime? dt, [String parseStr = "dd/MM/yyyy HH:mm"]) => dt == null ? "" : dt2str(dt, parseStr);
String? dtN2strN(DateTime? dt, [String parseStr = "dd/MM/yyyy HH:mm"]) => dt == null ? null : dt2str(dt, parseStr);

DateTime dt2dtDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);

DateTime str2dt(String str, [String parseStr = "dd/MM/yyyy HH:mm"]) => DateFormat(parseStr).parse(str);
DateTime? strN2dtN(String? str, [String parseStr = "dd/MM/yyyy HH:mm"]) => DateFormat(parseStr).tryParse(str ?? "");

int dt2intTurno(DateTime dt) {
  if(dt.hour >= 16){return 2;}
  if(dt.hour >= 8){return 1;}
  return 0;
}

DateTime anoSemana2dt(int ano, int semana){
  final jan4 = DateTime(ano, 1, 4);
  final segundaSemanaJan4 = jan4.add(Duration(days: 1 - jan4.weekday));
  return segundaSemanaJan4.add(Duration(days: 7 * (semana - 1)));
}

// ██ ███    ██ ████████ 
// ██ ████   ██    ██    
// ██ ██ ██  ██    ██    
// ██ ██  ██ ██    ██    
// ██ ██   ████    ██    

String int2str(int i) => i.toString();
String intN2str(int? i) => i?.toString() ?? "";
String? intN2strN(int? i) => i?.toString();

int str2int(String str) => int.parse(str);
int? strN2intN(String? str) => int.tryParse(str ?? "");

// ██████   ██████  ██    ██ ██████  ██      ███████ 
// ██   ██ ██    ██ ██    ██ ██   ██ ██      ██      
// ██   ██ ██    ██ ██    ██ ██████  ██      █████   
// ██   ██ ██    ██ ██    ██ ██   ██ ██      ██      
// ██████   ██████   ██████  ██████  ███████ ███████ 

String double2str(double d, [int? decimals]) => d % 1 == 0 ? d.toInt().toString() : decimals == null ? d.toString().replaceAll(".",",") : d.toStringAsFixed(decimals).replaceAll(".",",");
String doubleN2str(double? d, [int? decimals]) => d == null ? "" : double2str(d, decimals);
String? doubleN2strN(double? d, [int? decimals]) => d == null ? null : double2str(d, decimals);

int double2int(double d) => d.toInt();
int? doubleN2intN(double? d) => d?.toInt();

double str2double(String str) => double.parse(str.replaceAll(",","."));
double? strN2doubleN(String? str) => double.tryParse(str?.replaceAll(",",".") ?? "");

String double2strDinheiro(double d) => NumberFormat("#,##0.00", "pt_BR").format(d);
String doubleN2strDinheiro(double? d) => d == null ? "0,00" : NumberFormat("#,##0.00", "pt_BR").format(d);
String? doubleN2strNDinheiro(double? d) => d == null ? null : NumberFormat("#,##0.00", "pt_BR").format(d);

double doubleRound(double d, [int decimals = 0]) => str2double(double2str(d,decimals));

String double2strCientifico(double d) => NumberFormat.compact(locale: "pt_BR").format(d).replaceAll("mil", "k").replaceAll("mi", "M").replaceAll("bi", "G");

// ███████ ██      ███████ ████████ ██████  ██  ██████ ██ ██████   █████  ██████  ███████ 
// ██      ██      ██         ██    ██   ██ ██ ██      ██ ██   ██ ██   ██ ██   ██ ██      
// █████   ██      █████      ██    ██████  ██ ██      ██ ██   ██ ███████ ██   ██ █████   
// ██      ██      ██         ██    ██   ██ ██ ██      ██ ██   ██ ██   ██ ██   ██ ██      
// ███████ ███████ ███████    ██    ██   ██ ██  ██████ ██ ██████  ██   ██ ██████  ███████ 

double cons2dem(double cons, {double a = 0.7428, double b = 0.0606}) => b * pow(cons, a);
double consN2dem(double? cons, {double a = 0.7428, double b = 0.0606}) => cons == null ? 0 : cons2dem(cons);
double? consN2demN(double? cons, {double a = 0.7428, double b = 0.0606}) => cons == null ? null : cons2dem(cons);

double dem2cons(double dem, {double a = 0.7428, double b = 0.0606}) => pow(dem/b, 1/a).toDouble();
double demN2cons(double? dem, {double a = 0.7428, double b = 0.0606}) => dem == null ? 0 : dem2cons(dem);
double? demN2consN(double? dem, {double a = 0.7428, double b = 0.0606}) => dem == null ? null : dem2cons(dem);

// ███████ ██ ███    ███     ██ ███    ██  █████   ██████  
// ██      ██ ████  ████    ██  ████   ██ ██   ██ ██    ██ 
// ███████ ██ ██ ████ ██   ██   ██ ██  ██ ███████ ██    ██ 
//      ██ ██ ██  ██  ██  ██    ██  ██ ██ ██   ██ ██    ██ 
// ███████ ██ ██      ██ ██     ██   ████ ██   ██  ██████  

String sn2SimNao(String sn) => sn == "S" ? "Sim" : "Não";
String? snN2SimNao(String? sn) => sn == "S" ? "Sim" : "Não";
String? snN2SimNaoN(String? sn) => sn == null ? null : sn == "S" ? "Sim" : "Não";

bool sn2bool(String sn) => sn == "S";
bool snN2bool(String? sn) => sn == "S";
bool? snN2boolN(String? sn) => sn == null ? null : sn == "S";

String bool2sn(bool b) => b ? "S" : "N";
String boolN2sn(bool? b) => b == null ? "N" : b ? "S" : "N";
String? boolN2snN(bool? b) => b == null ? null : b ? "S" : "N";