import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/app_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_services.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/sign_in/sign_in.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/splashscreen.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_language_provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppLanguageProvider(),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      title: 'SignIn_up',
      theme: getAppTheme(ThemeType.LIGHT),
      darkTheme: getAppTheme(ThemeType.DARK),
      themeMode: ThemeMode.system,
      locale: appLanguage.appLocal,
      supportedLocales: const [Locale('en', 'US'), Locale('si', 'LK')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SplashScreen()
    );
  }
}
