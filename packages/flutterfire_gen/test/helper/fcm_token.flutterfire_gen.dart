// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadFcmToken {
  const ReadFcmToken({
    required this.tokenAndDevices,
    required this.createdAt,
    required this.fcmTokenId,
    required this.path,
    required this.fcmTokenReference,
  });

  final List<TokenAndDevice> tokenAndDevices;

  final DateTime? createdAt;

  final String fcmTokenId;

  final String path;

  final DocumentReference<ReadFcmToken> fcmTokenReference;

  factory ReadFcmToken.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadFcmToken(
      tokenAndDevices: _tokenAndDevicesConverter
          .fromJson(extendedJson['tokenAndDevices'] as List<dynamic>?),
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      fcmTokenId: extendedJson['fcmTokenId'] as String,
      path: extendedJson['path'] as String,
      fcmTokenReference:
          extendedJson['fcmTokenReference'] as DocumentReference<ReadFcmToken>,
    );
  }

  factory ReadFcmToken.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadFcmToken.fromJson(<String, dynamic>{
      ...data,
      'fcmTokenId': ds.id,
      'path': ds.reference.path,
      'fcmTokenReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadFcmToken copyWith({
    List<TokenAndDevice>? tokenAndDevices,
    DateTime? createdAt,
    String? fcmTokenId,
    String? path,
    DocumentReference<ReadFcmToken>? fcmTokenReference,
  }) {
    return ReadFcmToken(
      tokenAndDevices: tokenAndDevices ?? this.tokenAndDevices,
      createdAt: createdAt ?? this.createdAt,
      fcmTokenId: fcmTokenId ?? this.fcmTokenId,
      path: path ?? this.path,
      fcmTokenReference: fcmTokenReference ?? this.fcmTokenReference,
    );
  }
}

/// Represents the data structure for creating a new fcmToken document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new fcmToken document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateFcmToken {
  const CreateFcmToken({
    required this.tokenAndDevices,
  });

  final FirestoreData<List<TokenAndDevice>> tokenAndDevices;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'tokenAndDevices':
          _tokenAndDevicesConverter.toJson(tokenAndDevices.actualValue),
      'createdAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a fcmToken document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a fcmToken document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateFcmToken {
  const UpdateFcmToken({
    this.tokenAndDevices,
    this.createdAt,
  });

  final FirestoreData<List<TokenAndDevice>>? tokenAndDevices;

  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (tokenAndDevices != null)
        'tokenAndDevices':
            _tokenAndDevicesConverter.toJson(tokenAndDevices!.actualValue),
      if (createdAt != null)
        'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for deleting a fcmToken document in Cloud Firestore.
class DeleteFcmToken {}

/// Reference to the 'fcmTokens' collection with a converter for [ReadFcmToken].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadFcmToken] objects.
final readFcmTokensCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<ReadFcmToken>(
      fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<ReadFcmToken> readFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    readFcmTokensCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [CreateFcmToken].
/// This enables type-safe create operations in Firestore, converting
/// [CreateFcmToken] objects to Firestore document data.
final createFcmTokensCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<CreateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<CreateFcmToken> createFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    createFcmTokensCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [UpdateFcmToken].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateFcmToken] objects to Firestore document data.
final updateFcmTokensCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<UpdateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<UpdateFcmToken> updateFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    updateFcmTokensCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [DeleteFcmToken].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteFcmTokensCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<DeleteFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<DeleteFcmToken> deleteFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    deleteFcmTokensCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection group with a converter for [ReadFcmToken].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'fcmTokens' collection group
/// into [ReadFcmToken] objects. It facilitates unified handling of 'fcmTokens' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readFcmTokensCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('fcmTokens')
    .withConverter<ReadFcmToken>(
      fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting fcmToken documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteFcmToken {
  const BatchWriteFcmToken();
}

/// Represents a batch operation for creating a fcmToken document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new fcmToken documents. It encapsulates the ID of the new fcmToken document
/// and the data required for creation.
final class BatchCreateFcmToken extends BatchWriteFcmToken {
  const BatchCreateFcmToken({
    required this.fcmTokenId,
    required this.createFcmToken,
  });

  final String fcmTokenId;

  final CreateFcmToken createFcmToken;
}

/// Represents a batch operation for updating an existing fcmToken document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing fcmToken documents. It includes the fcmToken document's ID
/// and the data for the update.
final class BatchUpdateFcmToken extends BatchWriteFcmToken {
  const BatchUpdateFcmToken({
    required this.fcmTokenId,
    required this.updateFcmToken,
  });

  final String fcmTokenId;

  final UpdateFcmToken updateFcmToken;
}

// Represents a batch operation for deleting a fcmToken document in Firestore.
///
/// Used in a batch write to Firestore for deleting a fcmToken document. This class
/// only requires the ID of the fcmToken document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteFcmToken extends BatchWriteFcmToken {
  const BatchDeleteFcmToken({
    required this.fcmTokenId,
  });

  final String fcmTokenId;
}

/// A service class for managing fcmToken documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on fcmToken documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [ReadFcmToken] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [ReadFcmToken] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) fcmToken documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadFcmToken],
/// [CreateFcmToken], [UpdateFcmToken] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to fcmToken documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify fcmToken documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for fcmToken document operations.
class FcmTokenQuery {
  /// Fetches a list of [ReadFcmToken] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'fcmTokens' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadFcmToken documents.
  /// - [asCollectionGroup] Fetch the 'fcmTokens' as a collection group if true.
  ///
  /// Returns a list of [ReadFcmToken] documents.
  Future<List<ReadFcmToken>> fetchDocuments({
    GetOptions? options,
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    int Function(ReadFcmToken lhs, ReadFcmToken rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadFcmToken> query = asCollectionGroup
        ? readFcmTokensCollectionGroupReference
        : readFcmTokensCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(options);
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Subscribes to a stream of [ReadFcmToken] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadFcmToken] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'fcmTokens'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadFcmToken documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'fcmTokens' as a collection group if true.
  Stream<List<ReadFcmToken>> subscribeDocuments({
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    int Function(ReadFcmToken lhs, ReadFcmToken rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<ReadFcmToken> query = asCollectionGroup
        ? readFcmTokensCollectionGroupReference
        : readFcmTokensCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var streamQs =
        query.snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamQs = streamQs.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return streamQs.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// Counts the number of fcmToken documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'fcmTokens' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'fcmTokens' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadFcmToken> query = asCollectionGroup
        ? readFcmTokensCollectionGroupReference
        : readFcmTokensCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.count();
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.count;
  }

  /// Returns the sum of the values of the documents that match the query.
  ///
  /// This method returns the sum of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'fcmTokens'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'fcmTokens' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadFcmToken> query = asCollectionGroup
        ? readFcmTokensCollectionGroupReference
        : readFcmTokensCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(sum(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getSum(field);
  }

  /// Returns the average of the values of the documents that match the query.
  ///
  /// This method returns the average of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'fcmTokens'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'fcmTokens' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadFcmToken> query = asCollectionGroup
        ? readFcmTokensCollectionGroupReference
        : readFcmTokensCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [ReadFcmToken] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [fcmTokenId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadFcmToken?> fetchDocument({
    required String fcmTokenId,
    GetOptions? options,
  }) async {
    final ds = await readFcmTokenDocumentReference(
      fcmTokenId: fcmTokenId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadFcmToken] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadFcmToken] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadFcmToken?> subscribeDocument({
    required String fcmTokenId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readFcmTokenDocumentReference(
      fcmTokenId: fcmTokenId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a fcmToken document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createFcmToken] data.
  Future<DocumentReference<CreateFcmToken>> add({
    required CreateFcmToken createFcmToken,
  }) =>
      createFcmTokensCollectionReference.add(createFcmToken);

  /// Sets a fcmToken document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createFcmToken] data.
  Future<void> set({
    required String fcmTokenId,
    required CreateFcmToken createFcmToken,
    SetOptions? options,
  }) =>
      createFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).set(createFcmToken, options);

  /// Updates a fcmToken document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [fcmTokenId] with the
  /// provided [updateFcmToken] data.
  /// The update is based on the structure defined in `UpdateFcmToken.toJson()`.
  Future<void> update({
    required String fcmTokenId,
    required UpdateFcmToken updateFcmToken,
  }) =>
      updateFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).update(updateFcmToken.toJson());

  /// Deletes a fcmToken document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [fcmTokenId].
  Future<void> delete({
    required String fcmTokenId,
  }) =>
      deleteFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteFcmToken] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteFcmToken] objects, each representing a specific
  /// write operation (create, update, or delete) for FcmToken documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateFcmToken].
  /// - Updating existing documents for tasks of type [BatchUpdateFcmToken].
  /// - Deleting documents for tasks of type [BatchDeleteFcmToken].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteFcmToken> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateFcmToken(
            fcmTokenId: final fcmTokenId,
            createFcmToken: final createFcmToken,
          ):
          batch.set(
            createFcmTokenDocumentReference(
              fcmTokenId: fcmTokenId,
            ),
            createFcmToken,
          );
        case BatchUpdateFcmToken(
            fcmTokenId: final fcmTokenId,
            updateFcmToken: final updateFcmToken,
          ):
          batch.update(
            updateFcmTokenDocumentReference(
              fcmTokenId: fcmTokenId,
            ),
            updateFcmToken.toJson(),
          );
        case BatchDeleteFcmToken(fcmTokenId: final fcmTokenId):
          batch.delete(deleteFcmTokenDocumentReference(
            fcmTokenId: fcmTokenId,
          ));
      }
    }
    return batch.commit();
  }
}
