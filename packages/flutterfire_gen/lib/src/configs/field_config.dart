import 'package:analyzer/dart/element/type.dart';

import '../utils/dart_type_util.dart';
import 'json_converter_config.dart';
import 'json_post_processor_config.dart';

/// A configuration for a field.
class FieldConfig {
  /// Creates a new [FieldConfig] instance.
  FieldConfig({
    required this.name,
    required this.dartType,
    this.readDefaultValueString,
    this.createDefaultValueString,
    this.updateDefaultValueString,
    this.jsonConverterConfig,
    this.jsonPostProcessorConfig,
    this.allowFieldValue = false,
    this.alwaysUseFieldValueServerTimestampWhenCreating = false,
    this.alwaysUseFieldValueServerTimestampWhenUpdating = false,
  });

  /// The name of the field.
  final String name;

  /// The [DartType] of the field.
  final DartType dartType;

  /// Whether the field is nullable.
  bool get isNullableType => dartType.isNullableType;

  /// The type name String of the field.
  String typeName({
    bool forceNullable = false,
    bool wrapByFirestoreData = false,
  }) =>
      dartType.typeName(
        forceNullable: forceNullable,
        wrapByFirestoreData: wrapByFirestoreData,
      );

  /// The default value string when reading of the field.
  final String? readDefaultValueString;

  /// The default value string when creating of the field.
  final String? createDefaultValueString;

  /// The default value string when updating of the field.
  final String? updateDefaultValueString;

  /// The [JsonConverterConfig] of the field.
  final JsonConverterConfig? jsonConverterConfig;

  /// The [JsonPostProcessorConfig] of the field.
  final JsonPostProcessorConfig? jsonPostProcessorConfig;

  /// Whether the field allows `FieldValue` when writing.
  final bool allowFieldValue;

  /// Whether the field always uses `FieldValue.serverTimestamp()` when creating
  /// a document.
  final bool alwaysUseFieldValueServerTimestampWhenCreating;

  /// Whether the field always uses `FieldValue.serverTimestamp()` when updating
  /// a document.
  final bool alwaysUseFieldValueServerTimestampWhenUpdating;

  /// Whether the field is a list.
  bool get isNonNullableList => dartType.isDartCoreList && !isNullableType;

  /// Whether the field is a nullable list.
  bool get isNullableList => dartType.isDartCoreList && isNullableType;
}
