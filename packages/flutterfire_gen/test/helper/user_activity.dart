import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'user_activity.flutterfire_gen.dart';

@FirestoreDocument(path: 'users/{userId}/activities/{activityId}')
class UserActivity {
  const UserActivity({
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;

  final DateTime createdAt;

  final DateTime updatedAt;
}
