import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/app_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_services.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/sign_in/sign_in.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_language_provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguageProvider appLanguage = AppLanguageProvider();
  await appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguageProvider appLanguage;
  const MyApp({super.key, required this.appLanguage});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguageProvider>(
      create: (BuildContext context) => appLanguage,
      child: Consumer<AppLanguageProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'SignIn_up',
            theme: getAppTheme(ThemeType.LIGHT),
            darkTheme: getAppTheme(ThemeType.DARK),
            themeMode: ThemeMode.system,
            home: SignIn(),
            locale: value.appLocal,
            supportedLocales: const [Locale('en', 'US'), Locale('si', 'LK')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
