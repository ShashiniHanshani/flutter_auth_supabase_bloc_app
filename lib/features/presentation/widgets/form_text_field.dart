import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';

class FormTextField extends StatelessWidget {
  final String labelName;
  final String? hintText;
  final TextEditingController controller;
  final bool isObsecureText;
  final String? Function(String?)? validator;

  const FormTextField({
    super.key,
    required this.labelName,
    this.hintText,
    required this.controller,
    required this.isObsecureText,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelName, style: size16weight400.copyWith(color: colors(context).inputFieldHintColor),),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: TextFormField(
            cursorColor: colors(context).primaryColor,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: colors(context).textFieldColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), 
                borderSide: BorderSide.none,
              ),
              hintText: hintText,hintStyle: TextStyle(color: const Color.fromARGB(255, 117, 115, 115)),
            ),
            validator: validator,
            obscureText: isObsecureText,
          ),
        ),
      ],
    );
  }
}
