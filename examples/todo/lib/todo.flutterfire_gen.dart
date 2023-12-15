// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadTodo {
  const ReadTodo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
    required this.todoId,
    required this.path,
    required this.todoReference,
  });

  final String title;

  final bool isCompleted;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  final String todoId;

  final String path;

  final DocumentReference<ReadTodo> todoReference;

  factory ReadTodo.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadTodo(
      title: extendedJson['title'] as String,
      isCompleted: extendedJson['isCompleted'] as bool? ?? false,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      todoId: extendedJson['todoId'] as String,
      path: extendedJson['path'] as String,
      todoReference:
          extendedJson['todoReference'] as DocumentReference<ReadTodo>,
    );
  }

  factory ReadTodo.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadTodo.fromJson(<String, dynamic>{
      ...data,
      'todoId': ds.id,
      'path': ds.reference.path,
      'todoReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadTodo.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadTodo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? todoId,
    String? path,
    DocumentReference<ReadTodo>? todoReference,
  }) {
    return ReadTodo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      todoId: todoId ?? this.todoId,
      path: path ?? this.path,
      todoReference: todoReference ?? this.todoReference,
    );
  }
}

/// Represents the data structure for creating a new todo document in Cloud Firestore.
///
/// This class is used to define the necessary data for creating a new todo document.
/// `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields are
/// automatically set to the server's timestamp.
class CreateTodo {
  const CreateTodo({
    required this.title,
    this.isCompleted,
  });

  final String title;
  final bool? isCompleted;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'title': title,
      'isCompleted': isCompleted ?? false,
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

/// Represents the data structure for updating a todo document in Cloud Firestore.
///
/// This class provides a way to specify which fields of a todo document should
/// be updated. Fields set to `null` will not be updated. It also automatically
/// sets the `@alwaysUseFieldValueServerTimestampWhenUpdating` annotated fields
/// to the server's timestamp upon updating.
class UpdateTodo {
  const UpdateTodo({
    this.title,
    this.isCompleted,
    this.createdAt,
  });

  final String? title;
  final bool? isCompleted;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (title != null) 'title': title,
      if (isCompleted != null) 'isCompleted': isCompleted,
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

class DeleteTodo {}

/// Reference to the 'todos' collection with a converter for [ReadTodo].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadTodo] objects.
final readTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<ReadTodo>(
          fromFirestore: (ds, _) => ReadTodo.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<ReadTodo> readTodoDocumentReference({
  required String todoId,
}) =>
    readTodoCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [CreateTodo].
/// This enables type-safe create operations in Firestore, converting
/// [CreateTodo] objects to Firestore document data.
final createTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<CreateTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<CreateTodo> createTodoDocumentReference({
  required String todoId,
}) =>
    createTodoCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [UpdateTodo].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateTodo] objects to Firestore document data.
final updateTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<UpdateTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<UpdateTodo> updateTodoDocumentReference({
  required String todoId,
}) =>
    updateTodoCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [DeleteTodo].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteTodoCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<DeleteTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<DeleteTodo> deleteTodoDocumentReference({
  required String todoId,
}) =>
    deleteTodoCollectionReference.doc(todoId);

/// A service class for managing todo documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on todo documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadTodo]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadTodo],
/// [CreateTodo], [UpdateTodo] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more todo documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify todo documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for todo document operations.
class TodoQuery {
  /// Fetches a list of [ReadTodo] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<ReadTodo>> fetchDocuments({
    GetOptions? options,
    Query<ReadTodo>? Function(Query<ReadTodo> query)? queryBuilder,
    int Function(ReadTodo lhs, ReadTodo rhs)? compare,
  }) async {
    Query<ReadTodo> query = readTodoCollectionReference;
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

  /// Subscribes to a stream of [ReadTodo] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadTodo] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<ReadTodo>> subscribeDocuments({
    Query<ReadTodo>? Function(Query<ReadTodo> query)? queryBuilder,
    int Function(ReadTodo lhs, ReadTodo rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadTodo> query = readTodoCollectionReference;
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

  /// Fetches a single [ReadTodo] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [todoId].
  /// You can control the data retrieval with [GetOptions].
  Future<ReadTodo?> fetchDocument({
    required String todoId,
    GetOptions? options,
  }) async {
    final ds = await readTodoDocumentReference(
      todoId: todoId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadTodo] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadTodo] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<ReadTodo?> subscribeDocument({
    required String todoId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readTodoDocumentReference(
      todoId: todoId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [todo] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createTodo] data.
  Future<DocumentReference<CreateTodo>> add({
    required CreateTodo createTodo,
  }) =>
      createTodoCollectionReference.add(createTodo);

  /// Sets a [todo] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateTodo] data.
  Future<void> set({
    required String todoId,
    required CreateTodo createTodo,
    SetOptions? options,
  }) =>
      createTodoDocumentReference(
        todoId: todoId,
      ).set(createTodo, options);

  /// Updates a todo document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [todoId] with the
  /// provided [updateTodo] data.
  /// The update is based on the structure defined in `UpdateTodo.toJson()`.
  Future<void> update({
    required String todoId,
    required UpdateTodo updateTodo,
  }) =>
      updateTodoDocumentReference(
        todoId: todoId,
      ).update(updateTodo.toJson());

  /// Deletes a [todo] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [todoId].
  Future<void> delete({
    required String todoId,
  }) =>
      deleteTodoDocumentReference(
        todoId: todoId,
      ).delete();
}
