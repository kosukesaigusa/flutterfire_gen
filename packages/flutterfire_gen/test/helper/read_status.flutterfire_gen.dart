// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_status.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadReadStatus {
  const ReadReadStatus({
    required this.lastReadAt,
    required this.readStatusId,
    required this.path,
    required this.readStatusReference,
  });

  final DateTime? lastReadAt;

  final String readStatusId;

  final String path;

  final DocumentReference<ReadReadStatus> readStatusReference;

  factory ReadReadStatus.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadReadStatus(
      lastReadAt: (extendedJson['lastReadAt'] as Timestamp?)?.toDate(),
      readStatusId: extendedJson['readStatusId'] as String,
      path: extendedJson['path'] as String,
      readStatusReference: extendedJson['readStatusReference']
          as DocumentReference<ReadReadStatus>,
    );
  }

  factory ReadReadStatus.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadReadStatus.fromJson(<String, dynamic>{
      ...data,
      'readStatusId': ds.id,
      'path': ds.reference.path,
      'readStatusReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadReadStatus.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadReadStatus copyWith({
    DateTime? lastReadAt,
    String? readStatusId,
    String? path,
    DocumentReference<ReadReadStatus>? readStatusReference,
  }) {
    return ReadReadStatus(
      lastReadAt: lastReadAt ?? this.lastReadAt,
      readStatusId: readStatusId ?? this.readStatusId,
      path: path ?? this.path,
      readStatusReference: readStatusReference ?? this.readStatusReference,
    );
  }
}

/// Represents the data structure for creating a new readStatus document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new readStatus document.
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
/// automatically set to the server's timestamp.
class CreateReadStatus {
  const CreateReadStatus();

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'lastReadAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

/// Represents the data structure for updating a readStatus document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a readStatus document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateReadStatus {
  const UpdateReadStatus();

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'lastReadAt': FieldValue.serverTimestamp(),
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteReadStatus {}

/// Reference to the 'readStatuses' collection with a converter for [ReadReadStatus].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadReadStatus] objects.
CollectionReference<ReadReadStatus> readReadStatusCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('readStatuses')
        .withConverter<ReadReadStatus>(
          fromFirestore: (ds, _) => ReadReadStatus.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific ReadStatus document.
DocumentReference<ReadReadStatus> readReadStatusDocumentReference({
  required String chatRoomId,
  required String readStatusId,
}) =>
    readReadStatusCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(readStatusId);

/// Reference to the 'readStatuses' collection with a converter for [CreateReadStatus].
/// This enables type-safe create operations in Firestore, converting
/// [CreateReadStatus] objects to Firestore document data.
CollectionReference<CreateReadStatus> createReadStatusCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('readStatuses')
        .withConverter<CreateReadStatus>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific ReadStatus document.
DocumentReference<CreateReadStatus> createReadStatusDocumentReference({
  required String chatRoomId,
  required String readStatusId,
}) =>
    createReadStatusCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(readStatusId);

/// Reference to the 'readStatuses' collection with a converter for [UpdateReadStatus].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateReadStatus] objects to Firestore document data.
CollectionReference<UpdateReadStatus> updateReadStatusCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('readStatuses')
        .withConverter<UpdateReadStatus>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific ReadStatus document.
DocumentReference<UpdateReadStatus> updateReadStatusDocumentReference({
  required String chatRoomId,
  required String readStatusId,
}) =>
    updateReadStatusCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(readStatusId);

/// Reference to the 'readStatuses' collection with a converter for [DeleteReadStatus].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteReadStatus> deleteReadStatusCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('readStatuses')
        .withConverter<DeleteReadStatus>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific ReadStatus document.
DocumentReference<DeleteReadStatus> deleteReadStatusDocumentReference({
  required String chatRoomId,
  required String readStatusId,
}) =>
    deleteReadStatusCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(readStatusId);

/// A service class for managing readStatus documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on readStatus documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadReadStatus]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadReadStatus],
/// [CreateReadStatus], [UpdateReadStatus] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more readStatus documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify readStatus documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for readStatus document operations.
class ReadStatusQuery {
  /// Fetches a list of [ReadReadStatus] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadReadStatus>> fetchDocuments({
    required String chatRoomId,
    GetOptions? options,
    Query<ReadReadStatus>? Function(Query<ReadReadStatus> query)? queryBuilder,
    int Function(ReadReadStatus lhs, ReadReadStatus rhs)? compare,
  }) async {
    Query<ReadReadStatus> query = readReadStatusCollectionReference(
      chatRoomId: chatRoomId,
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

  /// Subscribes to a stream of [ReadReadStatus] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadReadStatus] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadReadStatus>> subscribeDocuments({
    required String chatRoomId,
    Query<ReadReadStatus>? Function(Query<ReadReadStatus> query)? queryBuilder,
    int Function(ReadReadStatus lhs, ReadReadStatus rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadReadStatus> query = readReadStatusCollectionReference(
      chatRoomId: chatRoomId,
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

  /// Fetches a single [ReadReadStatus] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [readStatusId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadReadStatus?> fetchDocument({
    required String chatRoomId,
    required String readStatusId,
    GetOptions? options,
  }) async {
    final ds = await readReadStatusDocumentReference(
      chatRoomId: chatRoomId,
      readStatusId: readStatusId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadReadStatus] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadReadStatus] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadReadStatus?> subscribeDocument({
    required String chatRoomId,
    required String readStatusId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readReadStatusDocumentReference(
      chatRoomId: chatRoomId,
      readStatusId: readStatusId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [readStatus] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createReadStatus] data.
  Future<DocumentReference<CreateReadStatus>> add({
    required String chatRoomId,
    required CreateReadStatus createReadStatus,
  }) =>
      createReadStatusCollectionReference(
        chatRoomId: chatRoomId,
      ).add(createReadStatus);

  /// Sets a [readStatus] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateReadStatus] data.
  Future<void> set({
    required String chatRoomId,
    required String readStatusId,
    required CreateReadStatus createReadStatus,
    SetOptions? options,
  }) =>
      createReadStatusDocumentReference(
        chatRoomId: chatRoomId,
        readStatusId: readStatusId,
      ).set(createReadStatus, options);

  /// Updates a readStatus document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [readStatusId] with the
  /// provided [updateReadStatus] data.
  /// The update is based on the structure defined in `UpdateReadStatus.toJson()`.
  Future<void> update({
    required String chatRoomId,
    required String readStatusId,
    required UpdateReadStatus updateReadStatus,
  }) =>
      updateReadStatusDocumentReference(
        chatRoomId: chatRoomId,
        readStatusId: readStatusId,
      ).update(updateReadStatus.toJson());

  /// Deletes a [readStatus] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [readStatusId].
  Future<void> delete({
    required String chatRoomId,
    required String readStatusId,
  }) =>
      deleteReadStatusDocumentReference(
        chatRoomId: chatRoomId,
        readStatusId: readStatusId,
      ).delete();
}
