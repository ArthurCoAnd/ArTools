bool isStrDouble(String? txt){
  try{
    double.parse(txt!.replaceAll(',','.'));
    return true;
  }catch(_){return false;}
}