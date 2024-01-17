// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class Counter {
  const Counter({
    required this.value,
    required this.createdAt,
    required this.updatedAt,
    required this.counterId,
    required this.path,
    required this.counterReference,
  });

  final int value;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String counterId;

  final String path;

  final DocumentReference<Counter> counterReference;

  factory Counter.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return Counter(
      value: extendedJson['value'] as int,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      counterId: extendedJson['counterId'] as String,
      path: extendedJson['path'] as String,
      counterReference:
          extendedJson['counterReference'] as DocumentReference<Counter>,
    );
  }

  factory Counter.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Counter.fromJson(<String, dynamic>{
      ...data,
      'counterId': ds.id,
      'path': ds.reference.path,
      'counterReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => Counter.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  Counter copyWith({
    int? value,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? counterId,
    String? path,
    DocumentReference<Counter>? counterReference,
  }) {
    return Counter(
      value: value ?? this.value,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      counterId: counterId ?? this.counterId,
      path: path ?? this.path,
      counterReference: counterReference ?? this.counterReference,
    );
  }
}

/// Represents the data structure for creating a new counter document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new counter document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateCounterData {
  const CreateCounterData({
    required this.value,
  });

  final FirestoreData<int> value;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'value': value.value,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a counter document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a counter document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateCounterData {
  const UpdateCounterData({
    this.value,
    this.createdAt,
  });

  final FirestoreData<int>? value;

  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (value != null) 'value': value!.value,
      if (createdAt != null)
        'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),
      'updatedAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for deleting a counter document in Cloud Firestore.
class DeleteCounter {}

/// Reference to the 'counters' collection with a converter for [Counter].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [Counter] objects.
final readCountersCollectionReference =
    FirebaseFirestore.instance.collection('counters').withConverter<Counter>(
          fromFirestore: (ds, _) => Counter.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Counter document.
DocumentReference<Counter> readCounterDocumentReference({
  required String counterId,
}) =>
    readCountersCollectionReference.doc(counterId);

/// Reference to the 'counters' collection with a converter for [CreateCounterData].
/// This enables type-safe create operations in Firestore, converting
/// [CreateCounterData] objects to Firestore document data.
final createCountersCollectionReference = FirebaseFirestore.instance
    .collection('counters')
    .withConverter<CreateCounterData>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Counter document.
DocumentReference<CreateCounterData> createCounterDocumentReference({
  required String counterId,
}) =>
    createCountersCollectionReference.doc(counterId);

/// Reference to the 'counters' collection with a converter for [UpdateCounterData].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateCounterData] objects to Firestore document data.
final updateCountersCollectionReference = FirebaseFirestore.instance
    .collection('counters')
    .withConverter<UpdateCounterData>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Counter document.
DocumentReference<UpdateCounterData> updateCounterDocumentReference({
  required String counterId,
}) =>
    updateCountersCollectionReference.doc(counterId);

/// Reference to the 'counters' collection with a converter for [DeleteCounter].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteCountersCollectionReference = FirebaseFirestore.instance
    .collection('counters')
    .withConverter<DeleteCounter>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific Counter document.
DocumentReference<DeleteCounter> deleteCounterDocumentReference({
  required String counterId,
}) =>
    deleteCountersCollectionReference.doc(counterId);

/// Reference to the 'counters' collection group with a converter for [Counter].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'counters' collection group
/// into [Counter] objects. It facilitates unified handling of 'counters' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readCountersCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('counters')
    .withConverter<Counter>(
      fromFirestore: (ds, _) => Counter.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting counter documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteCounter {
  const BatchWriteCounter();
}

/// Represents a batch operation for creating a counter document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new counter documents. It encapsulates the ID of the new counter document
/// and the data required for creation.
final class BatchCreateCounter extends BatchWriteCounter {
  const BatchCreateCounter({
    required this.counterId,
    required this.createCounterData,
  });

  final String counterId;

  final CreateCounterData createCounterData;
}

/// Represents a batch operation for updating an existing counter document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing counter documents. It includes the counter document's ID
/// and the data for the update.
final class BatchUpdateCounter extends BatchWriteCounter {
  const BatchUpdateCounter({
    required this.counterId,
    required this.updateCounterData,
  });

  final String counterId;

  final UpdateCounterData updateCounterData;
}

// Represents a batch operation for deleting a counter document in Firestore.
///
/// Used in a batch write to Firestore for deleting a counter document. This class
/// only requires the ID of the counter document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteCounter extends BatchWriteCounter {
  const BatchDeleteCounter({
    required this.counterId,
  });

  final String counterId;
}

/// A service class for managing counter documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on counter documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [Counter] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [Counter] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) counter documents.
///
/// The class uses Firebase Firestore as the backend, assuming [Counter],
/// [CreateCounterData], [UpdateCounterData] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to counter documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify counter documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for counter document operations.
class CounterQuery {
  /// Fetches a list of [Counter] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'counters' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the Counter documents.
  /// - [asCollectionGroup] Fetch the 'counters' as a collection group if true.
  ///
  /// Returns a list of [Counter] documents.
  Future<List<Counter>> fetchDocuments({
    GetOptions? options,
    Query<Counter>? Function(Query<Counter> query)? queryBuilder,
    int Function(Counter lhs, Counter rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<Counter> query = asCollectionGroup
        ? readCountersCollectionGroupReference
        : readCountersCollectionReference;
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

  /// Subscribes to a stream of [Counter] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [Counter] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'counters'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the Counter documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'counters' as a collection group if true.
  Stream<List<Counter>> subscribeDocuments({
    Query<Counter>? Function(Query<Counter> query)? queryBuilder,
    int Function(Counter lhs, Counter rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<Counter> query = asCollectionGroup
        ? readCountersCollectionGroupReference
        : readCountersCollectionReference;
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

  /// Counts the number of counter documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'counters' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'counters' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    Query<Counter>? Function(Query<Counter> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<Counter> query = asCollectionGroup
        ? readCountersCollectionGroupReference
        : readCountersCollectionReference;
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
  /// The [asCollectionGroup] parameter determines whether to query the 'counters'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'counters' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    Query<Counter>? Function(Query<Counter> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<Counter> query = asCollectionGroup
        ? readCountersCollectionGroupReference
        : readCountersCollectionReference;
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
  /// The [asCollectionGroup] parameter determines whether to query the 'counters'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'counters' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    Query<Counter>? Function(Query<Counter> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<Counter> query = asCollectionGroup
        ? readCountersCollectionGroupReference
        : readCountersCollectionReference;
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [Counter] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [counterId].
  /// You can control the data retrieval with [GetOptions].
  Future<Counter?> fetchDocument({
    required String counterId,
    GetOptions? options,
  }) async {
    final ds = await readCounterDocumentReference(
      counterId: counterId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [Counter] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [Counter] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<Counter?> subscribeDocument({
    required String counterId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readCounterDocumentReference(
      counterId: counterId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a counter document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createCounter] data.
  Future<DocumentReference<CreateCounterData>> add({
    required CreateCounterData createCounterData,
  }) =>
      createCountersCollectionReference.add(createCounterData);

  /// Sets a counter document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createCounter] data.
  Future<void> set({
    required String counterId,
    required CreateCounterData createCounterData,
    SetOptions? options,
  }) =>
      createCounterDocumentReference(
        counterId: counterId,
      ).set(createCounterData, options);

  /// Updates a counter document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [counterId] with the
  /// provided [updateCounter] data.
  /// The update is based on the structure defined in `UpdateCounterData.toJson()`.
  Future<void> update({
    required String counterId,
    required UpdateCounterData updateCounterData,
  }) =>
      updateCounterDocumentReference(
        counterId: counterId,
      ).update(updateCounterData.toJson());

  /// Deletes a counter document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [counterId].
  Future<void> delete({
    required String counterId,
  }) =>
      deleteCounterDocumentReference(
        counterId: counterId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteCounter] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteCounter] objects, each representing a specific
  /// write operation (create, update, or delete) for Counter documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateCounter].
  /// - Updating existing documents for tasks of type [BatchUpdateCounter].
  /// - Deleting documents for tasks of type [BatchDeleteCounter].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteCounter> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateCounter(
            counterId: final counterId,
            createCounterData: final createCounterData,
          ):
          batch.set(
            createCounterDocumentReference(
              counterId: counterId,
            ),
            createCounterData,
          );
        case BatchUpdateCounter(
            counterId: final counterId,
            updateCounterData: final updateCounterData,
          ):
          batch.update(
            updateCounterDocumentReference(
              counterId: counterId,
            ),
            updateCounterData.toJson(),
          );
        case BatchDeleteCounter(counterId: final counterId):
          batch.delete(deleteCounterDocumentReference(
            counterId: counterId,
          ));
      }
    }
    return batch.commit();
  }
}
