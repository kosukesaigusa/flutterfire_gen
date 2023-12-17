import '../../configs/code_generation_config.dart';

/// A template for generating the `copyWith` method for a Firestore document
/// class.
///
/// This template is used to create a `copyWith` method in classes representing
/// Firestore documents. The `copyWith` method allows for creating a new
/// instance of the class with modified fields, based on the provided
/// parameters.
class CopyWithTemplate {
  /// Creates a new instance of [CopyWithTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including class and field
  /// details.
  const CopyWithTemplate(this.config);

  /// Configuration details for generating the `copyWith` method.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final fields = <String, String>{
      for (final fieldConfig in config.fieldConfigs)
        fieldConfig.name: fieldConfig.typeName(forceNullable: true),
      config.documentId: 'String?',
      if (config.includePathField) 'path': 'String?',
      if (config.includeDocumentReferenceField)
        config.documentReferenceFieldName:
            'DocumentReference<${config.readClassName}>?',
    };
    if (fields.isEmpty) {
      return '${config.readClassName} copyWith() => ${config.readClassName}();';
    }
    return '''
${config.readClassName} copyWith({
    ${fields.entries.map((entry) {
      final fieldNameString = entry.key;
      final typeNameString = entry.value;
      return '$typeNameString $fieldNameString,';
    }).join('\n')}
  }) {
    return ${config.readClassName}(
      ${fields.entries.map((entry) => '${entry.key}: ${entry.key} ?? this.${entry.key},').join('\n')}
    );
  }
''';
  }
}
