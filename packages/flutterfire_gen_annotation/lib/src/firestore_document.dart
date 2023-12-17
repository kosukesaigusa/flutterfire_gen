/// An annotation to define a Cloud Firestore document class.
///
/// Apply this annotation to a Dart class to define its correspondence with a
/// Firestore document. It enables the specification of the document path,
/// prefixes for generated class names, and other Firestore-related \
/// configurations.
class FirestoreDocument {
  /// Creates a [FirestoreDocument] annotation.
  ///
  /// Parameters:
  ///
  /// - [path] The path to the Firestore document.
  /// - [readClassPrefix] Optional prefix for classes representing read
  /// operations.
  /// - [createClassPrefix] Optional prefix for classes representing create
  /// operations.
  /// - [updateClassPrefix] Optional prefix for classes representing update
  /// operations.
  /// - [deleteClassPrefix] Optional prefix for classes representing delete
  /// operations.
  /// - [includePathField] Whether to include a `path` field in the generated
  /// class.
  /// - [includeDocumentReferenceField] Whether to include a `DocumentReference`
  /// field.
  /// - [generateCopyWith] Whether to generate a `copyWith` method in the class.
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
