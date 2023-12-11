import '../utils/string.dart';
import 'field_config.dart';
import 'firestore_document_path.dart';
import 'reference_class_type.dart';

/// A class to represent the configuration for a Firestore document.
class CodeGenerationConfig {
  /// Creates a Firestore document configuration.
  CodeGenerationConfig({
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
    required String path,
    required this.baseClassName,
    required this.fieldConfigs,
  }) : firestoreDocumentPath = FirestoreDocumentPath(path);

  /// Whether to include a path field in the document class.
  final bool includePathField;

  /// Whether to include a document reference field in the document class.
  final bool includeDocumentReferenceField;

  /// Whether to generate a copyWith method for the document class.
  final bool generateCopyWith;

  ///
  final FirestoreDocumentPath firestoreDocumentPath;

  /// The base class name for the document.
  final String baseClassName;

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
  String get readClassName => 'Read$baseClassName';

  /// The name of the document class for creating.
  String get createClassName => 'Create$baseClassName';

  /// The name of the document class for updating.
  String get updateClassName => 'Update$baseClassName';

  /// The name of the document class for deleting.
  String get deleteClassName => 'Delete$baseClassName';

  /// The name of the instance variable for the document class for creating.
  String get createClassInstanceName => 'create$baseClassName';

  /// The name of the instance variable for the document class for updating.
  String get updateClassInstanceName => 'update$baseClassName';

  /// The name of the instance variable for the document class for deleting.
  String get deleteClassInstanceName => 'delete$baseClassName';

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
