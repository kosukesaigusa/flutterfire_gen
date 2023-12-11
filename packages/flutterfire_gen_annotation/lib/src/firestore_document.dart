/// An annotation to define Cloud Firestore document.
class FirestoreDocument {
  /// Creates a [FirestoreDocument].
  const FirestoreDocument({
    required this.path,
    this.includePathField,
    this.includeDocumentReferenceField,
    this.generateCopyWith,
  });

  /// A path to firestore document.
  final String path;

  /// Whether to include `path` field in ReadEntity class.
  final bool? includePathField;

  /// Whether to include `DocumentReference` field in ReadEntity class.
  final bool? includeDocumentReferenceField;

  /// Whether to generate `copyWith` method in ReadEntity class.
  final bool? generateCopyWith;
}
