import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: TodoListPage(),
      ),
    ),
  );
}

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: todoList.when(
        data: (todos) => RefreshIndicator(
          onRefresh: () => ref.refresh(todoListProvider.future),
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.todoId),
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) async {
                    if (value == null) {
                      return;
                    }
                    await ref
                        .read(todoListProvider.notifier)
                        .updateCompletionStatus(
                          todoId: todo.todoId,
                          isCompleted: value,
                        );
                    ref.invalidate(todoListProvider);
                  },
                ),
                trailing: IconButton(
                  onPressed: () async {
                    await ref
                        .read(todoListProvider.notifier)
                        .delete(todo.todoId);
                    ref.invalidate(todoListProvider);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref
              .read(todoListProvider.notifier)
              .addTodo('Todo ${DateTime.now()}');
          ref.invalidate(todoListProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
