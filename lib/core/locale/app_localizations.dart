import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'localization_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  Map<String, String> _localizationStrings;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  } 

  String translate(String key) => _localizationStrings[key];

  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();
}