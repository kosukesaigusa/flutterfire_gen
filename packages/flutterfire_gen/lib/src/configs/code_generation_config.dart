import '../utils/string.dart';
import 'field_config.dart';
import 'firestore_document_path.dart';
import 'reference_class_type.dart';

/// A class to represent the configuration for a Firestore document.
class CodeGenerationConfig {
  /// Creates a Firestore document configuration.
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

  ///
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

  /// The name of collection of the document.
  String get collectionName => firestoreDocumentPath.endPair.collectionName;

  /// The name of the document.
  String get documentName => firestoreDocumentPath.documentName;

  /// All fields configurations of the generation target class.
  final List<FieldConfig> fieldConfigs;

  /// The capitalized collection name of the document.
  String get capitalizedCollectionName => collectionName.capitalize();

  /// The capitalized document name of the document.
  String get capitalizedDocumentName => documentName.capitalize();

  /// The name of the document class for reading.
  String get readClassName => '$readClassPrefix$baseClassName';

  /// The name of the document class for creating.
  String get createClassName => '$createClassPrefix$baseClassName';

  /// The name of the document class for updating.
  String get updateClassName => '$updateClassPrefix$baseClassName';

  /// The name of the document class for deleting.
  String get deleteClassName => '$deleteClassPrefix$baseClassName';

  /// The name of the instance variable for the document class for creating.
  String get createClassInstanceName =>
      '${createClassPrefix.decapitalize()}$baseClassName';

  /// The name of the instance variable for the document class for updating.
  String get updateClassInstanceName =>
      '${updateClassPrefix.decapitalize()}$baseClassName';

  /// The name of the instance variable for the document class for deleting.
  String get deleteClassInstanceName =>
      '${deleteClassPrefix.decapitalize()}$baseClassName';

  /// The document ID field name.
  String get documentId => firestoreDocumentPath.endPair.documentId;

  /// The document reference field name.
  String get documentReferenceFieldName => '${documentName}Reference';

  ///
  String get readDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.read);

  ///
  String get createDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.create);

  ///
  String get updateDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.update);

  ///
  String get deleteDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.delete);

  ///
  String documentReferenceName(
    ReferenceClassType referenceClassType,
  ) =>
      '${referenceClassType.name}${baseClassName}DocumentReference';

  /// The document reference name of the document for creating.
  String collectionReferenceName(
    ReferenceClassType referenceClassType,
  ) =>
      '${referenceClassType.name}${baseClassName}CollectionReference';

  /// The document reference type name of the document for reading.
  String get readDocumentReferenceTypeName =>
      documentReferenceTypeName(ReferenceClassType.read);

  ///
  String documentReferenceTypeName(ReferenceClassType referenceClassType) =>
      'DocumentReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  ///
  String collectionReferenceTypeName(ReferenceClassType referenceClassType) =>
      'CollectionReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  ///
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
