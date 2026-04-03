import 'dart:math';
import 'package:artools/services/conversores.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CCCPCoordenadas{
  CCCPCoordenadas();

  final ValueNotifier<double?> coordenadaX = ValueNotifier(null);
  final ValueNotifier<double?> coordenadaY = ValueNotifier(null);
  final ValueNotifier<double?> modulo = ValueNotifier(null);
  final ValueNotifier<double?> anguloGraus = ValueNotifier(null);
  final ValueNotifier<double?> anguloRadianos = ValueNotifier(null);

  final GlobalKey<FormBuilderState> formBuilderState = GlobalKey<FormBuilderState>();
  
  bool _alterando = false;

  void _alterar(void Function() function) {
    if (_alterando) return;
    _alterando = true;
    final state = formBuilderState.currentState;
    if (state != null && state.saveAndValidate()) {
      function();
      _sincronizar(state);
    }
    _alterando = false;
  }

  void _sincronizar(FormBuilderState state) {
    final mapeamento = {
      'X': coordenadaX.value,
      'Y': coordenadaY.value,
      'MOD': modulo.value,
      'DEG': anguloGraus.value,
      'RAD': anguloRadianos.value,
    };
    mapeamento.forEach((campo, valor){state.fields[campo]?.didChange(doubleN2str(valor));});
  }

  void alterarCartesiano() => _alterar(() {
    final values = formBuilderState.currentState!.value;
    coordenadaX.value = values['X'];
    coordenadaY.value = values['Y'];
    final x = coordenadaX.value ?? 0.0;
    final y = coordenadaY.value ?? 0.0;
    modulo.value = sqrt(x * x + y * y);
    anguloRadianos.value = atan2(y, x);
    anguloGraus.value = anguloRadianos.value! * 180 / pi;
  });

  void alterarPolarGraus() => _alterar(() {
    final values = formBuilderState.currentState!.value;
    modulo.value = values['MOD'];
    anguloGraus.value = values['DEG'];
    anguloRadianos.value = (anguloGraus.value ?? 0) * pi / 180;
    _calcularCartesiano();
  });

  void alterarPolarRadianos() => _alterar(() {
    final values = formBuilderState.currentState!.value;
    modulo.value = values['MOD'];
    anguloRadianos.value = values['RAD'];
    anguloGraus.value = (anguloRadianos.value ?? 0) * 180 / pi;
    _calcularCartesiano();
  });

  void _calcularCartesiano() {
    final m = modulo.value ?? 0.0;
    final r = anguloRadianos.value ?? 0.0;
    coordenadaX.value = m * cos(r);
    coordenadaY.value = m * sin(r);
  }
}