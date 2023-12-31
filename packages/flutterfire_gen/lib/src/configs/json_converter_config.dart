/// A configuration for a json converter.
class JsonConverterConfig {
  /// Creates a new [JsonConverterConfig] instance.
  const JsonConverterConfig({
    required this.jsonConverterString,
    required this.clientTypeString,
    required this.firestoreTypeString,
  });

  /// The name string of the json converter.
  final String jsonConverterString;

  /// The client type string of the json converter.
  final String clientTypeString;

  /// The Cloud Firestore type string of the json converter.
  final String firestoreTypeString;
}
