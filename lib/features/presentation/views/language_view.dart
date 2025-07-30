import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/text_styles.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/core/themes/theme_data.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/features/presentation/views/sign_in/sign_in.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_language_provider.dart';
import 'package:sign_in_sign_up_bloc_supabase_hive_getit/utils/app_localizations.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {

  @override
  Widget build(BuildContext context) {
    String selectedLanguage= ""; 
    return Scaffold(
      backgroundColor: colors(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.translate("select_your_language"),
              style: size26weight700.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  LanguageTile(
                    name: "English",
                    selectedLanguage: selectedLanguage == "en",
                    onPressed: () async{
                      final appLan = Provider.of<AppLanguageProvider>(context, listen: false);
                      await appLan.changeLanguage(Locale('en'));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                      
                    },
                  ),
                  SizedBox(height: 12),
                  LanguageTile(
                    name: "සිංහල",
                    selectedLanguage: selectedLanguage == "si",
                    onPressed: () async{
                      final appLan = Provider.of<AppLanguageProvider>(context, listen: false);
                      await appLan.changeLanguage(Locale('si'));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                      print(appLan.appLocal);
                    },
                  ),
                 
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String name;
  final bool selectedLanguage;
  final VoidCallback onPressed;
  const LanguageTile({super.key,required this.selectedLanguage,required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name, textAlign: TextAlign.center),
      selected: selectedLanguage,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      selectedTileColor: colors(context).primaryColor,
      tileColor: colors(context).inputFieldHintColor,
      onTap: onPressed,
    );
  }
}


