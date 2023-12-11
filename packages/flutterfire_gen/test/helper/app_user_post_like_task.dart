import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'app_user_post_like_task.flutterfire_gen.dart';

@FirestoreDocument(path: 'appUserPostLikeTasks/{appUserPostLikeTaskId}')
class AppUserPostLikeTask {
  const AppUserPostLikeTask({
    required this.appUserId,
    required this.appUserPostId,
    required this.appUserPostLikeId,
  });

  @_AppUserIdRefJsonPostProcessor()
  final String appUserId;

  @_AppUserPostIdRefJsonPostProcessor()
  final String appUserPostId;

  final String appUserPostLikeId;
}

class _AppUserIdRefJsonPostProcessor
    implements JsonPostProcessor<String, DocumentReference> {
  const _AppUserIdRefJsonPostProcessor();

  @override
  String fromJson(Map<String, dynamic> json) {
    final appUserId = json['appUserId'] as String?;
    if (appUserId != null) {
      return appUserId;
    }
    final appUserRef = json['appUserRef'] as DocumentReference;
    return appUserRef.id;
  }

  @override
  ({String key, DocumentReference<Object?> value}) toJson(
    Map<String, dynamic> json,
  ) {
    final appUserRef = json['appUserRef'] as DocumentReference?;
    if (appUserRef != null) {
      return (key: 'appUserRef', value: appUserRef);
    }
    return (
      key: 'appUserRef',
      value: FirebaseFirestore.instance
          .collection('appUsers')
          .doc(json['appUserId'] as String),
    );
  }
}

class _AppUserPostIdRefJsonPostProcessor
    implements JsonPostProcessor<String, DocumentReference> {
  const _AppUserPostIdRefJsonPostProcessor();

  @override
  String fromJson(Map<String, dynamic> json) {
    final appUserPostId = json['appUserPostId'] as String?;
    if (appUserPostId != null) {
      return appUserPostId;
    }
    final appUserPostRef = json['appUserPostRef'] as DocumentReference;
    return appUserPostRef.id;
  }

  @override
  ({String key, DocumentReference<Object?> value}) toJson(
    Map<String, dynamic> json,
  ) {
    final appUserPostRef = json['appUserPostRef'] as DocumentReference?;
    if (appUserPostRef != null) {
      return (key: 'appUserPostRef', value: appUserPostRef);
    }
    return (
      key: 'appUserPostRef',
      value: FirebaseFirestore.instance
          .collection('appUsers')
          .doc(json['appUserId'] as String)
          .collection('appUserPosts')
          .doc(json['appUserPostId'] as String),
    );
  }
}
