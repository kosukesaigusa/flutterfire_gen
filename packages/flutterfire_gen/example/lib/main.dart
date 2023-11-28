import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: App(),
      ),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ref.watch(userProvider('userId')).when(
              data: (user) {
                if (user == null) {
                  return const Text('User not found');
                }
                return Text('Hello ${user.name}');
              },
              error: (e, __) => Text(e.toString()),
              loading: CircularProgressIndicator.new,
            ),
      ),
    );
  }
}
