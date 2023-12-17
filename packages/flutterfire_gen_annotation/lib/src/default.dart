/// Represents a base class for default value annotations in Firestore.
///
/// This sealed class is the base for annotations that provide default values
/// for Firestore document fields under different circumstances (read, create,
/// update).
sealed class Default {
  /// Creates a [Default] instance.
  const Default();
}

/// An annotation to provide a default value for a field when reading documents.
///
/// Use this annotation to specify a default value for a field if it is null
/// when reading from Firestore.
final class ReadDefault extends Default {
  /// Creates a [ReadDefault] annotation with the given default value.
  ///
  /// Parameters:
  ///
  /// - [value] The default value to use when the field is null on read.
  const ReadDefault(this.value);

  /// The default value to be used when reading.
  final dynamic value;
}

/// An annotation to provide a default value for a field when creating a
/// document.
///
/// Use this annotation to specify a default value for a field if it is null
/// when creating a new Firestore document.
final class CreateDefault extends Default {
  /// Creates a [CreateDefault] annotation with the given default value.
  ///
  /// Parameters:
  ///
  /// - [value] The default value to use when the field is null on create.
  const CreateDefault(this.value);

  /// The default value to be used when creating.
  final dynamic value;
}

/// An annotation to provide a default value for a field when updating a
/// document.
///
/// Use this annotation to specify a default value for a field if it is null
/// when updating an existing Firestore document.
final class UpdateDefault extends Default {
  /// Creates an [UpdateDefault] annotation with the given default value.
  ///
  /// Parameters:
  ///
  /// - [value] The default value to use when the field is null on update.
  const UpdateDefault(this.value);

  /// The default value to be used when updating.
  final dynamic value;
}
