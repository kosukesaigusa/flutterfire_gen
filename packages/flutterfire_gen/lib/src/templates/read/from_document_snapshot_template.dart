import '../../configs/code_generation_config.dart';

/// A template for a class to read documents from Firestore.
class FromDocumentSnapshotTemplate {
  /// Creates a [FromDocumentSnapshotTemplate] with the given [config].
  const FromDocumentSnapshotTemplate({required this.config});

  /// The configuration for the document.
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

  /// Returns the document reference field if it should be included.
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
