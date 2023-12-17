import '../../configs/code_generation_config.dart';

/// A template for generating documentation comments for an update class.
///
/// This template creates documentation comments for a class that represents
/// the structure for updating a Firestore document. It explains how to use the
/// class to specify fields for updates and handle server timestamps.
class UpdateClassDocCommentTemplate {
  /// Creates a new instance of [UpdateClassDocCommentTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including document details.
  UpdateClassDocCommentTemplate(this.config);

  /// Configurations used for generating the documentation comment.
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
