import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../../utils/dart_type_util.dart';
import '../constructor_template.dart';
import 'doc_comment_template.dart';
import 'to_json_template.dart';

/// A template for a class to create documents in Firestore.
class CreateClassTemplate {
  /// Creates a [CreateClassTemplate].
  const CreateClassTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final docComment = CreateClassDocCommentTemplate(config);
    final constructorTemplate = ConstructorTemplate(
      className: config.createClassName,
      configs: effectiveFieldConfigs.map((fieldConfig) {
        return ConstructorFieldConfig(
          name: fieldConfig.name,
          isOptional: _shouldBeOptionalField(fieldConfig),
        );
      }).toList(),
    );

    final fields = effectiveFieldConfigs.map((fieldConfig) {
      return 'final ${fieldConfig.typeName(
        forceNullable: fieldConfig.dartType.isNullableType ||
            fieldConfig.createDefaultValueString != null,
        wrapByFirestoreData: fieldConfig.allowFieldValue,
      )} ${fieldConfig.name};';
    }).join('\n');

    final toJsonTemplate = ToJsonTemplate(config.fieldConfigs);

    return '''
${docComment}class ${config.createClassName} {
  $constructorTemplate

  $fields

  $toJsonTemplate
}
''';
  }

  ///
  List<FieldConfig> get effectiveFieldConfigs => config.fieldConfigs
      .where(
        (fieldConfig) =>
            !fieldConfig.alwaysUseFieldValueServerTimestampWhenCreating,
      )
      .toList();

  ///
  bool _shouldBeOptionalField(FieldConfig fieldConfig) =>
      fieldConfig.dartType.isNullableType ||
      fieldConfig.createDefaultValueString != null;
}
