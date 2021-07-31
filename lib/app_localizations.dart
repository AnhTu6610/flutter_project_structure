import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:yaml/yaml.dart';

// ignore: invalid_required_positional_param
String translate(@required BuildContext context, @required String key) {
  return AppLocalizations.of(context).translate(key);
}

class AppLocalizations {
  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  final Locale locale;

  AppLocalizations(this.locale);
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  // Map<String, String> _localizedStrings;
  dynamic _localizedStrings;

  Future<bool> load() async {
    print("|-->Language: ${locale.languageCode}");
    String val = await rootBundle.loadString('assets/language/${locale.languageCode}.yaml', cache: true);
    _localizedStrings = loadYaml(val);

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? "#";
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
