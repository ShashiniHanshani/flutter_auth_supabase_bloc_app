import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textFieldColor;
  final Color inputFieldHintColor;
  final Color backgroundColor;

  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.textFieldColor,
    required this.inputFieldHintColor,
    required this.backgroundColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? textFieldColor,
    Color? inputFieldHintColor,
    Color? backgroundColor,

  }) {
    return AppColors(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      textFieldColor: textFieldColor ?? this.textFieldColor,
      inputFieldHintColor: inputFieldHintColor ??  this.inputFieldHintColor,
      backgroundColor: backgroundColor?? this.backgroundColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if(other is! AppColors){
      return this;
    }
    return AppColors(
      primaryColor: Color.lerp(primaryColor , other.primaryColor, t)!, 
      secondaryColor: Color.lerp(secondaryColor , other.secondaryColor, t)!, 
      textFieldColor : Color.lerp(textFieldColor , other.textFieldColor, t)!, 
      inputFieldHintColor :Color.lerp(inputFieldHintColor , other.inputFieldHintColor, t)!,
      backgroundColor : Color.lerp(backgroundColor , other.backgroundColor, t)!
    );
  }
}
