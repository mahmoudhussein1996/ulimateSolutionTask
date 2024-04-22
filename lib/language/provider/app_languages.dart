import 'dart:ui';

import 'package:flutter/material.dart';

import '../../Shared/shared_preferances.dart';

enum Languages {ar, en}

class AppLanguage extends ChangeNotifier {
  String defaultLang = "en";
  Locale? _appLocale;
  Locale get appLocal => _appLocale ?? Locale(defaultLang);
  String get appLanguage => SharedPref.getCurrentLang() == null
      ? window.locale.languageCode : defaultLang;

  bool _arabicSelected = false;
  bool get arabicSelected => _arabicSelected;
  setArabicSelected(bool arabicSelected){
    _arabicSelected = arabicSelected;
    _englishSelected = !arabicSelected;
    notifyListeners();
  }

  bool _englishSelected = false;
  bool get englishSelected => _englishSelected;
  setEnglishSelected(bool englishSelected){
    _englishSelected = englishSelected;
    _arabicSelected = !englishSelected;
    notifyListeners();
  }

  Locale fetchLocale() {
    if (SharedPref.getCurrentLang() != null) {
      _appLocale = Locale(SharedPref.getCurrentLang()!);
    } else {
      _appLocale = Locale(defaultLang);
    }
    return _appLocale!;
  }

  Future changeLanguage({required String lang}) async {
    if (_appLocale == Locale(lang)) return;
    _appLocale = Locale(lang);
    await SharedPref.setCurrentLang(lang: lang);
    notifyListeners();
  }

  void listen(){
    notifyListeners();
  }
}
