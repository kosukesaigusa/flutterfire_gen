import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo.flutterfire_gen.dart';
part 'todo.g.dart';

@riverpod
TodoQuery todoQuery(TodoQueryRef _) => TodoQuery();

@riverpod
class TodoList extends _$TodoList {
  @override
  Future<List<ReadTodo>> build() =>
      ref.watch(todoQueryProvider).fetchDocuments();

  Future<DocumentReference<CreateTodo>> addTodo(String title) {
    return ref
        .read(todoQueryProvider)
        .add(createTodo: CreateTodo(title: title));
  }

  Future<void> updateCompletionStatus({
    required String todoId,
    required bool isCompleted,
  }) {
    return ref.read(todoQueryProvider).update(
          todoId: todoId,
          updateTodo: UpdateTodo(isCompleted: isCompleted),
        );
  }
}

@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  const Todo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;

  @ReadDefault(false)
  @CreateDefault(false)
  final bool isCompleted;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
