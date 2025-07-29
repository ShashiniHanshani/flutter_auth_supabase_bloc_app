import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/sign_up/sign_up.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/form_text_field.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/widgets/sign_in_up_button.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_localizations.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors(context).backgroundColor,
      appBar: AppBar(backgroundColor: colors(context).backgroundColor),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context,)!.translate("sign_in_your_account"),
                        style: size26weight700,
                      ),
                      Padding(
                         padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: FormTextField(
                          labelName: AppLocalizations.of(context,)!.translate("email"),
                          hintText: "example123@gmail.com",
                          controller: email,
                          isObsecureText: false,
                          validator: (p0) {
                            if(p0!.isEmpty){
                              return "Not a valid Email";
                            }else if(!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(p0)){
                              return "Please enter a valid email address";
                            }else{
                              return null;
                            }
                          },
                        ),
                      ),
                      
                      FormTextField(
                        labelName: AppLocalizations.of(context,)!.translate("password"),
                        hintText: '********',
                        controller: password,
                        isObsecureText: true,
                        validator: (p0) {
                           if(p0!.isEmpty){
                            return "Not a valid password";
                          }else if(p0.length<6){
                            return "The password should contain 6 characters";
                          }else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 12),
                      SignInUpButton(
                        buttonName: AppLocalizations.of(context,)!.translate("sign_in"),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            print("Email : ${email.text}");
                            print("Password : ${password.text}");
                            
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "or sign in with",
                          style: size16weight400.copyWith(color: colors(context).inputFieldHintColor),
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
                      RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: size16weight400.copyWith(
                            color: colors(context).secondaryColor,
                          ),
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(context,)!.translate("sign_up"),
                              style: size16weight400.copyWith(color: colors(context).primaryColor),
                              recognizer:
                                  TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUp(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                        ),
                          
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
