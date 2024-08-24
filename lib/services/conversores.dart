double? str2double(String txt){
  try{return double.parse(txt.replaceAll(',','.'));}
  catch(_){return null;}
}