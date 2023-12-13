import '../../configs/code_generation_config.dart';

///
class QueryClassDocCommentTemplate {
  ///
  const QueryClassDocCommentTemplate(this.config);

  ///
  final CodeGenerationConfig config;

  /// Returns the doc comment for the query class.
  String forClass() {
    return '''
/// A service class for managing ${config.documentName} documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on ${config.documentName} documents.
///
/// It includes methods to fetch and subscribe to single or multiple [${config.readClassName}]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [${config.readClassName}],
/// [${config.createClassName}], [${config.updateClassName}] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more ${config.documentName} documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify ${config.documentName} documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for ${config.documentName} document operations.
''';
  }

  /// Returns the doc comment for the fetchDocuments method.
  String forFetchDocumentsMethod() {
    return '''
/// Fetches a list of [${config.readClassName}] documents from Cloud Firestore.
/// 
/// This method retrieves documents based on the provided query and sorts them
/// if a [compare] function is given.
/// You can customize the query by using the [queryBuilder] and control the
''';
  }

  /// Returns the doc comment for the subscribeDocuments method.
  String forSubscribeDocumentsMethod() {
    return '''
/// Subscribes to a stream of [${config.readClassName}] documents from Cloud Firestore.
/// 
/// This method returns a stream of [${config.readClassName}] documents, which updates in
/// real-time based on the database changes. You can customize the query using
/// [queryBuilder]. The documents can be sorted using the [compare] function.
''';
  }

  /// Returns the doc comment for the fetchDocument method.
  String forFetchDocumentMethod() {
    return '''
/// Fetches a single [${config.readClassName}] document from Cloud Firestore by its ID.
///
/// This method retrieves a specific document using the provided [${config.documentId}].
/// You can control the data retrieval with [GetOptions].
''';
  }

  /// Returns the doc comment for the subscribeDocument method.
  String forSubscribeDocumentMethod() {
    return '''
/// Subscribes to a stream of a single [${config.readClassName}] document from Cloud Firestore by its ID.
/// 
/// This method returns a stream of a single [${config.readClassName}] document, which updates in
/// real-time based on the database changes. You can control the data retrieval with [GetOptions].
''';
  }

  /// Returns the doc comment for the add method.
  String forAddMethod() {
    return '''
/// Adds a [${config.documentName}] document to Cloud Firestore.
/// 
/// This method creates a new document in Cloud Firestore using the provided
/// [create${config.baseClassName}] data.
''';
  }

  /// Returns the doc comment for the set method.
  String forSetMethod() {
    return '''
/// Sets a [${config.documentName}] document to Cloud Firestore.
/// 
/// This method creates a new document in Cloud Firestore using the provided
/// [update${config.baseClassName}] data.
''';
  }

  /// Returns the doc comment for the update method.
  String forUpdateMethod() {
    return '''
  /// Updates a ${config.documentName} document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [${config.documentId}] with the
  /// provided [update${config.baseClassName}] data.
  /// The update is based on the structure defined in `${config.updateClassName}.toJson()`.
''';
  }

  /// Returns the doc comment for the delete method.
  String forDeleteMethod() {
    return '''
/// Deletes a [${config.documentName}] document from Cloud Firestore.
/// 
/// This method deletes an existing document identified by [${config.documentId}].
''';
  }
}
