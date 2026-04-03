import 'package:artools/app/egs/egs_controller.dart';
import 'package:artools/services/conversores.dart';
import 'package:artools/services/validadores.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';

class EGSFormulario extends StatelessWidget {
  const EGSFormulario(this.egs, {super.key});
  final EGSController egs;
  @override
  Widget build(BuildContext context) => FormBuilder(
    key: egs.formBuilderState,
    child: Wrap(
      alignment: WrapAlignment.center,
      spacing: 13, runSpacing: 13,
      children: [
        FormBuilderTypeAhead<String>(
          name: 'E',
          decoration: const InputDecoration(labelText: 'Estado', border: OutlineInputBorder()),
          itemBuilder: (context, String suggestion) => ListTile(title: Text(suggestion)),
          suggestionsCallback: (pattern) => egs.estadoOpt.where((estado) => estado.toLowerCase().contains(pattern.toLowerCase())).toList(),
          suggestionErrorBuilder: (context, error) => const Padding(padding: EdgeInsetsGeometry.all(13), child: Text('Nenhum estado encontrado...')),
          emptyBuilder:(context) => const Padding(padding: EdgeInsetsGeometry.all(13), child: Text('Nenhum estado encontrado...')),
          selectionToTextTransformer: (suggestion) => suggestion,
          onChanged: (value) => egs.alterarEstado(value),
        ),
        FormBuilderTypeAhead<String>(
          name: 'M',
          decoration: const InputDecoration(labelText: 'Município', border: OutlineInputBorder()),
          itemBuilder: (context, String suggestion) => ListTile(title: Text(suggestion)),
          suggestionsCallback: (pattern) => egs.municipioOpt.where((municipio) => municipio.toUpperCase().contains(pattern.toUpperCase())).toList(),
          suggestionErrorBuilder: (context, error) => const Padding(padding: EdgeInsetsGeometry.all(13), child: Text('Nenhum município encontrado...')),
          emptyBuilder:(context) => const Padding(padding: EdgeInsetsGeometry.all(13), child: Text('Nenhum município encontrado...')),
          selectionToTextTransformer: (suggestion) => suggestion,
          onChanged: (value) => egs.alterarMunicipio(value),
        ),
        FormBuilderTextField(
          name: 'P',
          decoration: const InputDecoration(labelText: 'Potência [kWp]', border: OutlineInputBorder()),
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => valIsDouble(value),
          valueTransformer: (value) => strN2doubleN(value),
          onChanged: (value) => egs.alterarPotencia(value),
        ),
      ].map((e) => SizedBox(width: 360, child: e)).toList(),
    ),
  );
}