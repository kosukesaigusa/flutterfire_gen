import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

import '../configs/field_config.dart';
import '../configs/json_converter_config.dart';
import '../configs/json_post_processor_config.dart';

enum _DefaultType { read, create, update }

/// `FieldElementParser` class for parsing annotations on field elements
/// and generating configuration details.
class FieldElementParser {
  /// Constructs a `FieldElementParser` with specified [TypeChecker] instances
  /// for different types of annotations.
  ///
  /// Each [TypeChecker] provided as a parameter is used to identify and
  /// process specific annotations found on Dart field elements. This allows
  /// the parser to handle a variety of annotations related to default values,
  /// JSON serialization, Firestore field values, and more.
  ///
  /// Parameters:
  ///
  /// - [readDefaultTypeChecker] A [TypeChecker] for identifying `ReadDefault`
  ///   annotations. It is used to extract default values for fields.
  /// - [createDefaultTypeChecker] A [TypeChecker] for identifying
  /// `CreateDefault` annotations, which define default values for object
  /// creation.
  /// - [updateDefaultTypeChecker] A [TypeChecker] for `UpdateDefault`
  ///   annotations, specifying default values for object updates.
  /// - [jsonConverterTypeChecker] A [TypeChecker] for `JsonConverter`
  ///   annotations, used for custom JSON conversion logic.
  /// - [jsonPostProcessorTypeChecker] A [TypeChecker] for `JsonPostProcessor`
  ///   annotations, for post-processing after JSON deserialization.
  /// - [allowFieldValueTypeChecker] A [TypeChecker] for `AllowFieldValue`
  ///   annotations, allowing specific Firestore FieldValue types.
  /// - [alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker] A
  /// [TypeChecker] for identifying
  /// `AlwaysUseFieldValueServerTimestampWhenCreating` annotations, enforcing
  /// `FieldValue.serverTimestamp` for new instances.
  /// - [alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker] A
  /// [TypeChecker] for `AlwaysUseFieldValueServerTimestampWhenUpdating`
  /// annotations, enforcing `FieldValue.serverTimestamp` during updates.
  const FieldElementParser({
    required this.readDefaultTypeChecker,
    required this.createDefaultTypeChecker,
    required this.updateDefaultTypeChecker,
    required this.jsonConverterTypeChecker,
    required this.jsonPostProcessorTypeChecker,
    required this.allowFieldValueTypeChecker,
    required this.alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker,
    required this.alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker,
  });

  /// [TypeChecker] for identifying `ReadDefault` annotations.
  /// Used to check if a field element has been annotated with `ReadDefault`
  /// and process its value accordingly.
  final TypeChecker readDefaultTypeChecker;

  /// [TypeChecker] for identifying `CreateDefault` annotations.
  /// This checker is used to determine if a field element has the
  /// `CreateDefault`
  /// annotation for default value assignment during object creation.
  final TypeChecker createDefaultTypeChecker;

  /// [TypeChecker] for identifying `UpdateDefault` annotations.
  /// It checks for the presence of `UpdateDefault` annotation on a field
  /// element,
  /// which indicates a default value to be used during object updates.
  final TypeChecker updateDefaultTypeChecker;

  /// [TypeChecker] for identifying `JsonConverter` annotations.
  /// This is used to specify custom JSON conversion logic for a field element.
  final TypeChecker jsonConverterTypeChecker;

  /// [TypeChecker] for identifying `JsonPostProcessor` annotations.
  /// It is used to apply custom post-processing logic after JSON
  /// deserialization.
  final TypeChecker jsonPostProcessorTypeChecker;

  /// [TypeChecker] for identifying `AllowFieldValue` annotations.
  /// This checker is used to allow specific Firestore FieldValue types
  /// (like `FieldValue.serverTimestamp`) for a field element.
  final TypeChecker allowFieldValueTypeChecker;

  /// [TypeChecker] for identifying
  /// `AlwaysUseFieldValueServerTimestampWhenCreating` annotations.
  /// It checks for this annotation to use `FieldValue.serverTimestamp` as a
  /// default value when creating new instances.
  final TypeChecker alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker;

  /// [TypeChecker] for identifying
  /// `AlwaysUseFieldValueServerTimestampWhenUpdating` annotations.
  /// This is used to enforce `FieldValue.serverTimestamp` as a default value
  /// when updating instances.
  final TypeChecker alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker;

  TypeChecker _defaultTypeChecker(_DefaultType defaultType) {
    return switch (defaultType) {
      _DefaultType.read => readDefaultTypeChecker,
      _DefaultType.create => createDefaultTypeChecker,
      _DefaultType.update => updateDefaultTypeChecker,
    };
  }

  /// Parses a given [FieldElement] to produce a [FieldConfig] instance.
  /// This function examines the metadata annotations of the [FieldElement]
  /// to extract default values and any JsonConverter configurations.
  ///
  /// Returns a [FieldConfig] that contains parsed configurations.
  FieldConfig parse(FieldElement element) {
    final annotations = element.metadata;
    final readDefaultValueString = annotations
        .map(
          (annotation) => _parseDefaultAnnotation(
            defaultType: _DefaultType.read,
            annotation: annotation,
          ),
        )
        .firstWhere((value) => value != null, orElse: () => null);
    final createDefaultValueString = annotations
        .map(
          (annotation) => _parseDefaultAnnotation(
            defaultType: _DefaultType.create,
            annotation: annotation,
          ),
        )
        .firstWhere((value) => value != null, orElse: () => null);
    final updateDefaultValueString = annotations
        .map(
          (annotation) => _parseDefaultAnnotation(
            defaultType: _DefaultType.update,
            annotation: annotation,
          ),
        )
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

  String? _parseDefaultAnnotation({
    required _DefaultType defaultType,
    required ElementAnnotation annotation,
  }) {
    final source = annotation.toSource();
    final objectType = annotation.computeConstantValue()!.type!;

    if (!_defaultTypeChecker(defaultType).isAssignableFromType(objectType)) {
      return null;
    }

    final defaultTypeString =
        objectType.getDisplayString(withNullability: false);
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
  /// converter configurations for JSON serialization.
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
    return allowFieldValueTypeChecker.isExactlyType(objectType);
  }

  bool _parseAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation(
    ElementAnnotation annotation,
  ) {
    final objectType = annotation.computeConstantValue()!.type!;
    return alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker
        .isExactlyType(objectType);
  }

  bool _parseAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation(
    ElementAnnotation annotation,
  ) {
    final objectType = annotation.computeConstantValue()!.type!;
    return alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker
        .isExactlyType(objectType);
  }
}
