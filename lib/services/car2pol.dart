import 'dart:math';

Map car2pol(Map car){
  print(car);
  Map pol = {'mod': '', 'angG': '', 'angR': ''};
  try{
    final double x = double.parse(car['x'].replaceAll(',','.'));
    final double y = double.parse(car['y'].replaceAll(',','.'));
    pol['mod'] = '${sqrt(x*x+y*y)}'.replaceAll('.',',');
    pol['angG'] = '$x'.replaceAll('.',',');
    pol['angR'] = '$y'.replaceAll('.',',');
  }catch(_){}
  print(pol);
  return pol;
}

Map pol2car(Map pol){
  Map car = {'x': '', 'y': ''};
  return car;
}