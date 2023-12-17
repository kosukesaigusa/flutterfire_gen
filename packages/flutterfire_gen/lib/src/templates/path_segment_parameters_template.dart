import '../configs/firestore_document_path.dart';

enum _DocumentIdParametersType {
  constructorParameterDefinition,
  methodParameterDefinition,
  fieldDefinition,
  argumentInvocation,
  caseParameter,
}

/// A template for generating various representations of document ID parameters.
///
/// This class provides different representations for document ID parameters,
/// depending on the context (e.g., constructor parameters, method parameters,
/// field definitions, etc.). It is useful in generating code for classes that
/// interact with Firestore documents and require document ID handling.
class DocumentIdParametersTemplate {
  /// Creates a template for constructor parameter definitions using document
  /// ID.
  ///
  /// This constructor generates a representation suitable for defining
  /// parameters in a class constructor that require document IDs from a
  /// Firestore path.
  const DocumentIdParametersTemplate.constructorParameterDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.constructorParameterDefinition;

  /// Creates a template for method parameter definitions using document ID.
  ///
  /// This constructor generates a representation suitable for defining
  /// parameters in a class method that require document IDs from a Firestore
  /// path.
  const DocumentIdParametersTemplate.methodParameterDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.methodParameterDefinition;

  /// Creates a template for field definitions using document ID.
  ///
  /// This constructor generates a representation suitable for defining fields
  /// in a class that represent document IDs from a Firestore path.
  const DocumentIdParametersTemplate.fieldDefinition(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.fieldDefinition;

  /// Creates a template for argument invocation using document ID.
  ///
  /// This constructor generates a representation suitable for invoking
  /// arguments in methods or constructors that require document IDs from a
  /// Firestore path.
  const DocumentIdParametersTemplate.argumentInvocation(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.argumentInvocation;

  /// Creates a template for case parameters using document ID in switch
  /// statements.
  ///
  /// This constructor generates a representation suitable for defining case
  /// parameters in switch statements that handle document IDs from a Firestore
  /// path.
  const DocumentIdParametersTemplate.caseParameter(
    this.firestoreDocumentPath,
  ) : _type = _DocumentIdParametersType.caseParameter;

  /// The Firestore document path configuration.
  final FirestoreDocumentPath firestoreDocumentPath;

  /// The type of representation for the document ID parameters.
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
