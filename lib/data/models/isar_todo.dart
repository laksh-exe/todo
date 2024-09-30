/*

ISAR TO DO MODEL

Converts to do model into isar to do model, stores into isar db

*/

import 'package:isar/isar.dart';
import 'package:todo/domain/models/todo.dart';

//to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert ISAR object into a pure todo object
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  // convert pure object into an ISAR object
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
