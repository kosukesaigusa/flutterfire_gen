import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final query = TodoQuery();

  final todos = await query.fetchDocuments();
  for (final todo in todos) {
    print(todo.todoId);
  }

  final notCompletedTodos = await query.fetchDocuments(
    queryBuilder: (query) => query.where('isCompleted', isNotEqualTo: true),
  );
  for (final todo in notCompletedTodos) {
    print(todo.todoId);
  }

  query.subscribeDocuments();

  query.subscribeDocuments(
    queryBuilder: (query) => query.where('isCompleted', isNotEqualTo: true),
  );

  final todosAsCollectionGroup =
      await query.fetchDocuments(asCollectionGroup: true);
  for (final todo in todosAsCollectionGroup) {
    print(todo.todoId);
  }

  query.subscribeDocuments(asCollectionGroup: true);

  final todo = await query.fetchDocument(todoId: 'todoId');
  print(todo?.todoId);

  final todosCount = await query.count();
  print(todosCount);

  final addedDocumentReference =
      await query.add(createTodo: const CreateTodo(title: 'A new Todo'));
  print(addedDocumentReference.id);

  await query.set(
    todoId: 'anotherTodoId',
    createTodo: const CreateTodo(title: 'Another Todo'),
  );

  await query.update(
    todoId: 'todoId',
    updateTodo: const UpdateTodo(isCompleted: true),
  );

  await query.delete(todoId: 'todoId');

  await query.batchWrite([
    const BatchCreateTodo(
      todoId: 'newTodoId',
      createTodo: CreateTodo(title: 'A new Todo'),
    ),
    const BatchUpdateTodo(
      todoId: 'todoId',
      updateTodo: UpdateTodo(isCompleted: true),
    ),
    const BatchDeleteTodo(todoId: 'anotherTodoId'),
  ]);
}
