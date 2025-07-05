import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'di/injection.dart';
import 'infrastructure/managers/shared_prefs.dart';
import 'presentation/splash/splash.dart';
import 'utils/colors.dart';
import 'utils/theme_extensions.dart';
import 'utils/theme_provider.dart';

/// Entry point of the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await configureDependencies();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(getIt<SharedPrefsManager>()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AppColors.light(),
        ],
        datePickerTheme: ThemeDataExtensions.lightDatePickerTheme,
        timePickerTheme: ThemeDataExtensions.lightTimePickerTheme,
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          AppColors.dark(),
        ],
        datePickerTheme: ThemeDataExtensions.darkDatePickerTheme,
        timePickerTheme: ThemeDataExtensions.darkTimePickerTheme,
      ),
      themeMode: themeProvider.themeMode,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
