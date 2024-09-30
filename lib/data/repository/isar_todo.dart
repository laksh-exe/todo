/*

DATABASE repo

This implements todo repo, handles storing, retrieving, updating and deleting
in the isar database

*/

import 'package:isar/isar.dart';
import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;
  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    // fetch
    final todos = await db.todoIsars.where().findAll();
    // convert to normal todo object
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // convert to isar
    final todoIsar = TodoIsar.fromDomain(todo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    // convert to isar
    final todoIsar = TodoIsar.fromDomain(newTodo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
