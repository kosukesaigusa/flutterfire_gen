// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadChatMessage {
  const ReadChatMessage({
    required this.senderId,
    required this.map,
    required this.nestedMap,
    required this.deeplyNestedMap,
    required this.chatMessageType,
    required this.content,
    required this.imageUrls,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.chatMessageId,
    required this.path,
    required this.chatMessageReference,
  });

  final String senderId;

  final Map<String, dynamic> map;

  final Map<String, Map<String, String>> nestedMap;

  final Map<String, Map<int, List<Map<String, Map<String, dynamic>>>>>
      deeplyNestedMap;

  final ChatMessageType chatMessageType;

  final String content;

  final List<String> imageUrls;

  final bool isDeleted;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String chatMessageId;

  final String path;

  final DocumentReference<ReadChatMessage> chatMessageReference;

  factory ReadChatMessage.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadChatMessage(
      senderId: extendedJson['senderId'] as String,
      map: extendedJson['map'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
      nestedMap: (extendedJson['nestedMap'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(
              k,
              (v as Map<String, dynamic>)
                  .map((k, v) => MapEntry(k, v as String)))),
      deeplyNestedMap: (extendedJson['deeplyNestedMap'] as Map<String, dynamic>)
          .map((k, v) => MapEntry(
              k, v as Map<int, List<Map<String, Map<String, dynamic>>>>)),
      chatMessageType: _chatMessageTypeConverter
          .fromJson(extendedJson['chatMessageType'] as String),
      content: extendedJson['content'] as String? ?? '',
      imageUrls: (extendedJson['imageUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      isDeleted: extendedJson['isDeleted'] as bool? ?? false,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      chatMessageId: extendedJson['chatMessageId'] as String,
      path: extendedJson['path'] as String,
      chatMessageReference: extendedJson['chatMessageReference']
          as DocumentReference<ReadChatMessage>,
    );
  }

  factory ReadChatMessage.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadChatMessage.fromJson(<String, dynamic>{
      ...data,
      'chatMessageId': ds.id,
      'path': ds.reference.path,
      'chatMessageReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadChatMessage.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadChatMessage copyWith({
    String? senderId,
    Map<String, dynamic>? map,
    Map<String, Map<String, String>>? nestedMap,
    Map<String, Map<int, List<Map<String, Map<String, dynamic>>>>>?
        deeplyNestedMap,
    ChatMessageType? chatMessageType,
    String? content,
    List<String>? imageUrls,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? chatMessageId,
    String? path,
    DocumentReference<ReadChatMessage>? chatMessageReference,
  }) {
    return ReadChatMessage(
      senderId: senderId ?? this.senderId,
      map: map ?? this.map,
      nestedMap: nestedMap ?? this.nestedMap,
      deeplyNestedMap: deeplyNestedMap ?? this.deeplyNestedMap,
      chatMessageType: chatMessageType ?? this.chatMessageType,
      content: content ?? this.content,
      imageUrls: imageUrls ?? this.imageUrls,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      chatMessageId: chatMessageId ?? this.chatMessageId,
      path: path ?? this.path,
      chatMessageReference: chatMessageReference ?? this.chatMessageReference,
    );
  }
}

/// Represents the data structure for creating a new chatMessage document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new chatMessage document.
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateChatMessage {
  const CreateChatMessage({
    required this.senderId,
    required this.map,
    required this.nestedMap,
    required this.deeplyNestedMap,
    required this.chatMessageType,
    required this.content,
    this.imageUrls,
    this.isDeleted,
  });

  final String senderId;

  final Map<String, dynamic> map;

  final Map<String, Map<String, String>> nestedMap;

  final Map<String, Map<int, List<Map<String, Map<String, dynamic>>>>>
      deeplyNestedMap;

  final ChatMessageType chatMessageType;

  final String content;

  final List<String>? imageUrls;

  final bool? isDeleted;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'senderId': senderId,
      'map': map,
      'nestedMap': nestedMap,
      'deeplyNestedMap': deeplyNestedMap,
      'chatMessageType': _chatMessageTypeConverter.toJson(chatMessageType),
      'content': content,
      'imageUrls': imageUrls ?? const <String>[],
      'isDeleted': isDeleted ?? false,
      'createdAt': FieldValue.serverTimestamp(),
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

/// Represents the data structure for updating a chatMessage document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a chatMessage document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateChatMessage {
  const UpdateChatMessage({
    this.senderId,
    this.map,
    this.nestedMap,
    this.deeplyNestedMap,
    this.chatMessageType,
    this.content,
    this.imageUrls,
    this.isDeleted,
    this.createdAt,
  });

  final String? senderId;

  final Map<String, dynamic>? map;

  final Map<String, Map<String, String>>? nestedMap;

  final Map<String, Map<int, List<Map<String, Map<String, dynamic>>>>>?
      deeplyNestedMap;

  final ChatMessageType? chatMessageType;

  final String? content;

  final List<String>? imageUrls;

  final bool? isDeleted;

  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (senderId != null) 'senderId': senderId,
      if (map != null) 'map': map,
      if (nestedMap != null) 'nestedMap': nestedMap,
      if (deeplyNestedMap != null) 'deeplyNestedMap': deeplyNestedMap,
      if (chatMessageType != null)
        'chatMessageType': _chatMessageTypeConverter.toJson(chatMessageType!),
      if (content != null) 'content': content,
      if (imageUrls != null) 'imageUrls': imageUrls,
      if (isDeleted != null) 'isDeleted': isDeleted,
      if (createdAt != null)
        'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),
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

/// Represents the data structure for deleting a chatMessage document in Cloud Firestore.
class DeleteChatMessage {}

/// Reference to the 'chatMessages' collection with a converter for [ReadChatMessage].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadChatMessage] objects.
CollectionReference<ReadChatMessage> readChatMessagesCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('chatMessages')
        .withConverter<ReadChatMessage>(
          fromFirestore: (ds, _) => ReadChatMessage.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific ChatMessage document.
DocumentReference<ReadChatMessage> readChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    readChatMessagesCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Reference to the 'chatMessages' collection with a converter for [CreateChatMessage].
/// This enables type-safe create operations in Firestore, converting
/// [CreateChatMessage] objects to Firestore document data.
CollectionReference<CreateChatMessage> createChatMessagesCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('chatMessages')
        .withConverter<CreateChatMessage>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific ChatMessage document.
DocumentReference<CreateChatMessage> createChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    createChatMessagesCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Reference to the 'chatMessages' collection with a converter for [UpdateChatMessage].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateChatMessage] objects to Firestore document data.
CollectionReference<UpdateChatMessage> updateChatMessagesCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('chatMessages')
        .withConverter<UpdateChatMessage>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific ChatMessage document.
DocumentReference<UpdateChatMessage> updateChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    updateChatMessagesCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Reference to the 'chatMessages' collection with a converter for [DeleteChatMessage].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
CollectionReference<DeleteChatMessage> deleteChatMessagesCollectionReference({
  required String chatRoomId,
}) =>
    FirebaseFirestore.instance
        .collection('chatRooms')
        .doc(chatRoomId)
        .collection('chatMessages')
        .withConverter<DeleteChatMessage>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific ChatMessage document.
DocumentReference<DeleteChatMessage> deleteChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    deleteChatMessagesCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Reference to the 'chatMessages' collection group with a converter for [ReadChatMessage].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents from various paths in the 'chatMessages' collection group
/// into [ReadChatMessage] objects. It facilitates unified handling of 'chatMessages' documents
/// scattered across different locations in Firestore, ensuring consistent
/// data structure and manipulation.
final readChatMessagesCollectionGroupReference = FirebaseFirestore.instance
    .collectionGroup('chatMessages')
    .withConverter<ReadChatMessage>(
      fromFirestore: (ds, _) => ReadChatMessage.fromDocumentSnapshot(ds),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting chatMessage documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteChatMessage {
  const BatchWriteChatMessage();
}

/// Represents a batch operation for creating a chatMessage document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new chatMessage documents. It encapsulates the ID of the new chatMessage document
/// and the data required for creation.
final class BatchCreateChatMessage extends BatchWriteChatMessage {
  const BatchCreateChatMessage({
    required this.chatRoomId,
    required this.chatMessageId,
    required this.createChatMessage,
  });

  final String chatRoomId;

  final String chatMessageId;

  final CreateChatMessage createChatMessage;
}

/// Represents a batch operation for updating an existing chatMessage document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing chatMessage documents. It includes the chatMessage document's ID
/// and the data for the update.
final class BatchUpdateChatMessage extends BatchWriteChatMessage {
  const BatchUpdateChatMessage({
    required this.chatRoomId,
    required this.chatMessageId,
    required this.updateChatMessage,
  });

  final String chatRoomId;

  final String chatMessageId;

  final UpdateChatMessage updateChatMessage;
}

// Represents a batch operation for deleting a chatMessage document in Firestore.
///
/// Used in a batch write to Firestore for deleting a chatMessage document. This class
/// only requires the ID of the chatMessage document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteChatMessage extends BatchWriteChatMessage {
  const BatchDeleteChatMessage({
    required this.chatRoomId,
    required this.chatMessageId,
  });

  final String chatRoomId;

  final String chatMessageId;
}

/// A service class for managing chatMessage documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on chatMessage documents, along with additional utilities like counting
/// documents, and calculating sum and average values for specific fields.
///
/// It includes methods to:
///
/// - Fetch single or multiple [ReadChatMessage] documents ([fetchDocuments], [fetchDocument]).
/// - Subscribe to real-time updates of single or multiple [ReadChatMessage] documents ([subscribeDocuments], [subscribeDocument]).
/// - Count documents based on queries ([count]).
/// - Calculate sum ([getSum]) and average ([getAverage]) of specific fields across documents.
/// - Add ([add]), set ([set]), update ([update]), and delete ([delete]) chatMessage documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadChatMessage],
/// [CreateChatMessage], [UpdateChatMessage] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to chatMessage documents, or to count them, use the corresponding fetch, subscribe, and count methods.
/// - To modify chatMessage documents, use the methods for adding, setting, updating, or deleting.
/// - To perform aggregate calculations like sum and average, use [getSum] and [getAverage].
///
/// This class abstracts the complexities of direct Firestore usage and provides
/// a straightforward API for chatMessage document operations.
class ChatMessageQuery {
  /// Fetches a list of [ReadChatMessage] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given. You can customize the query by using the
  /// [queryBuilder] and control the source of the documents with [options].
  /// The [asCollectionGroup] parameter determines whether to fetch documents
  /// from the 'chatMessages' collection directly (false) or as a collection group across
  /// different Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [options] Optional [GetOptions] to define the source of the documents (server, cache).
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadChatMessage documents.
  /// - [asCollectionGroup] Fetch the 'chatMessages' as a collection group if true.
  ///
  /// Returns a list of [ReadChatMessage] documents.
  Future<List<ReadChatMessage>> fetchDocuments({
    required String chatRoomId,
    GetOptions? options,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    int Function(ReadChatMessage lhs, ReadChatMessage rhs)? compare,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadChatMessage> query = asCollectionGroup
        ? readChatMessagesCollectionGroupReference
        : readChatMessagesCollectionReference(
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

  /// Subscribes to a stream of [ReadChatMessage] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadChatMessage] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  /// The [asCollectionGroup] parameter determines whether to query the 'chatMessages'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [compare] Optional function to sort the ReadChatMessage documents.
  /// - [includeMetadataChanges] Include metadata changes in the stream.
  /// - [excludePendingWrites] Exclude documents with pending writes from the stream.
  /// - [asCollectionGroup] Query the 'chatMessages' as a collection group if true.
  Stream<List<ReadChatMessage>> subscribeDocuments({
    required String chatRoomId,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    int Function(ReadChatMessage lhs, ReadChatMessage rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
    bool asCollectionGroup = false,
  }) {
    Query<ReadChatMessage> query = asCollectionGroup
        ? readChatMessagesCollectionGroupReference
        : readChatMessagesCollectionReference(
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

  /// Counts the number of chatMessage documents in Cloud Firestore.
  ///
  /// This method returns the count of documents based on the provided query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to count documents
  /// in the 'chatMessages' collection directly (false) or across various Firestore
  /// paths as a collection group (true). The [source] parameter allows you to
  /// specify whether to count documents from the server or the local cache.
  ///
  /// Parameters:
  ///
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [source] Source of the count, either from the server or local cache.
  /// - [asCollectionGroup] Count the 'chatMessages' as a collection group if true.
  ///
  /// Returns the count of documents as an integer.
  Future<int?> count({
    required String chatRoomId,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadChatMessage> query = asCollectionGroup
        ? readChatMessagesCollectionGroupReference
        : readChatMessagesCollectionReference(
            chatRoomId: chatRoomId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.count();
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.count;
  }

  /// Returns the sum of the values of the documents that match the query.
  ///
  /// This method returns the sum of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'chatMessages'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to sum over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'chatMessages' as a collection group if true.
  ///
  /// Returns the sum of the values of the documents that match the query.
  Future<double?> getSum({
    required String field,
    required String chatRoomId,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadChatMessage> query = asCollectionGroup
        ? readChatMessagesCollectionGroupReference
        : readChatMessagesCollectionReference(
            chatRoomId: chatRoomId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(sum(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getSum(field);
  }

  /// Returns the average of the values of the documents that match the query.
  ///
  /// This method returns the average of the values of the documents that match the query.
  /// You can customize the query by using the [queryBuilder].
  /// The [asCollectionGroup] parameter determines whether to query the 'chatMessages'
  /// collection directly (false) or as a collection group across different
  /// Firestore paths (true).
  ///
  /// Parameters:
  ///
  /// - [field] The field to average over.
  /// - [queryBuilder] Optional function to build and customize the Firestore query.
  /// - [asCollectionGroup] Query the 'chatMessages' as a collection group if true.
  ///
  /// Returns the average of the values of the documents that match the query.
  Future<double?> getAverage({
    required String field,
    required String chatRoomId,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    AggregateSource source = AggregateSource.server,
    bool asCollectionGroup = false,
  }) async {
    Query<ReadChatMessage> query = asCollectionGroup
        ? readChatMessagesCollectionGroupReference
        : readChatMessagesCollectionReference(
            chatRoomId: chatRoomId,
          );
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.aggregate(average(field));
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.getAverage(field);
  }

  /// Fetches a single [ReadChatMessage] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [chatMessageId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadChatMessage?> fetchDocument({
    required String chatRoomId,
    required String chatMessageId,
    GetOptions? options,
  }) async {
    final ds = await readChatMessageDocumentReference(
      chatRoomId: chatRoomId,
      chatMessageId: chatMessageId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadChatMessage] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadChatMessage] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadChatMessage?> subscribeDocument({
    required String chatRoomId,
    required String chatMessageId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readChatMessageDocumentReference(
      chatRoomId: chatRoomId,
      chatMessageId: chatMessageId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a chatMessage document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createChatMessage] data.
  Future<DocumentReference<CreateChatMessage>> add({
    required String chatRoomId,
    required CreateChatMessage createChatMessage,
  }) =>
      createChatMessagesCollectionReference(
        chatRoomId: chatRoomId,
      ).add(createChatMessage);

  /// Sets a chatMessage document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createChatMessage] data.
  Future<void> set({
    required String chatRoomId,
    required String chatMessageId,
    required CreateChatMessage createChatMessage,
    SetOptions? options,
  }) =>
      createChatMessageDocumentReference(
        chatRoomId: chatRoomId,
        chatMessageId: chatMessageId,
      ).set(createChatMessage, options);

  /// Updates a chatMessage document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [chatMessageId] with the
  /// provided [updateChatMessage] data.
  /// The update is based on the structure defined in `UpdateChatMessage.toJson()`.
  Future<void> update({
    required String chatRoomId,
    required String chatMessageId,
    required UpdateChatMessage updateChatMessage,
  }) =>
      updateChatMessageDocumentReference(
        chatRoomId: chatRoomId,
        chatMessageId: chatMessageId,
      ).update(updateChatMessage.toJson());

  /// Deletes a chatMessage document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [chatMessageId].
  Future<void> delete({
    required String chatRoomId,
    required String chatMessageId,
  }) =>
      deleteChatMessageDocumentReference(
        chatRoomId: chatRoomId,
        chatMessageId: chatMessageId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteChatMessage] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteChatMessage] objects, each representing a specific
  /// write operation (create, update, or delete) for ChatMessage documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateChatMessage].
  /// - Updating existing documents for tasks of type [BatchUpdateChatMessage].
  /// - Deleting documents for tasks of type [BatchDeleteChatMessage].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteChatMessage> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateChatMessage(
            chatRoomId: final chatRoomId,
            chatMessageId: final chatMessageId,
            createChatMessage: final createChatMessage,
          ):
          batch.set(
            createChatMessageDocumentReference(
              chatRoomId: chatRoomId,
              chatMessageId: chatMessageId,
            ),
            createChatMessage,
          );
        case BatchUpdateChatMessage(
            chatRoomId: final chatRoomId,
            chatMessageId: final chatMessageId,
            updateChatMessage: final updateChatMessage,
          ):
          batch.update(
            updateChatMessageDocumentReference(
              chatRoomId: chatRoomId,
              chatMessageId: chatMessageId,
            ),
            updateChatMessage.toJson(),
          );
        case BatchDeleteChatMessage(
            chatRoomId: final chatRoomId,
            chatMessageId: final chatMessageId
          ):
          batch.delete(deleteChatMessageDocumentReference(
            chatRoomId: chatRoomId,
            chatMessageId: chatMessageId,
          ));
      }
    }
    return batch.commit();
  }
}
