// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadFcmToken {
  const ReadFcmToken({
    required this.tokenAndDevices,
    required this.createdAt,
    required this.fcmTokenId,
    required this.path,
    required this.fcmTokenReference,
  });

  final List<TokenAndDevice> tokenAndDevices;

  final DateTime? createdAt;

  final String fcmTokenId;

  final String path;

  final DocumentReference<ReadFcmToken> fcmTokenReference;

  factory ReadFcmToken.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadFcmToken(
      tokenAndDevices: _tokenAndDevicesConverter
          .fromJson(extendedJson['tokenAndDevices'] as List<dynamic>?),
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      fcmTokenId: extendedJson['fcmTokenId'] as String,
      path: extendedJson['path'] as String,
      fcmTokenReference:
          extendedJson['fcmTokenReference'] as DocumentReference<ReadFcmToken>,
    );
  }

  factory ReadFcmToken.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadFcmToken.fromJson(<String, dynamic>{
      ...data,
      'fcmTokenId': ds.id,
      'path': ds.reference.path,
      'fcmTokenReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadFcmToken copyWith({
    List<TokenAndDevice>? tokenAndDevices,
    DateTime? createdAt,
    String? fcmTokenId,
    String? path,
    DocumentReference<ReadFcmToken>? fcmTokenReference,
  }) {
    return ReadFcmToken(
      tokenAndDevices: tokenAndDevices ?? this.tokenAndDevices,
      createdAt: createdAt ?? this.createdAt,
      fcmTokenId: fcmTokenId ?? this.fcmTokenId,
      path: path ?? this.path,
      fcmTokenReference: fcmTokenReference ?? this.fcmTokenReference,
    );
  }
}

/// Represents the data structure for creating a new fcmToken document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new fcmToken document.
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
/// automatically set to the server's timestamp.
class CreateFcmToken {
  const CreateFcmToken({
    required this.tokenAndDevices,
  });

  final FirestoreData<List<TokenAndDevice>> tokenAndDevices;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'tokenAndDevices':
          _tokenAndDevicesConverter.toJson(tokenAndDevices.actualValue),
      'createdAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a fcmToken document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a fcmToken document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateFcmToken {
  const UpdateFcmToken({
    this.tokenAndDevices,
    this.createdAt,
  });

  final FirestoreData<List<TokenAndDevice>>? tokenAndDevices;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (tokenAndDevices != null)
        'tokenAndDevices':
            _tokenAndDevicesConverter.toJson(tokenAndDevices!.actualValue),
      if (createdAt != null)
        'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteFcmToken {}

/// Reference to the 'fcmTokens' collection with a converter for [ReadFcmToken].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadFcmToken] objects.
final readFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<ReadFcmToken>(
      fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<ReadFcmToken> readFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    readFcmTokenCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [CreateFcmToken].
/// This enables type-safe create operations in Firestore, converting
/// [CreateFcmToken] objects to Firestore document data.
final createFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<CreateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<CreateFcmToken> createFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    createFcmTokenCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [UpdateFcmToken].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateFcmToken] objects to Firestore document data.
final updateFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<UpdateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<UpdateFcmToken> updateFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    updateFcmTokenCollectionReference.doc(fcmTokenId);

/// Reference to the 'fcmTokens' collection with a converter for [DeleteFcmToken].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<DeleteFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific FcmToken document.
DocumentReference<DeleteFcmToken> deleteFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    deleteFcmTokenCollectionReference.doc(fcmTokenId);

sealed class BatchWriteFcmToken {
  const BatchWriteFcmToken();
}

final class BatchCreateFcmToken extends BatchWriteFcmToken {
  const BatchCreateFcmToken({
    required this.fcmTokenId,
    required this.createFcmToken,
  });

  final String fcmTokenId;

  final CreateFcmToken createFcmToken;
}

final class BatchUpdateFcmToken extends BatchWriteFcmToken {
  const BatchUpdateFcmToken({
    required this.fcmTokenId,
    required this.updateFcmToken,
  });

  final String fcmTokenId;

  final UpdateFcmToken updateFcmToken;
}

final class BatchDeleteFcmToken extends BatchWriteFcmToken {
  const BatchDeleteFcmToken({
    required this.fcmTokenId,
  });

  final String fcmTokenId;
}

/// A service class for managing fcmToken documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on fcmToken documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadFcmToken]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadFcmToken],
/// [CreateFcmToken], [UpdateFcmToken] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more fcmToken documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify fcmToken documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for fcmToken document operations.
class FcmTokenQuery {
  /// Fetches a list of [ReadFcmToken] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadFcmToken>> fetchDocuments({
    GetOptions? options,
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    int Function(ReadFcmToken lhs, ReadFcmToken rhs)? compare,
  }) async {
    Query<ReadFcmToken> query = readFcmTokenCollectionReference;
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

  /// Subscribes to a stream of [ReadFcmToken] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadFcmToken] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadFcmToken>> subscribeDocuments({
    Query<ReadFcmToken>? Function(Query<ReadFcmToken> query)? queryBuilder,
    int Function(ReadFcmToken lhs, ReadFcmToken rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadFcmToken> query = readFcmTokenCollectionReference;
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

  /// Fetches a single [ReadFcmToken] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [fcmTokenId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadFcmToken?> fetchDocument({
    required String fcmTokenId,
    GetOptions? options,
  }) async {
    final ds = await readFcmTokenDocumentReference(
      fcmTokenId: fcmTokenId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadFcmToken] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadFcmToken] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadFcmToken?> subscribeDocument({
    required String fcmTokenId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readFcmTokenDocumentReference(
      fcmTokenId: fcmTokenId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [fcmToken] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createFcmToken] data.
  Future<DocumentReference<CreateFcmToken>> add({
    required CreateFcmToken createFcmToken,
  }) =>
      createFcmTokenCollectionReference.add(createFcmToken);

  /// Sets a [fcmToken] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateFcmToken] data.
  Future<void> set({
    required String fcmTokenId,
    required CreateFcmToken createFcmToken,
    SetOptions? options,
  }) =>
      createFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).set(createFcmToken, options);

  /// Updates a fcmToken document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [fcmTokenId] with the
  /// provided [updateFcmToken] data.
  /// The update is based on the structure defined in `UpdateFcmToken.toJson()`.
  Future<void> update({
    required String fcmTokenId,
    required UpdateFcmToken updateFcmToken,
  }) =>
      updateFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).update(updateFcmToken.toJson());

  /// Deletes a [fcmToken] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [fcmTokenId].
  Future<void> delete({
    required String fcmTokenId,
  }) =>
      deleteFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).delete();

  Future<void> batchWrite(List<BatchWriteFcmToken> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateFcmToken(
            fcmTokenId: final fcmTokenId,
            createFcmToken: final createFcmToken,
          ):
          batch.set(
            createFcmTokenDocumentReference(
              fcmTokenId: fcmTokenId,
            ),
            createFcmToken,
          );
        case BatchUpdateFcmToken(
            fcmTokenId: final fcmTokenId,
            updateFcmToken: final updateFcmToken,
          ):
          batch.update(
            updateFcmTokenDocumentReference(
              fcmTokenId: fcmTokenId,
            ),
            updateFcmToken.toJson(),
          );
        case BatchDeleteFcmToken(fcmTokenId: final fcmTokenId):
          batch.delete(deleteFcmTokenDocumentReference(
            fcmTokenId: fcmTokenId,
          ));
      }
    }
    return batch.commit();
  }
}
