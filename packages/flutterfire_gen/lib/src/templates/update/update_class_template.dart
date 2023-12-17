import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../constructor_template.dart';
import 'doc_comment_template.dart';
import 'to_json_template.dart';

/// A template for generating a class used for updating Firestore documents.
///
/// This class constructs the necessary Dart code for a class that represents
/// the structure and data required for updating Firestore documents. It
/// includes the class definition, constructor, fields, and a `toJson` method.
class UpdateClassTemplate {
  /// Creates a new instance of [UpdateClassTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including details about the
  /// Firestore document to be updated.
  const UpdateClassTemplate(this.config);

  /// Configurations used for generating the update class.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final docComment = UpdateClassDocCommentTemplate(config);
    final constructorTemplate = ConstructorTemplate(
      className: config.updateClassName,
      configs: _effectiveFieldConfigs.map((fieldConfig) {
        return ConstructorFieldConfig(name: fieldConfig.name, isOptional: true);
      }).toList(),
    );

    final fields = _effectiveFieldConfigs.map((fieldConfig) {
      return 'final ${fieldConfig.typeName(
        forceNullable: true,
        wrapByFirestoreData: fieldConfig.allowFieldValue,
      )} ${fieldConfig.name};';
    }).join('\n\n');

    final toJsonTemplate = ToJsonTemplate(config.fieldConfigs);

    return '''
${docComment}class ${config.updateClassName} {
  $constructorTemplate

  $fields

  $toJsonTemplate
}
''';
  }

  List<FieldConfig> get _effectiveFieldConfigs => config.fieldConfigs
      .where(
        (fieldConfig) =>
            !fieldConfig.alwaysUseFieldValueServerTimestampWhenUpdating,
      )
      .toList();
}
