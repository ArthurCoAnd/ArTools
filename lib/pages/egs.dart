// PACKAGES
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// SERVICES
import 'package:artools/services/csv.dart';
import 'package:artools/services/graficos.dart';

// WIDGETS
import 'package:artools/widgets/entradas.dart';

class EGS extends StatefulWidget {
  const EGS({super.key});

  @override
  State<EGS> createState() => _EGSState();
}

class _EGSState extends State<EGS> {

  bool carregado = false;

  Map irradDados = {};

  final formKey = GlobalKey<FormState>();

  final TextEditingController estado = TextEditingController();
  List<String> estadoOpt = [];

  final TextEditingController municipio = TextEditingController();
  List<String> municipioOpt = [];

  final TextEditingController potencia = TextEditingController();

  Map irradMunDados = {};
  List<CartesianSeries> irradSeries = [];

  void carregarDados() async {
    irradDados = await loadCSV2Map2col('IRRAD','EST','MUN');
    estadoOpt = {for(var k in irradDados.keys) irradDados[k]['EST'].toString()}.toList();
    setState((){carregado = true;});
  }

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          primary: Colors.amber,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Estimador de Geração Solar'), centerTitle: true, backgroundColor: Colors.amber),
        body: !carregado
        ? const Center(child: CircularProgressIndicator())
        : Column(children: [
          MediaQuery.of(context).size.width > 750
            ? Row(children: [
              Expanded(child: SimpleP(child: SimpleTA(estado, estadoOpt, 'Estado', func: altEst))),
              Expanded(child: SimpleP(child: SimpleTA(municipio, municipioOpt, 'Município', func: altMun, enable: municipioOpt.isNotEmpty))),
              Expanded(child: Form(key: formKey, child: SimpleP(child: SimpleTFF(potencia, 'Potência (kW)', func: altPot, validador: isDouble)))),
            ])
            : Column(children: [
              SimpleP(child: SimpleTA(estado, estadoOpt, 'Estado', func: altEst)),
              SimpleP(child: SimpleTA(municipio, municipioOpt, 'Município', func: altMun, enable: municipioOpt.isNotEmpty)),
              Form(key: formKey, child: SimpleP(child: SimpleTFF(potencia, 'Potência (kW)', func: altPot, validador: isDouble))),
            ]),
          if(irradSeries.isNotEmpty) Expanded(child: SimpleP(child: SfCartesianChart(
            trackballBehavior: TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap),
            legend: const Legend(title: LegendTitle(text: ''), isVisible: true, position: LegendPosition.top),
            primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mês')),
            primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Geração (kWh.mês)'), rangePadding: ChartRangePadding.normal),
            series: irradSeries,
          ))),
        ]),
      ),
    );
  }

  void altEst(){
    municipio.text = '';
    municipioOpt = [];
    irradMunDados = {};
    potencia.text = '';
    irradSeries = [];
    if(estadoOpt.contains(estado.text)){
      municipioOpt = {
        for(var k in irradDados.keys)
          if(irradDados[k]['EST'] == estado.text)
            irradDados[k]['MUN'].toString()
      }.toList();
      municipioOpt.sort((a, b){return a.compareTo(b);});
    }
    setState((){});
  }

  void altMun(){
    irradMunDados = {};
    potencia.text = '';
    irradSeries = [];
    if(municipioOpt.contains(municipio.text)){
      for(var m in ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']){
        irradMunDados[m] = num.parse(irradDados['${estado.text}-${municipio.text}'][m]);
      }
    }
    setState((){});
  }

  altPot(){
    irradSeries = [];
    if(formKey.currentState!.validate()){
      double pot = double.parse(potencia.text.replaceAll(',','.'));
      double fat = 30*pot*0.8/1000;
      double med = fat*num.parse(irradDados['${estado.text}-${municipio.text}']['Ano']);
      irradSeries.add(serieColunaMesVal('Geração', Colors.amber, [for(var m in irradMunDados.keys) MesVal(m, fat*irradMunDados[m])]));
      irradSeries.add(serieLinhaMesVal('Média', Colors.blue, [for(var m in irradMunDados.keys) MesVal(m, med)]));
    }
    setState((){});
  }
}