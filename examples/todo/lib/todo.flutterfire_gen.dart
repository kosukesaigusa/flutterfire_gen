// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class Todo {
  const Todo({
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

  final DocumentReference<Todo> todoReference;

  factory Todo.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return Todo(
      title: extendedJson['title'] as String,
      isCompleted: extendedJson['isCompleted'] as bool? ?? false,
      createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (extendedJson['updatedAt'] as Timestamp?)?.toDate(),
      todoId: extendedJson['todoId'] as String,
      path: extendedJson['path'] as String,
      todoReference: extendedJson['todoReference'] as DocumentReference<Todo>,
    );
  }

  factory Todo.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return Todo.fromJson(<String, dynamic>{
      ...data,
      'todoId': ds.id,
      'path': ds.reference.path,
      'todoReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => Todo.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  Todo copyWith({
    String? title,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? todoId,
    String? path,
    DocumentReference<Todo>? todoReference,
  }) {
    return Todo(
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
/// `@alwaysUseFieldValueServerTimestampWhenCreating` annotated fields are
/// automatically set to the server's timestamp.
class CreateTodoData {
  const CreateTodoData({
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
class UpdateTodoData {
  const UpdateTodoData({
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

/// Represents the data structure for deleting a todo document in Cloud Firestore.
class DeleteTodo {}

/// Reference to the 'todos' collection with a converter for [Todo].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [Todo] objects.
final readTodosCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<Todo>(
          fromFirestore: (ds, _) => Todo.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<Todo> readTodoDocumentReference({
  required String todoId,
}) =>
    readTodosCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [CreateTodoData].
/// This enables type-safe create operations in Firestore, converting
/// [CreateTodoData] objects to Firestore document data.
final createTodosCollectionReference = FirebaseFirestore.instance
    .collection('todos')
    .withConverter<CreateTodoData>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<CreateTodoData> createTodoDocumentReference({
  required String todoId,
}) =>
    createTodosCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [UpdateTodoData].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateTodoData] objects to Firestore document data.
final updateTodosCollectionReference = FirebaseFirestore.instance
    .collection('todos')
    .withConverter<UpdateTodoData>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<UpdateTodoData> updateTodoDocumentReference({
  required String todoId,
}) =>
    updateTodosCollectionReference.doc(todoId);

/// Reference to the 'todos' collection with a converter for [DeleteTodo].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteTodosCollectionReference =
    FirebaseFirestore.instance.collection('todos').withConverter<DeleteTodo>(
          fromFirestore: (_, __) => throw UnimplementedError(),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Todo document.
DocumentReference<DeleteTodo> deleteTodoDocumentReference({
  required String todoId,
}) =>
    deleteTodosCollectionReference.doc(todoId);

/// A sealed class that serves as a base for representing batch write operations in Firestore.
///
/// This class is the abstract base for subclasses that define specific types
/// of batch operations, such as creating, updating, or deleting todo documents.
/// It is used as a part of a type hierarchy for batch operations and is not
/// intended for direct instantiation. Instead, it establishes a common
/// interface and structure for various types of batch write operations.
///
/// The use of a sealed class here ensures type safety and polymorphic handling
/// of different batch operation types, while allowing specific implementations
/// in the subclasses.
sealed class BatchWriteTodo {
  const BatchWriteTodo();
}

/// Represents a batch operation for creating a todo document in Firestore.
///
/// This class is used as part of a batch write to Firestore, specifically for
/// creating new todo documents. It encapsulates the ID of the new todo document
/// and the data required for creation.
final class BatchCreateTodo extends BatchWriteTodo {
  const BatchCreateTodo({
    required this.todoId,
    required this.createTodoData,
  });

  final String todoId;

  final CreateTodoData createTodoData;
}

/// Represents a batch operation for updating an existing todo document in Firestore.
///
/// This class is utilized in a batch write process to Firestore, allowing for
/// the update of existing todo documents. It includes the todo document's ID
/// and the data for the update.
final class BatchUpdateTodo extends BatchWriteTodo {
  const BatchUpdateTodo({
    required this.todoId,
    required this.updateTodoData,
  });

  final String todoId;

  final UpdateTodoData updateTodoData;
}

// Represents a batch operation for deleting a todo document in Firestore.
///
/// Used in a batch write to Firestore for deleting a todo document. This class
/// only requires the ID of the todo document to be deleted, as no additional
/// data is needed for deletion.
final class BatchDeleteTodo extends BatchWriteTodo {
  const BatchDeleteTodo({
    required this.todoId,
  });

  final String todoId;
}

/// A service class for managing todo documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on todo documents.
///
/// It includes methods to fetch and subscribe to single or multiple [Todo]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [Todo],
/// [CreateTodoData], [UpdateTodoData] are models representing the data.
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
  /// Fetches a list of [Todo] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the
  Future<List<Todo>> fetchDocuments({
    GetOptions? options,
    Query<Todo>? Function(Query<Todo> query)? queryBuilder,
    int Function(Todo lhs, Todo rhs)? compare,
  }) async {
    Query<Todo> query = readTodosCollectionReference;
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

  /// Subscribes to a stream of [Todo] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [Todo] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.
  Stream<List<Todo>> subscribeDocuments({
    Query<Todo>? Function(Query<Todo> query)? queryBuilder,
    int Function(Todo lhs, Todo rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<Todo> query = readTodosCollectionReference;
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

  /// Fetches a single [Todo] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [todoId].
  /// You can control the data retrieval with [GetOptions].
  Future<Todo?> fetchDocument({
    required String todoId,
    GetOptions? options,
  }) async {
    final ds = await readTodoDocumentReference(
      todoId: todoId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [Todo] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [Todo] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].
  Stream<Todo?> subscribeDocument({
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

  /// Adds a todo document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createTodo] data.
  Future<DocumentReference<CreateTodoData>> add({
    required CreateTodoData createTodoData,
  }) =>
      createTodosCollectionReference.add(createTodoData);

  /// Sets a todo document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createTodo] data.
  Future<void> set({
    required String todoId,
    required CreateTodoData createTodoData,
    SetOptions? options,
  }) =>
      createTodoDocumentReference(
        todoId: todoId,
      ).set(createTodoData, options);

  /// Updates a todo document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [todoId] with the
  /// provided [updateTodo] data.
  /// The update is based on the structure defined in `UpdateTodoData.toJson()`.
  Future<void> update({
    required String todoId,
    required UpdateTodoData updateTodoData,
  }) =>
      updateTodoDocumentReference(
        todoId: todoId,
      ).update(updateTodoData.toJson());

  /// Deletes a todo document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [todoId].
  Future<void> delete({
    required String todoId,
  }) =>
      deleteTodoDocumentReference(
        todoId: todoId,
      ).delete();

  /// Performs a batch write operation in Firestore using a list of [BatchWriteTodo] tasks.
  ///
  /// This function allows for executing multiple Firestore write operations (create, update, delete)
  /// as a single batch. This ensures that all operations either complete successfully or fail
  /// without applying any changes, providing atomicity.
  ///
  /// Parameters:
  ///
  /// - [batchWriteTasks] A list of [BatchWriteTodo] objects, each representing a specific
  /// write operation (create, update, or delete) for Todo documents.
  ///
  /// The function iterates over each task in [batchWriteTasks] and performs the corresponding
  /// Firestore operation. This includes:
  ///
  /// - Creating new documents for tasks of type [BatchCreateTodo].
  /// - Updating existing documents for tasks of type [BatchUpdateTodo].
  /// - Deleting documents for tasks of type [BatchDeleteTodo].
  ///
  /// Returns a `Future<void>` that completes when the batch operation is committed successfully.
  ///
  /// Throws:
  ///
  /// - Firestore exceptions if the batch commit fails or if there are issues with the individual
  /// operations within the batch.
  Future<void> batchWrite(List<BatchWriteTodo> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreateTodo(
            todoId: final todoId,
            createTodoData: final createTodoData,
          ):
          batch.set(
            createTodoDocumentReference(
              todoId: todoId,
            ),
            createTodoData,
          );
        case BatchUpdateTodo(
            todoId: final todoId,
            updateTodoData: final updateTodoData,
          ):
          batch.update(
            updateTodoDocumentReference(
              todoId: todoId,
            ),
            updateTodoData.toJson(),
          );
        case BatchDeleteTodo(todoId: final todoId):
          batch.delete(deleteTodoDocumentReference(
            todoId: todoId,
          ));
      }
    }
    return batch.commit();
  }
}
