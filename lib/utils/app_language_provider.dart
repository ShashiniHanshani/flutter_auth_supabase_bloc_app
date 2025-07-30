//Step 03 : 
//provider file for state management
//hold and change the state of the language we selected

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier{
  Locale _appLocale = const Locale("en");
  Locale get appLocal => _appLocale;

  fetchLocale() async{
    var prefs = await SharedPreferences.getInstance();
    if(prefs.getString('language_code') == null){
      _appLocale = const Locale('en');
      return null;
    }

    _appLocale = Locale(prefs.getString('language_code')!);
    notifyListeners();
    return Null;
  }

  Future <void> changeLanguage(Locale type) async{
    var prefs = await SharedPreferences.getInstance();
    if(_appLocale == type){
      return;
    }

    if(type == const Locale("si")){
      _appLocale = const Locale("si");
      await prefs.setString('language_code', 'si');
      await prefs.setString('countryCode', 'LK');
    }else{
      _appLocale = const Locale("en");
      await prefs.setString('language_code', 'en');
      await prefs.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}