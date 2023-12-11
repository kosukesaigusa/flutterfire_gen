// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadUser {
  const ReadUser({
    required this.name,
    required this.age,
    required this.userId,
    required this.path,
    required this.userReference,
  });

  final String name;

  final int age;

  final String userId;

  final String path;

  final DocumentReference<ReadUser> userReference;

  factory ReadUser.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadUser(
      name: extendedJson['name'] as String,
      age: extendedJson['age'] as int,
      userId: extendedJson['userId'] as String,
      path: extendedJson['path'] as String,
      userReference:
          extendedJson['userReference'] as DocumentReference<ReadUser>,
    );
  }

  factory ReadUser.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadUser.fromJson(<String, dynamic>{
      ...data,
      'userId': ds.id,
      'path': ds.reference.path,
      'userReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadUser.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadUser copyWith({
    String? name,
    int? age,
    String? userId,
    String? path,
    DocumentReference<ReadUser>? userReference,
  }) {
    return ReadUser(
      name: name ?? this.name,
      age: age ?? this.age,
      userId: userId ?? this.userId,
      path: path ?? this.path,
      userReference: userReference ?? this.userReference,
    );
  }
}

class CreateUser {
  const CreateUser({
    required this.name,
    required this.age,
  });

  final String name;
  final int age;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'name': name,
      'age': age,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class UpdateUser {
  const UpdateUser({
    this.name,
    this.age,
  });

  final String? name;
  final int? age;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (name != null) 'name': name,
      if (age != null) 'age': age,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteUser {}

/// Provides a reference to the users collection for reading.
final readUserCollectionReference =
    FirebaseFirestore.instance.collection('users').withConverter<ReadUser>(
          fromFirestore: (ds, _) => ReadUser.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Provides a reference to a user document for reading.
DocumentReference<ReadUser> readUserDocumentReference({
  required String userId,
}) =>
    readUserCollectionReference.doc(userId);

/// Provides a reference to the users collection for creating.
final createUserCollectionReference =
    FirebaseFirestore.instance.collection('users').withConverter<CreateUser>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Provides a reference to a user document for creating.
DocumentReference<CreateUser> createUserDocumentReference({
  required String userId,
}) =>
    createUserCollectionReference.doc(userId);

/// Provides a reference to the users collection for updating.
final updateUserCollectionReference =
    FirebaseFirestore.instance.collection('users').withConverter<UpdateUser>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Provides a reference to a user document for updating.
DocumentReference<UpdateUser> updateUserDocumentReference({
  required String userId,
}) =>
    updateUserCollectionReference.doc(userId);

/// Provides a reference to the users collection for deleting.
final deleteUserCollectionReference =
    FirebaseFirestore.instance.collection('users').withConverter<DeleteUser>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Provides a reference to a user document for deleting.
DocumentReference<DeleteUser> deleteUserDocumentReference({
  required String userId,
}) =>
    deleteUserCollectionReference.doc(userId);

/// Manages queries against the users collection.
class UserQuery {
  /// Fetches [ReadUser] documents.
  Future<List<ReadUser>> fetchDocuments({
    GetOptions? options,
    Query<ReadUser>? Function(Query<ReadUser> query)? queryBuilder,
    int Function(ReadUser lhs, ReadUser rhs)? compare,
  }) async {
    Query<ReadUser> query = readUserCollectionReference;
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

  /// Subscribes [User] documents.
  Stream<List<ReadUser>> subscribeDocuments({
    Query<ReadUser>? Function(Query<ReadUser> query)? queryBuilder,
    int Function(ReadUser lhs, ReadUser rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadUser> query = readUserCollectionReference;
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

  /// Fetches a specific [ReadUser] document.
  Future<ReadUser?> fetchDocument({
    required String userId,
    GetOptions? options,
  }) async {
    final ds = await readUserDocumentReference(
      userId: userId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [User] document.
  Stream<ReadUser?> subscribeDocument({
    required String userId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readUserDocumentReference(
      userId: userId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [User] document.
  Future<DocumentReference<CreateUser>> add({
    required CreateUser createUser,
  }) =>
      createUserCollectionReference.add(createUser);

  /// Sets a [User] document.
  Future<void> set({
    required String userId,
    required CreateUser createUser,
    SetOptions? options,
  }) =>
      createUserDocumentReference(
        userId: userId,
      ).set(createUser, options);

  /// Updates a specific [User] document.
  Future<void> update({
    required String userId,
    required UpdateUser updateUser,
  }) =>
      updateUserDocumentReference(
        userId: userId,
      ).update(updateUser.toJson());

  /// Deletes a specific [User] document.
  Future<void> delete({
    required String userId,
  }) =>
      deleteUserDocumentReference(
        userId: userId,
      ).delete();
}
