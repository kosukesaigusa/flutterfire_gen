import '../../configs/code_generation_config.dart';

/// A template for a copyWith method for a document class.
class CopyWithTemplate {
  ///
  const CopyWithTemplate(this.config);

  ///
  final CodeGenerationConfig config;

  @override
  String toString() {
    final fields = <String, String>{
      for (final fieldConfig in config.fieldConfigs)
        fieldConfig.name: fieldConfig.typeName(forceNullable: true),
      config.documentIdFieldName: 'String?',
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
