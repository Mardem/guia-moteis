import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guia_moteis/core/di/core_di.dart';
import 'package:logger/logger.dart';

import 'modules/home/home.dart';

final GetIt inject = GetIt.instance;
final Logger logger = Logger();

void main() {
  startModules();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
      ),
      home: const HomePresentation(),
    );
  }
}
