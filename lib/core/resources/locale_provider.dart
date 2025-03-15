import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const supportedLocales = {
  'en': Locale('en', 'IN'),
  'es': Locale('es', 'ES'),
};

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(supportedLocales['en']!);

  void setLocale(String languageCode) {
    if (supportedLocales.containsKey(languageCode)) {
      state = supportedLocales[languageCode]!;
    }
  }
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
