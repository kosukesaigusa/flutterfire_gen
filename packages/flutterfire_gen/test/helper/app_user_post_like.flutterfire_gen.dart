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

class DeleteAppUserPostLike {}

/// Provides a reference to the appUserPostLikes collection for reading.
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

/// Provides a reference to a appUserPostLike document for reading.
DocumentReference<ReadAppUserPostLike> readAppUserPostLikeDocumentReference({
  required String appUserId,
  required String appUserPostId,
  required String appUserPostLikeId,
}) =>
    readAppUserPostLikeCollectionReference(
      appUserId: appUserId,
      appUserPostId: appUserPostId,
    ).doc(appUserPostLikeId);

/// Provides a reference to the appUserPostLikes collection for creating.
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

/// Provides a reference to a appUserPostLike document for creating.
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

/// Provides a reference to the appUserPostLikes collection for updating.
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

/// Provides a reference to a appUserPostLike document for updating.
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

/// Provides a reference to the appUserPostLikes collection for deleting.
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

/// Provides a reference to a appUserPostLike document for deleting.
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

/// Manages queries against the appUserPostLikes collection.
class AppUserPostLikeQuery {
  /// Fetches [ReadAppUserPostLike] documents.
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

  /// Subscribes [AppUserPostLike] documents.
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

  /// Fetches a specific [ReadAppUserPostLike] document.
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

  /// Subscribes a specific [AppUserPostLike] document.
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

  /// Adds a [AppUserPostLike] document.
  Future<DocumentReference<CreateAppUserPostLike>> add({
    required String appUserId,
    required String appUserPostId,
    required CreateAppUserPostLike createAppUserPostLike,
  }) =>
      createAppUserPostLikeCollectionReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).add(createAppUserPostLike);

  /// Sets a [AppUserPostLike] document.
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

  /// Updates a specific [AppUserPostLike] document.
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

  /// Deletes a specific [AppUserPostLike] document.
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
}
