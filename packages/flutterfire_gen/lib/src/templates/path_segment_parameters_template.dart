import '../configs/firestore_document_path.dart';

enum _DocumentIdParametersType { parameterDefinition, argumentInvocation }

///
class DocumentIdParametersTemplate {
  ///
  const DocumentIdParametersTemplate.parameterDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.parameterDefinition;

  ///
  const DocumentIdParametersTemplate.argumentInvocation(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.argumentInvocation;

  ///
  final FirestoreDocumentPath firestoreDocumentPath;

  final _DocumentIdParametersType _type;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final pair in firestoreDocumentPath.ancestors) {
      final documentId = pair.documentId;
      switch (_type) {
        case _DocumentIdParametersType.parameterDefinition:
          buffer.writeln('required String $documentId,');
        case _DocumentIdParametersType.argumentInvocation:
          buffer.writeln('$documentId: $documentId,');
      }
    }
    return buffer.toString();
  }
}
