// ignore_for_file: lines_longer_than_80_chars

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterfire_gen/src/templates/read/from_json_template.dart';

import 'helper/entity.dart';

void main() {
  final db = FakeFirebaseFirestore();
  final data = <String, dynamic>{
    'name': 'name',
    'nullableText': 'nullableText',
    'age': 40,
    'isAdult': true,
    'map': {
      'name': 'name',
      'nullableText': 'nullableText',
      'age': 40,
      'isAdult': true,
      'texts': ['a', 'b', 'c'],
      'geoPoint': const GeoPoint(0, 0),
      'dateTime': DateTime.now(),
      'nullableDateTime': FieldValue.serverTimestamp(),
      // 'foo': const Foo('foo'),
    },
    'texts': ['a', 'b', 'c'],
    'geoPoint': const GeoPoint(0, 0),
    'dateTime': DateTime.now(),
    'nullableDateTime': FieldValue.serverTimestamp(),
    // 'foo': const Foo('foo'),
  };
  final query = EntityQuery();

  test('test', () async {
    final ref = await db.collection('entities').add(data);
    final json = (await ref.get()).data();
    print(json);

    final a = (await db.collection('entities').doc(ref.id).get()).data();
    print(a);

    final b = (await db
            .collection('entities')
            .withConverter(
              fromFirestore: (ds, _) => ReadEntity.fromDocumentSnapshot(ds),
              toFirestore: (obj, _) => obj.toJson(),
            )
            .doc(ref.id)
            .get())
        .data();
    print(b);

    final entity = await query.fetchDocument(entityId: ref.id);
    print(entity);
  });

  group('test fromJsonTemplate', () {
    final template = FromJsonTemplate(
      readClassName: '',
      fields: {},
      defaultValues: {},
    );

    test('parse List<String>', () {
      final result = template.fromJsonEachField(
        fieldNameString: 'texts',
        typeNameString: 'List<String>',
      );
      expect(
        result,
        "texts: (json['texts'] as List<dynamic>).map((e) => e as String).toList()",
      );
    });

    test('parse List<String> with default value', () {
      final result = template.fromJsonEachField(
        fieldNameString: 'texts',
        typeNameString: 'List<String>',
        defaultValue: [],
      );
      expect(
        result,
        "texts: (json['texts'] as List<dynamic>?)?.map((e) => e as String).toList() ?? []",
      );
    });

    test('parse List<String>?', () {
      final result = template.fromJsonEachField(
        fieldNameString: 'texts',
        typeNameString: 'List<String>?',
        defaultValue: [],
      );
      print(result);
      expect(
        result,
        "texts: (json['texts'] as List<dynamic>?)?.map((e) => e as String).toList() ?? []",
      );
    });

    test('parse List<List<String>>', () {
      final result = template.fromJsonEachField(
        fieldNameString: 'twoDList',
        typeNameString: 'List<List<String>>',
      );
      expect(
        result,
        "twoDList: (json['twoDList'] as List<dynamic>).map((e) => (e as List<dynamic>).map((e) => e as String).toList()).toList()",
      );
    });
  });
}
