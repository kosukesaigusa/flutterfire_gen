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

class DeleteChatMessage {}

/// Provides a reference to the chatMessages collection for reading.
CollectionReference<ReadChatMessage> readChatMessageCollectionReference({
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

/// Provides a reference to a chatMessage document for reading.
DocumentReference<ReadChatMessage> readChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    readChatMessageCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Provides a reference to the chatMessages collection for creating.
CollectionReference<CreateChatMessage> createChatMessageCollectionReference({
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

/// Provides a reference to a chatMessage document for creating.
DocumentReference<CreateChatMessage> createChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    createChatMessageCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Provides a reference to the chatMessages collection for updating.
CollectionReference<UpdateChatMessage> updateChatMessageCollectionReference({
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

/// Provides a reference to a chatMessage document for updating.
DocumentReference<UpdateChatMessage> updateChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    updateChatMessageCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Provides a reference to the chatMessages collection for deleting.
CollectionReference<DeleteChatMessage> deleteChatMessageCollectionReference({
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

/// Provides a reference to a chatMessage document for deleting.
DocumentReference<DeleteChatMessage> deleteChatMessageDocumentReference({
  required String chatRoomId,
  required String chatMessageId,
}) =>
    deleteChatMessageCollectionReference(
      chatRoomId: chatRoomId,
    ).doc(chatMessageId);

/// Manages queries against the chatMessages collection.
class ChatMessageQuery {
  /// Fetches [ReadChatMessage] documents.
  Future<List<ReadChatMessage>> fetchDocuments({
    required String chatRoomId,
    GetOptions? options,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    int Function(ReadChatMessage lhs, ReadChatMessage rhs)? compare,
  }) async {
    Query<ReadChatMessage> query = readChatMessageCollectionReference(
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

  /// Subscribes [ChatMessage] documents.
  Stream<List<ReadChatMessage>> subscribeDocuments({
    required String chatRoomId,
    Query<ReadChatMessage>? Function(Query<ReadChatMessage> query)?
        queryBuilder,
    int Function(ReadChatMessage lhs, ReadChatMessage rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadChatMessage> query = readChatMessageCollectionReference(
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

  /// Fetches a specific [ReadChatMessage] document.
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

  /// Subscribes a specific [ChatMessage] document.
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

  /// Adds a [ChatMessage] document.
  Future<DocumentReference<CreateChatMessage>> add({
    required String chatRoomId,
    required CreateChatMessage createChatMessage,
  }) =>
      createChatMessageCollectionReference(
        chatRoomId: chatRoomId,
      ).add(createChatMessage);

  /// Sets a [ChatMessage] document.
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

  /// Updates a specific [ChatMessage] document.
  Future<void> update({
    required String chatRoomId,
    required String chatMessageId,
    required UpdateChatMessage updateChatMessage,
  }) =>
      updateChatMessageDocumentReference(
        chatRoomId: chatRoomId,
        chatMessageId: chatMessageId,
      ).update(updateChatMessage.toJson());

  /// Deletes a specific [ChatMessage] document.
  Future<void> delete({
    required String chatRoomId,
    required String chatMessageId,
  }) =>
      deleteChatMessageDocumentReference(
        chatRoomId: chatRoomId,
        chatMessageId: chatMessageId,
      ).delete();
}
