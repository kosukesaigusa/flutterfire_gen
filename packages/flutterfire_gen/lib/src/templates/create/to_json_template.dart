import '../../configs/field_config.dart';
import '../../parser/to_json_field_parser.dart';
import '../json/json_post_processor_template.dart';

/// A template for generating a `toJson` method for classes used for creating
/// Firestore documents.
///
/// This template constructs the Dart code for a `toJson` method. This method
/// is responsible for converting the class fields into a JSON format suitable
/// for Firestore document creation, considering field values, default values,
/// and custom JSON conversion configurations.
class ToJsonTemplate {
  /// Creates a new instance of [ToJsonTemplate].
  ///
  /// Parameters:
  ///
  /// - [fieldConfigs] A list of configurations for each field in the class.
  const ToJsonTemplate(this.fieldConfigs);

  /// Configurations for the fields to be included in the `toJson` method.
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

  /// Generates Dart code for serializing each field to JSON.
  ///
  /// This method iterates over all field configurations, generating the
  /// appropriate serialization code for each field.
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
