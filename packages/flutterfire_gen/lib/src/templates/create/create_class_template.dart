import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../../utils/dart_type_util.dart';
import '../constructor_template.dart';
import 'doc_comment_template.dart';
import 'to_json_template.dart';

/// A template for generating a class used for creating documents in Firestore.
///
/// This class constructs the necessary Dart code for a class that represents
/// the structure of a Firestore document for creation purposes. It includes
/// the class definition, constructor, fields, and a `toJson` method.
///
/// The generated class is used to define the data structure for creating new
/// documents in Firestore, and includes handling for default values and field
/// value conversions.
class CreateClassTemplate {
  /// Creates a new instance of [CreateClassTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including details about the
  /// Firestore document and field configurations.
  const CreateClassTemplate(this.config);

  /// Configurations used for generating the class.
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
    }).join('\n\n');

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
