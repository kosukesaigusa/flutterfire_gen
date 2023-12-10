import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'read_status.flutterfire_gen.dart';

@FirestoreDocument(
  path: 'chatRooms/{chatRoomId}/readStatuses',
  documentName: 'readStatus',
)
class ReadStatus {
  const ReadStatus({
    this.lastReadAt,
  });

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? lastReadAt;
}
