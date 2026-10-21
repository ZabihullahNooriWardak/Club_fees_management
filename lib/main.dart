import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/modules/language/presentation/controllers/language_controller.dart';

import 'core/presentation/screens/home_view.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final lang = ref.watch(languageProvider);

        return lang.when(
          data: (data) => _buildMaterialApp(local: data),
          error: (error, stackTrace) => _buildMaterialApp(),
          loading: () => _buildMaterialApp(),
        );
      },
    );
  }

  Widget _buildMaterialApp({Locale? local}) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: local ?? Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Boxing club',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}
