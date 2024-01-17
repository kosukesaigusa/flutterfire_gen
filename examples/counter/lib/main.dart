import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: const CounterListPage(),
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

class CounterListPage extends ConsumerStatefulWidget {
  const CounterListPage({super.key});

  @override
  ConsumerState<CounterListPage> createState() => _CounterListPageState();
}

class _CounterListPageState extends ConsumerState<CounterListPage> {
  @override
  Widget build(BuildContext context) {
    final counterList = ref.watch(counterListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Counter List')),
      body: counterList.when(
        data: (counters) => RefreshIndicator(
          onRefresh: () => ref.refresh(counterListProvider.future),
          child: ListView.builder(
            itemCount: counters.length,
            itemBuilder: (context, index) {
              final counter = counters[index];
              return ListTile(
                key: ValueKey(counter.counterId),
                title: Text(counter.value.toString()),
                subtitle: Text(counter.counterId),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () => ref
                          .read(counterListProvider.notifier)
                          .increment(counterId: counter.counterId),
                      icon: const Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () => ref
                          .read(counterListProvider.notifier)
                          .decrement(counterId: counter.counterId),
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () => ref
                          .read(counterListProvider.notifier)
                          .delete(counter.counterId),
                      icon: const Icon(Icons.delete),
                    ),
                  ],
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
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () => ref.read(counterListProvider.notifier).deleteAll(),
            child: const Icon(Icons.delete),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () async {
              final average =
                  await ref.read(counterListProvider.notifier).getAverage();
              if (!mounted) {
                return;
              }
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text('average: $average')),
                );
            },
            child: const Icon(Icons.balance),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () async {
              final sum = await ref.read(counterListProvider.notifier).getSum();
              if (!mounted) {
                return;
              }
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text('sum: $sum')),
                );
            },
            child: const Icon(Icons.add_circle_outline),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            onPressed: () =>
                ref.read(counterListProvider.notifier).addCounter(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
