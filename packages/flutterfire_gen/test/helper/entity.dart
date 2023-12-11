import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterfire_gen_annotation/flutterfire_gen_annotation.dart';
import 'package:flutterfire_gen_utils/flutterfire_gen_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity.flutterfire_gen.dart';

@FirestoreDocument(path: 'entities/{entityId}')
class Entity {
  Entity({
    required this.text,
    required this.textWithDefault,
    this.nullableText,
    required this.integer,
    required this.integerWithDefault,
    this.nullableInteger,
    required this.doubleNumber,
    required this.doubleNumberWithDefault,
    this.nullableDoubleNumber,
    required this.isBool,
    required this.isBoolWithDefault,
    this.nullableIsBool,
    required this.texts,
    required this.textsWithDefault,
    this.nullableTexts,
    required this.map,
    required this.mapWithDefault,
    this.nullableMap,
    required this.stringMap,
    required this.stringMapWithDefault,
    this.nullableStringMap,
    required this.nestedMap,
    required this.nestedMapWithDefault,
    this.nullableNestedMap,
    required this.listMap,
    required this.listMapWithDefault,
    this.nullableListMap,
    required this.mapList,
    required this.mapListWithDefault,
    this.nullableMapList,
    required this.geoPoint,
    required this.geoPointWithDefault,
    this.nullableGeoPoint,
    required this.dateTime,
    this.nullableDateTime,
    required this.timestamp,
    this.nullableTimestamp,
    required this.documentReference,
    this.nullableDocumentReference,
    required this.foo,
    required this.fooWithDefault,
    this.nullableFoo,
    this.nullableFooWithDefaultAnnotation,
    required this.fieldValueAllowedInt,
    this.fieldValueAllowedNullableInt,
    this.fieldValueAllowedNullableIntWithDefaultAnnotation,
  });

  final String text;

  @ReadDefault('requiredWithDefault')
  @CreateDefault('createDefault')
  @UpdateDefault('updateDefault')
  final String textWithDefault;

  @ReadDefault('defaultText')
  @CreateDefault('createDefault')
  @UpdateDefault('updateDefault')
  final String? nullableText;

  final int integer;

  @ReadDefault(0)
  final int integerWithDefault;

  @ReadDefault(0)
  final int? nullableInteger;

  final double doubleNumber;

  @ReadDefault(3.14)
  final double doubleNumberWithDefault;

  @ReadDefault(3.14)
  final double? nullableDoubleNumber;

  final bool isBool;

  @ReadDefault(false)
  final bool isBoolWithDefault;

  @ReadDefault(false)
  final bool? nullableIsBool;

  final List<String> texts;

  @ReadDefault(<String>['requiredWithDefault'])
  final List<String> textsWithDefault;

  @ReadDefault(<String>[])
  final List<String>? nullableTexts;

  final Map<String, dynamic> map;

  @ReadDefault(<String, dynamic>{})
  final Map<String, dynamic> mapWithDefault;

  @ReadDefault(<String, dynamic>{})
  final Map<String, dynamic>? nullableMap;

  final Map<String, String> stringMap;

  @ReadDefault(<String, String>{})
  final Map<String, String> stringMapWithDefault;

  @ReadDefault(<String, String>{})
  final Map<String, String>? nullableStringMap;

  final Map<String, Map<String, int>> nestedMap;

  @ReadDefault(
    <String, Map<String, int>>{'requiredWithDefault': <String, int>{}},
  )
  final Map<String, Map<String, int>> nestedMapWithDefault;

  @ReadDefault(<String, Map<String, int>>{})
  final Map<String, Map<String, int>>? nullableNestedMap;

  final Map<String, List<int>> listMap;

  @ReadDefault(<String, List<int>>{'requiredWithDefault': <int>[]})
  final Map<String, List<int>> listMapWithDefault;

  @ReadDefault(<String, List<int>>{})
  final Map<String, List<int>>? nullableListMap;

  final List<Map<String, int>> mapList;

  @ReadDefault(<Map<String, int>>[
    <String, int>{'requiredWithDefault': 0},
  ])
  final List<Map<String, int>> mapListWithDefault;

  @ReadDefault(<Map<String, int>>[])
  final List<Map<String, int>>? nullableMapList;

  final GeoPoint geoPoint;

  @ReadDefault(GeoPoint(0, 0))
  final GeoPoint geoPointWithDefault;

  @ReadDefault(GeoPoint(0, 0))
  final GeoPoint? nullableGeoPoint;

  final DateTime dateTime;

  final DateTime? nullableDateTime;

  final Timestamp timestamp;

  final Timestamp? nullableTimestamp;

  final DocumentReference<Object?> documentReference;

  final DocumentReference<Object?>? nullableDocumentReference;

  @_FooJsonConverter()
  final Foo foo;

  @ReadDefault(Foo('requiredWithDefault'))
  @_FooJsonConverter()
  final Foo fooWithDefault;

  @_nullableFooJsonConverter
  final Foo? nullableFoo;

  @CreateDefault(Foo('defaultBar'))
  @_FooJsonConverter()
  final Foo? nullableFooWithDefaultAnnotation;

  @allowFieldValue
  final int fieldValueAllowedInt;

  @allowFieldValue
  final int? fieldValueAllowedNullableInt;

  @allowFieldValue
  @CreateDefault(0)
  final int? fieldValueAllowedNullableIntWithDefaultAnnotation;
}

class Foo {
  const Foo(this.bar);

  final String bar;
}

class _FooJsonConverter implements JsonConverter<Foo, Map<String, dynamic>> {
  const _FooJsonConverter();

  @override
  Foo fromJson(Map<String, dynamic> json) {
    final bar = json['bar'] as String;
    return Foo(bar);
  }

  @override
  Map<String, dynamic> toJson(Foo foo) {
    return <String, dynamic>{'bar': foo.bar};
  }
}

const _nullableFooJsonConverter = _NullableFooJsonConverter();

class _NullableFooJsonConverter
    implements JsonConverter<Foo?, Map<String, dynamic>> {
  const _NullableFooJsonConverter();

  @override
  Foo? fromJson(Map<String, dynamic> json) {
    final bar = json['bar'] as String?;
    if (bar == null) {
      return null;
    }
    return Foo(bar);
  }

  @override
  Map<String, dynamic> toJson(Foo? foo) {
    if (foo == null) {
      return <String, dynamic>{'bar': 'defaultBar'};
    }
    return <String, dynamic>{'bar': foo.bar};
  }
}
