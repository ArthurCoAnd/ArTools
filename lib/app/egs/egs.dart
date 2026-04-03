// ███████╗ ██████╗ ███████╗
// ██╔════╝██╔════╝ ██╔════╝
// █████╗  ██║  ███╗███████╗
// ██╔══╝  ██║   ██║╚════██║
// ███████╗╚██████╔╝███████║
// ╚══════╝ ╚═════╝ ╚══════╝
// Estimador de Geração Solar

import 'package:artools/app/egs/egs_controller.dart';
import 'package:artools/app/egs/egs_formulario.dart';
import 'package:artools/app/egs/egs_grafico.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class EGS extends StatefulWidget {
  const EGS({super.key});

  @override
  State<EGS> createState() => _EGSState();
}

class _EGSState extends State<EGS> {
  
  final EGSController _egs = EGSController();
  final ValueNotifier<bool> _carregado = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _carregar();
  }

  void _carregar() async {
    await _egs.carregar();
    _carregado.value = true;
  }

  @override
  Widget build(BuildContext context) => Theme(
    data: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.amber,
        primary: Colors.amber,
      ),
      fontFamily: GoogleFonts.oswald().fontFamily,
    ),
    child: Scaffold(
      appBar: AppBar(title: const Text('Estimador de Geração Solar'), centerTitle: true, backgroundColor: Colors.amber),
      body: ValueListenableBuilder(
        valueListenable: _carregado,
        builder: (context, value, child) => !value ? const Center(child: CircularProgressIndicator()) : Center(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              spacing: 13,
              children: [
                EGSFormulario(_egs),
                EGSGrafico(_egs),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}