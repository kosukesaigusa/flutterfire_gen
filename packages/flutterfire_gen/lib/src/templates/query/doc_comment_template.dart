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
/// Adds a ${config.documentName} document to Cloud Firestore.
/// 
/// This method creates a new document in Cloud Firestore using the provided
/// [create${config.baseClassName}] data.
''';
  }

  /// Returns the doc comment for the set method.
  String forSetMethod() {
    return '''
/// Sets a ${config.documentName} document to Cloud Firestore.
/// 
/// This method creates a new document in Cloud Firestore using the provided
/// [create${config.baseClassName}] data.
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
/// Deletes a ${config.documentName} document from Cloud Firestore.
/// 
/// This method deletes an existing document identified by [${config.documentId}].
''';
  }

  /// Returns the doc comment for the batch write sealed class.
  String forBatchWriteSealedClass() {
    return '''
/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting ${config.documentName} documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
''';
  }

  /// Returns the doc comment for the batch write create class.
  String forBatchWriteCreateClass() {
    return '''
/// Represents a batch operation for creating a ${config.documentName} document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new ${config.documentName} documents. It encapsulates the ID of the new ${config.documentName} document
/// and the data required for creation.
''';
  }

  /// Returns the doc comment for the batch write update class.
  String forBatchWriteUpdateClass() {
    return '''
/// Represents a batch operation for updating an existing ${config.documentName} document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing ${config.documentName} documents. It includes the ${config.documentName} document's ID
/// and the data for the update.
''';
  }

  /// Returns the doc comment for the batch write delete class.
  String forBatchWriteDeleteClass() {
    return '''
// Represents a batch operation for deleting a ${config.documentName} document in Firestore.
///
/// Used in a batch write to Firestore for deleting a ${config.documentName} document. This class
/// only requires the ID of the ${config.documentName} document to be deleted, as no additional
/// data is needed for deletion.
''';
  }

  /// Returns the doc comment for the batch write method.
  String forBatchWriteMethod() {
    return '''
/// Performs a batch write operation in Firestore using a list of [BatchWrite${config.capitalizedDocumentName}] tasks.
///
/// This function allows for executing multiple Firestore write operations (create, update, delete)
/// as a single batch. This ensures that all operations either complete successfully or fail
/// without applying any changes, providing atomicity.
///
/// Parameters:
///   - [batchWriteTasks] A list of [BatchWrite${config.capitalizedDocumentName}] objects, each representing a specific
///     write operation (create, update, or delete) for ${config.capitalizedDocumentName} documents.
///
/// The function iterates over each task in [batchWriteTasks] and performs the corresponding
/// Firestore operation. This includes:
///   - Creating new documents for tasks of type [BatchCreate${config.capitalizedDocumentName}].
///   - Updating existing documents for tasks of type [BatchUpdate${config.capitalizedDocumentName}].
///   - Deleting documents for tasks of type [BatchDelete${config.capitalizedDocumentName}].
///
/// Returns a `Future<void>` that completes when the batch operation is committed successfully.
///
/// Throws:
///   - Firestore exceptions if the batch commit fails or if there are issues with the individual
///     operations within the batch.
''';
  }
}
