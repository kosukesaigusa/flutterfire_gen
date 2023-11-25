import 'package:analyzer/dart/element/element.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';

import '../configs/field_config.dart';
import '../configs/json_converter_config.dart';
import '../configs/json_post_processor_config.dart';

/// Parses a given [FieldElement] to produce a [FieldConfig] instance.
/// This function examines the metadata annotations of the [FieldElement]
/// to extract default values and any JsonConverter configurations.
///
/// Returns a [FieldConfig] that contains parsed configurations.
FieldConfig parseFieldElement(FieldElement element) {
  final annotations = element.metadata;
  final readDefaultValueString = annotations
      .map(_parseReadDefaultAnnotation)
      .firstWhere((value) => value != null, orElse: () => null);
  final createDefaultValueString = annotations
      .map(_parseCreateDefaultAnnotation)
      .firstWhere((value) => value != null, orElse: () => null);
  final updateDefaultValueString = annotations
      .map(_parseUpdateDefaultAnnotation)
      .firstWhere((value) => value != null, orElse: () => null);
  final jsonConverterConfig = annotations
      .map(_parseJsonConverterAnnotation)
      .firstWhere((value) => value != null, orElse: () => null);
  final jsonPostProcessorConfig = annotations
      .map(_parseJsonPostProcessorAnnotation)
      .firstWhere((value) => value != null, orElse: () => null);
  final allowFieldValue = annotations
      .map(_parseAllowFieldValueAnnotation)
      .firstWhere((value) => value, orElse: () => false);
  final alwaysUseFieldValueServerTimestampWhenCreating = annotations
      .map(_parseAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation)
      .firstWhere((value) => value, orElse: () => false);
  final alwaysUseFieldValueServerTimestampWhenUpdating = annotations
      .map(_parseAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation)
      .firstWhere((value) => value, orElse: () => false);

  return FieldConfig(
    name: element.name,
    dartType: element.type,
    readDefaultValueString: readDefaultValueString,
    createDefaultValueString: createDefaultValueString,
    updateDefaultValueString: updateDefaultValueString,
    jsonConverterConfig: jsonConverterConfig,
    jsonPostProcessorConfig: jsonPostProcessorConfig,
    allowFieldValue: allowFieldValue,
    alwaysUseFieldValueServerTimestampWhenCreating:
        alwaysUseFieldValueServerTimestampWhenCreating,
    alwaysUseFieldValueServerTimestampWhenUpdating:
        alwaysUseFieldValueServerTimestampWhenUpdating,
  );
}

/// Parses the `@ReadDefault` annotation present on a field to extract the
/// default value.
///
/// The method inspects the given `annotation` to determine if it is a
/// `@ReadDefault` annotation. If it is, the method extracts the string
/// representation of the  default value specified in the annotation. This
/// string is suitable for inclusion in generated code that sets default values
/// for fields.
///
/// Parameters:
///
/// - [annotation] The metadata annotation to parse, looking for `@ReadDefault`.
///
/// Returns:
///
/// A `String` representing the default value from the annotation,
/// properly formatted for inclusion in Dart code. If the `@ReadDefault`
/// annotation is not present on the field, `null` is returned.
///
/// Note:
///
/// If the extracted default value is not a string or a literal that is
/// prefixed with `const`, and if it is a compound literal (like list, set, or
/// map), this method adds a `const` modifier to the returned string to ensure
/// correct constant initialization in generated code.
String? _parseReadDefaultAnnotation(ElementAnnotation annotation) {
  final source = annotation.toSource();
  final objectType = annotation.computeConstantValue()!.type!;

  const defaultTypeChecker = TypeChecker.fromRuntime(ReadDefault);
  if (!defaultTypeChecker.isAssignableFromType(objectType)) {
    return null;
  }

  final defaultTypeString = objectType.getDisplayString(withNullability: false);
  final res =
      source.substring('@$defaultTypeString('.length, source.length - 1);
  final needsConstModifier = !objectType.isDartCoreString &&
      !res.trimLeft().startsWith('const') &&
      (res.contains('(') || res.contains('[') || res.contains('{'));
  if (needsConstModifier) {
    return 'const $res';
  } else {
    return res;
  }
}

String? _parseCreateDefaultAnnotation(ElementAnnotation annotation) {
  final source = annotation.toSource();
  final objectType = annotation.computeConstantValue()!.type!;

  const defaultTypeChecker = TypeChecker.fromRuntime(CreateDefault);
  if (!defaultTypeChecker.isAssignableFromType(objectType)) {
    return null;
  }

  final defaultTypeString = objectType.getDisplayString(withNullability: false);
  final res =
      source.substring('@$defaultTypeString('.length, source.length - 1);
  final needsConstModifier = !objectType.isDartCoreString &&
      !res.trimLeft().startsWith('const') &&
      (res.contains('(') || res.contains('[') || res.contains('{'));
  if (needsConstModifier) {
    return 'const $res';
  } else {
    return res;
  }
}

String? _parseUpdateDefaultAnnotation(ElementAnnotation annotation) {
  final source = annotation.toSource();
  final objectType = annotation.computeConstantValue()!.type!;

  const defaultTypeChecker = TypeChecker.fromRuntime(UpdateDefault);
  if (!defaultTypeChecker.isAssignableFromType(objectType)) {
    return null;
  }

  final defaultTypeString = objectType.getDisplayString(withNullability: false);
  final res =
      source.substring('@$defaultTypeString('.length, source.length - 1);
  final needsConstModifier = !objectType.isDartCoreString &&
      !res.trimLeft().startsWith('const') &&
      (res.contains('(') || res.contains('[') || res.contains('{'));
  if (needsConstModifier) {
    return 'const $res';
  } else {
    return res;
  }
}

/// Parses the `@JsonConverter` annotation present on a field to extract
/// converter  configurations for JSON serialization.
///
/// This method identifies and processes the `@JsonConverter` annotation, if
/// present, on the `annotation` parameter. It extracts the necessary
/// configuration details that specify how a field is converted to and from
/// JSON. This information is encapsulated in a `JsonConverterConfig` object.
///
/// Parameters:
///
/// - [annotation] The metadata annotation to parse, looking for
/// `@JsonConverter`.
///
/// Returns:
///
/// A `JsonConverterConfig` containing the information required to  configure
/// JSON serialization for the field. If the field is not annotated with
/// `@JsonConverter`, `null` is returned.
///
/// Note:
///
/// This method assumes that the `@JsonConverter` annotation is applied
/// on fields that also have a converter class specified. The converter class
/// should implement the `JsonConverter` interface with the expected type
/// arguments. The method retrieves and includes these type arguments in the
/// returned  configuration, which are essential for correctly generating
/// serialization code.
JsonConverterConfig? _parseJsonConverterAnnotation(
  ElementAnnotation annotation,
) {
  final source = annotation.toSource();
  final objectType = annotation.computeConstantValue()!.type!;

  const jsonConverterTypeChecker = TypeChecker.fromRuntime(JsonConverter);
  if (!jsonConverterTypeChecker.isAssignableFromType(objectType)) {
    return null;
  }

  final interfaceTypes = (objectType.element! as ClassElement)
      .allSupertypes
      .where(jsonConverterTypeChecker.isExactlyType);
  final typeArguments = interfaceTypes.first.typeArguments;
  if (typeArguments.length == 2) {
    final clientType = typeArguments[0];
    final jsonType = typeArguments[1];
    final pattern = RegExp('@(.*)');
    final match = pattern.firstMatch(source);
    if (match != null) {
      return JsonConverterConfig(
        jsonConverterString: match.group(1)!,
        clientTypeString: clientType.getDisplayString(withNullability: true),
        firestoreTypeString: jsonType.getDisplayString(withNullability: true),
      );
    }
    return null;
  }
  return null;
}

JsonPostProcessorConfig? _parseJsonPostProcessorAnnotation(
  ElementAnnotation annotation,
) {
  final source = annotation.toSource();
  final objectType = annotation.computeConstantValue()!.type!;

  const jsonPostProcessorTypeChecker =
      TypeChecker.fromRuntime(JsonPostProcessor);
  if (!jsonPostProcessorTypeChecker.isAssignableFromType(objectType)) {
    return null;
  }

  final interfaceTypes = (objectType.element! as ClassElement)
      .allSupertypes
      .where(jsonPostProcessorTypeChecker.isExactlyType);
  final typeArguments = interfaceTypes.first.typeArguments;
  if (typeArguments.length == 2) {
    final clientType = typeArguments[0];
    final jsonType = typeArguments[1];
    final pattern = RegExp('@(.*)');
    final match = pattern.firstMatch(source);
    if (match != null) {
      return JsonPostProcessorConfig(
        jsonPostProcessorString: match.group(1)!,
        clientTypeString: clientType.getDisplayString(withNullability: true),
        firestoreTypeString: jsonType.getDisplayString(withNullability: true),
      );
    }
    return null;
  }
  return null;
}

bool _parseAllowFieldValueAnnotation(ElementAnnotation annotation) {
  final objectType = annotation.computeConstantValue()!.type!;
  const allowFieldValueTypeChecker = TypeChecker.fromRuntime(AllowFieldValue);
  return allowFieldValueTypeChecker.isExactlyType(objectType);
}

bool _parseAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation(
  ElementAnnotation annotation,
) {
  final objectType = annotation.computeConstantValue()!.type!;
  const alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker =
      TypeChecker.fromRuntime(AlwaysUseFieldValueServerTimestampWhenCreating);
  return alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker
      .isExactlyType(objectType);
}

bool _parseAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation(
  ElementAnnotation annotation,
) {
  final objectType = annotation.computeConstantValue()!.type!;
  const alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker =
      TypeChecker.fromRuntime(AlwaysUseFieldValueServerTimestampWhenUpdating);
  return alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker
      .isExactlyType(objectType);
}
