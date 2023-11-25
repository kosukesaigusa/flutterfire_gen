// ignore_for_file: lines_longer_than_80_chars

import 'package:meta/meta.dart';

import '../../configs/code_generation_config.dart';
import '../../configs/field_config.dart';
import '../../configs/json_converter_config.dart';
import '../../parser/from_json_field_parser.dart';
import '../../utils/string.dart';
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
      "${config.documentIdFieldName}: extendedJson['${config.documentIdFieldName}'] as String",
      if (config.includePathField) "path: extendedJson['path'] as String",
      if (config.includeDocumentReferenceField)
        "${config.documentReferenceFieldName}: extendedJson['${config.documentReferenceFieldName}'] as ${config.readDocumentReferenceTypeName},",
    ].join(',\n');
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

  String _parseType(
    String fieldNameString,
    String typeNameString, {
    required bool isFirstLoop,
    String? defaultValueString,
    JsonConverterConfig? jsonConverterConfig,
    String parsedKey = 'e',
  }) {
    final hasDefaultValue = (defaultValueString ?? '').isNotEmpty;
    final defaultValueExpression =
        (isFirstLoop && hasDefaultValue) ? ' ?? $defaultValueString' : '';

    if (jsonConverterConfig != null) {
      final fromJsonString = '${jsonConverterConfig.jsonConverterString}.'
          "fromJson(extendedJson['$fieldNameString']"
          ' as ${jsonConverterConfig.firestoreTypeString})';
      if (defaultValueString != null) {
        return "extendedJson['$fieldNameString'] == null ? $defaultValueString : $fromJsonString";
      } else {
        return fromJsonString;
      }
    }

    final effectiveParsedKey =
        isFirstLoop ? "extendedJson['$fieldNameString']" : parsedKey;

    final nullableListMatch =
        RegExp(r'^List<(.*)>\?$').firstMatch(typeNameString);
    if (nullableListMatch != null) {
      final listItemType = nullableListMatch.group(1)!;
      final parsedListItemType = _parseType(
        fieldNameString,
        listItemType,
        defaultValueString: defaultValueString,
        isFirstLoop: false,
      );
      return '($effectiveParsedKey as List<dynamic>?)?.map((e) => $parsedListItemType).toList()$defaultValueExpression';
    }

    final listMatch = RegExp(r'^List<(.*)>$').firstMatch(typeNameString);
    if (listMatch != null) {
      final listItemType = listMatch.group(1)!;
      final parsedListItemType = _parseType(
        fieldNameString,
        listItemType,
        defaultValueString: defaultValueString,
        isFirstLoop: false,
      );
      if (defaultValueExpression.isEmpty) {
        return '($effectiveParsedKey as List<dynamic>).map((e) => $parsedListItemType).toList()';
      } else {
        return '($effectiveParsedKey as List<dynamic>?)?.map((e) => $parsedListItemType).toList()$defaultValueExpression';
      }
    }

    final nullableMapMatch =
        RegExp(r'^Map<String, (.*)>\?$').firstMatch(typeNameString);
    if (nullableMapMatch != null) {
      final mapValueType = nullableMapMatch.group(1)!;
      if (mapValueType == 'dynamic') {
        return '$effectiveParsedKey as Map<String, dynamic>?$defaultValueExpression';
      }
      final parsedMapValueType = _parseType(
        fieldNameString,
        mapValueType,
        defaultValueString: defaultValueString,
        isFirstLoop: false,
        parsedKey: 'v',
      );
      return '($effectiveParsedKey as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, $parsedMapValueType))$defaultValueExpression';
    }

    final mapMatch = RegExp(r'^Map<String, (.*)>$').firstMatch(typeNameString);
    if (mapMatch != null) {
      final mapValueType = mapMatch.group(1)!;
      if (mapValueType == 'dynamic') {
        if (defaultValueExpression.isEmpty) {
          return '$effectiveParsedKey as Map<String, dynamic>$defaultValueExpression';
        } else {
          return '$effectiveParsedKey as Map<String, dynamic>?$defaultValueExpression';
        }
      } else {
        final parsedMapValueType = _parseType(
          fieldNameString,
          mapValueType,
          defaultValueString: defaultValueString,
          isFirstLoop: false,
          parsedKey: 'v',
        );
        if (defaultValueExpression.isEmpty) {
          return '($effectiveParsedKey as Map<String, dynamic>).map((k, v) => MapEntry(k, $parsedMapValueType))$defaultValueExpression';
        } else {
          return '($effectiveParsedKey as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, $parsedMapValueType))$defaultValueExpression';
        }
      }
    }

    final dateTimeMatch = RegExp(r'^DateTime\??$').firstMatch(typeNameString);
    if (dateTimeMatch != null) {
      if (typeNameString.endsWith('?')) {
        return '($effectiveParsedKey as Timestamp?)?.toDate()';
      } else {
        return '($effectiveParsedKey as Timestamp).toDate()';
      }
    }

    if (defaultValueExpression.isEmpty) {
      return '$effectiveParsedKey as $typeNameString$defaultValueExpression';
    } else {
      return '$effectiveParsedKey as ${typeNameString.ensureNullable()}$defaultValueExpression';
    }
  }

  ///
  @visibleForTesting
  String fromJsonEachField({
    required String fieldNameString,
    required String typeNameString,
    String? defaultValueString,
    JsonConverterConfig? jsonConverterConfig,
  }) {
    return '$fieldNameString: ${_parseType(
      fieldNameString,
      typeNameString,
      defaultValueString: defaultValueString,
      jsonConverterConfig: jsonConverterConfig,
      isFirstLoop: true,
    )}';
  }
}
