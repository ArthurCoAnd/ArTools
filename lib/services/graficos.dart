import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class XY {
  XY(this.x, this.y);
  final num x;
  final num y;
}

CartesianSeries<dynamic, dynamic> serieLinhaXY(String nome, Color cor, List<XY> dados, {double wdt = 2}){
  return LineSeries<XY, num>(
    name: nome, color: cor,
    dataSource: dados,
    width: wdt,
    xValueMapper: (XY data, _) => data.x,
    yValueMapper: (XY data, _) => data.y,
  );
}

class MesVal {
  MesVal(this.mes, this.val);
  final String mes;
  final num val;
}

CartesianSeries<dynamic, dynamic> serieLinhaMesVal(String nome, Color cor, List<MesVal> dados){
  return LineSeries<MesVal, String>(
    name: nome, color: cor,
    dataSource: dados,
    xValueMapper: (MesVal data, _) => data.mes,
    yValueMapper: (MesVal data, _) => data.val,
  );
}

CartesianSeries<dynamic, dynamic> serieColunaMesVal(String nome, Color cor, List<MesVal> dados){
  return ColumnSeries<MesVal, String>(
    name: nome, color: cor,
    dataSource: dados,
    xValueMapper: (MesVal data, _) => data.mes,
    yValueMapper: (MesVal data, _) => data.val,
  );
}

class DtVal {
  DtVal(this.dt, this.val);
  final DateTime dt;
  final num val;
}

CartesianSeries<dynamic, dynamic> serieLinhaDtVal(String nome, Color cor, List<DtVal> dados){
  return LineSeries<DtVal, DateTime>(
    name: nome, color: cor,
    dataSource: dados,
    xValueMapper: (DtVal data, _) => data.dt,
    yValueMapper: (DtVal data, _) => data.val,
  );
}

CartesianSeries<dynamic, dynamic> serieColunaDtVal(String nome, Color cor, List<DtVal> dados){
  return ColumnSeries<DtVal, DateTime>(
    name: nome, color: cor,
    dataSource: dados,
    xValueMapper: (DtVal data, _) => data.dt,
    yValueMapper: (DtVal data, _) => data.val,
  );
}