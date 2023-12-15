import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';

///
class ReferenceDocCommentTemplate {
  ///
  ReferenceDocCommentTemplate({
    required this.config,
    required this.referenceClassType,
  });

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  /// The type of reference class.
  final ReferenceClassType referenceClassType;

  /// Returns the doc comment for the [referenceClassType] collection reference.
  String forCollectionReference() {
    switch (referenceClassType) {
      case ReferenceClassType.read:
        return _forReadCollectionReference();
      case ReferenceClassType.create:
        return _forCreateCollectionReference();
      case ReferenceClassType.update:
        return _forUpdateCollectionReference();
      case ReferenceClassType.delete:
        return _forDeleteCollectionReference();
    }
  }

  /// Returns the doc comment for the [referenceClassType] document reference.
  String forDocumentReference() {
    switch (referenceClassType) {
      case ReferenceClassType.read:
        return _forReadDocumentReference();
      case ReferenceClassType.create:
        return _forCreateDocumentReference();
      case ReferenceClassType.update:
        return _forUpdateDocumentReference();
      case ReferenceClassType.delete:
        return _forDeleteDocumentReference();
    }
  }

  /// Returns the doc comment for the read collection reference.
  String _forReadCollectionReference() {
    return '''
/// Reference to the '${config.collectionName}' collection with a converter for [${config.readClassName}].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [${config.readClassName}] objects.
''';
  }

  /// Returns the doc comment for the read document reference.
  String _forReadDocumentReference() {
    return '''
/// Creates a [DocumentReference] for a specific ${config.baseClassName} document.
''';
  }

  /// Returns the doc comment for the create collection reference.
  String _forCreateCollectionReference() {
    return '''
/// Reference to the '${config.collectionName}' collection with a converter for [${config.createClassName}].
/// This enables type-safe create operations in Firestore, converting
/// [${config.createClassName}] objects to Firestore document data.
''';
  }

  /// Returns the doc comment for the create document reference.
  String _forCreateDocumentReference() {
    return '''
/// Creates a [DocumentReference] for a specific ${config.baseClassName} document.
''';
  }

  /// Returns the doc comment for the update collection reference.
  String _forUpdateCollectionReference() {
    return '''
/// Reference to the '${config.collectionName}' collection with a converter for [${config.updateClassName}].
/// This allows for type-safe update operations in Firestore, converting
/// [${config.updateClassName}] objects to Firestore document data.
''';
  }

  /// Returns the doc comment for the update document reference.
  String _forUpdateDocumentReference() {
    return '''
/// Creates a [DocumentReference] for a specific ${config.baseClassName} document.
''';
  }

  /// Returns the doc comment for the delete collection reference.
  String _forDeleteCollectionReference() {
    return '''
/// Reference to the '${config.collectionName}' collection with a converter for [${config.deleteClassName}].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
''';
  }

  /// Returns the doc comment for the delete document reference.
  String _forDeleteDocumentReference() {
    return '''
/// Creates a [DocumentReference] for a specific ${config.baseClassName} document.
''';
  }
}
