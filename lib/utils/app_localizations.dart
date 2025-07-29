//Step 04 & Step 05: 
//helper class for localization delegates

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationDelegate();
  
  Map<String, String> _localizedStrings =  {};

  Future<bool> load() async{
    String jsonString = await rootBundle.loadString('locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value){
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key){
    return _localizedStrings[key] ?? key;
  }

}

//Step 05: create Localizaion Delegates
//the object that knows what to do when it is time to load a particular langauage

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>{
  const AppLocalizationDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return['en','si'].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async{
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }
  
  @override
  bool shouldReload(AppLocalizationDelegate old)=>false;
  
}
