import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:flutterfire_gen_utils/flutterfire_gen_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.flutterfire_gen.dart';
part 'counter.g.dart';

@riverpod
CounterQuery counterQuery(CounterQueryRef _) => CounterQuery();

@riverpod
class CounterList extends _$CounterList {
  @override
  Future<List<Counter>> build() =>
      ref.watch(counterQueryProvider).fetchDocuments();

  Future<void> addCounter() async {
    final randomInt = Random().nextInt(5);
    await ref.read(counterQueryProvider).add(
          createCounterData: CreateCounterData(value: ActualValue(randomInt)),
        );
    ref.invalidateSelf();
  }

  Future<void> increment({required String counterId}) async {
    await ref.read(counterQueryProvider).update(
          counterId: counterId,
          updateCounterData: UpdateCounterData(
            value: FieldValueData(FieldValue.increment(1)),
          ),
        );
    ref.invalidateSelf();
  }

  Future<void> decrement({
    required String counterId,
  }) async {
    await ref.read(counterQueryProvider).update(
          counterId: counterId,
          updateCounterData: UpdateCounterData(
            value: FieldValueData(FieldValue.increment(-1)),
          ),
        );
    ref.invalidateSelf();
  }

  Future<double> getSum() async {
    final sum = await ref.read(counterQueryProvider).getSum(field: 'value');
    return sum ?? 0;
  }

  Future<double> getAverage() async {
    final average =
        await ref.read(counterQueryProvider).getAverage(field: 'value');
    return average ?? 0;
  }

  Future<void> delete(String counterId) async {
    await ref.read(counterQueryProvider).delete(counterId: counterId);
    ref.invalidateSelf();
  }

  Future<void> deleteAll() async {
    final counterIds = (await ref.read(counterListProvider.future))
        .map((counter) => counter.counterId);
    await ref.read(counterQueryProvider).batchWrite(
          counterIds
              .map((counterId) => BatchDeleteCounter(counterId: counterId))
              .toList(),
        );
    ref.invalidateSelf();
  }
}

@FirestoreDocument(path: 'counters/{counterId}')
// ignore: unused_element
class _$Counter {
  const _$Counter({
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  @allowFieldValue
  final int value;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
