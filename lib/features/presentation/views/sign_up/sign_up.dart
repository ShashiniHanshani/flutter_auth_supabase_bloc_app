import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/sign_in/sign_in.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/terms_&_conditions.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/form_text_field.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/sign_in_cages.dart';
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

  bool? value = false;

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
        scrolledUnderElevation: 0,
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
                      Row(
                        children: [
                          Checkbox(
                            focusColor: colors(context).primaryColor,
                            checkColor: Colors.white,
                            value: value,
                            onChanged: (bool? newChange) {
                              setState(() {
                                value = newChange;
                              });
                            },
                            fillColor: MaterialStateProperty.all(value==true?colors(context).primaryColor: Colors.white),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "${AppLocalizations.of(context)!.translate("I_understood")} ", 
                                    style: TextStyle(
                                      color: colors(context).secondaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppLocalizations.of(context)!.translate("terms_policy"),
                                    style: TextStyle(
                                      color: colors(context).primaryColor,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndCondition()));
                                    }
                                  ),
                                ],
                              ),
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.translate("or_sign_up_with"),
                            style: size16weight400.copyWith(color: colors(context).inputFieldHintColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SignInCages(
                              icon: FontAwesomeIcons.google,
                              color: Color(0xFFE94435),
                              onPressed: () {
                                
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: SignInCages(
                              icon: FontAwesomeIcons.facebookF,
                              color: Color(0xFF0085FF),
                              onPressed: () {
                                
                              },
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: SignInCages(
                              icon: FontAwesomeIcons.twitter,
                              color: Color(0xFF00C2FF),
                              onPressed: () {
                                
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: "${AppLocalizations.of(context)!.translate("have_account")} ",
                            style: size16weight400.copyWith(
                              color: colors(context).secondaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context,)!.translate("sign_in"),
                                style: size16weight400.copyWith(color: colors(context).primaryColor),
                                recognizer:
                                    TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignIn(),
                                          ),
                                        );
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
            ],
          ),
        ),
      ),
    );
  }
}
