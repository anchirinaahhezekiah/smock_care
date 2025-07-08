// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';
import 'providers/app_state.dart';
import 'providers/language_provider.dart';
import 'providers/audio_provider.dart';
import 'utils/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            title: 'SmockCare',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.pink,
              primaryColor: Color(0xFFE91E63),
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFFE91E63),
                brightness: Brightness.light,
              ),
              fontFamily: 'Roboto',
              textTheme: TextTheme(
                displayLarge: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                headlineLarge: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                bodyLarge: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            locale: languageProvider.currentLocale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'),
              Locale('tw', 'GH'), // Twi
              Locale('ak', 'GH'), // Akan
            ],
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

