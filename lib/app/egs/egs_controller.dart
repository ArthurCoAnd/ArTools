import 'package:artools/models/irradiacao.dart';
import 'package:artools/services/conversores.dart';
import 'package:artools/services/csv.dart';
import 'package:artools/services/graficos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EGSController {
  EGSController();

  final GlobalKey<FormBuilderState> formBuilderState = GlobalKey<FormBuilderState>();
  
  List<Irradiacao> irradiacao = [];
  List<MesVal> irradiacaoMesVal = [];
  ValueNotifier<List<CartesianSeries>> irradiacaoCartesianSeries = ValueNotifier([]);

  String? estado;
  List<String> estadoOpt = [];
  
  String? municipio;
  List<String> municipioOpt = [];
  
  double? potencia;

  Future<void> carregar() async {
    final List<Map> irradCSVdata = await loadCSV('IRRADIACAO');
    irradiacao = [for(Map m in irradCSVdata) Irradiacao.fromMap(m)];
    estadoOpt = {for(Irradiacao i in irradiacao) i.estado}.toList()..sort();
  }

  void alterarEstado(String? str) {
    estado = str;
    municipioOpt = irradiacao.where((e) => e.estado == estado).map((e) => e.municipio).toList()..sort();
    formBuilderState.currentState?.fields['M']?.didChange(null);
    _calcular();
  }
  
  void alterarMunicipio(String? str) {
    municipio = str;
    irradiacaoMesVal = irradiacao.where((i) => i.estado == estado && i.municipio == municipio).firstOrNull?.irradiacao ?? [];
    _calcular();
  }
  
  void alterarPotencia(String? str) {
    potencia = strN2doubleN(str);
    _calcular();
  }

  void _calcular() {
    irradiacaoCartesianSeries.value = [];
    if(estado == null || municipio == null || potencia == null) return;
    final double fator = 30*potencia!*0.8/1000;
    final double media = fator * irradiacaoMesVal.fold(0.0, (val, i) => val += i.val)/irradiacaoMesVal.length;
    irradiacaoCartesianSeries.value = [
      ColumnSeriesMesVal(name: 'Geração', color: Colors.amber, dataSource: [for(MesVal m in irradiacaoMesVal) MesVal(m.mes, fator*m.val)]),
      LineSeriesMesVal(name: 'Média', color: Colors.blue, dataSource: [for(MesVal m in irradiacaoMesVal) MesVal(m.mes, media)]),
    ];
  }
}