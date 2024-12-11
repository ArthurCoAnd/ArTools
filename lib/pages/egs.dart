// PACKAGES
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _carregado = false;

  List<IRRAD> _irrad = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _estado = TextEditingController();
  List<String> _estadoOpt = [];

  final TextEditingController _municipio = TextEditingController();
  List<String> _municipioOpt = [];

  final TextEditingController _potencia = TextEditingController();

  List<MesVal> _irradVal = [];
  List<CartesianSeries> _irradSeries = [];

  void _carregar() async {
    final List<Map> irradCSVdata = await loadCSV('IRRAD');
    _irrad = [for(Map m in irradCSVdata) IRRAD.fromMap(m)];
    _estadoOpt = {for(IRRAD i in _irrad) i.estado}.toList();
    setState((){_carregado = true;});
  }

  @override
  void initState() {
    super.initState();
    _carregar();
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
        fontFamily: GoogleFonts.sunflower().fontFamily,
      ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Estimador de Geração Solar'), centerTitle: true, backgroundColor: Colors.amber),
        body: !_carregado
        ? const Center(child: CircularProgressIndicator())
        : Column(children: [
          MediaQuery.of(context).size.width > 750
            ? Row(children: [
              Expanded(child: SimpleP(child: SimpleTA(_estado, _estadoOpt, 'Estado', func: altEst))),
              Expanded(child: SimpleP(child: SimpleTA(_municipio, _municipioOpt, 'Município', func: altMun, enable: _municipioOpt.isNotEmpty))),
              Expanded(child: Form(key: _formKey, child: SimpleP(child: SimpleTFF(_potencia, 'Potência (kW)', func: altPot, validador: valIsDouble)))),
            ])
            : Column(children: [
              SimpleP(child: SimpleTA(_estado, _estadoOpt, 'Estado', func: altEst)),
              SimpleP(child: SimpleTA(_municipio, _municipioOpt, 'Município', func: altMun, enable: _municipioOpt.isNotEmpty)),
              Form(key: _formKey, child: SimpleP(child: SimpleTFF(_potencia, 'Potência (kW)', func: altPot, validador: valIsDouble))),
            ]),
          if(_irradSeries.isNotEmpty) Expanded(child: SimpleP(child: SfCartesianChart(
            trackballBehavior: TrackballBehavior(enable: true, activationMode: ActivationMode.singleTap),
            legend: const Legend(title: LegendTitle(text: ''), isVisible: true, position: LegendPosition.top),
            primaryXAxis: const CategoryAxis(title: AxisTitle(text: 'Mês')),
            primaryYAxis: const NumericAxis(title: AxisTitle(text: 'Geração (kWh.mês)'), rangePadding: ChartRangePadding.normal),
            series: _irradSeries,
          ))),
        ]),
      ),
    );
  }

  void altEst(){
    _municipio.text = '';
    _municipioOpt = [];
    _irradVal = [];
    _potencia.text = '';
    _irradSeries = [];
    if(_estadoOpt.contains(_estado.text.toUpperCase())){
      _municipioOpt = {for(IRRAD i in _irrad) if(i.estado == _estado.text.toUpperCase()) i.municipio}.toList();
      _municipioOpt.sort((a, b){return a.compareTo(b);});
    }
    setState((){});
  }

  void altMun(){
    _irradVal = [];
    _potencia.text = '';
    _irradSeries = [];
    if(_municipioOpt.contains(_municipio.text.toUpperCase())){
      _irradVal = _irrad.firstWhere((i) => i.estado == _estado.text.toUpperCase() && i.municipio == _municipio.text.toUpperCase()).irrad;
    }
    setState((){});
  }

  altPot(){
    _irradSeries = [];
    if(_formKey.currentState!.validate()){
      final double pot = double.parse(_potencia.text.replaceAll(',','.'));
      final double fat = 30*pot*0.8/1000;
      final double med = fat * _irradVal.fold(0.0, (val, i) => val += i.val)/_irradVal.length;
      _irradSeries.add(serieColunaMesVal('Geração', Colors.amber, [for(MesVal m in _irradVal) MesVal(m.mes, fat*m.val)]));
      _irradSeries.add(serieLinhaMesVal('Média', Colors.blue, [for(var m in _irradVal) MesVal(m.mes, med)]));
    }
    setState((){});
  }
}

// ██ ██████  ██████   █████  ██████  
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██████  ██████  ███████ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██   ██ 
// ██ ██   ██ ██   ██ ██   ██ ██████  

class IRRAD{
  final int id;
  final double lat;
  final double lon;
  final String estado;
  final String municipio;

  List<MesVal> irrad = [];

  IRRAD({
    required this.id,
    required this.lat,
    required this.lon,
    required this.estado,
    required this.municipio,
  });

  factory IRRAD.fromMap(Map map){
    return IRRAD(
      id: int.parse(map['ID']),
      lat: double.parse(map['LAT']),
      lon: double.parse(map['LON']),
      estado: map['EST'].toString().toUpperCase(),
      municipio: map['MUN'].toString().toUpperCase(),
    )..irrad = [for(String mes in ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez']) MesVal(mes, int.parse(map[mes]))];
  }
}