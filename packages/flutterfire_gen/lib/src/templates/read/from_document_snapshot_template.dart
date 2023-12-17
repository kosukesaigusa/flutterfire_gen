import '../../configs/code_generation_config.dart';

/// A template for generating a factory method to create instances from
/// Firestore document snapshots.
///
/// This template creates a `fromDocumentSnapshot` factory method in a class
/// representing a Firestore document. The method converts a Firestore
/// `DocumentSnapshot` into an instance of the class, handling field extraction
/// and conversion.
class FromDocumentSnapshotTemplate {
  /// Creates a new instance of [FromDocumentSnapshotTemplate] with the provided
  /// configuration.
  ///
  /// Parameters:
  ///
  /// - [config] Configuration details for the Firestore document class.
  const FromDocumentSnapshotTemplate(this.config);

  /// Configuration details for the Firestore document class.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
factory ${config.readClassName}.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ${config.readClassName}.fromJson(<String, dynamic>{
      ...data,
      '${config.documentId}': ds.id,
      'path': ds.reference.path,
      ${_documentReferenceField()}
    });
  }
''';
  }

  /// Returns the document reference field definition if it is configured to be
  /// included.
  String _documentReferenceField() {
    if (!config.includeDocumentReferenceField) {
      return '';
    }
    return '''
'${config.documentReferenceFieldName}': ds.reference.parent.doc(ds.id).withConverter(
        fromFirestore: (ds, _) => ${config.readClassName}.fromDocumentSnapshot(ds),
        toFirestore: (obj, _) => throw UnimplementedError(),
      ),
''';
  }
}
