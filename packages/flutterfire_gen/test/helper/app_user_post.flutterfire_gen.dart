// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_post.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadAppUserPost {
  const ReadAppUserPost({
    required this.content,
    required this.numbers,
    required this.updatedAt,
    required this.appUserPostId,
    required this.path,
    required this.appUserPostReference,
  });

  final String content;

  final List<int> numbers;

  final DateTime? updatedAt;

  final String appUserPostId;

  final String path;

  final DocumentReference<ReadAppUserPost> appUserPostReference;

  factory ReadAppUserPost.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadAppUserPost(
      content: extendedJson['content'] as String? ?? '',
      numbers: (extendedJson['numbers'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          const <int>[],
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      appUserPostId: extendedJson['appUserPostId'] as String,
      path: extendedJson['path'] as String,
      appUserPostReference: extendedJson['appUserPostReference']
          as DocumentReference<ReadAppUserPost>,
    );
  }

  factory ReadAppUserPost.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadAppUserPost.fromJson(<String, dynamic>{
      ...data,
      'appUserPostId': ds.id,
      'path': ds.reference.path,
      'appUserPostReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadAppUserPost.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadAppUserPost copyWith({
    String? content,
    List<int>? numbers,
    DateTime? updatedAt,
    String? appUserPostId,
    String? path,
    DocumentReference<ReadAppUserPost>? appUserPostReference,
  }) {
    return ReadAppUserPost(
      content: content ?? this.content,
      numbers: numbers ?? this.numbers,
      updatedAt: updatedAt ?? this.updatedAt,
      appUserPostId: appUserPostId ?? this.appUserPostId,
      path: path ?? this.path,
      appUserPostReference: appUserPostReference ?? this.appUserPostReference,
    );
  }
}

/// Represents the data structure for creating a new appUserPost document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new appUserPost document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateAppUserPost {
  const CreateAppUserPost({
    required this.content,
    required this.numbers,
  });

  final String content;

  final FirestoreData<List<int>> numbers;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'content': content,
      'numbers': numbers.value,
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

/// Represents the data structure for updating a appUserPost document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a appUserPost document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateAppUserPost {
  const UpdateAppUserPost({
    this.content,
    this.numbers,
  });

  final String? content;

  final FirestoreData<List<int>>? numbers;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (content != null) 'content': content,
      if (numbers != null) 'numbers': numbers!.value,
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

/// Represents the data structure for deleting a appUserPost document in Cloud Firestore.
class DeleteAppUserPost {}

/// Reference to the 'appUserPosts' collection with a converter for [ReadAppUserPost].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadAppUserPost] objects.
CollectionReference<ReadAppUserPost> readAppUserPostCollectionReference({
  required String appUserId,
}) =>
    FirebaseFirestore.instance
        .collection('appUsers')
        .doc(appUserId)
        .collection('appUserPosts')
        .withConverter<ReadAppUserPost>(
          fromFirestore: (ds, _) => ReadAppUserPost.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific AppUserPost document.
DocumentReference<ReadAppUserPost> readAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    readAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Reference to the 'appUserPosts' collection with a converter for [CreateAppUserPost].
/// This enables type-safe create operations in Firestore, converting
/// [CreateAppUserPost] objects to Firestore document data.
CollectionReference<CreateAppUserPost> createAppUserPostCollectionReference({
  required String appUserId,
}) =>
    FirebaseFirestore.instance
        .collection('appUsers')
        .doc(appUserId)
        .collection('appUserPosts')
        .withConverter<CreateAppUserPost>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific AppUserPost document.
DocumentReference<CreateAppUserPost> createAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    createAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Reference to the 'appUserPosts' collection with a converter for [UpdateAppUserPost].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateAppUserPost] objects to Firestore document data.
CollectionReference<UpdateAppUserPost> updateAppUserPostCollectionReference({
  required String appUserId,
}) =>
    FirebaseFirestore.instance
        .collection('appUsers')
        .doc(appUserId)
        .collection('appUserPosts')
        .withConverter<UpdateAppUserPost>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific AppUserPost document.
DocumentReference<UpdateAppUserPost> updateAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    updateAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Reference to the 'appUserPosts' collection with a converter for [DeleteAppUserPost].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteAppUserPost> deleteAppUserPostCollectionReference({
  required String appUserId,
}) =>
    FirebaseFirestore.instance
        .collection('appUsers')
        .doc(appUserId)
        .collection('appUserPosts')
        .withConverter<DeleteAppUserPost>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific AppUserPost document.
DocumentReference<DeleteAppUserPost> deleteAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    deleteAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting appUserPost documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteAppUserPost {
  const BatchWriteAppUserPost();
}

/// Represents a batch operation for creating a appUserPost document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new appUserPost documents. It encapsulates the ID of the new appUserPost document
/// and the data required for creation.
final class BatchCreateAppUserPost extends BatchWriteAppUserPost {
  const BatchCreateAppUserPost({
    required this.appUserId,
    required this.appUserPostId,
    required this.createAppUserPost,
  });

  final String appUserId;

  final String appUserPostId;

  final CreateAppUserPost createAppUserPost;
}

/// Represents a batch operation for updating an existing appUserPost document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing appUserPost documents. It includes the appUserPost document's ID
/// and the data for the update.
final class BatchUpdateAppUserPost extends BatchWriteAppUserPost {
  const BatchUpdateAppUserPost({
    required this.appUserId,
    required this.appUserPostId,
    required this.updateAppUserPost,
  });

  final String appUserId;

  final String appUserPostId;

  final UpdateAppUserPost updateAppUserPost;
}

// Represents a batch operation for deleting a appUserPost document in Firestore.
///
/// Used in a batch write to Firestore for deleting a appUserPost document. This class
/// only requires the ID of the appUserPost document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteAppUserPost extends BatchWriteAppUserPost {
  const BatchDeleteAppUserPost({
    required this.appUserId,
    required this.appUserPostId,
  });

  final String appUserId;

  final String appUserPostId;
}

/// A service class for managing appUserPost documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on appUserPost documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadAppUserPost]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadAppUserPost],
/// [CreateAppUserPost], [UpdateAppUserPost] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more appUserPost documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify appUserPost documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for appUserPost document operations.
class AppUserPostQuery {
  /// Fetches a list of [ReadAppUserPost] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadAppUserPost>> fetchDocuments({
    required String appUserId,
    GetOptions? options,
    Query<ReadAppUserPost>? Function(Query<ReadAppUserPost> query)?
        queryBuilder,
    int Function(ReadAppUserPost lhs, ReadAppUserPost rhs)? compare,
  }) async {
    Query<ReadAppUserPost> query = readAppUserPostCollectionReference(
      appUserId: appUserId,
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

  /// Subscribes to a stream of [ReadAppUserPost] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadAppUserPost] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadAppUserPost>> subscribeDocuments({
    required String appUserId,
    Query<ReadAppUserPost>? Function(Query<ReadAppUserPost> query)?
        queryBuilder,
    int Function(ReadAppUserPost lhs, ReadAppUserPost rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadAppUserPost> query = readAppUserPostCollectionReference(
      appUserId: appUserId,
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

  /// Fetches a single [ReadAppUserPost] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [appUserPostId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadAppUserPost?> fetchDocument({
    required String appUserId,
    required String appUserPostId,
    GetOptions? options,
  }) async {
    final ds = await readAppUserPostDocumentReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadAppUserPost] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadAppUserPost] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadAppUserPost?> subscribeDocument({
    required String appUserId,
    required String appUserPostId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readAppUserPostDocumentReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a appUserPost document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUserPost] data.
  Future<DocumentReference<CreateAppUserPost>> add({
    required String appUserId,
    required CreateAppUserPost createAppUserPost,
  }) =>
      createAppUserPostCollectionReference(
        appUserId: appUserId,
      ).add(createAppUserPost);

  /// Sets a appUserPost document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUserPost] data.
  Future<void> set({
    required String appUserId,
    required String appUserPostId,
    required CreateAppUserPost createAppUserPost,
    SetOptions? options,
  }) =>
      createAppUserPostDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).set(createAppUserPost, options);

  /// Updates a appUserPost document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [appUserPostId] with the
  /// provided [updateAppUserPost] data.
  /// The update is based on the structure defined in `UpdateAppUserPost.toJson()`.
  Future<void> update({
    required String appUserId,
    required String appUserPostId,
    required UpdateAppUserPost updateAppUserPost,
  }) =>
      updateAppUserPostDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).update(updateAppUserPost.toJson());

  /// Deletes a appUserPost document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [appUserPostId].
  Future<void> delete({
    required String appUserId,
    required String appUserPostId,
  }) =>
      deleteAppUserPostDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteAppUserPost] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///   - [batchWriteTasks] A list of [BatchWriteAppUserPost] objects, each representing a specific
  ///     write operation (create, update, or delete) for AppUserPost documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///   - Creating new documents for tasks of type [BatchCreateAppUserPost].
  ///   - Updating existing documents for tasks of type [BatchUpdateAppUserPost].
  ///   - Deleting documents for tasks of type [BatchDeleteAppUserPost].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///   - Firestore exceptions if the batch commit fails or if there are issues with the individual
  ///     operations within the batch.
  Future<void> batchWrite(List<BatchWriteAppUserPost> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateAppUserPost(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId,
            createAppUserPost: final createAppUserPost,
          ):
          batch.set(
            createAppUserPostDocumentReference(
              appUserId: appUserId,
              appUserPostId: appUserPostId,
            ),
            createAppUserPost,
          );
        case BatchUpdateAppUserPost(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId,
            updateAppUserPost: final updateAppUserPost,
          ):
          batch.update(
            updateAppUserPostDocumentReference(
              appUserId: appUserId,
              appUserPostId: appUserPostId,
            ),
            updateAppUserPost.toJson(),
          );
        case BatchDeleteAppUserPost(
            appUserId: final appUserId,
            appUserPostId: final appUserPostId
          ):
          batch.delete(deleteAppUserPostDocumentReference(
            appUserId: appUserId,
            appUserPostId: appUserPostId,
          ));
      }
    }
    return batch.commit();
  }
}
