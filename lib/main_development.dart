import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/app.dart';
import 'package:second_hand_app/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleFonts.pendingFonts([
    GoogleFonts.syne(),
  ]);
  await bootstrap(() => const App());
}
