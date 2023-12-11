import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'configs/build_yaml_config.dart';
import 'configs/code_generation_config.dart';
import 'parser/field_element_parser.dart';
import 'templates/create/create_class_template.dart';
import 'templates/delete/delete_class_template.dart';
import 'templates/query_class_template.dart';
import 'templates/read/read_class_template.dart';
import 'templates/references/references_template.dart';
import 'templates/update/update_class_template.dart';
import 'utils/dart_object_util.dart';

/// A generator for [FirestoreDocument] annotation.
class FlutterFireGen extends GeneratorForAnnotation<FirestoreDocument> {
  /// Creates a new instance of [FlutterFireGen].
  FlutterFireGen(this._buildYamlConfig);

  /// A [BuildYamlConfig] instance.
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

    final annotation = const TypeChecker.fromRuntime(FirestoreDocument)
        .firstAnnotationOf(element, throwOnUnresolved: false)!;

    final config = CodeGenerationConfig(
      baseClassName: element.name,
      path: annotation.decodeField(
        'path',
        decode: (obj) => obj.toStringValue()!,
        orElse: () => throw InvalidGenerationSourceError(
          'path field is required. '
          'Failing element: ${element.name}',
          element: element,
        ),
      ),
      includePathField: annotation.decodeField(
        'includePathField',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.includePathField ?? false,
      ),
      includeDocumentReferenceField: annotation.decodeField(
        'includeDocumentReferenceField',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.includeDocumentReferenceField ?? false,
      ),
      generateCopyWith: annotation.decodeField(
        'generateCopyWith',
        decode: (obj) => obj.toBoolValue() ?? false,
        orElse: () => _buildYamlConfig.generateCopyWith ?? false,
      ),
      fieldConfigs: element.fields.map(parseFieldElement).toList(),
    );

    final buffer = StringBuffer()
      ..writeln(ReadClassTemplate(config))
      ..writeln(CreateClassTemplate(config))
      ..writeln(UpdateClassTemplate(config))
      ..writeln(DeleteClassTemplate(config.deleteClassName))
      ..writeln(ReferencesTemplate(config))
      ..writeln(QueryClassTemplate(config));

    return buffer.toString();
  }
}
