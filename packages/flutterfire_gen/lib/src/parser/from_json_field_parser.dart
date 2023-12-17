import 'package:analyzer/dart/element/type.dart';

import '../configs/json_converter_config.dart';
import '../utils/dart_type_util.dart';

/// A utility class responsible for generating Dart code for deserializing a
/// specific class field from a JSON object.
///
/// This class is used to generate the code snippet necessary to deserialize
/// a field from JSON into its corresponding Dart type, considering any special
/// configurations like default values or custom JSON converters.
class FromJsonFieldParser {
  /// Creates a new [FromJsonFieldParser] instance.
  ///
  /// Parameters:
  ///
  /// - [name] The name of the field in the class.
  /// - [dartType] The Dart type of the field.
  /// - [defaultValueString] The default value of the field, represented as a
  /// string.
  /// - [jsonConverterConfig] Configuration for custom JSON conversion of the
  /// field.
  const FromJsonFieldParser({
    required this.name,
    required this.dartType,
    required this.defaultValueString,
    required this.jsonConverterConfig,
  });

  /// The name of the field in the class.
  final String name;

  /// The Dart type of the field.
  final DartType dartType;

  /// The default value of the field, represented as a string.
  ///
  /// This value is used in the generated code to provide a default when the
  /// JSON object does not contain the field.
  final String? defaultValueString;

  /// Configuration for custom JSON conversion of the field.
  ///
  /// If provided, this configuration is used to customize the deserialization
  /// of the field from JSON.
  final JsonConverterConfig? jsonConverterConfig;

  @override
  String toString() {
    final result = _generateFromJsonCodeSnippet(
      dartType,
      defaultValueString: defaultValueString,
      jsonConverterConfig: jsonConverterConfig,
      isFirstLoop: true,
    );
    return '$name: $result,';
  }

  /// Generates a Dart code snippet for deserializing a field from a JSON
  /// object.
  ///
  /// Parameters:
  ///
  /// - [dartType] The type of the field to be deserialized.
  /// - [defaultValueString] A default value for the field, if any.
  /// - [jsonConverterConfig] Configuration for custom JSON conversion.
  /// - [isFirstLoop] A flag to indicate whether this is the first recursive
  /// call.
  /// - [parsedKey] The key used in parsing, useful in recursion for nested
  /// types.
  String _generateFromJsonCodeSnippet(
    DartType dartType, {
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
          "fromJson(extendedJson['$name']"
          ' as ${jsonConverterConfig.firestoreTypeString})';
      if (defaultValueString != null) {
        return "extendedJson['$name'] == null "
            '? $defaultValueString : $fromJsonString';
      } else {
        return fromJsonString;
      }
    }

    final effectiveParsedKey =
        isFirstLoop ? "extendedJson['$name']" : parsedKey;

    if (dartType.isDartCoreList) {
      if (dartType.firstTypeArgumentOfList != null) {
        final parsedListItemType = _generateFromJsonCodeSnippet(
          dartType.firstTypeArgumentOfList!,
          defaultValueString: defaultValueString,
          isFirstLoop: false,
        );
        if (dartType.isNullableType || defaultValueExpression.isNotEmpty) {
          return '($effectiveParsedKey as List<dynamic>?)?.map((e) '
              '=> $parsedListItemType).toList()$defaultValueExpression';
        } else {
          return '($effectiveParsedKey as List<dynamic>).map((e) '
              '=> $parsedListItemType).toList()';
        }
      }
    }

    if (dartType.isJsonMap) {
      if (dartType.keyValueOfMap != null) {
        final valueType = dartType.keyValueOfMap!.value;
        if (valueType is DynamicType) {
          if (dartType.isNullableType || defaultValueExpression.isNotEmpty) {
            return '$effectiveParsedKey '
                'as Map<String, dynamic>?$defaultValueExpression';
          } else {
            return '$effectiveParsedKey as Map<String, dynamic>';
          }
        }
        final parsedMapValueType = _generateFromJsonCodeSnippet(
          valueType,
          defaultValueString: defaultValueString,
          isFirstLoop: false,
          parsedKey: 'v',
        );
        if (dartType.isNullableType || defaultValueExpression.isNotEmpty) {
          return '($effectiveParsedKey as Map<String, dynamic>?)?.map((k, v) '
              '=> MapEntry(k, $parsedMapValueType))$defaultValueExpression';
        } else {
          return '($effectiveParsedKey as Map<String, dynamic>).map((k, v) => '
              'MapEntry(k, $parsedMapValueType))$defaultValueExpression';
        }
      }
    }

    if (dartType.isDateTimeType) {
      if (dartType.isNullableType) {
        return '($effectiveParsedKey as Timestamp?)?.toDate()';
      } else {
        return '($effectiveParsedKey as Timestamp).toDate()';
      }
    }

    final typeNameString = dartType.typeName(
      forceNullable:
          dartType.isNullableType || defaultValueExpression.isNotEmpty,
    );
    return '$effectiveParsedKey as $typeNameString$defaultValueExpression';
  }
}
