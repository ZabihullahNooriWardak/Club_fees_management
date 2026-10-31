import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

// The generated file part prefix must match this filename
part 'database.g.dart';

@DriftDatabase()
class AppDatabase extends _$AppDatabase {
  // Use driftDatabase to automatically provision standard directory paths across mobile, desktop, and web
  AppDatabase() : super(driftDatabase(name: 'boxing_gym_database'));

  @override
  int get schemaVersion => 1;
}
