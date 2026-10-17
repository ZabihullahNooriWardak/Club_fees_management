import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/l10n/app_localizations.dart';
import 'package:untitled1/modules/language/domain/models/enums/language_enum.dart';
import 'package:untitled1/modules/language/presentation/controllers/language_controller.dart';
import 'package:untitled1/modules/student/presentation/screens/add_student_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LanguageEnum selectedLang = LanguageEnum.english;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(AppLocalizations.of(context)!.language),
                  onTap: () {
                    _displayLanguageSelectionSheet(context);
                  },
                ),
              ];
            },
          ),
        ],

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(AppLocalizations.of(context)!.homePageTitle),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddStudentPage();
              },
            ),
          );
        },
        tooltip: 'Add student',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _displayLanguageSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) => StatefulBuilder(
            builder: (context, setState) => RadioGroup(
              groupValue: selectedLang,
              onChanged: (value) {
                setState(() {
                  selectedLang = value!;
                });

                ref.read(languageProvider.notifier).changeLanguage();
              },
              //
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      value: LanguageEnum.english,
                      title: Text('English'),
                    ),

                    RadioListTile(
                      value: LanguageEnum.persian,
                      title: Text('فارسی'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
