import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../constructor_template.dart';
import 'to_json_template.dart';

/// A template for a class to update documents in Firestore.
class UpdateClassTemplate {
  /// Creates a [UpdateClassTemplate].
  const UpdateClassTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
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
    }).join('\n');

    final toJsonTemplate = ToJsonTemplate(config.fieldConfigs);

    return '''
class ${config.updateClassName} {
  $constructorTemplate

  $fields

  $toJsonTemplate
}
''';
  }

  ///
  List<FieldConfig> get _effectiveFieldConfigs => config.fieldConfigs
      .where(
        (fieldConfig) =>
            !fieldConfig.alwaysUseFieldValueServerTimestampWhenUpdating,
      )
      .toList();
}
