// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_activity.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadUserActivity {
  const ReadUserActivity({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.activityId,
    required this.path,
    required this.activityReference,
  });

  final String title;

  final DateTime createdAt;

  final DateTime updatedAt;

  final String activityId;

  final String path;

  final DocumentReference<ReadUserActivity> activityReference;

  factory ReadUserActivity.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadUserActivity(
      title: extendedJson['title'] as String,
      createdAt: (extendedJson['createdAt'] as Timestamp).toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp).toDate(),
      activityId: extendedJson['activityId'] as String,
      path: extendedJson['path'] as String,
      activityReference: extendedJson['activityReference']
          as DocumentReference<ReadUserActivity>,
    );
  }

  factory ReadUserActivity.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadUserActivity.fromJson(<String, dynamic>{
      ...data,
      'activityId': ds.id,
      'path': ds.reference.path,
      'activityReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadUserActivity.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadUserActivity copyWith({
    String? title,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? activityId,
    String? path,
    DocumentReference<ReadUserActivity>? activityReference,
  }) {
    return ReadUserActivity(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      activityId: activityId ?? this.activityId,
      path: path ?? this.path,
      activityReference: activityReference ?? this.activityReference,
    );
  }
}

/// Represents the data structure for creating a new activity document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new activity document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateUserActivity {
  const CreateUserActivity({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;

  final DateTime createdAt;

  final DateTime updatedAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'title': title,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a activity document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a activity document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateUserActivity {
  const UpdateUserActivity({
    this.title,
    this.createdAt,
    this.updatedAt,
  });

  final String? title;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (title != null) 'title': title,
      if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
      if (updatedAt != null) 'updatedAt': Timestamp.fromDate(updatedAt!),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for deleting a activity document in Cloud Firestore.
class DeleteUserActivity {}

/// Reference to the 'activities' collection with a converter for [ReadUserActivity].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadUserActivity] objects.
CollectionReference<ReadUserActivity> readActivitiesCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('activities')
        .withConverter<ReadUserActivity>(
          fromFirestore: (ds, _) => ReadUserActivity.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific UserActivity document.
DocumentReference<ReadUserActivity> readActivityDocumentReference({
  required String userId,
  required String activityId,
}) =>
    readActivitiesCollectionReference(
      userId: userId,
    ).doc(activityId);

/// Reference to the 'activities' collection with a converter for [CreateUserActivity].
/// This enables type-safe create operations in Firestore, converting
/// [CreateUserActivity] objects to Firestore document data.
CollectionReference<CreateUserActivity> createActivitiesCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('activities')
        .withConverter<CreateUserActivity>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific UserActivity document.
DocumentReference<CreateUserActivity> createActivityDocumentReference({
  required String userId,
  required String activityId,
}) =>
    createActivitiesCollectionReference(
      userId: userId,
    ).doc(activityId);

/// Reference to the 'activities' collection with a converter for [UpdateUserActivity].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateUserActivity] objects to Firestore document data.
CollectionReference<UpdateUserActivity> updateActivitiesCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('activities')
        .withConverter<UpdateUserActivity>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific UserActivity document.
DocumentReference<UpdateUserActivity> updateActivityDocumentReference({
  required String userId,
  required String activityId,
}) =>
    updateActivitiesCollectionReference(
      userId: userId,
    ).doc(activityId);

/// Reference to the 'activities' collection with a converter for [DeleteUserActivity].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteUserActivity> deleteActivitiesCollectionReference({
  required String userId,
}) =>
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('activities')
        .withConverter<DeleteUserActivity>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific UserActivity document.
DocumentReference<DeleteUserActivity> deleteActivityDocumentReference({
  required String userId,
  required String activityId,
}) =>
    deleteActivitiesCollectionReference(
      userId: userId,
    ).doc(activityId);

/// Reference to the 'activities' collection group with a converter for [ReadUserActivity].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'activities' collection group
/// into [ReadUserActivity] objects. It facilitates unified handling of 'activities' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readActivitiesCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('activities')
    .withConverter<ReadUserActivity>(
      fromFirestore: (ds, _) => ReadUserActivity.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting activity documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteActivity {
  const BatchWriteActivity();
}

/// Represents a batch operation for creating a activity document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new activity documents. It encapsulates the ID of the new activity document
/// and the data required for creation.
final class BatchCreateActivity extends BatchWriteActivity {
  const BatchCreateActivity({
    required this.userId,
    required this.activityId,
    required this.createActivity,
  });

  final String userId;

  final String activityId;

  final CreateUserActivity createActivity;
}

/// Represents a batch operation for updating an existing activity document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing activity documents. It includes the activity document's ID
/// and the data for the update.
final class BatchUpdateActivity extends BatchWriteActivity {
  const BatchUpdateActivity({
    required this.userId,
    required this.activityId,
    required this.updateActivity,
  });

  final String userId;

  final String activityId;

  final UpdateUserActivity updateActivity;
}

// Represents a batch operation for deleting a activity document in Firestore.
///
/// Used in a batch write to Firestore for deleting a activity document. This class
/// only requires the ID of the activity document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteActivity extends BatchWriteActivity {
  const BatchDeleteActivity({
    required this.userId,
    required this.activityId,
  });

  final String userId;

  final String activityId;
}

/// A service class for managing activity documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on activity documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [ReadUserActivity] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [ReadUserActivity] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) activity documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadUserActivity],
/// [CreateUserActivity], [UpdateUserActivity] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to activity documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify activity documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for activity document operations.
class UserActivityQuery {
  /// Fetches a list of [ReadUserActivity] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'activities' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadUserActivity documents.
  /// - [asCollectionGroup] Fetch the 'activities' as a collection group if true.
  ///
  /// Returns a list of [ReadUserActivity] documents.
  Future<List<ReadUserActivity>> fetchDocuments({
    required String userId,
    GetOptions? options,
    Query<ReadUserActivity>? Function(Query<ReadUserActivity> query)?
        queryBuilder,
    int Function(ReadUserActivity lhs, ReadUserActivity rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserActivity> query = asCollectionGroup
        ? readActivitiesCollectionGroupReference
        : readActivitiesCollectionReference(
            userId: userId,
          );
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

  /// Subscribes to a stream of [ReadUserActivity] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadUserActivity] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'activities'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadUserActivity documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'activities' as a collection group if true.
  Stream<List<ReadUserActivity>> subscribeDocuments({
    required String userId,
    Query<ReadUserActivity>? Function(Query<ReadUserActivity> query)?
        queryBuilder,
    int Function(ReadUserActivity lhs, ReadUserActivity rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<ReadUserActivity> query = asCollectionGroup
        ? readActivitiesCollectionGroupReference
        : readActivitiesCollectionReference(
            userId: userId,
          );
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

  /// Counts the number of activity documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'activities' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'activities' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    required String userId,
    Query<ReadUserActivity>? Function(Query<ReadUserActivity> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserActivity> query = asCollectionGroup
        ? readActivitiesCollectionGroupReference
        : readActivitiesCollectionReference(
            userId: userId,
          );
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
  /// The [asCollectionGroup] parameter determines whether to query the 'activities'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'activities' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    required String userId,
    Query<ReadUserActivity>? Function(Query<ReadUserActivity> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserActivity> query = asCollectionGroup
        ? readActivitiesCollectionGroupReference
        : readActivitiesCollectionReference(
            userId: userId,
          );
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
  /// The [asCollectionGroup] parameter determines whether to query the 'activities'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'activities' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    required String userId,
    Query<ReadUserActivity>? Function(Query<ReadUserActivity> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadUserActivity> query = asCollectionGroup
        ? readActivitiesCollectionGroupReference
        : readActivitiesCollectionReference(
            userId: userId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [ReadUserActivity] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [activityId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadUserActivity?> fetchDocument({
    required String userId,
    required String activityId,
    GetOptions? options,
  }) async {
    final ds = await readActivityDocumentReference(
      userId: userId,
      activityId: activityId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadUserActivity] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadUserActivity] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadUserActivity?> subscribeDocument({
    required String userId,
    required String activityId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readActivityDocumentReference(
      userId: userId,
      activityId: activityId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a activity document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createUserActivity] data.
  Future<DocumentReference<CreateUserActivity>> add({
    required String userId,
    required CreateUserActivity createActivity,
  }) =>
      createActivitiesCollectionReference(
        userId: userId,
      ).add(createActivity);

  /// Sets a activity document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createUserActivity] data.
  Future<void> set({
    required String userId,
    required String activityId,
    required CreateUserActivity createActivity,
    SetOptions? options,
  }) =>
      createActivityDocumentReference(
        userId: userId,
        activityId: activityId,
      ).set(createActivity, options);

  /// Updates a activity document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [activityId] with the
  /// provided [updateUserActivity] data.
  /// The update is based on the structure defined in `UpdateUserActivity.toJson()`.
  Future<void> update({
    required String userId,
    required String activityId,
    required UpdateUserActivity updateActivity,
  }) =>
      updateActivityDocumentReference(
        userId: userId,
        activityId: activityId,
      ).update(updateActivity.toJson());

  /// Deletes a activity document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [activityId].
  Future<void> delete({
    required String userId,
    required String activityId,
  }) =>
      deleteActivityDocumentReference(
        userId: userId,
        activityId: activityId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteActivity] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteActivity] objects, each representing a specific
  /// write operation (create, update, or delete) for Activity documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateActivity].
  /// - Updating existing documents for tasks of type [BatchUpdateActivity].
  /// - Deleting documents for tasks of type [BatchDeleteActivity].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteActivity> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateActivity(
            userId: final userId,
            activityId: final activityId,
            createActivity: final createActivity,
          ):
          batch.set(
            createActivityDocumentReference(
              userId: userId,
              activityId: activityId,
            ),
            createActivity,
          );
        case BatchUpdateActivity(
            userId: final userId,
            activityId: final activityId,
            updateActivity: final updateActivity,
          ):
          batch.update(
            updateActivityDocumentReference(
              userId: userId,
              activityId: activityId,
            ),
            updateActivity.toJson(),
          );
        case BatchDeleteActivity(
            userId: final userId,
            activityId: final activityId
          ):
          batch.delete(deleteActivityDocumentReference(
            userId: userId,
            activityId: activityId,
          ));
      }
    }
    return batch.commit();
  }
}
