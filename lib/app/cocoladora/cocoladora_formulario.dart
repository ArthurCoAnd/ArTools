import 'package:artools/services/conversores.dart';
import 'package:artools/services/validadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CocoladoraFormulario extends StatelessWidget {
  const CocoladoraFormulario(this.formBuilderState, this.onChanged, {super.key});
  final GlobalKey<FormBuilderState> formBuilderState;
  final VoidCallback onChanged;
  @override
  Widget build(BuildContext context) => FormBuilder(
    key: formBuilderState,
    child: Column(
      spacing: 13,
      children: [
        FormBuilderTextField(
          name: 'S',
          decoration: const InputDecoration(labelText: 'Média Salarial Mensal (R\$/mês)', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => valIsDouble(value),
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => onChanged(),
        ),
        FormBuilderTextField(
          name: 'H',
          decoration: const InputDecoration(labelText: 'Carga Horária Semanal (h/semana)', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => valIsDouble(value),
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => onChanged(),
        ),
        FormBuilderTextField(
          name: 'M',
          decoration: const InputDecoration(labelText: 'Média de Tempo no Troninho (min/💩)', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => valIsDouble(value),
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => onChanged(),
        ),
      ].map((e) => SizedBox(width: 500, child: e)).toList(),
    ),
  );
}