import 'package:artools/app/egs/egs_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EGSGrafico extends StatelessWidget {
  const EGSGrafico(this.egs, {super.key});
  final EGSController egs;
  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: egs.irradiacaoCartesianSeries,
    builder: (context, value, child) => value.isEmpty ? const SizedBox.shrink() : Expanded(child: SfCartesianChart(
      trackballBehavior: TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap),
      legend: const Legend(title: LegendTitle(text: ''), isVisible: true, position: LegendPosition.top),
      primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mês')),
      primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Geração (kWh.mês)'), rangePadding: ChartRangePadding.normal),
      series: value,
    )),
  );
}