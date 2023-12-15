import '../../configs/code_generation_config.dart';

///
class UpdateClassDocCommentTemplate {
  ///
  UpdateClassDocCommentTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Represents the data structure for updating a ${config.documentName} document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a ${config.documentName} document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
''';
  }
}
