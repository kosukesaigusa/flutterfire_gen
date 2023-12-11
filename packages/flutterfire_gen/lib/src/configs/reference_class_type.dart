/// An enum to represent the type of a reference class.
enum ReferenceClassType {
  /// A reference class for reading.
  read,

  /// A reference class for creating.
  create,

  /// A reference class for updating.
  update,

  /// A reference class for deleting.
  delete,
  ;

  @override
  String toString() {
    switch (this) {
      case ReferenceClassType.read:
        return 'reading';
      case ReferenceClassType.create:
        return 'creating';
      case ReferenceClassType.update:
        return 'updating';
      case ReferenceClassType.delete:
        return 'deleting';
    }
  }
}
