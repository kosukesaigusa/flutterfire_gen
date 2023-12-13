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

/// Provides a reference to the fcmTokens collection for reading.
final readFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<ReadFcmToken>(
      fromFirestore: (ds, _) => ReadFcmToken.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Provides a reference to a fcmToken document for reading.
DocumentReference<ReadFcmToken> readFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    readFcmTokenCollectionReference.doc(fcmTokenId);

/// Provides a reference to the fcmTokens collection for creating.
final createFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<CreateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Provides a reference to a fcmToken document for creating.
DocumentReference<CreateFcmToken> createFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    createFcmTokenCollectionReference.doc(fcmTokenId);

/// Provides a reference to the fcmTokens collection for updating.
final updateFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<UpdateFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Provides a reference to a fcmToken document for updating.
DocumentReference<UpdateFcmToken> updateFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    updateFcmTokenCollectionReference.doc(fcmTokenId);

/// Provides a reference to the fcmTokens collection for deleting.
final deleteFcmTokenCollectionReference = FirebaseFirestore.instance
    .collection('fcmTokens')
    .withConverter<DeleteFcmToken>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Provides a reference to a fcmToken document for deleting.
DocumentReference<DeleteFcmToken> deleteFcmTokenDocumentReference({
  required String fcmTokenId,
}) =>
    deleteFcmTokenCollectionReference.doc(fcmTokenId);

/// Manages queries against the fcmTokens collection.
class FcmTokenQuery {
  /// Fetches [ReadFcmToken] documents.
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

  /// Subscribes [FcmToken] documents.
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

  /// Fetches a specific [ReadFcmToken] document.
  Future<ReadFcmToken?> fetchDocument({
    required String fcmTokenId,
    GetOptions? options,
  }) async {
    final ds = await readFcmTokenDocumentReference(
      fcmTokenId: fcmTokenId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [FcmToken] document.
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

  /// Adds a [FcmToken] document.
  Future<DocumentReference<CreateFcmToken>> add({
    required CreateFcmToken createFcmToken,
  }) =>
      createFcmTokenCollectionReference.add(createFcmToken);

  /// Sets a [FcmToken] document.
  Future<void> set({
    required String fcmTokenId,
    required CreateFcmToken createFcmToken,
    SetOptions? options,
  }) =>
      createFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).set(createFcmToken, options);

  /// Updates a specific [FcmToken] document.
  Future<void> update({
    required String fcmTokenId,
    required UpdateFcmToken updateFcmToken,
  }) =>
      updateFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).update(updateFcmToken.toJson());

  /// Deletes a specific [FcmToken] document.
  Future<void> delete({
    required String fcmTokenId,
  }) =>
      deleteFcmTokenDocumentReference(
        fcmTokenId: fcmTokenId,
      ).delete();
}
