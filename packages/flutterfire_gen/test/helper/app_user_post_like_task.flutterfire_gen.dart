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

/// Provides a reference to the appUserPostLikeTasks collection for reading.
final readAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<ReadAppUserPostLikeTask>(
      fromFirestore: (ds, _) =>
          ReadAppUserPostLikeTask.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Provides a reference to a appUserPostLikeTask document for reading.
DocumentReference<ReadAppUserPostLikeTask>
    readAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        readAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Provides a reference to the appUserPostLikeTasks collection for creating.
final createAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<CreateAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Provides a reference to a appUserPostLikeTask document for creating.
DocumentReference<CreateAppUserPostLikeTask>
    createAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        createAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Provides a reference to the appUserPostLikeTasks collection for updating.
final updateAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<UpdateAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Provides a reference to a appUserPostLikeTask document for updating.
DocumentReference<UpdateAppUserPostLikeTask>
    updateAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        updateAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Provides a reference to the appUserPostLikeTasks collection for deleting.
final deleteAppUserPostLikeTaskCollectionReference = FirebaseFirestore.instance
    .collection('appUserPostLikeTasks')
    .withConverter<DeleteAppUserPostLikeTask>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Provides a reference to a appUserPostLikeTask document for deleting.
DocumentReference<DeleteAppUserPostLikeTask>
    deleteAppUserPostLikeTaskDocumentReference({
  required String appUserPostLikeTaskId,
}) =>
        deleteAppUserPostLikeTaskCollectionReference.doc(appUserPostLikeTaskId);

/// Manages queries against the appUserPostLikeTasks collection.
class AppUserPostLikeTaskQuery {
  /// Fetches [ReadAppUserPostLikeTask] documents.
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

  /// Subscribes [AppUserPostLikeTask] documents.
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

  /// Fetches a specific [ReadAppUserPostLikeTask] document.
  Future<ReadAppUserPostLikeTask?> fetchDocument({
    required String appUserPostLikeTaskId,
    GetOptions? options,
  }) async {
    final ds = await readAppUserPostLikeTaskDocumentReference(
      appUserPostLikeTaskId: appUserPostLikeTaskId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [AppUserPostLikeTask] document.
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

  /// Adds a [AppUserPostLikeTask] document.
  Future<DocumentReference<CreateAppUserPostLikeTask>> add({
    required CreateAppUserPostLikeTask createAppUserPostLikeTask,
  }) =>
      createAppUserPostLikeTaskCollectionReference
          .add(createAppUserPostLikeTask);

  /// Sets a [AppUserPostLikeTask] document.
  Future<void> set({
    required String appUserPostLikeTaskId,
    required CreateAppUserPostLikeTask createAppUserPostLikeTask,
    SetOptions? options,
  }) =>
      createAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).set(createAppUserPostLikeTask, options);

  /// Updates a specific [AppUserPostLikeTask] document.
  Future<void> update({
    required String appUserPostLikeTaskId,
    required UpdateAppUserPostLikeTask updateAppUserPostLikeTask,
  }) =>
      updateAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).update(updateAppUserPostLikeTask.toJson());

  /// Deletes a specific [AppUserPostLikeTask] document.
  Future<void> delete({
    required String appUserPostLikeTaskId,
  }) =>
      deleteAppUserPostLikeTaskDocumentReference(
        appUserPostLikeTaskId: appUserPostLikeTaskId,
      ).delete();
}
