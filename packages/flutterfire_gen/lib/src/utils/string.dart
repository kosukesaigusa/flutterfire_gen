/// An extension class on [String].
extension StringExtension on String {
  /// Capitalizes the given [String].
  String capitalize() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// De-capitalizes the given [String].
  String decapitalize() {
    if (isEmpty) {
      return '';
    }
    return '${this[0].toLowerCase()}${substring(1)}';
  }
}
