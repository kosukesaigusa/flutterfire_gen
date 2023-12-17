import '../utils/string.dart';
import 'field_config.dart';
import 'firestore_document_path.dart';
import 'reference_class_type.dart';

/// A class to represent the code generation configuration for
/// `@FirestoreDocument` annotated schema definition classes.
///
/// This class holds the configuration details necessary for generating code
/// related to a specific Firestore document. It includes information such as
/// class name prefixes for different operations (read, create, update, delete),
/// inclusion of specific fields, and configuration for related classes.
class CodeGenerationConfig {
  /// Creates a Firestore document configuration with all required details.
  ///
  /// Parameters:
  ///
  /// - [path] : The Firestore document path.
  /// - [baseClassName] The base name for generated classes.
  /// - [readClassPrefix] Prefix for read operation class names.
  /// - [createClassPrefix] Prefix for create operation class names.
  /// - [updateClassPrefix] Prefix for update operation class names.
  /// - [deleteClassPrefix] Prefix for delete operation class names.
  /// - [includePathField] Whether to include a path field in the read class.
  /// - [includeDocumentReferenceField] Whether to include a document  reference
  /// field in the read class.
  /// - [generateCopyWith] Whether to generate a `copyWith` method in the read
  /// class.
  /// - [fieldConfigs] Configuration for fields of schema definition class.
  CodeGenerationConfig({
    required String path,
    required this.baseClassName,
    required this.readClassPrefix,
    required this.createClassPrefix,
    required this.updateClassPrefix,
    required this.deleteClassPrefix,
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
    required this.fieldConfigs,
  }) : firestoreDocumentPath = FirestoreDocumentPath(path);

  /// The Firestore document path configuration.
  final FirestoreDocumentPath firestoreDocumentPath;

  /// The base class name for the document.
  final String baseClassName;

  /// The prefix for the class name of entities created based on documents read
  /// from Cloud Firestore.
  final String readClassPrefix;

  /// The prefix for the class name of data structure for creating a new
  /// document in Cloud Firestore.
  final String createClassPrefix;

  /// The prefix for the class name of data structure for updating a document in
  /// Cloud Firestore.
  final String updateClassPrefix;

  /// The prefix for the class name of data structure for deleting a  document
  /// in Cloud Firestore.
  final String deleteClassPrefix;

  /// Whether to include a path field in the document class.
  final bool includePathField;

  /// Whether to include a document reference field in the document class.
  final bool includeDocumentReferenceField;

  /// Whether to generate a copyWith method for the document class.
  final bool generateCopyWith;

  /// All fields configurations of the generation target class.
  final List<FieldConfig> fieldConfigs;

  /// The collection name of the document.
  ///
  /// Derived from the [firestoreDocumentPath].
  String get collectionName => firestoreDocumentPath.endPair.collectionName;

  /// The document ID field name.
  ///
  /// Derived from the [firestoreDocumentPath].
  String get documentId => firestoreDocumentPath.endPair.documentId;

  /// The name of the document.
  String get documentName => firestoreDocumentPath.documentName;

  /// The capitalized document name of the document.
  String get capitalizedDocumentName => documentName.capitalize();

  /// The name of the document class for reading.
  String get readClassName => '${readClassPrefix.capitalize()}$baseClassName';

  /// The name of the class for creating a document.
  String get createClassName =>
      '${createClassPrefix.capitalize()}$baseClassName';

  /// The name of the class for updating a document.
  String get updateClassName =>
      '${updateClassPrefix.capitalize()}$baseClassName';

  /// The name of the class for deleting a document.
  String get deleteClassName =>
      '${deleteClassPrefix.capitalize()}$baseClassName';

  /// The name of the instance variable of [createClassName].
  String get createClassInstanceName =>
      '${createClassPrefix.decapitalize()}$capitalizedDocumentName';

  /// The name of the instance variable of [updateClassName].
  String get updateClassInstanceName =>
      '${updateClassPrefix.decapitalize()}$capitalizedDocumentName';

  /// The name of the instance variable of [deleteClassName].
  String get deleteClassInstanceName =>
      '${deleteClassPrefix.decapitalize()}$capitalizedDocumentName';

  /// The document reference field name.
  String get documentReferenceFieldName => '${documentName}Reference';

  /// The document reference name for read operations.
  String get readDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.read);

  /// The document reference name for create operations.
  String get createDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.create);

  /// The document reference name for update operations.
  String get updateDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.update);

  /// The document reference name for delete operations.
  String get deleteDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.delete);

  /// Returns the document reference name based on the given
  /// [referenceClassType].
  String documentReferenceName(ReferenceClassType referenceClassType) =>
      '${referenceClassType.name}${documentName.capitalize()}DocumentReference';

  /// Returns the collection reference name based on the given
  /// [referenceClassType].
  String collectionReferenceName(ReferenceClassType referenceClassType) =>
      '${referenceClassType.name}${collectionName.capitalize()}'
      'CollectionReference';

  /// Returns the document reference type name based on the given reference
  /// class type.
  String documentReferenceTypeName(ReferenceClassType referenceClassType) =>
      'DocumentReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  /// Returns the collection reference type name based on the given reference
  /// class type.
  String collectionReferenceTypeName(ReferenceClassType referenceClassType) =>
      'CollectionReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  /// Determines the class name from the reference class type.
  ///
  /// This method returns the appropriate class name based on the type of
  /// operation (read, create, update, delete) being performed.
  String classNameFromReferenceClassType(
    ReferenceClassType referenceClassType,
  ) {
    switch (referenceClassType) {
      case ReferenceClassType.read:
        return readClassName;
      case ReferenceClassType.create:
        return createClassName;
      case ReferenceClassType.update:
        return updateClassName;
      case ReferenceClassType.delete:
        return deleteClassName;
    }
  }
}
