///
class ConstructorFieldConfig {
  ///
  ConstructorFieldConfig({
    required this.name,
    required this.isOptional,
  });

  ///
  final String name;

  ///
  final bool isOptional;
}

/// A template for a constructor.
class ConstructorTemplate {
  /// The name of the constructor.
  ConstructorTemplate({required this.className, required this.configs});

  /// The name of the class.
  final String className;

  ///
  final List<ConstructorFieldConfig> configs;

  @override
  String toString() {
    if (configs.isEmpty) {
      return 'const $className();';
    }
    final fields = configs.map((config) {
      if (config.isOptional) {
        return 'this.${config.name}';
      } else {
        return 'required this.${config.name}';
      }
    }).join(',\n');
    return '''
const $className({
    $fields,
});
  ''';
  }
}
