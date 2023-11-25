/// A template for a class to delete documents in Firestore.
class DeleteClassTemplate {
  /// Creates a [DeleteClassTemplate].
  const DeleteClassTemplate(this.className);

  ///
  final String className;

  @override
  String toString() {
    return 'class $className {}';
  }
}
