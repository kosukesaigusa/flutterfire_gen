import '../configs/code_generation_config.dart';

enum _DocumentIdParametersType { parameterDefinition, argumentInvocation }

///
class DocumentIdParametersTemplate {
  ///
  const DocumentIdParametersTemplate.parameterDefinition(
    this.firestorePathSegments,
  ) : _type = _DocumentIdParametersType.parameterDefinition;

  ///
  const DocumentIdParametersTemplate.argumentInvocation(
    this.firestorePathSegments,
  ) : _type = _DocumentIdParametersType.argumentInvocation;

  ///
  final List<FirestorePathSegment> firestorePathSegments;

  final _DocumentIdParametersType _type;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final segment in firestorePathSegments) {
      final documentName = segment.documentName;
      if (documentName != null) {
        switch (_type) {
          case _DocumentIdParametersType.parameterDefinition:
            buffer.writeln('required String $documentName,');
          case _DocumentIdParametersType.argumentInvocation:
            buffer.writeln('$documentName: $documentName,');
        }
      }
    }
    return buffer.toString();
  }
}
