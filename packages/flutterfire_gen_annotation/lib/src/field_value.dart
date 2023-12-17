/// Annotation to accept Cloud Firestore `FieldValue` input when creating or
/// updating a document.
///
/// Apply this annotation to enable a field in a Firestore document class to
/// accept Firestore `FieldValue` objects (such as `FieldValue.increment()`,
/// `FieldValue.arrayUnion()` when creating or updating documents.
const allowFieldValue = AllowFieldValue();

/// Represents the annotation to accept Cloud Firestore `FieldValue` input.
class AllowFieldValue {
  /// Creates a new [AllowFieldValue] instance.
  ///
  /// This annotation enables a field to accept Firestore `FieldValue` objects.
  const AllowFieldValue();
}
