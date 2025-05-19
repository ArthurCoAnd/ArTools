String? valIsStr(String? txt){
  if(txt == ''){return 'Preencha com um valor!';}
  return null;
}

String? valIsInt(String? txt){
  if(int.tryParse(txt ?? '') == null){return 'Preencha com um valor numérico inteiro válido!';}
  return null;
}

String? valIsDouble(String? txt){
  if(double.tryParse(txt?.replaceAll(',','.') ?? '') == null){return 'Preencha com um valor numérico válido!';}
  return null;
}