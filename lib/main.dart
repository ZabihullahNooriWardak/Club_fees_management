import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/screens/home_view.dart';
import 'package:untitled1/shared/providers/language_provider.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp( ProviderScope(child: const MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale currentLocal = Locale('en');

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {

        final lang = ref.watch(languageProvider);

        return MaterialApp(
          locale: lang,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}
