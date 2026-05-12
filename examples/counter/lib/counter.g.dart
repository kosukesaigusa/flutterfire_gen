// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterQuery)
final counterQueryProvider = CounterQueryProvider._();

final class CounterQueryProvider
    extends $FunctionalProvider<CounterQuery, CounterQuery, CounterQuery>
    with $Provider<CounterQuery> {
  CounterQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterQueryHash();

  @$internal
  @override
  $ProviderElement<CounterQuery> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CounterQuery create(Ref ref) {
    return counterQuery(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterQuery value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterQuery>(value),
    );
  }
}

String _$counterQueryHash() => r'e87727ca37b59ee57a1b436e50ac0089de718a0c';

@ProviderFor(CounterList)
final counterListProvider = CounterListProvider._();

final class CounterListProvider
    extends $AsyncNotifierProvider<CounterList, List<Counter>> {
  CounterListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterListHash();

  @$internal
  @override
  CounterList create() => CounterList();
}

String _$counterListHash() => r'0c05a52816154a97df1cb22f22a96e34b2641d6b';

abstract class _$CounterList extends $AsyncNotifier<List<Counter>> {
  FutureOr<List<Counter>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Counter>>, List<Counter>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Counter>>, List<Counter>>,
              AsyncValue<List<Counter>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
