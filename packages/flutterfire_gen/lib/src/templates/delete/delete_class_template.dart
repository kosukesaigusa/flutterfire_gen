import '../../configs/code_generation_config.dart';

/// A template for generating a class used for deleting documents in Firestore.
///
/// This class constructs the necessary Dart code for a class that represents
/// the structure and functionality required to delete a Firestore document.
/// The generated class typically includes minimal functionality, as it is
/// primarily used to represent the deletion action.
class DeleteClassTemplate {
  /// Creates a new instance of [DeleteClassTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including details about the
  /// Firestore document to be deleted.
  const DeleteClassTemplate(this.config);

  /// Configurations used for generating the delete class.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Represents the data structure for deleting a ${config.documentName} document in Cloud Firestore.
class ${config.deleteClassName} {}
''';
  }
}
