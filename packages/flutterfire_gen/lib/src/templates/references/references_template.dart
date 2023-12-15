import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';
import '../path_segment_parameters_template.dart';
import 'doc_comment_template.dart';
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
      ..write(
        ReferenceDocCommentTemplate(
          config: config,
          referenceClassType: referenceClassType,
        ).forCollectionReference(),
      )
      ..write(_collectionReference(referenceClassType))
      ..write('FirebaseFirestore.instance');
    for (final pair in config.firestoreDocumentPath.ancestors) {
      final collectionName = pair.collectionName;
      final documentId = pair.documentId;
      buffer
        ..write(".collection('$collectionName')")
        ..write('.doc($documentId)');
    }
    buffer
      ..write(
        ".collection('${config.firestoreDocumentPath.endPair.collectionName}')",
      )
      ..write(
        WithConverterTemplate(
          config: config,
          referenceClassType: referenceClassType,
        ),
      )
      ..write(';');
    return buffer.toString();
  }

  String _documentReferenceTemplate(ReferenceClassType referenceClassType) {
    final buffer = StringBuffer()
      ..write(
        ReferenceDocCommentTemplate(
          config: config,
          referenceClassType: referenceClassType,
        ).forDocumentReference(),
      )
      ..writeln(_documentReference(referenceClassType));
    return buffer.toString();
  }

  String _collectionReference(ReferenceClassType referenceClassType) {
    final ancestors = config.firestoreDocumentPath.ancestors;
    final typeName = config.collectionReferenceTypeName(referenceClassType);
    final varName = config.collectionReferenceName(referenceClassType);
    if (ancestors.isEmpty) {
      return 'final $varName = ';
    } else {
      final documentIdParametersDefinition =
          DocumentIdParametersTemplate.parameterDefinition(
        config.firestoreDocumentPath,
      );
      return '$typeName $varName ({$documentIdParametersDefinition}) => ';
    }
  }

  String _documentReference(ReferenceClassType referenceClassType) {
    final ancestors = config.firestoreDocumentPath.ancestors;
    final typeName = config.documentReferenceTypeName(referenceClassType);
    final documentReferenceVarName =
        config.documentReferenceName(referenceClassType);
    final collectionReferenceVarName =
        config.collectionReferenceName(referenceClassType);
    if (ancestors.isEmpty) {
      return '''
$typeName $documentReferenceVarName({
  required String ${config.documentId},
}) =>
    $collectionReferenceVarName.doc(${config.documentId});
''';
    } else {
      final documentIdParametersDefinition =
          DocumentIdParametersTemplate.parameterDefinition(
        config.firestoreDocumentPath,
      );
      final documentIdParametersArgumentInvocation =
          DocumentIdParametersTemplate.argumentInvocation(
        config.firestoreDocumentPath,
      );
      return '''
$typeName $documentReferenceVarName({
  $documentIdParametersDefinition
  required String ${config.documentId},
}) =>
    $collectionReferenceVarName(
      $documentIdParametersArgumentInvocation
    ).doc(${config.documentId});
''';
    }
  }
}
