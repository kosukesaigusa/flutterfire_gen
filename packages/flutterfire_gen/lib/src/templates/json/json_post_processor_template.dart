import '../../configs/field_config.dart';

enum _JsonPostProcessorTemplateType { fromJson, toJson }

/// A template for JSON post processors.
class JsonPostProcessorTemplate {
  ///
  const JsonPostProcessorTemplate.fromJson(this.fieldConfigs)
      : _type = _JsonPostProcessorTemplateType.fromJson;

  ///
  const JsonPostProcessorTemplate.toJson(this.fieldConfigs)
      : _type = _JsonPostProcessorTemplateType.toJson;

  ///
  final List<FieldConfig> fieldConfigs;

  ///
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
