// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_post_like_task.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadAppUserPostLikeTask {
  const ReadAppUserPostLikeTask({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
    required this.appUserPostLikeTaskId,
    required this.path,
    required this.appUserPostLikeTaskReference,
  });

  final String appUserId;

  final String appUserPostId;

  final String appUserPostLikeId;

  final String appUserPostLikeTaskId;

  final String path;

  final DocumentReference<ReadAppUserPostLikeTask> appUserPostLikeTaskReference;

  factory ReadAppUserPostLikeTask.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
      'appUserId': _AppUserIdRefJsonPostProcessor().fromJson(json),
      'appUserPostId': _AppUserPostIdRefJsonPostProcessor().fromJson(json),
    };
    return ReadAppUserPostLikeTask(
      appUserId: extendedJson['appUserId'] as String,
      appUserPostId: extendedJson['appUserPostId'] as String,
      appUserPostLikeId: extendedJson['appUserPostLikeId'] as String,
      appUserPostLikeTaskId: extendedJson['appUserPostLikeTaskId'] as String,
      path: extendedJson['path'] as String,
      appUserPostLikeTaskReference: extendedJson['appUserPostLikeTaskReference']
          as DocumentReference<ReadAppUserPostLikeTask>,
    );
  }

  factory ReadAppUserPostLikeTask.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadAppUserPostLikeTask.fromJson(<String, dynamic>{
      ...data,
      'appUserPostLikeTaskId': ds.id,
      'path': ds.reference.path,
      'appUserPostLikeTaskReference':
          ds.reference.parent.doc(ds.id).withConverter(
                fromFirestore: (ds, _) =>
                    ReadAppUserPostLikeTask.fromDocumentSnapshot(ds),
                toFirestore: (obj, _) => throw UnimplementedError(),
              ),
    });
  }

  ReadAppUserPostLikeTask copyWith({
    String? appUserId,
    String? appUserPostId,
    String? appUserPostLikeId,
    String? appUserPostLikeTaskId,
    String? path,
    DocumentReference<ReadAppUserPostLikeTask>? appUserPostLikeTaskReference,
  }) {
    return ReadAppUserPostLikeTask(
      appUserId: appUserId ?? this.appUserId,
      appUserPostId: appUserPostId ?? this.appUserPostId,
      appUserPostLikeId: appUserPostLikeId ?? this.appUserPostLikeId,
      appUserPostLikeTaskId:
          appUserPostLikeTaskId ?? this.appUserPostLikeTaskId,
      path: path ?? this.path,
      appUserPostLikeTaskReference:
          appUserPostLikeTaskReference ?? this.appUserPostLikeTaskReference,
    );
  }
}

class CreateAppUserPostLikeTask {
  const CreateAppUserPostLikeTask({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
  });

  final String appUserId;
  final String appUserPostId;
  final String appUserPostLikeId;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'appUserId': appUserId,
      'appUserPostId': appUserPostId,
      'appUserPostLikeId': appUserPostLikeId,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[
      if (json.containsKey('appUserId'))
        _AppUserIdRefJsonPostProcessor().toJson(json),
      if (json.containsKey('appUserPostId'))
        _AppUserPostIdRefJsonPostProcessor().toJson(json),
    ];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class UpdateAppUserPostLikeTask {
  const UpdateAppUserPostLikeTask({
    this.appUserId,
    this.appUserPostId,
    this.appUserPostLikeId,
  });

  final String? appUserId;
  final String? appUserPostId;
  final String? appUserPostLikeId;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (appUserId != null) 'appUserId': appUserId,
      if (appUserPostId != null) 'appUserPostId': appUserPostId,
      if (appUserPostLikeId != null) 'appUserPostLikeId': appUserPostLikeId,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[
      if (json.containsKey('appUserId'))
        _AppUserIdRefJsonPostProcessor().toJson(json),
      if (json.containsKey('appUserPostId'))
        _AppUserPostIdRefJsonPostProcessor().toJson(json),
    ];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteAppUserPostLikeTask {}

/// Reference to the 'appUserPostLikeTasks' collection with a converter for [ReadAppUserPostLikeTask].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadAppUserPostLikeTask] objects.
final readAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<ReadAppUserPostLikeTask>(
      fromFirestore: (ds, _) =>
          ReadAppUserPostLikeTask.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific AppUserPostLikeTask document.
DocumentReference<ReadAppUserPostLikeTask>
    readAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        readAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Reference to the 'appUserPostLikeTasks' collection with a converter for [CreateAppUserPostLikeTask].
/// This enables type-safe create operations in Firestore, converting
/// [CreateAppUserPostLikeTask] objects to Firestore document data.
final createAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<CreateAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific AppUserPostLikeTask document.
DocumentReference<CreateAppUserPostLikeTask>
    createAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        createAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Reference to the 'appUserPostLikeTasks' collection with a converter for [UpdateAppUserPostLikeTask].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateAppUserPostLikeTask] objects to Firestore document data.
final updateAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<UpdateAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific AppUserPostLikeTask document.
DocumentReference<UpdateAppUserPostLikeTask>
    updateAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        updateAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Reference to the 'appUserPostLikeTasks' collection with a converter for [DeleteAppUserPostLikeTask].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<DeleteAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific AppUserPostLikeTask document.
DocumentReference<DeleteAppUserPostLikeTask>
    deleteAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        deleteAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// A service class for managing appUserPostLikeTask documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on appUserPostLikeTask documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadAppUserPostLikeTask]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadAppUserPostLikeTask],
/// [CreateAppUserPostLikeTask], [UpdateAppUserPostLikeTask] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more appUserPostLikeTask documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify appUserPostLikeTask documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for appUserPostLikeTask document operations.

class AppUserPostLikeTaskQuery {
  /// Fetches a list of [ReadAppUserPostLikeTask] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the

  Future<List<ReadAppUserPostLikeTask>> fetchDocuments({
    GetOptions? options,
    Query<ReadAppUserPostLikeTask>? Function(
            Query<ReadAppUserPostLikeTask> query)?
        queryBuilder,
    int Function(ReadAppUserPostLikeTask lhs, ReadAppUserPostLikeTask rhs)?
        compare,
  }) async {
    Query<ReadAppUserPostLikeTask> query =
        readAppUserPostLikeTaskCollectionReference;
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

  /// Subscribes to a stream of [ReadAppUserPostLikeTask] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadAppUserPostLikeTask] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.

  Stream<List<ReadAppUserPostLikeTask>> subscribeDocuments({
    Query<ReadAppUserPostLikeTask>? Function(
            Query<ReadAppUserPostLikeTask> query)?
        queryBuilder,
    int Function(ReadAppUserPostLikeTask lhs, ReadAppUserPostLikeTask rhs)?
        compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadAppUserPostLikeTask> query =
        readAppUserPostLikeTaskCollectionReference;
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

  /// Fetches a single [ReadAppUserPostLikeTask] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [appUserPostLikeTaskId].
  /// You can control the data retrieval with [GetOptions].

  Future<ReadAppUserPostLikeTask?> fetchDocument({
    required String appUserPostLikeTaskId,
    GetOptions? options,
  }) async {
    final ds = await readAppUserPostLikeTaskDocumentReference(
      appUserPostLikeTaskId: appUserPostLikeTaskId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadAppUserPostLikeTask] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadAppUserPostLikeTask] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].

  Stream<ReadAppUserPostLikeTask?> subscribeDocument({
    required String appUserPostLikeTaskId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readAppUserPostLikeTaskDocumentReference(
      appUserPostLikeTaskId: appUserPostLikeTaskId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [appUserPostLikeTask] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUserPostLikeTask] data.

  Future<DocumentReference<CreateAppUserPostLikeTask>> add({
    required CreateAppUserPostLikeTask createAppUserPostLikeTask,
  }) =>
      createAppUserPostLikeTaskCollectionReference
          .add(createAppUserPostLikeTask);

  /// Sets a [appUserPostLikeTask] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateAppUserPostLikeTask] data.

  Future<void> set({
    required String appUserPostLikeTaskId,
    required CreateAppUserPostLikeTask createAppUserPostLikeTask,
    SetOptions? options,
  }) =>
      createAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).set(createAppUserPostLikeTask, options);

  /// Updates a appUserPostLikeTask document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [appUserPostLikeTaskId] with the
  /// provided [updateAppUserPostLikeTask] data.
  /// The update is based on the structure defined in `UpdateAppUserPostLikeTask.toJson()`.

  Future<void> update({
    required String appUserPostLikeTaskId,
    required UpdateAppUserPostLikeTask updateAppUserPostLikeTask,
  }) =>
      updateAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).update(updateAppUserPostLikeTask.toJson());

  /// Deletes a [appUserPostLikeTask] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [appUserPostLikeTaskId].

  Future<void> delete({
    required String appUserPostLikeTaskId,
  }) =>
      deleteAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).delete();
}
