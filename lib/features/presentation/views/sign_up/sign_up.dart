import 'package:flutter/material.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/form_text_field.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/sign_in_up_button.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        backgroundColor: colors(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.translate("create_your_account"),
                style: size26weight700,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:40.0, horizontal: 40),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormTextField(
                        labelName: AppLocalizations.of(context)!.translate("name"),
                        controller: name,
                        isObsecureText: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter a valid username";
                          } else {
                            return null;
                          }
                        },
                      ),
                      FormTextField(
                        labelName: AppLocalizations.of(context)!.translate("email"),
                        controller: email,
                        isObsecureText: false,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter a valid email address";
                          } else if(!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(p0)){
                            return "Please enter a valid email address";
                          }else {
                            return null;
                          }
                        },
                      ),
                      FormTextField(
                        labelName: AppLocalizations.of(context)!.translate("password"),
                        controller: password,
                        isObsecureText: true,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Enter a valid password";
                          }else if(p0.length<6){
                            return "The password should contain 6 characters";
                          }else {
                            return null;
                          }
                        },
                      ),
                      FormTextField(
                        labelName: AppLocalizations.of(context)!.translate("confirm_password"),
                        controller: confirmPassword,
                        isObsecureText: true,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return "Confirm the password";
                          }else if(p0 != password.text){
                            return "Password doesnot match";
                          }else {
                            return null;
                          }
                        },
                      ),
                      SignInUpButton(
                        buttonName: AppLocalizations.of(context,)!.translate("sign_up"),
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                            _formKey.currentState!.save();
                              print("Email : ${email.text}");
                              print("Password : ${password.text}");
                              print("Email : ${name.text}");
                              print("Password : ${confirmPassword.text}");
                              final snack = SnackBar(
                              content: Text(
                                AppLocalizations.of(context,)!.translate("sign_up_success_msg"),
                              ),
                              backgroundColor: colors(context).primaryColor,
                            );
                              Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(snack);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
