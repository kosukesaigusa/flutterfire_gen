/// Annotation to automatically use `FieldValue.serverTimestamp()` when creating
/// a document.
///
/// Apply this annotation to a field in a Firestore document class to
/// automatically set the field's value to the server's current timestamp when
/// creating the document.
const alwaysUseFieldValueServerTimestampWhenCreating =
    AlwaysUseFieldValueServerTimestampWhenCreating();

/// Represents the annotation to automatically use
/// `FieldValue.serverTimestamp()` when creating a document.
class AlwaysUseFieldValueServerTimestampWhenCreating {
  /// Creates a [AlwaysUseFieldValueServerTimestampWhenCreating] annotation
  /// instance.
  const AlwaysUseFieldValueServerTimestampWhenCreating();
}

/// Annotation to automatically use `FieldValue.serverTimestamp()` when updating
/// a document.
///
/// Apply this annotation to a field in a Firestore document class to
/// automatically set the field's value to the server's current timestamp when
/// updating the document.
const alwaysUseFieldValueServerTimestampWhenUpdating =
    AlwaysUseFieldValueServerTimestampWhenUpdating();

/// Represents the annotation to automatically use
/// `FieldValue.serverTimestamp()` when updating a document.
class AlwaysUseFieldValueServerTimestampWhenUpdating {
  /// Creates a [AlwaysUseFieldValueServerTimestampWhenUpdating] annotation
  /// instance.
  const AlwaysUseFieldValueServerTimestampWhenUpdating();
}
