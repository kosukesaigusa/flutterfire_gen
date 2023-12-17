# flutterfire_gen

[English](https://github.com/kosukesaigusa/flutterfire_gen/blob/main/packages/flutterfire_gen/README.md) | [日本語](https://github.com/kosukesaigusa/flutterfire_gen/blob/main/resources/translations/ja_JP/README.md)

flutterfire_gen is a code generation package for Cloud Firestore in Flutter.

## Motivation

By describing the schema of Cloud Firestore documents in Dart, flutterfire_gen can automatically generate boilerplate code that meets the following requirements:

- Generate the most suitable interfaces for read, create, update (and delete) operations.
- Produce type-safe methods for read, create, update, and delete.
- Set different default values for read, create, and update operations.
- Automatically use `FieldValue.serverTimestamp()` for create and update operations.
- Provide interfaces that handle both actual values (e.g., `42`, `[1, 3, 5]`) and `FieldValue` (e.g., `FieldValue.increment(1)`, `FieldValue.arrayUnion([7])`) for create and update operations.
- Allow the use of `JsonConverter`.
- And much more.

This goes beyond just generating the so-called data classes. It creates mechanisms for more convenient and versatile use of Cloud Firestore, including type-safe read/write methods and handling of `FieldValue`.

## How to use

### Install

Please add the following to your Flutter app's `pubspec.yaml`:

```yaml
dependencies:
  cloud_firestore: latest

  firebase_core: latest

  # A package containing annotations for flutterfire_gen.
  flutterfire_gen_annotation: ^0.2.0-dev.1

  # A package containing utility annotations for flutterfire_gen.
  flutterfire_gen_utils: ^0.2.0-dev.1

  # Optional. Will be necessary if you use JsonConverter.
  json_annotation: latest

dev_dependencies:
  # The tool to run code-generators.
  build_runner: latest

  # The code generator.
  flutterfire_gen: ^0.2.0-dev.5
```

- [flutterfire_gen](https://pub.dev/packages/flutterfire_gen)
- [flutterfire_gen_annotation](https://pub.dev/packages/flutterfire_gen_annotation)
- [flutterfire_gen_utils](https://pub.dev/packages/flutterfire_gen_utils)

### Define Cloud Firestore document schema with `@FirestoreDocument`

Let's describe the schema of a Todo document in the `todos` collection using flutterfire_gen's syntax.

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'todo.flutterfire_gen.dart';

@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  const Todo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final String title;

  @ReadDefault(false)
  @CreateDefault(false)
  final bool isCompleted;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
```

First, apply the @FirestoreDocument annotation to the Todo class that corresponds to the Cloud Firestore document.

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo { /** omitted */ }
```

In the mandatory `path` parameter of the `@FirestoreDocument` annotation, describe the path to the relevant document as follows:

- Write the collection name and document ID alternately, separated by slashes.
- Enclose the document ID in `{}`.
- The document ID should end with `Id` (the preceding string is recognized as the document name).

You can also define nested paths using subcollections in the same way.

Example:

```dart
@FirestoreDocument(path: 'chatRooms/{chatRoomId}/chatMessages/{chatMessageId}')
class ChatMessage { /** omitted */ }
```

The constructor parameters are not referenced in the code generation logic (whether you specify required or set default values does not affect the generated code). Please write them in a way that does not cause compile errors.

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  const Todo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  /** omitted */
}
```

Define member variables according to standard Dart syntax. Various annotations are supported.

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  /** omitted */

  final String title;

  @ReadDefault(false)
  @CreateDefault(false)
  final bool isCompleted;

  @alwaysUseFieldValueServerTimestampWhenCreating
  final DateTime? createdAt;

  @alwaysUseFieldValueServerTimestampWhenCreating
  @alwaysUseFieldValueServerTimestampWhenUpdating
  final DateTime? updatedAt;
}
```

In flutterfire_gen, it is possible to set different default values for read, update, and create operations.

```dart
@ReadDefault(false)
@CreateDefault(false)
final bool isCompleted;
```

For example, the `isCompleted` field is handled as follows:

- By default, it is set to `false` when read if the field is not present (i.e., `null`).
- By default, it is written as `false` during creation if no value is specified for the field.

Using annotations like `@alwaysUseFieldValueServerTimestampWhenCreating` and `@alwaysUseFieldValueServerTimestampWhenUpdating`, the field will automatically be assigned `FieldValue.serverTimestamp()` during creation and updating.

```dart
@alwaysUseFieldValueServerTimestampWhenCreating
final DateTime? createdAt;

@alwaysUseFieldValueServerTimestampWhenCreating
@alwaysUseFieldValueServerTimestampWhenUpdating
final DateTime? updatedAt;
```

### Run the generator

To run the code generator, execute the following command:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

Additionally, since a file with `.flutterfire_gen` added before the extension of the original file is generated, the source file must contain a line like `part 'todo.flutterfire_gen.dart';`.

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'todo.flutterfire_gen.dart';
```

### Use generated Query class

When code generation is performed for the `Todo` class annotated with `@FirestoreDocument`, the generated result includes a class named `TodoQuery`. `TodoQuery` has the following basic read and write methods:

read

- `fetchDocuments`: Retrieves multiple documents from the `todos` collection.
- `subscribeDocuments`: Retrieves real-time updates of multiple documents from the `todos` collection.
- `fetchDocument`: Retrieves a specified document from the `todos` collection.
- `subscribeDocument`: Retrieves real-time updates of a specified document from the `todos` collection.

create/update

- `add`: Creates a new document in the `todos` collection.
- `set`: Sets data to a specified document in the `todos` collection.
- `update`: Updates a specified document in the `todos` collection.

delete

- `delete`: Deletes a specified document from the `todos` collection.

Furthermore, these methods ensure type safety with:

- The `ReadTodo` type for values obtained through read operations.
- The `CreateTodo` interface for creating documents.
- The `UpdateTodo` interface for updating documents.

For example, the `ReadTodo` type instance obtained through `TodoQuery` methods automatically includes a non-nullable `String todoId`, even though the `Todo` class annotated with `@FirestoreDocument` does not specifically define a document ID string field.

During creation, the `todoId` is not included in the interface as the ID of the document being created is unknown.

In updates, since only specified fields are intended to be updated, all parameters in the `UpdateTodo` interface provided for updating documents are optional.

Defining a single `Todo` class and running code generation provides significant benefits with flutterfire_gen, as it automatically generates the most suitable types and basic read/write methods for each operation.

### read (get/list)

The read operations can be written very simply as follows. There is no need to repeatedly write `FirebaseFirestore.instance` or to write your own code to make operations type-safe by applying `withConverter` to `CollectionReference` or `DocumentReference`. All of this boilerplate code is generated by flutterfire_gen.

```dart
final query = TodoQuery();

Future<List<ReadTodo>> fetchTodos() => query.fetchDocuments();

Stream<List<ReadTodo>> subscribeTodos() => query.subscribeDocuments();

Future<ReadTodo?> fetchTodo(String todoId) =>
    query.fetchDocument(todoId: todoId);

Stream<ReadTodo?> subscribeTodo(String todoId) =>
    query.subscribeDocument(todoId: todoId);
```

It also supports adding `where` and `orderBy` clauses to the read queries. You just need to use the optional `queryBuilder` parameter of each method to add various conditions as follows.

```dart
final query = TodoQuery();

Future<List<ReadTodo>> fetchTodos() => query.fetchDocuments(
      queryBuilder: (query) => query
          .where('isCompleted', isEqualTo: false)
          .orderBy('createdAt', descending: true),
    );
```

As explained above, the `todoId`, which was not required to be written when defining the `Todo` class, is now reliably obtained.

```dart
Future<List<ReadTodo>> fetchTodos() async {
  final todos = await query.fetchDocuments();
  for (final todo in todos) {
    print(todo.todoId);
  }
  return todos;
}
```

### create

For creation, a dedicated interface named `CreateTodo` is provided for type-safe operations.

```dart
final query = TodoQuery();

Future<DocumentReference<CreateTodo>> addTodo(String title) =>
    query.add(createTodo: CreateTodo(title: title));

Future<DocumentReference<CreateTodo>> addCompletedTodo(String title) =>
    query.add(createTodo: CreateTodo(title: title, isCompleted: true));
```

The `title` of Todo is a mandatory parameter. The reason `isCompleted` is optional is because the `@CreateDefault(false)` annotation was applied when defining the `Todo` class. Therefore, if not specified, `isCompleted` will be `false` by default when the document is created.

Furthermore, `createdAt` and `updatedAt` do not appear in the interface, but `FieldValue.serverTimestamp()` is automatically applied internally. This convenience, where you don't have to worry about these details, is a benefit of flutterfire_gen automatically generating this code.

### update

For updates, a dedicated interface named `UpdateTodo` is also provided.

Since the intention is to update only specified fields, all the parameters defined in `UpdateTodo` are optional.

```dart
final query = TodoQuery();

Future<void> updateCompletionStatus({
  required String todoId,
  required bool isCompleted,
}) =>
    query.update(
      todoId: todoId,
      updateTodo: UpdateTodo(isCompleted: isCompleted),
    );
```

The above is a function for updating the completion status (`isCompleted`) of a specified Todo document.

Here too, just as with creation, `FieldValue.serverTimestamp()` is automatically applied internally to `updatedAt`.

### Advanced

#### Customize Schema Definition Class and Generated Class Names

In the examples provided so far, the schema definition was done using the class name `Todo`, and prefixes such as `Read`, `Create`, `Update`, and `Delete` were automatically added to classes generated for read, create, update, and delete operations respectively.

However, to address the following concerns:

- The most suitable class name `Todo` being used for schema definition, which restricts its use elsewhere.
- The desire to customize class names like `ReadTodo`, `CreateTodo`, `UpdateTodo`, `DeleteTodo` without being forced into a specific naming convention.

We have introduced a feature where you can uniformly customize the schema definition class name and the names of the generated classes through `build.yaml` as follows:

```yaml
targets:
  $default:
    builders:
      flutterfire_gen:
        options:
          schema_definition_class_prefix: "_$" # Defaults to ""
          read_class_prefix: "" # Defaults to "Read"
          create_class_prefix: "Create" # Defaults to "Create"
          update_class_prefix: "Update" # Defaults to "Update"
          delete_class_prefix: "Delete" # Defaults to "Delete"
          read_class_suffix: "Dto" # Defaults to ""
          create_class_suffix: "Data" # Defaults to ""
          update_class_suffix: "Interface" # Defaults to ""
          delete_class_suffix: "EtCetera" # Defaults to ""
```

The prefixes and suffixes for the generated code can also be individually set using the `@FirestoreDocument` annotation as follows:

```dart
@FirestoreDocument(
  path: 'todos/{todoId}',
  readClassPrefix: '',
  createClassPrefix: 'Create',
  updateClassPrefix: 'Update',
  deleteClassPrefix: 'Delete',
  readClassSuffix: 'Dto',
  createClassSuffix: 'Data',
  updateClassSuffix: 'Interface',
  deleteClassSuffix: 'EtCetera',
)
class _$Todo { /** omitted */ }
```

#### JsonConverter

It is also possible to apply the `JsonConverter` from the [json_annotation](https://pub.dev/packages/json_annotation) package.

For example, the `visibility` field below is annotated with the `@_visibilityConverter` `JsonConverter`:

- In Dart, it is treated as the `enum` type `Visibility`.
- In Cloud Firestore, it is treated as a `String` type.

This allows for conversion between these types.

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repository.flutterfire_gen.dart';

@FirestoreDocument(path: 'repositories/{repositoryId}')
class Repository {
  Repository({
    required this.visibility,
  });

  @_visibilityConverter
  final Visibility visibility;
}

enum Visibility {
  public,
  private,
  ;

  factory Visibility.fromString(String visibilityString) {
    switch (visibilityString) {
      case 'public':
        return Visibility.public;
      case 'private':
        return Visibility.private;
    }
    throw ArgumentError('visibility is not valid: $visibilityString');
  }
}

const _visibilityConverter = _VisibilityConverter();

class _VisibilityConverter implements JsonConverter<Visibility, String> {
  const _VisibilityConverter();

  @override
  Visibility fromJson(String json) => Visibility.fromString(json);

  @override
  String toJson(Visibility visibility) => visibility.name;
}
```

#### FieldValue

When creating or updating values in Cloud Firestore, it's possible to assign specific values to fields, such as `42` or `[1, 3, 5]`. However, you can also use `FieldValue` for specifying values in a different way:

- For `num` type fields, use `FieldValue.increment(1)` to specify a relative value from the current value.
- For `array` type fields, use `FieldValue.arrayUnion([7])` to add a value if it doesn't already exist, or `FieldValue.arrayRemove([5])` to remove a specified value if it exists.

Fields that might be specified using `FieldValue` can be defined using the `@allowFieldValue` annotation.

```dart
@allowFieldValue
final int fieldValueAllowedInt;

@allowFieldValue
final List<String> fieldValueAllowedList;
```

By doing this, for interfaces like `CreateFoo` or `UpdateFoo`, you would use:

- `FirestoreData<int>` type instead of `int` type.
- `FirestoreData<List<String>>` type instead of `List<String>` type.

The `FirestoreData` type, defined in the [flutterfire_gen_utils](https://pub.dev/packages/flutterfire_gen_utils) package, is a sealed class that encapsulates the following two types:

- `ActualValue`: For specifying concrete values like `42` or `[1, 3, 5]`.
- `FieldValueData`: For specifying values using `FieldValue`.

Therefore, for example, when updating the `count` integer field of a `Counter` document, you can execute the update using either actual values or `FieldValue` as follows.

```dart
final query = CounterQuery();

Future<void> updateCount(String counterId, int count) => query.update(
      counterId: counterId,
      updateCounter: UpdateCounter(count: ActualValue<int>(count)),
    );

Future<void> incrementCount(String counterId) => query.update(
      counterId: counterId,
      updateCounter:
          UpdateCounter(count: FieldValueData<int>(FieldValue.increment(1))),
    );
```
