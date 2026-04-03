import 'dart:math';
import 'package:artools/app/cccp/cccp_coordenadas.dart';
import 'package:artools/services/graficos.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CCCPGrafico extends StatelessWidget {
  const CCCPGrafico(this.cccp, {super.key});
  final CCCPCoordenadas cccp;
  List<XY> get circulo => [for(double r=0; r<=2*pi; r+=0.01) XY(cccp.modulo.value!*cos(r), cccp.modulo.value!*sin(r))];
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: Listenable.merge([cccp.coordenadaX, cccp.coordenadaY, cccp.modulo, cccp.anguloGraus, cccp.anguloRadianos]),
    builder: (context, child) => Column(
      spacing: 13,
      children: [
        const Text('Gráfico', textAlign: TextAlign.center, style: TextStyle(fontSize: 31)),
        AspectRatio(
          aspectRatio: 1,
          child: SfCartesianChart(
            series: cccp.coordenadaX.value == null || cccp.coordenadaY.value == null ? [] : [
              LineSeriesXY(name: 'Círculo', color: Colors.blue, dataSource: circulo),
              LineSeriesXY(name: 'X', color: Colors.black, dataSource: [XY(-cccp.modulo.value!, 0), XY(cccp.modulo.value!, 0)]),
              LineSeriesXY(name: 'Y', color: Colors.black, dataSource: [XY(0, -cccp.modulo.value!), XY(0, cccp.modulo.value!)]),
              LineSeriesXY(name: 'Módulo', color: Colors.red, dataSource: [XY(0, 0), XY(cccp.coordenadaX.value!, cccp.coordenadaY.value!)], width: 5),
            ],
            primaryXAxis: NumericAxis(
              plotOffset: 13,
              decimalPlaces: 0,
              rangePadding: ChartRangePadding.round,
              numberFormat: NumberFormat.decimalPattern('pt_BR'),
            ),
            primaryYAxis: NumericAxis(
              plotOffset: 13,
              decimalPlaces: 0,
              rangePadding: ChartRangePadding.round,
              numberFormat: NumberFormat.decimalPattern('pt_BR'),
            ),
          ),
        ),
      ],
    ),
  );
}