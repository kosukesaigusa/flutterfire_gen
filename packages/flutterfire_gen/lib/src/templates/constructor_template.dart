/// Represents a single field's configuration for a class constructor.
///
/// This class is used to define the configuration of a field within a
/// constructor, including its name and whether it is optional.
class ConstructorFieldConfig {
  /// Creates a new instance of [ConstructorFieldConfig].
  ///
  /// Parameters:
  ///
  /// - [name] The name of the field.
  /// - [isOptional] Indicates whether the field is optional in the constructor.
  ConstructorFieldConfig({
    required this.name,
    required this.isOptional,
  });

  /// The name of the field.
  final String name;

  /// Indicates whether the field is optional in the constructor.
  final bool isOptional;
}

/// A template for generating constructors for Firestore document classes.
///
/// This template is used to create constructors for classes representing
/// Firestore documents. It handles the inclusion of required and optional
/// fields based on their configurations.
class ConstructorTemplate {
  /// Creates a new instance of [ConstructorTemplate].
  ///
  /// Parameters:
  ///
  /// - [className] The name of the class for which the constructor is being
  /// generated.
  /// - [configs] Configurations for the fields in the constructor.
  ConstructorTemplate({required this.className, required this.configs});

  /// The name of the class for which the constructor is being generated.
  final String className;

  /// Configurations for the fields included in the constructor.
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
