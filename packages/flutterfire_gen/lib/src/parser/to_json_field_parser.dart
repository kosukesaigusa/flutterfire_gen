import 'package:analyzer/dart/element/type.dart';

import '../configs/json_converter_config.dart';
import '../utils/dart_type_util.dart';

/// A utility class responsible for generating Dart code for deserializing a
/// specific class field from a JSON object.
class ToJsonFieldParser {
  ///
  const ToJsonFieldParser({
    required this.name,
    required this.dartType,
    required this.defaultValueString,
    required this.allowFieldValue,
    required this.alwaysUseFieldValueServerTimestamp,
    required this.jsonConverterConfig,
    required this.skipIfNull,
  });

  /// The name of the field in the class.
  final String name;

  /// The Dart type of the field.
  final DartType dartType;

  /// The default value of the field, represented as a string.
  final String? defaultValueString;

  ///
  final bool allowFieldValue;

  ///
  final bool alwaysUseFieldValueServerTimestamp;

  /// Configuration for converting the field to and from JSON.
  final JsonConverterConfig? jsonConverterConfig;

  ///
  final bool skipIfNull;

  @override
  String toString() {
    final assertNonNull = skipIfNull &&
        (defaultValueString ?? '').isEmpty &&
        !alwaysUseFieldValueServerTimestamp;
    final result = _generateToJsonCodeSnippet(
      dartType: dartType,
      defaultValueString: defaultValueString,
      isFieldValueAllowed: allowFieldValue,
      isAlwaysUseFieldValueServerTimestamp: alwaysUseFieldValueServerTimestamp,
      jsonConverterConfig: jsonConverterConfig,
      assertNonNull: assertNonNull,
    );
    if (assertNonNull) {
      return "if ($name != null) '$name': $result,";
    } else {
      return "'$name': $result,";
    }
  }

  ///
  String _generateToJsonCodeSnippet({
    required DartType dartType,
    required String? defaultValueString,
    required bool isFieldValueAllowed,
    required bool isAlwaysUseFieldValueServerTimestamp,
    required JsonConverterConfig? jsonConverterConfig,
    required bool assertNonNull,
  }) {
    final hasDefaultValue = (defaultValueString ?? '').isNotEmpty;
    final defaultValueExpression =
        hasDefaultValue ? ' ?? $defaultValueString' : '';

    if (isAlwaysUseFieldValueServerTimestamp) {
      return 'FieldValue.serverTimestamp()';
    }

    if (jsonConverterConfig != null) {
      if (hasDefaultValue && dartType.isNullableType) {
        if (isFieldValueAllowed) {
          return '$name == null '
              '? $defaultValueString '
              ': ${jsonConverterConfig.jsonConverterString}'
              '.toJson($name!.actualValue)';
        } else {
          return '$name == null '
              '? $defaultValueString '
              ': ${jsonConverterConfig.jsonConverterString}.toJson($name!)';
        }
      }
      if (isFieldValueAllowed) {
        if (assertNonNull) {
          return '${jsonConverterConfig.jsonConverterString}'
              '.toJson($name!.actualValue)';
        } else {
          return '${jsonConverterConfig.jsonConverterString}'
              '.toJson($name.actualValue)';
        }
      } else {
        if (assertNonNull) {
          return '${jsonConverterConfig.jsonConverterString}'
              '.toJson($name!)';
        } else {
          return '${jsonConverterConfig.jsonConverterString}'
              '.toJson($name)';
        }
      }
    }

    if (isFieldValueAllowed) {
      if (dartType.isNullableType) {
        if (assertNonNull) {
          return '$name!.value$defaultValueExpression';
        } else {
          return '$name?.value$defaultValueExpression';
        }
      } else {
        if (assertNonNull) {
          return '$name!.value';
        } else {
          return '$name.value';
        }
      }
    }

    if (dartType.isDateTimeType) {
      if (dartType.isNullableType) {
        return '$name == null ? null : Timestamp.fromDate($name!)';
      } else {
        if (assertNonNull) {
          return 'Timestamp.fromDate($name!)';
        } else {
          return 'Timestamp.fromDate($name)';
        }
      }
    }

    return '$name$defaultValueExpression';
  }
}
