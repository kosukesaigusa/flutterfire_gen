// ignore_for_file: lines_longer_than_80_chars

import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../../configs/reference_class_type.dart';
import '../../parser/from_json_field_parser.dart';
import '../json/json_post_processor_template.dart';

/// A template for a class to read documents from Firestore.
class FromJsonTemplate {
  /// Creates a [FromJsonTemplate].
  FromJsonTemplate(this.config);

  ///
  final CodeGenerationConfig config;

  @override
  String toString() {
    final jsonPostProcessors =
        JsonPostProcessorTemplate.fromJson(config.fieldConfigs);
    final additionalFields = [
      "${config.documentId}: extendedJson['${config.documentId}'] as String,",
      if (config.includePathField) "path: extendedJson['path'] as String,",
      if (config.includeDocumentReferenceField)
        "${config.documentReferenceFieldName}: extendedJson['${config.documentReferenceFieldName}'] as ${config.documentReferenceTypeName(ReferenceClassType.read)},",
    ].join('\n');
    return '''
factory ${config.readClassName}.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
      $jsonPostProcessors
    };
    return ${config.readClassName}(
      ${_parseFields(config.fieldConfigs)}
      $additionalFields
    );
  }
''';
  }

  String _parseFields(List<FieldConfig> fieldConfigs) {
    final stringBuffer = StringBuffer();
    for (final fieldConfig in fieldConfigs) {
      final result = FromJsonFieldParser(
        name: fieldConfig.name,
        dartType: fieldConfig.dartType,
        defaultValueString: fieldConfig.readDefaultValueString,
        jsonConverterConfig: fieldConfig.jsonConverterConfig,
      );
      stringBuffer.writeln(result);
    }
    return stringBuffer.toString();
  }
}
