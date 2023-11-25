import '../../configs/field_config.dart';
import '../../parser/to_json_field_parser.dart';
import '../json/json_post_processor_template.dart';

/// A template for `toJson` method when creating documents in Firestore.
class ToJsonTemplate {
  /// Creates a [ToJsonTemplate].
  const ToJsonTemplate(this.fieldConfigs);

  ///
  final List<FieldConfig> fieldConfigs;

  @override
  String toString() {
    return '''
Map<String, dynamic> toJson() {
  final json = <String, dynamic>{
    ${_parseFields()}
  };
  final jsonPostProcessors = <({String key, dynamic value})>[
    ${JsonPostProcessorTemplate.toJson(fieldConfigs)}
  ];
  return {
    ...json,
    ...Map.fromEntries(jsonPostProcessors
        .map((record) => MapEntry(record.key, record.value))),
  };
}
''';
  }

  String _parseFields() {
    final stringBuffer = StringBuffer();
    for (final fieldConfig in fieldConfigs) {
      final result = ToJsonFieldParser(
        name: fieldConfig.name,
        dartType: fieldConfig.dartType,
        defaultValueString: fieldConfig.createDefaultValueString,
        allowFieldValue: fieldConfig.allowFieldValue,
        alwaysUseFieldValueServerTimestamp:
            fieldConfig.alwaysUseFieldValueServerTimestampWhenCreating,
        jsonConverterConfig: fieldConfig.jsonConverterConfig,
        skipIfNull: false,
      );
      stringBuffer.writeln(result);
    }
    return stringBuffer.toString();
  }
}
