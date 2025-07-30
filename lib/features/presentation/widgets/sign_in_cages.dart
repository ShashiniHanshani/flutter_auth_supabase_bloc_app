import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';

class SignInCages extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;
  const SignInCages({super.key, required this.icon, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        onPressed;
      },
      child: Container(
        height: height/15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: colors(context).textFieldColor
        ),
        child: Icon(icon, color: color,),
      ),
    );
  }
}