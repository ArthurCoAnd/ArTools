String? valIsStr(String? txt){
  if(txt != ''){
    return null;
  }else{return 'Preencha com um valor!';}
}

String? valIsInt(String? txt){
  try{
    int.parse(txt!.replaceAll(',','.'));
    return null;
  }catch(_){return 'Preencha com um valor numérico inteiro válido!';}
}

String? valIsDouble(String? txt){
  try{
    double.parse(txt!.replaceAll(',','.'));
    return null;
  }catch(_){return 'Preencha com um valor numérico válido!';}
}