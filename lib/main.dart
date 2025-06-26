import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'presentation/_home/home.dart';
import 'di/injection.dart';

/// Entry point of the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFFD4FAE6),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
