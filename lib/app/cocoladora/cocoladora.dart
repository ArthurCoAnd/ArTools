//  ██████╗ ██████╗  ██████╗ ██████╗ ██╗      █████╗ ██████╗  ██████╗ ██████╗  █████╗ 
// ██╔════╝██╔═══██╗██╔════╝██╔═══██╗██║     ██╔══██╗██╔══██╗██╔═══██╗██╔══██╗██╔══██╗
// ██║     ██║   ██║██║     ██║   ██║██║     ███████║██║  ██║██║   ██║██████╔╝███████║
// ██║     ██║   ██║██║     ██║   ██║██║     ██╔══██║██║  ██║██║   ██║██╔══██╗██╔══██║
// ╚██████╗╚██████╔╝╚██████╗╚██████╔╝███████╗██║  ██║██████╔╝╚██████╔╝██║  ██║██║  ██║
//  ╚═════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝

import 'package:artools/app/cocoladora/cocoladora_formulario.dart';
import 'package:artools/services/conversores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

class Cocoladora extends StatefulWidget{
  const Cocoladora({super.key});

  @override
  CocoladoraState createState() => CocoladoraState();
}

class CocoladoraState extends State<Cocoladora>{

  final GlobalKey<FormBuilderState> _formBuilderState = GlobalKey<FormBuilderState>();
  final ValueNotifier<double?> _cocoladora = ValueNotifier(null);

  // ██       █████  ██    ██  ██████  ██    ██ ████████ 
  // ██      ██   ██  ██  ██  ██    ██ ██    ██    ██    
  // ██      ███████   ████   ██    ██ ██    ██    ██    
  // ██      ██   ██    ██    ██    ██ ██    ██    ██    
  // ███████ ██   ██    ██     ██████   ██████     ██    

  @override
  Widget build(BuildContext context) => Theme(
    data: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        primary: Colors.brown,
        onPrimary: Colors.brown,
        surface: Colors.brown,
        onSurface: Colors.brown,
      ),
      fontFamily: GoogleFonts.dynaPuff().fontFamily,
    ),
    child: Scaffold(
      appBar: AppBar(title: const Text('Cocôladora'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(13),
          child: Card(
            color: Colors.brown.shade200,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(13),
              child: SizedBox(
                width: 500,
                child: Column(
                  spacing: 13,
                  children: [
                    Image.asset('assets/images/logos/Cocoladora.png', height: 131, width: 131),
                    const Center(child: Text('Cocôladora', style: TextStyle(fontSize: 31))),
                    CocoladoraFormulario(_formBuilderState, _calcular),
                    ValueListenableBuilder(
                      valueListenable: _cocoladora,
                      builder: (context, value, child) => value == null ? const SizedBox.shrink() : SelectableText(
                        'Cada 💩 lhe rende:\nR\$${double2strDinheiro(_cocoladora.value!)}',
                        style: const TextStyle(fontSize: 30),
                        textAlign: TextAlign.center
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  void _calcular() {
    _cocoladora.value = null;
    final FormBuilderState? state = _formBuilderState.currentState;
    if(state == null) return;
    state.save();
    final Map<String, dynamic> values = state.value;
    if(values.containsValue(null)) return;
    _cocoladora.value = values["M"] * values["S"] / (60 * values["H"] * 4);
  }
}