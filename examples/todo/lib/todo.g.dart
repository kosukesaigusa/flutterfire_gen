// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(todoQuery)
final todoQueryProvider = TodoQueryProvider._();

final class TodoQueryProvider
    extends $FunctionalProvider<TodoQuery, TodoQuery, TodoQuery>
    with $Provider<TodoQuery> {
  TodoQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoQueryHash();

  @$internal
  @override
  $ProviderElement<TodoQuery> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TodoQuery create(Ref ref) {
    return todoQuery(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TodoQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TodoQuery>(value),
    );
  }
}

String _$todoQueryHash() => r'1f26a40a4eb01f78b98e5f94460d649b164707f1';

@ProviderFor(TodoList)
final todoListProvider = TodoListProvider._();

final class TodoListProvider
    extends $AsyncNotifierProvider<TodoList, List<Todo>> {
  TodoListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoListHash();

  @$internal
  @override
  TodoList create() => TodoList();
}

String _$todoListHash() => r'7e71fca1db0730983b28290b2737ef974a2e571e';

abstract class _$TodoList extends $AsyncNotifier<List<Todo>> {
  FutureOr<List<Todo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>, List<Todo>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
