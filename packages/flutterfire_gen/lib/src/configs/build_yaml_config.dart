/// Configuration values defined in build.yaml.
class BuildYamlConfig {
  /// Creates a [BuildYamlConfig].
  BuildYamlConfig._({
    required this.schemaDefinitionClassPrefix,
    required this.readClassPrefix,
    required this.createClassPrefix,
    required this.updateClassPrefix,
    required this.deleteClassPrefix,
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
  });

  /// Decode the options from a build.yaml.
  factory BuildYamlConfig.fromBuildYaml(Map<String, dynamic> json) =>
      BuildYamlConfig._(
        schemaDefinitionClassPrefix:
            json['schema_definition_class_prefix'] as String? ?? '',
        readClassPrefix: json['read_class_prefix'] as String? ?? 'Read',
        createClassPrefix: json['create_class_prefix'] as String? ?? 'Create',
        updateClassPrefix: json['update_class_prefix'] as String? ?? 'Update',
        deleteClassPrefix: json['delete_class_prefix'] as String? ?? 'Delete',
        includePathField: json['include_path_field'] as bool? ?? false,
        includeDocumentReferenceField:
            json['include_document_reference_field'] as bool? ?? false,
        generateCopyWith: json['generate_copy_with'] as bool? ?? false,
      );

  /// The prefix for the `@FirestoreDocument` annotated schema definition class.
  final String schemaDefinitionClassPrefix;

  /// The prefix for the class name of entities created based on documents read
  /// from Cloud Firestore.
  final String readClassPrefix;

  /// The prefix for the class name of data structure for creating a new
  /// document in Cloud Firestore.
  final String createClassPrefix;

  /// The prefix for the class name of data structure for updating a document in
  /// Cloud Firestore.
  final String updateClassPrefix;

  /// The prefix for the class name of data structure for deleting a  document
  /// in Cloud Firestore.
  final String deleteClassPrefix;

  /// Whether to include `path` field in ReadEntity class.
  final bool includePathField;

  /// Whether to include `DocumentReference` field in ReadEntity class.
  final bool includeDocumentReferenceField;

  /// Whether to generate `copyWith` method in ReadEntity class.
  final bool generateCopyWith;
}
