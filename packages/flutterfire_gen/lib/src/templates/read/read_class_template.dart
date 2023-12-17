import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';
import '../constructor_template.dart';
import '../field_template.dart';
import 'copy_with_template.dart';
import 'from_document_snapshot_template.dart';
import 'from_json_template.dart';

/// A template for a class to read documents from Firestore.
class ReadClassTemplate {
  /// Creates a [ReadClassTemplate] with the given [config].
  const ReadClassTemplate(this.config);

  /// The configuration for the document.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final constructor = ConstructorTemplate(
      className: config.readClassName,
      configs: [
        for (final fieldConfig in config.fieldConfigs)
          ConstructorFieldConfig(name: fieldConfig.name, isOptional: false),
        ConstructorFieldConfig(
          name: config.documentId,
          isOptional: false,
        ),
        if (config.includePathField)
          ConstructorFieldConfig(name: 'path', isOptional: false),
        if (config.includeDocumentReferenceField)
          ConstructorFieldConfig(
            name: config.documentReferenceFieldName,
            isOptional: false,
          ),
      ],
    );

    final fieldDefinitions = FieldDefinitionsTemplate(
      fields: <String, String>{
        for (final fieldConfig in config.fieldConfigs)
          fieldConfig.name: fieldConfig.typeName(),
        config.documentId: 'String',
        if (config.includePathField) 'path': 'String',
        if (config.includeDocumentReferenceField)
          config.documentReferenceFieldName:
              config.documentReferenceTypeName(ReferenceClassType.read),
      },
    );

    final fromJson = FromJsonTemplate(config);

    final fromDocumentSnapshot = FromDocumentSnapshotTemplate(config: config);

    final copyWith = config.generateCopyWith ? CopyWithTemplate(config) : '';

    return '''
class ${config.readClassName} {
  $constructor

  $fieldDefinitions

  $fromJson

  $fromDocumentSnapshot

  $copyWith
}
''';
  }
}
