import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'configs/build_yaml_config.dart';
import 'configs/code_generation_config.dart';
import 'parser/field_element_parser.dart';
import 'templates/create/create_class_template.dart';
import 'templates/delete/delete_class_template.dart';
import 'templates/query/query_class_template.dart';
import 'templates/read/read_class_template.dart';
import 'templates/references/references_template.dart';
import 'templates/update/update_class_template.dart';
import 'utils/dart_object_util.dart';
import 'utils/string.dart';

/// A generator for [FirestoreDocument] annotation.
///
/// This class is responsible for generating Dart code for classes annotated
/// with [FirestoreDocument]. It produces the necessary classes and methods
/// for interacting with Firestore, based on the provided configuration and
/// annotations. This includes generating classes for CRUD operations, query
/// handling, and Firestore references.
class FlutterFireGen extends GeneratorForAnnotation<FirestoreDocument> {
  /// Creates a new instance of [FlutterFireGen].
  ///
  /// Parameters:
  ///
  /// - [_buildYamlConfig] Configuration for code generation provided in
  /// `build.yaml`.
  FlutterFireGen(this._buildYamlConfig);

  /// A [BuildYamlConfig] instance containing configuration from `build.yaml`.
  final BuildYamlConfig _buildYamlConfig;

  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        '@FirestoreDocument can only be applied on classes. '
        'Failing element: ${element.name}',
        element: element,
      );
    }

    if (!element.name
        .startsWith(_buildYamlConfig.schemaDefinitionClassPrefix)) {
      throw InvalidGenerationSourceError(
        '${element.name} must start with '
        "'${_buildYamlConfig.schemaDefinitionClassPrefix}'. "
        'Because you set schema_definition_class_prefix to '
        "'${_buildYamlConfig.schemaDefinitionClassPrefix}' in build.yaml. "
        'Failing element: ${element.name}',
        element: element,
      );
    }

    final baseClassName = element.name
        .replaceFirst(_buildYamlConfig.schemaDefinitionClassPrefix, '');

    final annotation = const TypeChecker.fromRuntime(FirestoreDocument)
        .firstAnnotationOf(element, throwOnUnresolved: false)!;

    final config = CodeGenerationConfig(
      baseClassName: baseClassName,
      path: annotation.decodeField(
        'path',
        decode: (obj) => obj.toStringValue()!,
        orElse: () => throw InvalidGenerationSourceError(
          'path field is required. '
          'Failing element: ${element.name}',
          element: element,
        ),
      ),
      readClassPrefix: annotation.decodeField(
        'readClassPrefix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.readClassPrefix.capitalize,
      ),
      readClassSuffix: annotation.decodeField(
        'readClassSuffix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.readClassSuffix.capitalize,
      ),
      createClassPrefix: annotation.decodeField(
        'createClassPrefix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.createClassPrefix.capitalize,
      ),
      createClassSuffix: annotation.decodeField(
        'createClassSuffix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.createClassSuffix.capitalize,
      ),
      updateClassPrefix: annotation.decodeField(
        'updateClassPrefix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.updateClassPrefix.capitalize,
      ),
      updateClassSuffix: annotation.decodeField(
        'updateClassSuffix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.updateClassSuffix.capitalize,
      ),
      deleteClassPrefix: annotation.decodeField(
        'deleteClassPrefix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.deleteClassPrefix.capitalize,
      ),
      deleteClassSuffix: annotation.decodeField(
        'deleteClassSuffix',
        decode: (obj) => obj.toStringValue()!.capitalize(),
        orElse: _buildYamlConfig.deleteClassSuffix.capitalize,
      ),
      includePathField: annotation.decodeField(
        'includePathField',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.includePathField,
      ),
      includeDocumentReferenceField: annotation.decodeField(
        'includeDocumentReferenceField',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.includeDocumentReferenceField,
      ),
      generateCopyWith: annotation.decodeField(
        'generateCopyWith',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.generateCopyWith,
      ),
      fieldConfigs: element.fields
          .map(
            const FieldElementParser(
              readDefaultTypeChecker: TypeChecker.fromRuntime(ReadDefault),
              createDefaultTypeChecker: TypeChecker.fromRuntime(CreateDefault),
              updateDefaultTypeChecker: TypeChecker.fromRuntime(UpdateDefault),
              jsonConverterTypeChecker: TypeChecker.fromRuntime(JsonConverter),
              jsonPostProcessorTypeChecker:
                  TypeChecker.fromRuntime(JsonPostProcessor),
              allowFieldValueTypeChecker:
                  TypeChecker.fromRuntime(AllowFieldValue),
              alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker:
                  TypeChecker.fromRuntime(
                AlwaysUseFieldValueServerTimestampWhenCreating,
              ),
              alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker:
                  TypeChecker.fromRuntime(
                AlwaysUseFieldValueServerTimestampWhenUpdating,
              ),
            ).parse,
          )
          .toList(),
    );

    final buffer = StringBuffer()
      ..writeln(ReadClassTemplate(config))
      ..writeln(CreateClassTemplate(config))
      ..writeln(UpdateClassTemplate(config))
      ..writeln(DeleteClassTemplate(config))
      ..writeln(ReferencesTemplate(config))
      ..writeln(QueryClassTemplate(config));

    return buffer.toString();
  }
}
