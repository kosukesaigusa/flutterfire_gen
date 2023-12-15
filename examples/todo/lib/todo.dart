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

  Future<void> addTodo(String title) async {
    await ref.read(todoQueryProvider).add(createTodo: CreateTodo(title: title));
    ref.invalidateSelf();
  }

  Future<void> updateCompletionStatus({
    required String todoId,
    required bool isCompleted,
  }) async {
    await ref.read(todoQueryProvider).update(
          todoId: todoId,
          updateTodo: UpdateTodo(isCompleted: isCompleted),
        );
    ref.invalidateSelf();
  }

  Future<void> delete(String todoId) async {
    await ref.read(todoQueryProvider).delete(todoId: todoId);
    ref.invalidateSelf();
  }

  Future<void> completeAll() async {
    final todoIds =
        (await ref.read(todoListProvider.future)).map((todo) => todo.todoId);
    await ref.read(todoQueryProvider).batchWrite(
          todoIds
              .map(
                (todoId) => BatchUpdateTodo(
                  todoId: todoId,
                  updateTodo: const UpdateTodo(isCompleted: true),
                ),
              )
              .toList(),
        );
    ref.invalidateSelf();
  }

  Future<void> deleteAll() async {
    final todoIds =
        (await ref.read(todoListProvider.future)).map((todo) => todo.todoId);
    await ref.read(todoQueryProvider).batchWrite(
          todoIds.map((todoId) => BatchDeleteTodo(todoId: todoId)).toList(),
        );
    ref.invalidateSelf();
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
