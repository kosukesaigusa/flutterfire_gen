/// A template for generating field definitions in a class.
///
/// This template is used to create field definitions for a class based on a
/// map of field names and their corresponding types. It generates the `final`
/// field declarations for each field in the class.
class FieldDefinitionsTemplate {
  /// Creates a new instance of [FieldDefinitionsTemplate].
  ///
  /// Parameters:
  ///
  /// - [fields] A map of field names to their types.
  FieldDefinitionsTemplate({required this.fields});

  /// A map of field names to their types.
  final Map<String, String> fields;

  @override
  String toString() {
    return fields.entries
        .map((entry) => 'final ${entry.value} ${entry.key};')
        .join('\n\n');
  }
}
