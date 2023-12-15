import '../configs/firestore_document_path.dart';

enum _DocumentIdParametersType {
  constructorParameterDefinition,
  methodParameterDefinition,
  fieldDefinition,
  argumentInvocation,
  caseParameter,
}

///
class DocumentIdParametersTemplate {
  ///
  const DocumentIdParametersTemplate.constructorParameterDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.constructorParameterDefinition;

  ///
  const DocumentIdParametersTemplate.methodParameterDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.methodParameterDefinition;

  ///
  const DocumentIdParametersTemplate.fieldDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.fieldDefinition;

  ///
  const DocumentIdParametersTemplate.argumentInvocation(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.argumentInvocation;

  ///
  const DocumentIdParametersTemplate.caseParameter(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.caseParameter;

  ///
  final FirestoreDocumentPath firestoreDocumentPath;

  final _DocumentIdParametersType _type;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final pair in firestoreDocumentPath.ancestors) {
      final documentId = pair.documentId;
      switch (_type) {
        case _DocumentIdParametersType.constructorParameterDefinition:
          buffer.writeln('required this.$documentId,');
        case _DocumentIdParametersType.methodParameterDefinition:
          buffer.writeln('required String $documentId,');
        case _DocumentIdParametersType.fieldDefinition:
          buffer
            ..writeln('final String $documentId;')
            ..writeln();
        case _DocumentIdParametersType.argumentInvocation:
          buffer.writeln('$documentId: $documentId,');
        case _DocumentIdParametersType.caseParameter:
          buffer.writeln('$documentId: final $documentId,');
      }
    }
    return buffer.toString();
  }
}
