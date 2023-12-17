import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';

/// A template for generating Firestore `.withConverter` extension methods.
///
/// This class is used to create the Dart code for `.withConverter` methods,
/// which are essential for converting Firestore data to and from custom Dart
/// objects. These methods are used in the context of Firestore CRUD operations.
class WithConverterTemplate {
  /// Creates a new instance of [WithConverterTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including model class
  /// details.
  /// - [referenceClassType] The type of reference class (read, create, update,
  /// delete).
  const WithConverterTemplate({
    required this.config,
    required this.referenceClassType,
  });

  /// Configurations used for generating `.withConverter` methods.
  final CodeGenerationConfig config;

  /// The type of reference class (read, create, update, delete).
  final ReferenceClassType referenceClassType;

  @override
  String toString() {
    final className =
        config.classNameFromReferenceClassType(referenceClassType);
    switch (referenceClassType) {
      case ReferenceClassType.read:
        return '''
.withConverter<$className>(
  fromFirestore: (ds, _) => $className.fromDocumentSnapshot(ds),
  toFirestore: (_, __) => throw UnimplementedError(),
)
''';
      case ReferenceClassType.create:
      case ReferenceClassType.update:
        return '''
.withConverter<$className>(
  fromFirestore: (_, __) => throw UnimplementedError(),
  toFirestore: (obj, _) => obj.toJson(),
)
''';
      case ReferenceClassType.delete:
        return '''
.withConverter<$className>(
  fromFirestore: (_, __) => throw UnimplementedError(),
  toFirestore: (_, __) => throw UnimplementedError(),
)
''';
    }
  }
}
