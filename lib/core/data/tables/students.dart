import 'package:drift/drift.dart';
import 'package:untitled1/modules/student/domain/enums/student_state.dart';
import 'package:untitled1/modules/student/domain/enums/student_time.dart';

class Students extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  TextColumn get phone => text().unique().nullable()();

  IntColumn get studentState =>
      integer().withDefault(Constant(StudentState.active.value))();

  IntColumn get studentTime =>
      integer().withDefault(Constant(StudentTime.night.value))();

  DateTimeColumn get dateOfBirth => dateTime().nullable()();

  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now().toUtc())();
}
