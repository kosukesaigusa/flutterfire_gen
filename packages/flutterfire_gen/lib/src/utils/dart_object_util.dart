import 'package:analyzer/dart/constant/value.dart';

/// Extension on `DartObject` to provide convenient field decoding.
///
/// This extension adds functionality to `DartObject`, which represents an
/// object in the Dart language's type system, to decode fields from that object
/// in a type-safe manner. It abstracts away common boilerplate checks and
/// operations associated with extracting data from `DartObject` instances.
extension DartObjectExtension on DartObject {
  /// Decodes a field from a `DartObject` into a type [T].
  ///
  /// Generic parameter:
  /// - `T`: The expected type to decode the field value into.
  ///
  /// Parameters:
  /// - `fieldName`: A `String` representing the name of the field to be
  /// decoded.
  /// - `decode`: A function that takes a `DartObject` and returns an instance
  /// of type [T]. This function is responsible for the actual decoding logic.
  /// - `orElse`: A function that returns an instance of type [T] to be used as
  /// a fallback value. This function is invoked when the field is either not
  /// present or is null.
  ///
  /// Returns:
  /// - An instance of type [T], either decoded from the field or provided by
  /// the `orElse` fallback.
  ///
  /// Throws:
  /// - May throw if the decoding function [decode] encounters an error or if
  /// the type [T] is not compatible.
  T decodeField<T>(
    String fieldName, {
    required T Function(DartObject obj) decode,
    required T Function() orElse,
  }) {
    final field = getField(fieldName);
    if (field == null || field.isNull) {
      return orElse();
    }
    return decode(field);
  }
}
