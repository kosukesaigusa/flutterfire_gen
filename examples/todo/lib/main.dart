import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'todo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const TodoListPage(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
          },
        ),
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
                key: ValueKey(todo.todoId),
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
                  },
                ),
                trailing: IconButton(
                  onPressed: () =>
                      ref.read(todoListProvider.notifier).delete(todo.todoId),
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text(err.toString())),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(todoListProvider.notifier).completeAll(),
            child: const Icon(Icons.check),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () => ref.read(todoListProvider.notifier).deleteAll(),
            child: const Icon(Icons.delete),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () => ref
                .read(todoListProvider.notifier)
                .addTodo('Todo ${DateTime.now()}'),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
