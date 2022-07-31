import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wassilni_maak/application/app.dart';

Future<void> main() async {
  GoogleFonts.config.allowRuntimeFetching = false;

  runApp(const Application());
}
