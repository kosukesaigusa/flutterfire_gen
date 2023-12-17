/// Configuration values defined in build.yaml.
class BuildYamlConfig {
  /// Creates a [BuildYamlConfig].
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
  });

  /// Decode the options from a build.yaml.
  factory BuildYamlConfig.fromBuildYaml(Map<String, dynamic> json) =>
        includePathField: json['include_path_field'] as bool? ?? false,
        includeDocumentReferenceField:
            json['include_document_reference_field'] as bool? ?? false,
        generateCopyWith: json['generate_copy_with'] as bool? ?? false,
      );

  /// Whether to include `path` field in ReadEntity class.
  final bool includePathField;

  /// Whether to include `DocumentReference` field in ReadEntity class.
  final bool includeDocumentReferenceField;

  /// Whether to generate `copyWith` method in ReadEntity class.
  final bool generateCopyWith;
}
