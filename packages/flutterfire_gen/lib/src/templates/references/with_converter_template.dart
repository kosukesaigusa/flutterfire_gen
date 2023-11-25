import '../../configs/code_generation_config.dart';

///
class WithConverterTemplate {
  ///
  const WithConverterTemplate({
    required this.config,
    required this.referenceClassType,
  });

  ///
  final CodeGenerationConfig config;

  ///
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
