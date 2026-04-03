import 'package:artools/app/cccp/cccp_coordenadas.dart';
import 'package:artools/services/conversores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CCCPFormulario extends StatelessWidget {
  const CCCPFormulario(this.cccp, {super.key});
  final CCCPCoordenadas cccp;
  @override
  Widget build(BuildContext context) => FormBuilder(
    key: cccp.formBuilderState,
    child: Column(
      spacing: 13,
      children: [
        // Entradas Cartesianas
        const Text('Cartesiano', textAlign: TextAlign.center, style: TextStyle(fontSize: 31)),
        FormBuilderTextField(
          name: 'X',
          decoration: const InputDecoration(labelText: 'Coordenada X', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => cccp.alterarCartesiano(),
        ),
        FormBuilderTextField(
          name: 'Y',
          decoration: const InputDecoration(labelText: 'Coordenada Y', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => cccp.alterarCartesiano(),
        ),
        // Entradas Polares
        const Text('Polar', textAlign: TextAlign.center, style: TextStyle(fontSize: 31)),
        FormBuilderTextField(
          name: 'MOD',
          decoration: const InputDecoration(labelText: 'Módulo', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => cccp.alterarPolarGraus(),
        ),
        FormBuilderTextField(
          name: 'DEG',
          decoration: const InputDecoration(labelText: 'Ângulo [º]', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => cccp.alterarPolarGraus(),
        ),
        FormBuilderTextField(
          name: 'RAD',
          decoration: const InputDecoration(labelText: 'Ângulo [rad]', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => cccp.alterarPolarRadianos(),
        ),
      ],
    ),
  );
}