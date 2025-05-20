import 'dart:math';

import 'package:artools/app/cccp/cccp_coordenadas.dart';
import 'package:artools/services/graficos.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CCCPgrafico extends StatelessWidget {
  const CCCPgrafico(this.coordenadas, {super.key});

  final CCCPcoordenadas coordenadas;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: SfCartesianChart(
        series: gerarSeries(),
        primaryXAxis: const NumericAxis(rangePadding: ChartRangePadding.normal),
        primaryYAxis: const NumericAxis(rangePadding: ChartRangePadding.normal),
      ),
    );
  }

  List<CartesianSeries> gerarSeries(){
    if(coordenadas.x == null || coordenadas.y == null){return [];}
    List<XY> circulo = [for(double r=0; r<=2*pi; r+=0.01) XY(coordenadas.mod!*cos(r), coordenadas.mod!*sin(r))];
    return [
      serieLinhaXY('Círculo', Colors.blue, circulo),
      serieLinhaXY('X', Colors.black, [XY(-coordenadas.mod!, 0), XY(coordenadas.mod!, 0)]),
      serieLinhaXY('Y', Colors.black, [XY(0, -coordenadas.mod!), XY(0, coordenadas.mod!)]),
      serieLinhaXY('Módulo', Colors.red, [XY(0, 0), XY(coordenadas.x!, coordenadas.y!)], wdt: 5),
    ];
  }
}