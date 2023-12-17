import '../../configs/code_generation_config.dart';

/// A template for generating documentation comments for a class used for
/// creating Firestore documents.
///
/// This template creates a documentation comment that describes the purpose
/// and usage of the generated class for creating new Firestore documents.
/// It includes information about fields that are automatically set to the
/// server's timestamp.
class CreateClassDocCommentTemplate {
  /// Creates a new instance of [CreateClassDocCommentTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including document details.
  CreateClassDocCommentTemplate(this.config);

  /// Configurations used for generating the documentation comment.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Represents the data structure for creating a new ${config.documentName} document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new ${config.documentName} document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
''';
  }
}
