import 'package:artools/services/conversores.dart';
import 'package:intl/intl.dart';

String? valTextField(String? str) {
  if(str == null){return "Preencha com um Valor!";}
  if(str == ""){return "Preencha com um Valor!";}
  return null;
}

String? valDropDown(String? str) {
  if(str == null){return "Escolha um Valor!";}
  if(str == ""){return "Escolha um Valor!";}
  return null;
}

String? valDatePicker(String? str, [String dateFormat = "dd/MM/yyyy"]) {
  final DateTime? dt = DateFormat(dateFormat).tryParse(str ?? "");
  if(dt == null){return "Preencha com uma DATA Válida!";}
  return null;
}

// ███████ ████████ ██████  
// ██         ██    ██   ██ 
// ███████    ██    ██████  
//      ██    ██    ██   ██ 
// ███████    ██    ██   ██ 

String? valIsStrN(String? str) => null;

String? valIsStr(String? str) {
  if(str == null){return "Preencha com um Valor!";}
  if(str == ""){return "Preencha com um Valor!";}
  return null;
}

// ██ ███    ██ ████████ 
// ██ ████   ██    ██    
// ██ ██ ██  ██    ██    
// ██ ██  ██ ██    ██    
// ██ ██   ████    ██    

String? valIsInt(String? str) {
  final int? i = int.tryParse(str ?? "");
  if(i == null){return "Preencha com um valor NUMÉRICO INTEIRO!";}
  return null;
}

String? valIsIntN(String? str) {
  if(str == null || str == ""){return null;}
  final int? i = int.tryParse(str);
  if(i == null){return "Preencha com um valor NUMÉRICO INTEIRO!";}
  return null;
}

// ██████   ██████  ██    ██ ██████  ██      ███████ 
// ██   ██ ██    ██ ██    ██ ██   ██ ██      ██      
// ██   ██ ██    ██ ██    ██ ██████  ██      █████   
// ██   ██ ██    ██ ██    ██ ██   ██ ██      ██      
// ██████   ██████   ██████  ██████  ███████ ███████ 

String? valIsDouble(String? str) {
  final double? i = strN2doubleN(str);
  if(i == null){return "Preencha com um valor NUMÉRICO!";}
  return null;
}

String? valIsDoubleN(String? str) {
  if(str == null || str == ""){return null;}
  final double? i = strN2doubleN(str);
  if(i == null){return "Preencha com um valor NUMÉRICO!";}
  return null;
}

String? valIsLatitude(String? str) {
  if(str == null){return "Preencha com um Valor!";}
  if(str == ""){return "Preencha com um Valor!";}
  final double? latitude = strN2doubleN(str);
  if(latitude == null){return "Preencha com um valor NUMÉRICO!";}
  if(latitude <= -90 || latitude >= 90){return "Preencha com um valor VÁLIDO!";}
  return null;
}

String? valIsLongitude(String? str) {
  if(str == null){return "Preencha com um Valor!";}
  if(str == ""){return "Preencha com um Valor!";}
  final double? longitude = strN2doubleN(str);
  if(longitude == null){return "Preencha com um valor NUMÉRICO!";}
  if(longitude <= -180 || longitude >= 180){return "Preencha com um valor VÁLIDO!";}
  return null;
}