# flutterfire_gen

[English](https://github.com/kosukesaigusa/flutterfire_gen/blob/main/packages/flutterfire_gen/README.md) | [日本語](https://github.com/rrousselGit/freezed/blob/main/resources/translations/ja_JP/README.md)

flutterfire_gen は Flutter の Cloud Firestore のためのコード生成パッケージです。

## Motivation

Cloud Firestore のドキュメントのスキーマを Dart で記述することで、下記のような要件を満たしたボイラプレートコードを自動で生成することができます。

- read, create, update (, delete) でそれぞれに最適なインターフェースを生成する
- read, create, update, delete の型安全なメソッドを生成する
- read, create, update 時に異なるデフォルト値を設定できる
- create, update 時に自動で `FieldValue.serverTimestamp()` を使用できる
- create, update 時に実際の値（例：`42`, `[1, 3, 5]`）と `FieldValue`（例：`FieldValue.increment(1)`, `FieldValue.arrayUnion([7])`）とをまとめて取り扱うインターフェースを提供する
- `JsonConverter` も使用できる
- その他にもいろいろ

単に、いわゆるデータクラスを生成するだけではなく、型安全な読み書きメソッドや、`FieldValue` の取り扱いなどの Cloud Firestore をより便利に・汎用的に使用することができる仕組みを生成します。

## How to use

### Install

あなたの Flutter アプリの `pubspec.yaml` に下記のような記述をしてください。

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
  flutterfire_gen: ^0.2.0-dev.2
```

<https://pub.dev/publishers/kosukesaigusa.com/unlisted-packages>

- [flutterfire_gen](https://pub.dev/packages/flutterfire_gen)
- [flutterfire_gen_annotation](https://pub.dev/packages/flutterfire_gen_annotation)
- [flutterfire_gen_utils](https://pub.dev/packages/flutterfire_gen_utils)

### Define Cloud Firestore document schema with `@FirestoreDocument`

`todos` コレクションの Todo ドキュメントのスキーマを flutterfire_gen の記法で記述してみましょう。

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

まずは Cloud Firestore のドキュメントに対応するクラス `Todo` に `@FirestoreDocument` のアノテーションを施します。

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo { /** 省略 */ }
```

`@FirestoreDocument` アノテーションの必須パラメータである `path` には、該当するドキュメントまでのパスを以下のようなルールで記述してください。

- スラッシュ区切りでコレクション名とドキュメント ID を交互に書く
- ドキュメント ID は `{}` で囲む
- ドキュメント ID は `Id` で終わる文字列とする（`Id` 以前の文字列がドキュメント名として認識されます）

サブコレクションを用いたネストしたパスでも同様に定義することができます。

例：

```dart
@FirestoreDocument(path: 'chatRooms/{chatRoomId}/chatMessages/{chatMessageId}')
class ChatMessage { /** 省略 */ }
```

コンストラクタパラメータの部分はコード生成のロジックでは参照していません（`required` を指定しようとしまいと、デフォルト値を設定しようとしまいと、生成されるコードに影響はありません）。コンパイルエラーの起きない方法で記述してください。

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  const Todo({
    required this.title,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  /** 省略 */
}
```

メンバ変数の定義も通常の Dart の文法に従って行ってください。様々なアノテーションに対応しています。

```dart
@FirestoreDocument(path: 'todos/{todoId}')
class Todo {
  /** 省略 */

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

flutterfire_gen では read, update, create 時にそれぞれ異なるデフォルト値を設定することができます。

```dart
@ReadDefault(false)
@CreateDefault(false)
final bool isCompleted;
```

たとえばこの `isCompleted` フィールドは

- read 時に当該フィールドに値がなければ（`null` であれば）デフォルトで `false` にする
- create 時に当該フィールドの値を指定しなければデフォルトで `false` を書き込む

のように処理されます。

`@alwaysUseFieldValueServerTimestampWhenCreating` や `@alwaysUseFieldValueServerTimestampWhenUpdating` のアノテーションを使用すると、create 時や update 時に当該フィールドに自動的に `FieldValue.serverTimestamp()` が与えられるようになります。

```dart
@alwaysUseFieldValueServerTimestampWhenCreating
final DateTime? createdAt;

@alwaysUseFieldValueServerTimestampWhenCreating
@alwaysUseFieldValueServerTimestampWhenUpdating
final DateTime? updatedAt;
```

### Run the generator

コード生成を実行するためには下記のコマンドを実行してください。

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

また、生成元ファイルの拡張子の直前に `.flutterfire_gen` を追加したファイルが生成されるので、生成元ファイルには下記のような `part 'todo.flutterfire_gen.dart';` の記述がされている必要があります。

```dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';

part 'todo.flutterfire_gen.dart';
```

### Use generated Query class

上記の `@FirestoreDocument` アノテーションを施した `Todo` クラスに対してコード生成を行うと、生成結果に `TodoQuery` というクラスが含まれています。`TodoQuery` には

read

- `fetchDocuments`: `todos` コレクションの複数のドキュメントを取得する
- `subscribeDocuments`: `todos` コレクションの複数のドキュメントのリアルタイム更新を取得する
- `fetchDocument`: `todos` コレクションの指定したドキュメントを取得する
- `subscribeDocument`: `todos` コレクションの指定したドキュメントのリアルタイム更新を取得する

create/update

- `add`: `todos` コレクションに新しいドキュメントを作成する
- `set`: `todos` コレクションの指定したドキュメントにデータをセットする
- `update`: `todos` コレクションの指定したドキュメントを更新する

delete

- `delete`: `todos` コレクションの指定したドキュメントを削除する

のような基本的な読み書きメソッドが定義されています。

さらに、それらは

- read で得られる値としての `ReadTodo` 型
- create で作成する際のインターフェースとしての `CreateTodo` 型
- update で更新する際のインターフェースとしての `UpdateTodo` 型

が定義されて型安全性が担保されています。

たとえば、`@FirestoreDocument` アノテーションを施した `Todo` クラスには特にドキュメント ID の文字列フィールドを定義していませんが、`TodoQuery` のメソッドを通じて得られる `ReadTodo` 型のインスタンスには、自動的に non-nullable な `String todoId` が含まれるようになっています。

一方で、create 時にはこれから作成するドキュメントの ID は知り得ないので、`todoId` はそのインターフェースに含まれません。

そして、update では指定したフィールドだけを更新したいので、`UpdateTodo` 型が提供するドキュメントの更新のためのインターフェースのパラメータはすべて optional です。

`Todo` クラスを一つ定義してコード生成を実行するだけで、読み書きの操作のそれぞれで異なる最適な型と、基本的な読み書きのメソッドが自動で生成されるのが flutterfire_gen を使用することで得られる大きな恩恵です。

### read (get/list)

read 操作は下記のようにとてもシンプルに書くことができます。`FirebaseFirestore.instance` と繰り返し書くことも、`CollectionReference` や `DocumentReference` に `withConverter` を施して型安全な操作をするためのコードを自分で書く必要も全くありません。それらのボイラプレートコードはすべて flutterfire_gen が生成します。

```dart
final query = TodoQuery();

Future<List<ReadTodo>> fetchTodos() => query.fetchDocuments();

Stream<List<ReadTodo>> subscribeTodos() => query.subscribeDocuments();

Future<ReadTodo?> fetchTodo(String todoId) =>
    query.fetchDocument(todoId: todoId);

Stream<ReadTodo?> subscribeTodo(String todoId) =>
    query.subscribeDocument(todoId: todoId);
```

読み込みクエリに `where` 句や `orderBy` 句を追加するのにも対応しています。各メソッドの任意引数の `queryBuilder` を持ちいて下記のように各種の条件を追加するだけです。

```dart
final query = TodoQuery();

Future<List<ReadTodo>> fetchTodos() => query.fetchDocuments(
      queryBuilder: (query) => query
          .where('isCompleted', isEqualTo: false)
          .orderBy('createdAt', descending: true),
    );
```

上で説明した通り、`Todo` クラスの定義をした際には書く必要のなかった `todoId` が確実に取得できています。

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

create 時には、型安全な操作のために `CreateTodo` という専用のインターフェースが提供されています。

```dart
final query = TodoQuery();

Future<DocumentReference<CreateTodo>> addTodo(String title) =>
    query.add(createTodo: CreateTodo(title: title));

Future<DocumentReference<CreateTodo>> addCompletedTodo(String title) =>
    query.add(createTodo: CreateTodo(title: title, isCompleted: true));
```

Todo の `title` が必須のパラメータとなっています。`isCompleted` が任意のパラメータになっているのは、`Todo` クラスを定義した際に `@CreateDefault(false)` のアノテーションを施したためです。よって、特に指定しなければ `isCompleted` は `false` でドキュメントが作成されます。

また、`createdAt`, `updatedAt` はインターフェースに登場しませんが、内部で自動で `FieldValue.serverTimestamp()` が適用されています。このあたりを何も意識しなくて良いのも flutterfire_gen が自動でそれらのコードを生成している恩恵です。

### update

update 時にも、`UpdateTodo` という専用のインターフェースが提供されています。

指定したフィールドのみを更新したいので、`UpdateTodo` に定義されているのはすべて任意引数です。

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

上記は、指定した Todo ドキュメントの完了状態 (`isCompleted`) を更新する関数です。

ここでも create と同様に、`updatedAt` には内部で自動で `FieldValue.serverTimestamp()` が適用されています。

### Advanced

#### JsonConverter

[json_annotation](https://pub.dev/packages/json_annotation) パッケージの `JsonConverter` を適用することも可能です。

たとえば、下記の `visibility` フィールドには `@_visibilityConverter` の `JsonConverter` のアノテーションが施されており、

- Dart では `enum` の `Visibility` 型
- Cloud Firestore では `String` 型

として扱うための変換をすることができます。

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

Cloud Firestore で値を作成したり更新したりする際には、フィールドに `42` や `[1, 3, 5]` のように具体的な値を与えることもできますが、

- `num` 型のフィールドに対して、現在の値から相対的な値を指定するための `FieldValue.increment(1)`
- `array` 型のフィールドに対して、既になければ指定した値を追加するための `FieldValue.arrayUnion([7])` や、指定した値があれば取り除く `FieldValue.arrayRemove([5])`

のように `FieldValue` を使用した指定方法もあります。

そのような `FieldValue` で指定する可能性があるフィールドには `@allowFieldValue` アノテーションを使用して、下記のように定義することができます。

```dart
@allowFieldValue
final int fieldValueAllowedInt;

@allowFieldValue
final List<String> fieldValueAllowedList;
```

そうすると、`CreateFoo` や `UpdateFoo` のインターフェースとして

- `int` 型の代わりに `FirestoreData<int>` 型
- `List<String>` 型の代わりに `FirestoreData<List<String>>` 型

を使用することになります。

`FirestoreData` 型は [flutterfire_gen_utils](https://pub.dev/packages/flutterfire_gen_utils) パッケージで定義された、sealed class で、下記の 2 つ

- `ActualValue`: `42` や `[1, 3, 5]` のような具体的な値を指定するための型
- `FieldValueData`: `FieldValue` で指定するための型

をまとめています。

よって、たとえば `Counter` ドキュメントの `count` という整数フィールドを更新する際には、下記のように実際の値と `FieldValue` とで更新を実行することができます。

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
