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

class DeleteAppUserPost {}

/// Provides a reference to the appUserPosts collection for reading.
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

/// Provides a reference to a appUserPost document for reading.
DocumentReference<ReadAppUserPost> readAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    readAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Provides a reference to the appUserPosts collection for creating.
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

/// Provides a reference to a appUserPost document for creating.
DocumentReference<CreateAppUserPost> createAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    createAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Provides a reference to the appUserPosts collection for updating.
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

/// Provides a reference to a appUserPost document for updating.
DocumentReference<UpdateAppUserPost> updateAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    updateAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Provides a reference to the appUserPosts collection for deleting.
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

/// Provides a reference to a appUserPost document for deleting.
DocumentReference<DeleteAppUserPost> deleteAppUserPostDocumentReference({
  required String appUserId,
  required String appUserPostId,
}) =>
    deleteAppUserPostCollectionReference(
      appUserId: appUserId,
    ).doc(appUserPostId);

/// Manages queries against the appUserPosts collection.
class AppUserPostQuery {
  /// Fetches [ReadAppUserPost] documents.
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

  /// Subscribes [AppUserPost] documents.
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

  /// Fetches a specific [ReadAppUserPost] document.
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

  /// Subscribes a specific [AppUserPost] document.
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

  /// Adds a [AppUserPost] document.
  Future<DocumentReference<CreateAppUserPost>> add({
    required String appUserId,
    required CreateAppUserPost createAppUserPost,
  }) =>
      createAppUserPostCollectionReference(
        appUserId: appUserId,
      ).add(createAppUserPost);

  /// Sets a [AppUserPost] document.
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

  /// Updates a specific [AppUserPost] document.
  Future<void> update({
    required String appUserId,
    required String appUserPostId,
    required UpdateAppUserPost updateAppUserPost,
  }) =>
      updateAppUserPostDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).update(updateAppUserPost.toJson());

  /// Deletes a specific [AppUserPost] document.
  Future<void> delete({
    required String appUserId,
    required String appUserPostId,
  }) =>
      deleteAppUserPostDocumentReference(
        appUserId: appUserId,
        appUserPostId: appUserPostId,
      ).delete();
}
