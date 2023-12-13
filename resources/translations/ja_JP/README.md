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

あなたの Flutter アプリの `pubspec.yaml` に下記のような記述をしてください。

```yaml
dependencies:
  cloud_firestore: latest

  firebase_core: latest

  # A package containing annotations for flutterfire_gen.
  flutterfire_gen_annotation: ^0.2.0-dev.1

  # A package containing utility annotations for flutterfire_gen.
  flutterfire_gen_utils: ^0.2.0-dev.1

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
