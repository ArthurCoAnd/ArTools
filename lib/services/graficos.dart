import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class XY {
  XY(this.x, this.y);
  final num x;
  final num y;
}

class LineSeriesXY extends LineSeries<XY, num> {
  LineSeriesXY({super.key, 
    required String super.name,
    required Color super.color,
    required List<XY> super.dataSource,
    super.width,
  }) : super(
    xValueMapper: (XY data, _) => data.x,
    yValueMapper: (XY data, _) => data.y,
  );
}

class MesVal {
  MesVal(this.mes, this.val);
  final String mes;
  final num val;
}

class LineSeriesMesVal extends LineSeries<MesVal, String> {
  LineSeriesMesVal({super.key,
    required String super.name,
    required Color super.color,
    required List<MesVal> super.dataSource,
    super.width,
  }) : super(
    xValueMapper: (MesVal data, _) => data.mes,
    yValueMapper: (MesVal data, _) => data.val,
  );
}

class ColumnSeriesMesVal extends ColumnSeries<MesVal, String> {
  ColumnSeriesMesVal({super.key,
    required String super.name,
    required Color super.color,
    required List<MesVal> super.dataSource,
  }) : super(
    xValueMapper: (MesVal data, _) => data.mes,
    yValueMapper: (MesVal data, _) => data.val,
  );
}

class DtVal {
  DtVal(this.dt, this.val);
  final DateTime dt;
  final num val;
}

class LineSeriesDtVal extends LineSeries<DtVal, DateTime> {
  LineSeriesDtVal({super.key,
    required String super.name,
    required Color super.color,
    required List<DtVal> super.dataSource,
  }) : super(
    xValueMapper: (DtVal data, _) => data.dt,
    yValueMapper: (DtVal data, _) => data.val,
  );
}

class ColumnSeriesDtVal extends ColumnSeries<DtVal, DateTime> {
  ColumnSeriesDtVal({super.key, 
    required String super.name,
    required Color super.color,
    required List<DtVal> super.dataSource,
  }) : super(
    xValueMapper: (DtVal data, _) => data.dt,
    yValueMapper: (DtVal data, _) => data.val,
  );
}