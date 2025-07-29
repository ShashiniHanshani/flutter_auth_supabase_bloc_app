import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';

class SignInUpButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const SignInUpButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    
    final widthSize = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: widthSize,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(buttonName,
          style: size16weight400.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
