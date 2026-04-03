import 'package:flutter/material.dart';

class CCCPTitulo extends StatelessWidget {
  const CCCPTitulo({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 13,
    children: [
      Image.asset('assets/images/logos/CCCP.png', height: 131, width: 131),
      const Text('Conversor de Coordenadas Cartesianas e Polares', style: TextStyle(fontSize: 13)),
    ],
  );
}