import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:flutterfire_gen_utils/flutterfire_gen_utils.dart';

part 'app_user_post.flutterfire_gen.dart';

@FirestoreDocument(path: 'appUsers/{appUserId}/appUserPosts/{appUserPostId}')
class AppUserPost {
  AppUserPost({
    required this.content,
    required this.numbers,
    this.updatedAt,
  });

  @ReadDefault('')
  final String content;

  @ReadDefault(<int>[])
  @allowFieldValue
  final List<int> numbers;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
