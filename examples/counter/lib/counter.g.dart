// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterQueryHash() => r'e0d3cae49e1e11c1ede24e024135c762b7c98457';

/// See also [counterQuery].
@ProviderFor(counterQuery)
final counterQueryProvider = AutoDisposeProvider<CounterQuery>.internal(
  counterQuery,
  name: r'counterQueryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CounterQueryRef = AutoDisposeProviderRef<CounterQuery>;
String _$counterListHash() => r'0c05a52816154a97df1cb22f22a96e34b2641d6b';

/// See also [CounterList].
@ProviderFor(CounterList)
final counterListProvider =
    AutoDisposeAsyncNotifierProvider<CounterList, List<Counter>>.internal(
  CounterList.new,
  name: r'counterListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$counterListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CounterList = AutoDisposeAsyncNotifier<List<Counter>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
