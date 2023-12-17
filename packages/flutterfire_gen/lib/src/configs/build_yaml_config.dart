/// Represents configuration values defined in `build.yaml` for
/// `@FirestoreDocument` annotated class code generation.
class BuildYamlConfig {
  /// Creates a new instance of [BuildYamlConfig] with specified configuration
  /// values.
  BuildYamlConfig._({
    required this.schemaDefinitionClassPrefix,
    required this.readClassPrefix,
    required this.readClassSuffix,
    required this.createClassPrefix,
    required this.createClassSuffix,
    required this.updateClassPrefix,
    required this.updateClassSuffix,
    required this.deleteClassPrefix,
    required this.deleteClassSuffix,
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
  });

  /// Constructs a [BuildYamlConfig] from JSON configuration in `build.yaml`.
  ///
  /// Parses configuration options defined in `build.yaml` and creates an
  /// instance of [BuildYamlConfig] to be used in code generation.
  factory BuildYamlConfig.fromBuildYaml(Map<String, dynamic> json) =>
      BuildYamlConfig._(
        schemaDefinitionClassPrefix:
            json['schema_definition_class_prefix'] as String? ?? '',
        readClassPrefix: json['read_class_prefix'] as String? ?? 'Read',
        readClassSuffix: json['read_class_suffix'] as String? ?? '',
        createClassPrefix: json['create_class_prefix'] as String? ?? 'Create',
        createClassSuffix: json['create_class_suffix'] as String? ?? '',
        updateClassPrefix: json['update_class_prefix'] as String? ?? 'Update',
        updateClassSuffix: json['update_class_suffix'] as String? ?? '',
        deleteClassPrefix: json['delete_class_prefix'] as String? ?? 'Delete',
        deleteClassSuffix: json['delete_class_suffix'] as String? ?? '',
        includePathField: json['include_path_field'] as bool? ?? false,
        includeDocumentReferenceField:
            json['include_document_reference_field'] as bool? ?? false,
        generateCopyWith: json['generate_copy_with'] as bool? ?? false,
      );

  /// The prefix for the schema definition class annotated with
  /// `@FirestoreDocument`.
  final String schemaDefinitionClassPrefix;

  /// The prefix for the class names representing entities read from Firestore.
  final String readClassPrefix;

  /// The suffix for the class names representing entities read from Firestore.
  final String readClassSuffix;

  /// The prefix for the class names representing data structures for creating
  /// new Firestore documents.
  final String createClassPrefix;

  /// The suffix for the class names representing data structures for creating
  /// new Firestore documents.
  final String createClassSuffix;

  /// The prefix for the class names representing data structures for updating
  /// Firestore documents.
  final String updateClassPrefix;

  /// The suffix for the class names representing data structures for updating
  /// Firestore documents.
  final String updateClassSuffix;

  /// The prefix for the class names representing data structures for deleting
  /// Firestore documents.
  final String deleteClassPrefix;

  /// The suffix for the class names representing data structures for deleting
  /// Firestore documents.
  final String deleteClassSuffix;

  /// Indicates whether to include a `path` field in the ReadEntity class.
  final bool includePathField;

  /// Indicates whether to include a `DocumentReference` field in the ReadEntity
  /// class.
  final bool includeDocumentReferenceField;

  /// Indicates whether to generate a `copyWith` method in the ReadEntity class.
  final bool generateCopyWith;
}
