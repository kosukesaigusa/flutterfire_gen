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
    final buffer = StringBuffer();
    for (final config in configs) {
      if (config.isOptional) {
        buffer.writeln('this.${config.name},');
      } else {
        buffer.writeln('required this.${config.name},');
      }
    }
    return 'const $className({$buffer});';
  }
}
