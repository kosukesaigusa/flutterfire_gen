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
  /// - [readClassSuffix] Optional suffix for classes representing read
  /// operations.
  /// - [createClassPrefix] Optional prefix for classes representing create
  /// operations.
  /// - [createClassSuffix] Optional suffix for classes representing create
  /// operations.
  /// - [updateClassPrefix] Optional prefix for classes representing update
  /// operations.
  /// - [updateClassSuffix] Optional suffix for classes representing update
  /// operations.
  /// - [deleteClassPrefix] Optional prefix for classes representing delete
  /// operations.
  /// - [deleteClassSuffix] Optional suffix for classes representing delete
  /// operations.
  /// - [includePathField] Whether to include a `path` field in the generated
  /// class.
  /// - [includeDocumentReferenceField] Whether to include a `DocumentReference`
  /// field.
  /// - [generateCopyWith] Whether to generate a `copyWith` method in the class.
  const FirestoreDocument({
    required this.path,
    this.readClassPrefix,
    this.readClassSuffix,
    this.createClassPrefix,
    this.createClassSuffix,
    this.updateClassPrefix,
    this.updateClassSuffix,
    this.deleteClassPrefix,
    this.deleteClassSuffix,
    this.includePathField,
    this.includeDocumentReferenceField,
    this.generateCopyWith,
  });

  /// A path to firestore document.
  final String path;

  /// The prefix for the class name of entities created based on documents read
  /// from Cloud Firestore.
  final String? readClassPrefix;

  /// The suffix for the class name of entities created based on documents read
  /// from Cloud Firestore.
  final String? readClassSuffix;

  /// The prefix for the class name of data structure for creating a new
  /// document in Cloud Firestore.
  final String? createClassPrefix;

  /// The suffix for the class name of data structure for creating a new
  /// document in Cloud Firestore.
  final String? createClassSuffix;

  /// The prefix for the class name of data structure for updating a document in
  /// Cloud Firestore.
  final String? updateClassPrefix;

  /// The suffix for the class name of data structure for updating a document in
  /// Cloud Firestore.
  final String? updateClassSuffix;

  /// The prefix for the class name of data structure for deleting a  document
  /// in Cloud Firestore.
  final String? deleteClassPrefix;

  /// The suffix for the class name of data structure for deleting a  document
  /// in Cloud Firestore.
  final String? deleteClassSuffix;

  /// Whether to include `path` field in ReadEntity class.
  final bool? includePathField;

  /// Whether to include `DocumentReference` field in ReadEntity class.
  final bool? includeDocumentReferenceField;

  /// Whether to generate `copyWith` method in ReadEntity class.
  final bool? generateCopyWith;
}
