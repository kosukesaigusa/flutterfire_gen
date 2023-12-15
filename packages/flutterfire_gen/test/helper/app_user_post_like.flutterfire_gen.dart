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
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
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

  /// Adds a [appUserPostLike] document to Cloud Firestore.
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

  /// Sets a [appUserPostLike] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateAppUserPostLike] data.
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

  /// Deletes a [appUserPostLike] document from Cloud Firestore.
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
}
