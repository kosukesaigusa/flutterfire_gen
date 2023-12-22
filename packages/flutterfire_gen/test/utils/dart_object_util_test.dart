import 'package:analyzer/dart/constant/value.dart';
import 'package:flutterfire_gen/src/utils/dart_object_util.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'dart_object_util_test.mocks.dart';

@GenerateMocks([DartObject])
void main() {
  group('DartObjectExtension tests', () {
    final pathDartObject = MockDartObject();
    when(pathDartObject.isNull).thenReturn(false);
    when(pathDartObject.toStringValue()).thenReturn('users/{userId}/');

    final firestoreDocumentAnnotation = MockDartObject();
    when(firestoreDocumentAnnotation.getField('path'))
        .thenReturn(pathDartObject);
    when(firestoreDocumentAnnotation.getField('readClassPrefix'))
        .thenReturn(null);

    test('test decodeField', () {
      final path = firestoreDocumentAnnotation.decodeField(
        'path',
        decode: (obj) => obj.toStringValue()!,
        orElse: () => throw Exception('path field is required.'),
      );

      expect(path, 'users/{userId}/');
    });

    test('test decodeField if the field does not exist', () {
      final readClassPrefix = firestoreDocumentAnnotation.decodeField(
        'readClassPrefix',
        decode: (obj) => obj.toStringValue()!,
        orElse: () => 'Read',
      );

      expect(readClassPrefix, 'Read');
    });
  });
}
