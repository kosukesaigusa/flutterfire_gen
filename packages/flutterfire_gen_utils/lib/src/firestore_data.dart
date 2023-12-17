import 'package:cloud_firestore/cloud_firestore.dart';

/// Represents a class for storing data in Firestore, either as an actual value
/// or `FieldValue`.
///
/// This sealed class is the base for classes that encapsulate Firestore data,
/// allowing storage of both actual values and Firestore `FieldValue` types.
sealed class FirestoreData<T> {
  /// Creates a [FirestoreData].
  const FirestoreData();

  /// Retrieves the `FieldValue` representation of the data.
  FieldValue get fieldValue {
    return switch (this) {
      FieldValueData(fieldValue: final fieldValue) => fieldValue,
      ActualValue<T>(actualValue: final _) => throw UnimplementedError(),
    };
  }

  /// Retrieves the data, whether as a `FieldValue` or actual value.
  T get actualValue {
    return switch (this) {
      FieldValueData(fieldValue: final _) => throw UnimplementedError(),
      ActualValue<T>(actualValue: final actualValue) => actualValue,
    };
  }

  /// Creates a [FirestoreData] from a [FieldValue] or an actual value.
  dynamic get value {
    return switch (this) {
      FieldValueData(fieldValue: final fieldValue) => fieldValue,
      ActualValue<T>(actualValue: final actualValue) => actualValue,
    };
  }
}

/// Represents a `FieldValue` that can be stored in Firestore.
///
/// This class encapsulates a Firestore `FieldValue`, allowing its use in
/// Firestore operations.
final class FieldValueData<T> extends FirestoreData<T> {
  /// Creates a [FieldValueData].
  const FieldValueData(this.fieldValue);

  @override
  final FieldValue fieldValue;
}

/// Represents an actual value that can be stored in Firestore.
///
/// This class encapsulates an actual value, allowing its storage and retrieval
/// from Firestore.
final class ActualValue<T> extends FirestoreData<T> {
  /// Creates an [ActualValue] instance with the given actual value.
  ///
  /// Parameters:
  ///
  /// - [actualValue] The actual value to be stored in Firestore.
  const ActualValue(this.actualValue);

  @override
  final T actualValue;
}
