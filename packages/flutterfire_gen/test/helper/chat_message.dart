import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_message.flutterfire_gen.dart';

@FirestoreDocument(path: 'chatRooms/{chatRoomId}/chatMessages/{chatMessageId}')
class ChatMessage {
  const ChatMessage({
    required this.senderId,
    required this.map,
    required this.nestedMap,
    required this.deeplyNestedMap,
    required this.chatMessageType,
    required this.content,
    required this.imageUrls,
    required this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  final String senderId;

  @ReadDefault(<String, dynamic>{})
  final Map<String, dynamic> map;

  final Map<String, Map<String, String>> nestedMap;

  final Map<String, Map<int, List<Map<String, Map<String, dynamic>>>>>
      deeplyNestedMap;

  @_chatMessageTypeConverter
  final ChatMessageType chatMessageType;

  @ReadDefault('')
  final String content;

  @ReadDefault(<String>[])
  @CreateDefault(<String>[])
  final List<String> imageUrls;

  @ReadDefault(false)
  @CreateDefault(false)
  final bool isDeleted;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}

enum ChatMessageType {
  worker,
  host,
  system,
  ;

  /// 与えられた文字列に対応する [ChatMessageType] を返す。
  factory ChatMessageType.fromString(String messageTypeString) {
    switch (messageTypeString) {
      case 'worker':
        return ChatMessageType.worker;
      case 'host':
        return ChatMessageType.host;
      case 'system':
        return ChatMessageType.system;
    }
    throw ArgumentError('メッセージ種別が正しくありません。');
  }
}

const _chatMessageTypeConverter = _ChatMessageTypeConverter();

class _ChatMessageTypeConverter
    implements JsonConverter<ChatMessageType, String> {
  const _ChatMessageTypeConverter();

  @override
  ChatMessageType fromJson(String json) => ChatMessageType.fromString(json);

  @override
  String toJson(ChatMessageType chatMessageType) => chatMessageType.name;
}
