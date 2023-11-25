import '../utils/string.dart';
import 'field_config.dart';

/// A class to represent the configuration for a Firestore document.
class CodeGenerationConfig {
  /// Creates a Firestore document configuration.
  CodeGenerationConfig({
    required this.includePathField,
    required this.includeDocumentReferenceField,
    required this.generateCopyWith,
    required this.path,
    required this.baseClassName,
    required this.documentName,
    required this.fieldConfigs,
  }) : firestorePathSegments = parseFirestorePath(path);

  /// Whether to include a path field in the document class.
  final bool includePathField;

  /// Whether to include a document reference field in the document class.
  final bool includeDocumentReferenceField;

  /// Whether to generate a copyWith method for the document class.
  final bool generateCopyWith;

  /// The Firestore path for the document.
  final String path;

  /// The Firestore path segments for the document.
  final List<FirestorePathSegment> firestorePathSegments;

  /// The base class name for the document.
  final String baseClassName;

  /// The name of collection of the document.
  String get collectionName => firestorePathSegments.last.collectionName;

  /// The name of the document.
  final String documentName;

  /// All fields configurations of the generation target class.
  final List<FieldConfig> fieldConfigs;

  /// The capitalized collection name of the document.
  String get capitalizedCollectionName => collectionName.capitalize();

  /// The capitalized document name of the document.
  String get capitalizedDocumentName => documentName.capitalize();

  /// The name of the document class for reading.
  String get readClassName => 'Read$baseClassName';

  /// The name of the document class for creating.
  String get createClassName => 'Create$baseClassName';

  /// The name of the document class for updating.
  String get updateClassName => 'Update$baseClassName';

  /// The name of the document class for deleting.
  String get deleteClassName => 'Delete$baseClassName';

  /// The name of the instance variable for the document class for creating.
  String get createClassInstanceName => 'create$baseClassName';

  /// The name of the instance variable for the document class for updating.
  String get updateClassInstanceName => 'update$baseClassName';

  /// The name of the instance variable for the document class for deleting.
  String get deleteClassInstanceName => 'delete$baseClassName';

  /// The document ID field name.
  String get documentIdFieldName => '${documentName}Id';

  /// The document reference field name.
  String get documentReferenceFieldName => '${documentName}Reference';

  ///
  String get readDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.read);

  ///
  String get createDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.create);

  ///
  String get updateDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.update);

  ///
  String get deleteDocumentReferenceName =>
      documentReferenceName(ReferenceClassType.delete);

  ///
  String documentReferenceName(
    ReferenceClassType referenceClassType,
  ) =>
      '${referenceClassType.name}${baseClassName}DocumentReference';

  /// The document reference name of the document for creating.
  String collectionReferenceName(
    ReferenceClassType referenceClassType,
  ) =>
      '${referenceClassType.name}${baseClassName}CollectionReference';

  /// The document reference type name of the document for reading.
  String get readDocumentReferenceTypeName =>
      documentReferenceTypeName(ReferenceClassType.read);

  ///
  String documentReferenceTypeName(ReferenceClassType referenceClassType) =>
      'DocumentReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  ///
  String collectionReferenceTypeName(ReferenceClassType referenceClassType) =>
      'CollectionReference'
      '<${classNameFromReferenceClassType(referenceClassType)}>';

  ///
  String classNameFromReferenceClassType(
    ReferenceClassType referenceClassType,
  ) {
    switch (referenceClassType) {
      case ReferenceClassType.read:
        return readClassName;
      case ReferenceClassType.create:
        return createClassName;
      case ReferenceClassType.update:
        return updateClassName;
      case ReferenceClassType.delete:
        return deleteClassName;
    }
  }
}

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

  /// The name of the reference class type.
  String toIng() {
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

/// A class to represent a segment of a Firestore path.
///
/// Each segment in a Firestore path is composed of a collection name
/// and potentially a document name, with the path segments alternating
/// between collections and documents. For example, in the path
/// 'appUsers/{appUserId}/appUserPosts/{appUserPostId}/appUserPostLikes',
/// 'appUsers', 'appUserPosts', and 'appUserPostLikes' are collection names
/// and '{appUserId}' and '{appUserPostId}' are document names.
class FirestorePathSegment {
  /// Creates a Firestore path segment.
  ///
  /// [collectionName] and [documentName] represent the names of
  /// the collection and document respectively in a segment of a Firestore path.
  /// [collectionName] is required, while [documentName] is optional since
  /// a Firestore path can end with a collection.
  ///
  /// For example, in the path 'appUsers/{appUserId}/appUserPosts',
  /// 'appUsers' is a collection name and '{appUserId}' is a document name,
  /// while 'appUserPosts' is another collection name without a following
  /// document name.
  const FirestorePathSegment({
    required this.collectionName,
    required this.documentName,
  });

  /// The name of the collection in this segment of a Firestore path.
  final String collectionName;

  /// The name of the document in this segment of a Firestore path, if one
  /// exists.
  final String? documentName;
}

/// Parses a Firestore path into a list of Firestore path segments.
///
/// This function accepts a Firestore path as a string, and returns a list of
/// [FirestorePathSegment] objects. Each segment in the Firestore path is
/// composed of a collection name and potentially a document name, with the path
/// segments alternating between collections and documents.
///
/// For example, given the path 'appUsers/{appUserId}/appUserPosts/{appUserPostId}/appUserPostLikes',
/// this function will return a list containing three [FirestorePathSegment]
/// objects:
/// 1. FirestorePathSegment with collectionName 'appUsers' and documentName
/// '{appUserId}'
/// 2. FirestorePathSegment with collectionName 'appUserPosts' and documentName
/// '{appUserPostId}'
/// 3. FirestorePathSegment with collectionName 'appUserPostLikes' and no
/// documentName
///
/// Throws an [ArgumentError] if the provided path does not adhere to the
/// alternating collection/document structure or if the path includes an
/// additional segment that doesn't start with '/' and doesn't have a following
/// collection name.
///
/// @param path The Firestore path string to parse.
/// @returns A list of [FirestorePathSegment] objects representing the parsed
/// path.
List<FirestorePathSegment> parseFirestorePath(String path) {
  final pattern = RegExp(r'(\w+)(\/\{(\w+)\})?');
  final matches = pattern.allMatches(path);

  final firestorePath = matches.map((match) {
    final collectionName = match.group(1)!;
    final documentName = match.group(3);
    return FirestorePathSegment(
      collectionName: collectionName,
      documentName: documentName,
    );
  }).toList();
  return firestorePath;
}
