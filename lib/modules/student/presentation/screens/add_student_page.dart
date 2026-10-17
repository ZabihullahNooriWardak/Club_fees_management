import 'package:flutter/material.dart';
import 'package:untitled1/l10n/app_localizations.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({super.key});

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.addStudentPageTitle),
      ),
      body: Column(children: [Row(children: [])]),
    );
  }
}
