//  █████╗ ██████╗ ████████╗ ██████╗  ██████╗ ██╗     ███████╗
// ██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝
// ███████║██████╔╝   ██║   ██║   ██║██║   ██║██║     ███████╗
// ██╔══██║██╔══██╗   ██║   ██║   ██║██║   ██║██║     ╚════██║
// ██║  ██║██║  ██║   ██║   ╚██████╔╝╚██████╔╝███████╗███████║
// ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝

// Desenvolvedores:
// - Arthur Cordeiro Andrade

import 'package:artools/app/cocoladora/cocoladora.dart';
import 'package:artools/app/menu/menu.dart';
import 'package:artools/app/cccp/cccp.dart';
import 'package:artools/app/cs16/cs16.dart';
import 'package:artools/app/egs/egs.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

void main(){runApp(const ArTools());}

class ArTools extends StatelessWidget {
  const ArTools({super.key});
  @override
  Widget build(BuildContext context) {

    final String? fonte = GoogleFonts.oswald().fontFamily;

    return MaterialApp(
      title: 'ArTools',
      debugShowCheckedModeBanner: false,
      
      localizationsDelegates: const [GlobalCupertinoLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, SfGlobalLocalizations.delegate],
      supportedLocales: const [Locale('pt','BR')],
      locale: const Locale('pt','BR'),
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: fonte,
        useMaterial3: true,
      ),
      
      routes: {
        '/': (context) => const MENU(),
        '/CCCP': (context) => const CCCP(),
        '/Cocoladora': (context) => const Cocoladora(),
        '/CS16': (context) => const CS16(),
        '/EGS': (context) => const EGS(),
      },
    );
  }
}