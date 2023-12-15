import '../../configs/code_generation_config.dart';

///
class CreateClassDocCommentTemplate {
  ///
  CreateClassDocCommentTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Represents the data structure for creating a new ${config.documentName} document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new ${config.documentName} document.
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
/// automatically set to the server's timestamp.
''';
  }
}
