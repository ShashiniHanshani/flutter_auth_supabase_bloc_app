import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/app_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/dark_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/light_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_services.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(ThemeType themedata){
  AppColors colors;
  switch (themedata) {
    case ThemeType.LIGHT:
      colors = LightColors().lightTheme();
      break;
    case ThemeType.DARK:
      colors = DarkColors().darkTheme();
      break;
    default:
      colors = LightColors().lightTheme();
  }

  return ThemeData(
    fontFamily: 'Poppins',
    extensions: <ThemeExtension<AppColors>>[colors],
    scaffoldBackgroundColor: colors.secondaryColor,
    primaryColor: colors.primaryColor,
    
  );
}