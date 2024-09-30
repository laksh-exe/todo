/* 

TO DO Repository

Define what app can do

*/

import 'package:todo/domain/models/todo.dart';

abstract class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> addTodo();
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
}

/*
Notes --

the repo in domain layer outlines what operations the app can do,
data layer implements the same

*/