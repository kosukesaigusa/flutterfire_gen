// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_post_like.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadAppUserPostLike {
  const ReadAppUserPostLike({
    required this.likedByAppUserId,
    required this.likedAt,
    required this.updatedAt,
    required this.appUserPostLikeId,
    required this.path,
    required this.appUserPostLikeReference,
  });

  final String likedByAppUserId;

  final DateTime? likedAt;

  final DateTime? updatedAt;

  final String appUserPostLikeId;

  final String path;

  final DocumentReference<ReadAppUserPostLike> appUserPostLikeReference;

  factory ReadAppUserPostLike.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadAppUserPostLike(
      likedByAppUserId: extendedJson['likedByAppUserId'] as String,
      likedAt: (extendedJson['likedAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      appUserPostLikeId: extendedJson['appUserPostLikeId'] as String,
      path: extendedJson['path'] as String,
      appUserPostLikeReference: extendedJson['appUserPostLikeReference']
          as DocumentReference<ReadAppUserPostLike>,
    );
  }

  factory ReadAppUserPostLike.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadAppUserPostLike.fromJson(<String, dynamic>{
      ...data,
      'appUserPostLikeId': ds.id,
      'path': ds.reference.path,
      'appUserPostLikeReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) =>
                ReadAppUserPostLike.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadAppUserPostLike copyWith({
    String? likedByAppUserId,
    DateTime? likedAt,
    DateTime? updatedAt,
    String? appUserPostLikeId,
    String? path,
    DocumentReference<ReadAppUserPostLike>? appUserPostLikeReference,
  }) {
    return ReadAppUserPostLike(
      likedByAppUserId: likedByAppUserId ?? this.likedByAppUserId,
      likedAt: likedAt ?? this.likedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      appUserPostLikeId: appUserPostLikeId ?? this.appUserPostLikeId,
      path: path ?? this.path,
      appUserPostLikeReference:
          appUserPostLikeReference ?? this.appUserPostLikeReference,
    );
  }
}

/// Represents the data structure for creating a new appUserPostLike document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new appUserPostLike document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateAppUserPostLike {
  const CreateAppUserPostLike({
    required this.likedByAppUserId,
  });

  final String likedByAppUserId;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'likedByAppUserId': likedByAppUserId,
      'likedAt': FieldValue.serverTimestamp(),
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

/// Represents the data structure for updating a appUserPostLike document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a appUserPostLike document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateAppUserPostLike {
  const UpdateAppUserPostLike({
    this.likedByAppUserId,
    this.likedAt,
  });

  final String? likedByAppUserId;

  final DateTime? likedAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (likedByAppUserId != null) 'likedByAppUserId': likedByAppUserId,
      if (likedAt != null)
        'likedAt': likedAt == null ? null : Timestamp.fromDate(likedAt!),
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

/// Represents the data structure for deleting a appUserPostLike document in Cloud Firestore.
class DeleteAppUserPostLike {}

/// Reference to the 'appUserPostLikes' collection with a converter for [ReadAppUserPostLike].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadAppUserPostLike] objects.
CollectionReference<ReadAppUserPostLike>
    readAppUserPostLikeCollectionReference({
  required String appUserId,
  required String appUserPostId,
}) =>
        FirebaseFirestore.instance
            .collection('appUsers')
            .doc(appUserId)
            .collection('appUserPosts')
            .doc(appUserPostId)
            .collection('appUserPostLikes')
            .withConverter<ReadAppUserPostLike>(
              fromFirestore: (ds, _) =>
                  ReadAppUserPostLike.fromDocumentSnapshot(ds),
              toFirestore: (_, __) => throw UnimplementedError(),
            );

/// Creates a [DocumentReference] for a specific AppUserPostLike document.
DocumentReference<ReadAppUserPostLike> readAppUserPostLikeDocumentReference({
  required String appUserId,
  required String appUserPostId,
  required String appUserPostLikeId,
}) =>
    readAppUserPostLikeCollectionReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
    ).doc(appUserPostLikeId);

/// Reference to the 'appUserPostLikes' collection with a converter for [CreateAppUserPostLike].
/// This enables type-safe create operations in Firestore, converting
/// [CreateAppUserPostLike] objects to Firestore document data.
CollectionReference<CreateAppUserPostLike>
    createAppUserPostLikeCollectionReference({
  required String appUserId,
  required String appUserPostId,
}) =>
        FirebaseFirestore.instance
            .collection('appUsers')
            .doc(appUserId)
            .collection('appUserPosts')
            .doc(appUserPostId)
            .collection('appUserPostLikes')
            .withConverter<CreateAppUserPostLike>(
              fromFirestore: (_, __) => throw UnimplementedError(),
              toFirestore: (obj, _) => obj.toJson(),
            );

/// Creates a [DocumentReference] for a specific AppUserPostLike document.
DocumentReference<CreateAppUserPostLike>
    createAppUserPostLikeDocumentReference({
  required String appUserId,
  required String appUserPostId,
  required String appUserPostLikeId,
}) =>
        createAppUserPostLikeCollectionReference(
          appUserId: appUserId,
          appUserPostId: appUserPostId,
        ).doc(appUserPostLikeId);

/// Reference to the 'appUserPostLikes' collection with a converter for [UpdateAppUserPostLike].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateAppUserPostLike] objects to Firestore document data.
CollectionReference<UpdateAppUserPostLike>
    updateAppUserPostLikeCollectionReference({
  required String appUserId,
  required String appUserPostId,
}) =>
        FirebaseFirestore.instance
            .collection('appUsers')
            .doc(appUserId)
            .collection('appUserPosts')
            .doc(appUserPostId)
            .collection('appUserPostLikes')
            .withConverter<UpdateAppUserPostLike>(
              fromFirestore: (_, __) => throw UnimplementedError(),
              toFirestore: (obj, _) => obj.toJson(),
            );

/// Creates a [DocumentReference] for a specific AppUserPostLike document.
DocumentReference<UpdateAppUserPostLike>
    updateAppUserPostLikeDocumentReference({
  required String appUserId,
  required String appUserPostId,
  required String appUserPostLikeId,
}) =>
        updateAppUserPostLikeCollectionReference(
          appUserId: appUserId,
          appUserPostId: appUserPostId,
        ).doc(appUserPostLikeId);

/// Reference to the 'appUserPostLikes' collection with a converter for [DeleteAppUserPostLike].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteAppUserPostLike>
    deleteAppUserPostLikeCollectionReference({
  required String appUserId,
  required String appUserPostId,
}) =>
        FirebaseFirestore.instance
            .collection('appUsers')
            .doc(appUserId)
            .collection('appUserPosts')
            .doc(appUserPostId)
            .collection('appUserPostLikes')
            .withConverter<DeleteAppUserPostLike>(
              fromFirestore: (_, __) => throw UnimplementedError(),
              toFirestore: (_, __) => throw UnimplementedError(),
            );

/// Creates a [DocumentReference] for a specific AppUserPostLike document.
DocumentReference<DeleteAppUserPostLike>
    deleteAppUserPostLikeDocumentReference({
  required String appUserId,
  required String appUserPostId,
  required String appUserPostLikeId,
}) =>
        deleteAppUserPostLikeCollectionReference(
          appUserId: appUserId,
          appUserPostId: appUserPostId,
        ).doc(appUserPostLikeId);

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting appUserPostLike documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteAppUserPostLike {
  const BatchWriteAppUserPostLike();
}

/// Represents a batch operation for creating a appUserPostLike document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new appUserPostLike documents. It encapsulates the ID of the new appUserPostLike document
/// and the data required for creation.
final class BatchCreateAppUserPostLike extends BatchWriteAppUserPostLike {
  const BatchCreateAppUserPostLike({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
    required this.createAppUserPostLike,
  });

  final String appUserId;

  final String appUserPostId;

  final String appUserPostLikeId;

  final CreateAppUserPostLike createAppUserPostLike;
}

/// Represents a batch operation for updating an existing appUserPostLike document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing appUserPostLike documents. It includes the appUserPostLike document's ID
/// and the data for the update.
final class BatchUpdateAppUserPostLike extends BatchWriteAppUserPostLike {
  const BatchUpdateAppUserPostLike({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
    required this.updateAppUserPostLike,
  });

  final String appUserId;

  final String appUserPostId;

  final String appUserPostLikeId;

  final UpdateAppUserPostLike updateAppUserPostLike;
}

// Represents a batch operation for deleting a appUserPostLike document in Firestore.
///
/// Used in a batch write to Firestore for deleting a appUserPostLike document. This class
/// only requires the ID of the appUserPostLike document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteAppUserPostLike extends BatchWriteAppUserPostLike {
  const BatchDeleteAppUserPostLike({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
  });

  final String appUserId;

  final String appUserPostId;

  final String appUserPostLikeId;
}

/// A service class for managing appUserPostLike documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on appUserPostLike documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadAppUserPostLike]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadAppUserPostLike],
/// [CreateAppUserPostLike], [UpdateAppUserPostLike] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more appUserPostLike documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify appUserPostLike documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for appUserPostLike document operations.
class AppUserPostLikeQuery {
  /// Fetches a list of [ReadAppUserPostLike] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadAppUserPostLike>> fetchDocuments({
    required String appUserId,
    required String appUserPostId,
    GetOptions? options,
    Query<ReadAppUserPostLike>? Function(Query<ReadAppUserPostLike> query)?
        queryBuilder,
    int Function(ReadAppUserPostLike lhs, ReadAppUserPostLike rhs)? compare,
  }) async {
    Query<ReadAppUserPostLike> query = readAppUserPostLikeCollectionReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
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

  /// Subscribes to a stream of [ReadAppUserPostLike] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadAppUserPostLike] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadAppUserPostLike>> subscribeDocuments({
    required String appUserId,
    required String appUserPostId,
    Query<ReadAppUserPostLike>? Function(Query<ReadAppUserPostLike> query)?
        queryBuilder,
    int Function(ReadAppUserPostLike lhs, ReadAppUserPostLike rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadAppUserPostLike> query = readAppUserPostLikeCollectionReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
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

  /// Fetches a single [ReadAppUserPostLike] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [appUserPostLikeId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadAppUserPostLike?> fetchDocument({
    required String appUserId,
    required String appUserPostId,
    required String appUserPostLikeId,
    GetOptions? options,
  }) async {
    final ds = await readAppUserPostLikeDocumentReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
      appUserPostLikeId: appUserPostLikeId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadAppUserPostLike] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadAppUserPostLike] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadAppUserPostLike?> subscribeDocument({
    required String appUserId,
    required String appUserPostId,
    required String appUserPostLikeId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readAppUserPostLikeDocumentReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
      appUserPostLikeId: appUserPostLikeId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a appUserPostLike document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUserPostLike] data.
  Future<DocumentReference<CreateAppUserPostLike>> add({
    required String appUserId,
    required String appUserPostId,
    required CreateAppUserPostLike createAppUserPostLike,
  }) =>
      createAppUserPostLikeCollectionReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).add(createAppUserPostLike);

  /// Sets a appUserPostLike document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUserPostLike] data.
  Future<void> set({
    required String appUserId,
    required String appUserPostId,
    required String appUserPostLikeId,
    required CreateAppUserPostLike createAppUserPostLike,
    SetOptions? options,
  }) =>
      createAppUserPostLikeDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
        appUserPostLikeId: appUserPostLikeId,
      ).set(createAppUserPostLike, options);

  /// Updates a appUserPostLike document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [appUserPostLikeId] with the
  /// provided [updateAppUserPostLike] data.
  /// The update is based on the structure defined in `UpdateAppUserPostLike.toJson()`.
  Future<void> update({
    required String appUserId,
    required String appUserPostId,
    required String appUserPostLikeId,
    required UpdateAppUserPostLike updateAppUserPostLike,
  }) =>
      updateAppUserPostLikeDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
        appUserPostLikeId: appUserPostLikeId,
      ).update(updateAppUserPostLike.toJson());

  /// Deletes a appUserPostLike document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [appUserPostLikeId].
  Future<void> delete({
    required String appUserId,
    required String appUserPostId,
    required String appUserPostLikeId,
  }) =>
      deleteAppUserPostLikeDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
        appUserPostLikeId: appUserPostLikeId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteAppUserPostLike] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///   - [batchWriteTasks] A list of [BatchWriteAppUserPostLike] objects, each representing a specific
  ///     write operation (create, update, or delete) for AppUserPostLike documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///   - Creating new documents for tasks of type [BatchCreateAppUserPostLike].
  ///   - Updating existing documents for tasks of type [BatchUpdateAppUserPostLike].
  ///   - Deleting documents for tasks of type [BatchDeleteAppUserPostLike].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///   - Firestore exceptions if the batch commit fails or if there are issues with the individual
  ///     operations within the batch.
  Future<void> batchWrite(List<BatchWriteAppUserPostLike> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateAppUserPostLike(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId,
            appUserPostLikeId: final appUserPostLikeId,
            createAppUserPostLike: final createAppUserPostLike,
          ):
          batch.set(
            createAppUserPostLikeDocumentReference(
              appUserId: appUserId,
              appUserPostId: appUserPostId,
              appUserPostLikeId: appUserPostLikeId,
            ),
            createAppUserPostLike,
          );
        case BatchUpdateAppUserPostLike(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId,
            appUserPostLikeId: final appUserPostLikeId,
            updateAppUserPostLike: final updateAppUserPostLike,
          ):
          batch.update(
            updateAppUserPostLikeDocumentReference(
              appUserId: appUserId,
              appUserPostId: appUserPostId,
              appUserPostLikeId: appUserPostLikeId,
            ),
            updateAppUserPostLike.toJson(),
          );
        case BatchDeleteAppUserPostLike(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId,
            appUserPostLikeId: final appUserPostLikeId
          ):
          batch.delete(deleteAppUserPostLikeDocumentReference(
            appUserId: appUserId,
            appUserPostId: appUserPostId,
            appUserPostLikeId: appUserPostLikeId,
          ));
      }
    }
    return batch.commit();
  }
}
