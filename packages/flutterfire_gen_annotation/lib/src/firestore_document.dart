/// An annotation to define Cloud Firestore document.
class FirestoreDocument {
  /// Creates a [FirestoreDocument].
  const FirestoreDocument({
    required this.path,
    this.readClassPrefix,
    this.createClassPrefix,
    this.updateClassPrefix,
    this.deleteClassPrefix,
    this.includePathField,
    this.includeDocumentReferenceField,
    this.generateCopyWith,
  });

  /// A path to firestore document.
  final String path;

  /// The prefix for the class name of entities created based on documents read
  /// from Cloud Firestore.
  final String? readClassPrefix;

  /// The prefix for the class name of data structure for creating a new
  /// document in Cloud Firestore.
  final String? createClassPrefix;

  /// The prefix for the class name of data structure for updating a document in
  /// Cloud Firestore.
  final String? updateClassPrefix;

  /// The prefix for the class name of data structure for deleting a  document
  /// in Cloud Firestore.
  final String? deleteClassPrefix;

  /// Whether to include `path` field in ReadEntity class.
  final bool? includePathField;

  /// Whether to include `DocumentReference` field in ReadEntity class.
  final bool? includeDocumentReferenceField;

  /// Whether to generate `copyWith` method in ReadEntity class.
  final bool? generateCopyWith;
}
