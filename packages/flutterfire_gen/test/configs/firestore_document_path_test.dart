import 'package:flutterfire_gen/src/configs/firestore_document_path.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  group('FirestoreDocumentPath test', () {
    test("test with valid path 'users/{userId}'", () {
      final documentPath = FirestoreDocumentPath('users/{userId}');
      expect(documentPath.documentName, 'user');
      expect(
        documentPath.ancestors,
        <({String collectionName, String documentId})>[],
      );
      expect(
        documentPath.endPair,
        (collectionName: 'users', documentId: 'userId'),
      );
    });

    test("test with valid path 'users/{userId}/posts/{postId}'", () {
      final documentPath =
          FirestoreDocumentPath('users/{userId}/posts/{postId}');
      expect(documentPath.documentName, 'post');
      expect(
        documentPath.ancestors,
        <({String collectionName, String documentId})>[
          (collectionName: 'users', documentId: 'userId'),
        ],
      );
      expect(
        documentPath.endPair,
        (collectionName: 'posts', documentId: 'postId'),
      );
    });

    test(
        "test with valid path 'users/{userId}/posts/{postId}/postLikes/{postLikeId}'",
        () {
      final documentPath = FirestoreDocumentPath(
        'users/{userId}/posts/{postId}/postLikes/{postLikeId}',
      );
      expect(documentPath.documentName, 'postLike');
      expect(
        documentPath.ancestors,
        <({String collectionName, String documentId})>[
          (collectionName: 'users', documentId: 'userId'),
          (collectionName: 'posts', documentId: 'postId'),
        ],
      );
      expect(
        documentPath.endPair,
        (collectionName: 'postLikes', documentId: 'postLikeId'),
      );
    });

    test('test with empty path', () {
      expect(
        () => FirestoreDocumentPath(''),
        throwsA(isA<InvalidGenerationSourceError>()),
      );
    });

    test('test with invalid path', () {
      expect(
        () => FirestoreDocumentPath('invalidPath'),
        throwsA(isA<InvalidGenerationSourceError>()),
      );
    });

    test('test with invalid documentId in ancestor path', () {
      expect(
        () => FirestoreDocumentPath(
          'users/{userId}/posts/invalid/postLikes/{postLikeId}',
        ),
        throwsA(isA<InvalidGenerationSourceError>()),
      );
    });

    test('test with invalid documentId in end pair path', () {
      expect(
        () => FirestoreDocumentPath(
          'users/{userId}/posts/{postId}/postLikes/invalid',
        ),
        throwsA(isA<InvalidGenerationSourceError>()),
      );
    });
  });
}
