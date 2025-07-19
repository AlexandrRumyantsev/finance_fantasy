import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:worker_manager/worker_manager.dart';

import 'di/injection.dart';
import 'infrastructure/managers/manager.dart';
import 'infrastructure/managers/settings_manager.dart';
import 'presentation/components/connection_warning/logic/cubit.dart';
import 'presentation/splash/splash.dart';
import 'utils/app_localizations.dart';
import 'utils/colors.dart';
import 'utils/locale_provider.dart';
import 'utils/settings_provider.dart';
import 'utils/theme_extensions.dart';
import 'utils/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await workerManager.init();
  await configureDependencies();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(getIt<SettingsManager>()),
        ),
        ChangeNotifierProvider(
          create: (_) => SettingsProvider(getIt<SettingsManager>()),
        ),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider(
            Provider.of<SettingsProvider>(context, listen: false),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return BlocProvider(
      create: (context) => getIt<ConnectionWarningCubit>(),
      child: BlocListener<ConnectionWarningCubit, ConnectionWarningState>(
        listener: (context, state) {},
        child: Consumer<LocaleProvider>(
          builder: (context, localeProvider, child) {
            return MaterialApp(
              navigatorKey: NavigationManager.navigatorKey,
              locale: localeProvider.locale,
              supportedLocales: const [
                Locale('ru'),
                Locale('en'),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              theme: ThemeData.light().copyWith(
                extensions: <ThemeExtension<dynamic>>[
                  AppColors.lightWithCustomPrimary(themeProvider.primaryColor),
                ],
                datePickerTheme: ThemeDataExtensions.lightDatePickerTheme,
                timePickerTheme: ThemeDataExtensions.lightTimePickerTheme,
              ),
              darkTheme: ThemeData.dark().copyWith(
                extensions: <ThemeExtension<dynamic>>[
                  AppColors.darkWithCustomPrimary(themeProvider.primaryColor),
                ],
                datePickerTheme: ThemeDataExtensions.darkDatePickerTheme,
                timePickerTheme: ThemeDataExtensions.darkTimePickerTheme,
              ),
              themeMode: themeProvider.themeMode,
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
            );
          },
        ),
      ),
    );
  }
}
