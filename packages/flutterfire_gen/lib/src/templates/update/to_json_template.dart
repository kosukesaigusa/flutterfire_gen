import '../../configs/field_config.dart';
import '../../parser/to_json_field_parser.dart';
import '../json/json_post_processor_template.dart';

/// A template for generating the `toJson` method for Firestore document
/// classes.
///
/// This template is used to create a `toJson` method in classes representing
/// Firestore documents. The method is responsible for converting the class
/// fields into a format suitable for Firestore, considering field values,
/// default values, and custom JSON conversion configurations.
class ToJsonTemplate {
  /// Creates a new instance of [ToJsonTemplate].
  ///
  /// Parameters:
  ///
  /// - [fieldConfigs] A list of field configurations for the class.
  const ToJsonTemplate(this.fieldConfigs);

  /// Field configurations used in the `toJson` method.
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
        defaultValueString: fieldConfig.updateDefaultValueString,
        allowFieldValue: fieldConfig.allowFieldValue,
        alwaysUseFieldValueServerTimestamp:
            fieldConfig.alwaysUseFieldValueServerTimestampWhenUpdating,
        jsonConverterConfig: fieldConfig.jsonConverterConfig,
        skipIfNull: true,
      );
      stringBuffer.writeln(result);
    }
    return stringBuffer.toString();
  }
}
