import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user.flutterfire_gen.dart';
part 'user.g.dart';

@riverpod
Stream<ReadUser?> user(UserRef ref, String userId) {
  final query = ref.watch(userQueryProvider);
  return query.subscribeDocument(userId: userId);
}

@riverpod
UserQuery userQuery(UserQueryRef _) => UserQuery();

@FirestoreDocument(path: 'users/{userId}')
class User {
  const User({
    required this.name,
    required this.age,
  });

  final String name;

  final int age;
}
