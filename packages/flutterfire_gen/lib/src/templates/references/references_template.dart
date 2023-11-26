import 'package:source_gen/source_gen.dart';

import '../../configs/code_generation_config.dart';
import '../path_segment_parameters_template.dart';
import 'with_converter_template.dart';

///
class ReferencesTemplate {
  /// Creates a [ReferencesTemplate].
  const ReferencesTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final referenceClassType in ReferenceClassType.values) {
      buffer
        ..writeln(_collectionReferenceTemplate(referenceClassType))
        ..writeln()
        ..writeln(_documentReferenceTemplate(referenceClassType));
    }
    return buffer.toString();
  }

  String _collectionReferenceTemplate(ReferenceClassType referenceClassType) {
    final buffer = StringBuffer()
      ..writeln(
        '/// Provides a reference to the ${config.collectionName} '
        'collection for ${referenceClassType.toIng()}.',
      )
      ..write(_collectionReference(referenceClassType))
      ..write('FirebaseFirestore.instance');
    for (final segment in config.firestorePathSegments) {
      final collectionName = segment.collectionName;
      final documentName = segment.documentName;
      buffer.write(".collection('$collectionName')");
      if (documentName != null) {
        buffer.write('.doc($documentName)');
      }
    }
    buffer.write(
      WithConverterTemplate(
        config: config,
        referenceClassType: referenceClassType,
      ),
    );
    buffer.write(';');
    return buffer.toString();
  }

  String _documentReferenceTemplate(ReferenceClassType referenceClassType) {
    final buffer = StringBuffer()
      ..writeln(
        '/// Provides a reference to a ${config.documentName} '
        'document for ${referenceClassType.toIng()}.',
      )
      ..writeln(_documentReference(referenceClassType));
    return buffer.toString();
  }

  String _collectionReference(ReferenceClassType referenceClassType) {
    if (config.firestorePathSegments.isEmpty) {
      throw InvalidGenerationSourceError(
        '@FirestoreDocument(path: ...) must be provided.',
      );
    }
    final typeName = config.collectionReferenceTypeName(referenceClassType);
    final varName = config.collectionReferenceName(referenceClassType);
    if (config.firestorePathSegments.length == 1) {
      return 'final $varName = ';
    }
    final documentIdParametersDefinition =
        DocumentIdParametersTemplate.parameterDefinition(
      config.firestorePathSegments,
    );
    return '$typeName $varName ({$documentIdParametersDefinition}) => ';
  }

  String _documentReference(ReferenceClassType referenceClassType) {
    if (config.firestorePathSegments.isEmpty) {
      throw InvalidGenerationSourceError(
        '@FirestoreDocument(path: ...) must be provided.',
      );
    }
    final typeName = config.documentReferenceTypeName(referenceClassType);
    final documentReferenceVarName =
        config.documentReferenceName(referenceClassType);
    final collectionReferenceVarName =
        config.collectionReferenceName(referenceClassType);
    if (config.firestorePathSegments.length == 1) {
      return '''
$typeName $documentReferenceVarName({
  required String ${config.documentName}Id,
}) =>
    $collectionReferenceVarName.doc(${config.documentName}Id);
''';
    }
    final documentIdParametersDefinition =
        DocumentIdParametersTemplate.parameterDefinition(
      config.firestorePathSegments,
    );
    final documentIdParametersArgumentInvocation =
        DocumentIdParametersTemplate.argumentInvocation(
      config.firestorePathSegments,
    );
    return '''
$typeName $documentReferenceVarName({
  $documentIdParametersDefinition
  required String ${config.documentName}Id,
}) =>
    $collectionReferenceVarName(
      $documentIdParametersArgumentInvocation
    ).doc(${config.documentName}Id);
''';
  }
}
