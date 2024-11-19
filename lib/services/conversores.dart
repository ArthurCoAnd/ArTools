double? str2double(String txt){
  try{return double.parse(txt.replaceAll(',','.'));}
  catch(_){return null;}
}

int? str2int(String txt){
  try{return int.parse(txt);}
  catch(_){return null;}
}

num? str2num(String txt){
  try{return num.parse(txt.replaceAll(',','.'));}
  catch(_){return null;}
}