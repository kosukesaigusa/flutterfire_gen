import 'package:source_gen/source_gen.dart';

/// A class to parse a Firestore document path into structured data.
///
/// The class takes a Firestore path as a constructor parameter and parses it
/// into a list of ancestor collection-document pairs and the end
/// collection-document pair.
///
/// The path must follow specific rules:
/// - The path is a string representing a Firestore document path.
/// - It alternates between collection names and document names, ending with a
/// document name.
/// - Document names are always enclosed in {} and end with 'Id'.
/// - The path must have an even number of segments.
///
/// If the input does not adhere to these rules, an exception is thrown.
class FirestoreDocumentPath {
  /// Constructs a [FirestoreDocumentPath] and parses the provided [path].
  ///
  /// Throws [FormatException] if the path does not meet the required format.
  FirestoreDocumentPath(this.path) {
    _parsePath();
  }

  /// The original Firestore document path.
  final String path;

  /// The name of the document.
  late String documentName;

  /// A list of ancestor collection-document pairs.
  late final List<({String collectionName, String documentId})> ancestors;

  /// The end collection-document pair.
  late final ({String collectionName, String documentId}) endPair;

  /// Parses the [path] and populates [ancestors] and [endPair].
  ///
  /// Throws [FormatException] if the path format is invalid.
  void _parsePath() {
    final segments = path.split('/');

    if (segments.length % 2 != 0 || segments.isEmpty) {
      throw InvalidGenerationSourceError(
        'The path must consist of an even number of segments.',
      );
    }

    ancestors = [];
    for (var i = 0; i < segments.length - 2; i += 2) {
      final collectionName = segments[i];
      final documentId = segments[i + 1];

      if (!_isValidDocumentName(documentId)) {
        throw InvalidGenerationSourceError(
          'Document names must be enclosed in {} '
          'and end with Id: $documentId',
        );
      }

      ancestors.add(
        (
          collectionName: collectionName,
          documentId: documentId.substring(1, documentId.length - 1),
        ),
      );
    }

    final endCollectionName = segments[segments.length - 2];
    final endDocumentId = segments.last;
    if (!_isValidDocumentName(endDocumentId)) {
      throw InvalidGenerationSourceError(
        'Document names must be enclosed in {} and end with Id: '
        '$endDocumentId',
      );
    }
    endPair = (
      collectionName: endCollectionName,
      documentId: endDocumentId.substring(1, endDocumentId.length - 1),
    );

    documentName =
        endPair.documentId.substring(0, endPair.documentId.length - 2);
  }

  /// Validates the format of a document name.
  ///
  /// Returns `true` if the document name is valid, otherwise `false`.
  bool _isValidDocumentName(String documentName) {
    return documentName.startsWith('{') && documentName.endsWith('Id}');
  }
}
