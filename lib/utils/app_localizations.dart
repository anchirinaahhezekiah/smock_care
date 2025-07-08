// lib/utils/app_localizations.dart
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome to SmockCare',
      'health_topics': 'Health Topics',
      'community': 'Community',
      'resources': 'Resources',
      'profile': 'Profile',
      'occupational_safety': 'Occupational Safety',
      'womens_health': 'Women\'s Health',
      'mental_wellness': 'Mental Wellness',
      'nutrition': 'Nutrition',
    },
    'tw': {
      'welcome': 'Akwaaba SmockCare',
      'health_topics': 'Akwahosan Ho Nsɛm',
      'community': 'Mpɔtam',
      'resources': 'Nneɛma',
      'profile': 'Wo Ho Nsɛm',
      'occupational_safety': 'Adwuma Ahotew',
      'womens_health': 'Mmaa Akwahosan',
      'mental_wellness': 'Adwene Ahotew',
      'nutrition': 'Aduane Pa',
    },
    'ak': {
      'welcome': 'Akwaaba SmockCare',
      'health_topics': 'Akwahosan Ho Nsɛm',
      'community': 'Mpɔtam',
      'resources': 'Nneɛma',
      'profile': 'Wo Ho Nsɛm',
      'occupational_safety': 'Adwuma Ahotew',
      'womens_health': 'Mmaa Akwahosan',
      'mental_wellness': 'Adwene Ahotew',
      'nutrition': 'Aduane Pa',
    },
  };

  String get welcome {
    return _localizedValues[locale.languageCode]!['welcome']!;
  }

  String get healthTopics {
    return _localizedValues[locale.languageCode]!['health_topics']!;
  }

  String get community {
    return _localizedValues[locale.languageCode]!['community']!;
  }

  String get resources {
    return _localizedValues[locale.languageCode]!['resources']!;
  }

  String get profile {
    return _localizedValues[locale.languageCode]!['profile']!;
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tw', 'ak'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}