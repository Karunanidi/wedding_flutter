import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMP | Reuni 2024',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0x9C295238),
          ),
        ),
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
