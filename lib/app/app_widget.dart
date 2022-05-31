import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        title: 'Flutter Slidy',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.luckiestGuyTextTheme()));
  }
}
