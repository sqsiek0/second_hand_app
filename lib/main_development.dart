import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:second_hand_app/app/app.dart';
import 'package:second_hand_app/bootstrap.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ffftdygzvcrzvmgqrgvq.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmZnRkeWd6dmNyenZtZ3FyZ3ZxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc0MDExODIsImV4cCI6MjAyMjk3NzE4Mn0._SjH7FbV80Jnk6MShwUzwHX8eT79p9TMl6rU9wkQZ6Q',
  );
  await GoogleFonts.pendingFonts([
    GoogleFonts.syne(),
  ]);
  await bootstrap(() => const App());
}
