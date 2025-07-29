import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/app_colors.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/colors/main_colors.dart';

class LightColors extends MainColors {
  AppColors lightTheme() {
    return const AppColors(
      primaryColor: Color(0xFF1D8A8C),
      backgroundColor : Colors.white,
      secondaryColor: Colors.black,
      textFieldColor:  Color(0xFFFAFAFA),
      inputFieldHintColor: Color(0xFF888888)
    );
  }
}
