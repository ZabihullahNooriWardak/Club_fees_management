
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/l10n/app_localizations.dart';
import 'package:untitled1/screens/add_student_page.dart';
import 'package:untitled1/screens/language_enum.dart';
import 'package:untitled1/shared/providers/language_provider.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

LanguageEnum selectedLang = LanguageEnum.english;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        
        actions: [PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(child: Text(AppLocalizations.of(context)!.language,),onTap: () {
              //
              showModalBottomSheet(context: context, builder: (context) {
                //
                return Consumer(
                  builder: (context, ref, child) =>
                   StatefulBuilder(
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
                            RadioListTile(value: LanguageEnum.english,title: Text('English'),),


                            RadioListTile(value: LanguageEnum.persian,title: Text('فارسی'),)


                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },);
            },)
          ];
        },)],

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(AppLocalizations.of(context)!.hello),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder:  (context) {
            return AddStudentPage();
          },));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
