import '../../configs/field_config.dart';

enum _JsonPostProcessorTemplateType { fromJson, toJson }

/// A template for JSON post-processing methods in serialization and
/// deserialization.
///
/// This class is used to generate Dart code for JSON post-processing operations
/// that are applied after the initial serialization or deserialization process.
/// It handles custom logic defined in `JsonPostProcessorConfig` for each field.
class JsonPostProcessorTemplate {
  /// Creates a template for generating JSON post-processing methods for
  /// deserialization.
  ///
  /// Parameters:
  ///
  /// - [fieldConfigs] A list of field configurations for which post-processing
  /// is required.
  const JsonPostProcessorTemplate.fromJson(this.fieldConfigs)
      : _type = _JsonPostProcessorTemplateType.fromJson;

  /// Creates a template for generating JSON post-processing methods for
  /// serialization.
  ///
  /// Parameters:
  ///
  /// - [fieldConfigs] A list of field configurations for which post-processing
  /// is required.
  const JsonPostProcessorTemplate.toJson(this.fieldConfigs)
      : _type = _JsonPostProcessorTemplateType.toJson;

  /// Configurations for the fields to be included in post-processing.
  final List<FieldConfig> fieldConfigs;

  /// The type of post-processing template (serialization or deserialization).
  final _JsonPostProcessorTemplateType _type;

  @override
  String toString() {
    final buffer = StringBuffer();
    for (final fieldConfig in fieldConfigs) {
      final jsonPostProcessorConfig = fieldConfig.jsonPostProcessorConfig;
      if (jsonPostProcessorConfig == null) {
        continue;
      }
      switch (_type) {
        case _JsonPostProcessorTemplateType.fromJson:
          final value = '${jsonPostProcessorConfig.jsonPostProcessorString}.'
              'fromJson(json)';
          buffer.writeln("'${fieldConfig.name}': $value,");
        case _JsonPostProcessorTemplateType.toJson:
          buffer.writeln(
            "if (json.containsKey('${fieldConfig.name}')) "
            '${jsonPostProcessorConfig.jsonPostProcessorString}.toJson(json),',
          );
      }
    }
    return buffer.toString();
  }
}
