import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'app_user_post_like.flutterfire_gen.dart';

@FirestoreDocument(
  path: 'appUsers/{appUserId}/appUserPosts/{appUserPostId}/appUserPostLikes',
  documentName: 'appUserPostLike',
)
class AppUserPostLike {
  AppUserPostLike({
    required this.likedByAppUserId,
    this.likedAt,
    this.updatedAt,
  });

  final String likedByAppUserId;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? likedAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
