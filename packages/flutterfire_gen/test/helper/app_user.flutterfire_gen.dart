// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadAppUser {
  const ReadAppUser({
    required this.name,
    required this.imageUrl,
    required this.appUserId,
    required this.path,
    required this.appUserReference,
  });

  final String name;

  final String imageUrl;

  final String appUserId;

  final String path;

  final DocumentReference<ReadAppUser> appUserReference;

  factory ReadAppUser.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadAppUser(
      name: extendedJson['name'] as String? ?? '',
      imageUrl: extendedJson['imageUrl'] as String? ?? '',
      appUserId: extendedJson['appUserId'] as String,
      path: extendedJson['path'] as String,
      appUserReference:
          extendedJson['appUserReference'] as DocumentReference<ReadAppUser>,
    );
  }

  factory ReadAppUser.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadAppUser.fromJson(<String, dynamic>{
      ...data,
      'appUserId': ds.id,
      'path': ds.reference.path,
      'appUserReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadAppUser.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadAppUser copyWith({
    String? name,
    String? imageUrl,
    String? appUserId,
    String? path,
    DocumentReference<ReadAppUser>? appUserReference,
  }) {
    return ReadAppUser(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      appUserId: appUserId ?? this.appUserId,
      path: path ?? this.path,
      appUserReference: appUserReference ?? this.appUserReference,
    );
  }
}

/// Represents the data structure for creating a new appUser document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new appUser document.
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
/// automatically set to the server's timestamp.
class CreateAppUser {
  const CreateAppUser({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a appUser document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a appUser document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateAppUser {
  const UpdateAppUser({
    this.name,
    this.imageUrl,
  });

  final String? name;
  final String? imageUrl;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (name != null) 'name': name,
      if (imageUrl != null) 'imageUrl': imageUrl,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteAppUser {}

/// Reference to the 'appUsers' collection with a converter for [ReadAppUser].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadAppUser] objects.
final readAppUserCollectionReference = FirebaseFirestore.instance
    .collection('appUsers')
    .withConverter<ReadAppUser>(
      fromFirestore: (ds, _) => ReadAppUser.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific AppUser document.
DocumentReference<ReadAppUser> readAppUserDocumentReference({
  required String appUserId,
}) =>
    readAppUserCollectionReference.doc(appUserId);

/// Reference to the 'appUsers' collection with a converter for [CreateAppUser].
/// This enables type-safe create operations in Firestore, converting
/// [CreateAppUser] objects to Firestore document data.
final createAppUserCollectionReference = FirebaseFirestore.instance
    .collection('appUsers')
    .withConverter<CreateAppUser>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific AppUser document.
DocumentReference<CreateAppUser> createAppUserDocumentReference({
  required String appUserId,
}) =>
    createAppUserCollectionReference.doc(appUserId);

/// Reference to the 'appUsers' collection with a converter for [UpdateAppUser].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateAppUser] objects to Firestore document data.
final updateAppUserCollectionReference = FirebaseFirestore.instance
    .collection('appUsers')
    .withConverter<UpdateAppUser>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific AppUser document.
DocumentReference<UpdateAppUser> updateAppUserDocumentReference({
  required String appUserId,
}) =>
    updateAppUserCollectionReference.doc(appUserId);

/// Reference to the 'appUsers' collection with a converter for [DeleteAppUser].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteAppUserCollectionReference = FirebaseFirestore.instance
    .collection('appUsers')
    .withConverter<DeleteAppUser>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific AppUser document.
DocumentReference<DeleteAppUser> deleteAppUserDocumentReference({
  required String appUserId,
}) =>
    deleteAppUserCollectionReference.doc(appUserId);

/// A service class for managing appUser documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on appUser documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadAppUser]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadAppUser],
/// [CreateAppUser], [UpdateAppUser] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more appUser documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify appUser documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for appUser document operations.
class AppUserQuery {
  /// Fetches a list of [ReadAppUser] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadAppUser>> fetchDocuments({
    GetOptions? options,
    Query<ReadAppUser>? Function(Query<ReadAppUser> query)? queryBuilder,
    int Function(ReadAppUser lhs, ReadAppUser rhs)? compare,
  }) async {
    Query<ReadAppUser> query = readAppUserCollectionReference;
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

  /// Subscribes to a stream of [ReadAppUser] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadAppUser] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadAppUser>> subscribeDocuments({
    Query<ReadAppUser>? Function(Query<ReadAppUser> query)? queryBuilder,
    int Function(ReadAppUser lhs, ReadAppUser rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadAppUser> query = readAppUserCollectionReference;
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

  /// Fetches a single [ReadAppUser] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [appUserId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadAppUser?> fetchDocument({
    required String appUserId,
    GetOptions? options,
  }) async {
    final ds = await readAppUserDocumentReference(
      appUserId: appUserId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadAppUser] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadAppUser] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadAppUser?> subscribeDocument({
    required String appUserId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readAppUserDocumentReference(
      appUserId: appUserId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [appUser] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createAppUser] data.
  Future<DocumentReference<CreateAppUser>> add({
    required CreateAppUser createAppUser,
  }) =>
      createAppUserCollectionReference.add(createAppUser);

  /// Sets a [appUser] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateAppUser] data.
  Future<void> set({
    required String appUserId,
    required CreateAppUser createAppUser,
    SetOptions? options,
  }) =>
      createAppUserDocumentReference(
        appUserId: appUserId,
      ).set(createAppUser, options);

  /// Updates a appUser document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [appUserId] with the
  /// provided [updateAppUser] data.
  /// The update is based on the structure defined in `UpdateAppUser.toJson()`.
  Future<void> update({
    required String appUserId,
    required UpdateAppUser updateAppUser,
  }) =>
      updateAppUserDocumentReference(
        appUserId: appUserId,
      ).update(updateAppUser.toJson());

  /// Deletes a [appUser] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [appUserId].
  Future<void> delete({
    required String appUserId,
  }) =>
      deleteAppUserDocumentReference(
        appUserId: appUserId,
      ).delete();
}
