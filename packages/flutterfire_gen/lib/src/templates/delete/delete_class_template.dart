import '../../configs/code_generation_config.dart';

/// A template for a class to delete documents in Firestore.
class DeleteClassTemplate {
  /// Creates a [DeleteClassTemplate].
  const DeleteClassTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Represents the data structure for deleting a ${config.documentName} document in Cloud Firestore.
class ${config.deleteClassName} {}
''';
  }
}
