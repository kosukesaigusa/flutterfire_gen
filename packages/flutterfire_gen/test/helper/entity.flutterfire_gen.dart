// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// Generator: FlutterFireGen
// **************************************************************************

class ReadEntity {
  const ReadEntity({
    required this.text,
    required this.textWithDefault,
    required this.nullableText,
    required this.integer,
    required this.integerWithDefault,
    required this.nullableInteger,
    required this.doubleNumber,
    required this.doubleNumberWithDefault,
    required this.nullableDoubleNumber,
    required this.isBool,
    required this.isBoolWithDefault,
    required this.nullableIsBool,
    required this.texts,
    required this.textsWithDefault,
    required this.nullableTexts,
    required this.map,
    required this.mapWithDefault,
    required this.nullableMap,
    required this.stringMap,
    required this.stringMapWithDefault,
    required this.nullableStringMap,
    required this.nestedMap,
    required this.nestedMapWithDefault,
    required this.nullableNestedMap,
    required this.listMap,
    required this.listMapWithDefault,
    required this.nullableListMap,
    required this.mapList,
    required this.mapListWithDefault,
    required this.nullableMapList,
    required this.geoPoint,
    required this.geoPointWithDefault,
    required this.nullableGeoPoint,
    required this.dateTime,
    required this.nullableDateTime,
    required this.timestamp,
    required this.nullableTimestamp,
    required this.documentReference,
    required this.nullableDocumentReference,
    required this.foo,
    required this.fooWithDefault,
    required this.nullableFoo,
    required this.nullableFooWithDefaultAnnotation,
    required this.fieldValueAllowedInt,
    required this.fieldValueAllowedNullableInt,
    required this.fieldValueAllowedNullableIntWithDefaultAnnotation,
    required this.entityId,
    required this.path,
    required this.entityReference,
  });

  final String text;

  final String textWithDefault;

  final String? nullableText;

  final int integer;

  final int integerWithDefault;

  final int? nullableInteger;

  final double doubleNumber;

  final double doubleNumberWithDefault;

  final double? nullableDoubleNumber;

  final bool isBool;

  final bool isBoolWithDefault;

  final bool? nullableIsBool;

  final List<String> texts;

  final List<String> textsWithDefault;

  final List<String>? nullableTexts;

  final Map<String, dynamic> map;

  final Map<String, dynamic> mapWithDefault;

  final Map<String, dynamic>? nullableMap;

  final Map<String, String> stringMap;

  final Map<String, String> stringMapWithDefault;

  final Map<String, String>? nullableStringMap;

  final Map<String, Map<String, int>> nestedMap;

  final Map<String, Map<String, int>> nestedMapWithDefault;

  final Map<String, Map<String, int>>? nullableNestedMap;

  final Map<String, List<int>> listMap;

  final Map<String, List<int>> listMapWithDefault;

  final Map<String, List<int>>? nullableListMap;

  final List<Map<String, int>> mapList;

  final List<Map<String, int>> mapListWithDefault;

  final List<Map<String, int>>? nullableMapList;

  final GeoPoint geoPoint;

  final GeoPoint geoPointWithDefault;

  final GeoPoint? nullableGeoPoint;

  final DateTime dateTime;

  final DateTime? nullableDateTime;

  final Timestamp timestamp;

  final Timestamp? nullableTimestamp;

  final DocumentReference<Object?> documentReference;

  final DocumentReference<Object?>? nullableDocumentReference;

  final Foo foo;

  final Foo fooWithDefault;

  final Foo? nullableFoo;

  final Foo? nullableFooWithDefaultAnnotation;

  final int fieldValueAllowedInt;

  final int? fieldValueAllowedNullableInt;

  final int? fieldValueAllowedNullableIntWithDefaultAnnotation;

  final String entityId;

  final String path;

  final DocumentReference<ReadEntity> entityReference;

  factory ReadEntity.fromJson(Map<String, dynamic> json) {
    final extendedJson = <String, dynamic>{
      ...json,
    };
    return ReadEntity(
      text: extendedJson['text'] as String,
      textWithDefault:
          extendedJson['textWithDefault'] as String? ?? 'requiredWithDefault',
      nullableText: extendedJson['nullableText'] as String? ?? 'defaultText',
      integer: extendedJson['integer'] as int,
      integerWithDefault: extendedJson['integerWithDefault'] as int? ?? 0,
      nullableInteger: extendedJson['nullableInteger'] as int? ?? 0,
      doubleNumber: extendedJson['doubleNumber'] as double,
      doubleNumberWithDefault:
          extendedJson['doubleNumberWithDefault'] as double? ?? 3.14,
      nullableDoubleNumber:
          extendedJson['nullableDoubleNumber'] as double? ?? 3.14,
      isBool: extendedJson['isBool'] as bool,
      isBoolWithDefault: extendedJson['isBoolWithDefault'] as bool? ?? false,
      nullableIsBool: extendedJson['nullableIsBool'] as bool? ?? false,
      texts: (extendedJson['texts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      textsWithDefault: (extendedJson['textsWithDefault'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>['requiredWithDefault'],
      nullableTexts: (extendedJson['nullableTexts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      map: extendedJson['map'] as Map<String, dynamic>,
      mapWithDefault: extendedJson['mapWithDefault'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
      nullableMap: extendedJson['nullableMap'] as Map<String, dynamic>? ??
          const <String, dynamic>{},
      stringMap: (extendedJson['stringMap'] as Map<String, dynamic>)
          .map((k, v) => MapEntry(k, v as String)),
      stringMapWithDefault:
          (extendedJson['stringMapWithDefault'] as Map<String, dynamic>?)
                  ?.map((k, v) => MapEntry(k, v as String)) ??
              const <String, String>{},
      nullableStringMap:
          (extendedJson['nullableStringMap'] as Map<String, dynamic>?)
                  ?.map((k, v) => MapEntry(k, v as String)) ??
              const <String, String>{},
      nestedMap: (extendedJson['nestedMap'] as Map<String, dynamic>).map(
          (k, v) => MapEntry(
              k,
              (v as Map<String, dynamic>)
                  .map((k, v) => MapEntry(k, v as int)))),
      nestedMapWithDefault:
          (extendedJson['nestedMapWithDefault'] as Map<String, dynamic>?)?.map(
                  (k, v) => MapEntry(
                      k,
                      (v as Map<String, dynamic>)
                          .map((k, v) => MapEntry(k, v as int)))) ??
              const <String, Map<String, int>>{
                'requiredWithDefault': <String, int>{}
              },
      nullableNestedMap:
          (extendedJson['nullableNestedMap'] as Map<String, dynamic>?)?.map(
                  (k, v) => MapEntry(
                      k,
                      (v as Map<String, dynamic>)
                          .map((k, v) => MapEntry(k, v as int)))) ??
              const <String, Map<String, int>>{},
      listMap: (extendedJson['listMap'] as Map<String, dynamic>).map((k, v) =>
          MapEntry(k, (v as List<dynamic>).map((e) => e as int).toList())),
      listMapWithDefault:
          (extendedJson['listMapWithDefault'] as Map<String, dynamic>?)?.map(
                  (k, v) => MapEntry(
                      k, (v as List<dynamic>).map((e) => e as int).toList())) ??
              const <String, List<int>>{'requiredWithDefault': <int>[]},
      nullableListMap:
          (extendedJson['nullableListMap'] as Map<String, dynamic>?)?.map(
                  (k, v) => MapEntry(
                      k, (v as List<dynamic>).map((e) => e as int).toList())) ??
              const <String, List<int>>{},
      mapList: (extendedJson['mapList'] as List<dynamic>)
          .map((e) =>
              (e as Map<String, dynamic>).map((k, v) => MapEntry(k, v as int)))
          .toList(),
      mapListWithDefault: (extendedJson['mapListWithDefault'] as List<dynamic>?)
              ?.map((e) => (e as Map<String, dynamic>)
                  .map((k, v) => MapEntry(k, v as int)))
              .toList() ??
          const <Map<String, int>>[
            <String, int>{'requiredWithDefault': 0}
          ],
      nullableMapList: (extendedJson['nullableMapList'] as List<dynamic>?)
              ?.map((e) => (e as Map<String, dynamic>)
                  .map((k, v) => MapEntry(k, v as int)))
              .toList() ??
          const <Map<String, int>>[],
      geoPoint: extendedJson['geoPoint'] as GeoPoint,
      geoPointWithDefault: extendedJson['geoPointWithDefault'] as GeoPoint? ??
          const GeoPoint(0, 0),
      nullableGeoPoint:
          extendedJson['nullableGeoPoint'] as GeoPoint? ?? const GeoPoint(0, 0),
      dateTime: (extendedJson['dateTime'] as Timestamp).toDate(),
      nullableDateTime:
          (extendedJson['nullableDateTime'] as Timestamp?)?.toDate(),
      timestamp: extendedJson['timestamp'] as Timestamp,
      nullableTimestamp: extendedJson['nullableTimestamp'] as Timestamp?,
      documentReference:
          extendedJson['documentReference'] as DocumentReference<Object?>,
      nullableDocumentReference: extendedJson['nullableDocumentReference']
          as DocumentReference<Object?>?,
      foo: _FooJsonConverter()
          .fromJson(extendedJson['foo'] as Map<String, dynamic>),
      fooWithDefault: extendedJson['fooWithDefault'] == null
          ? const Foo('requiredWithDefault')
          : _FooJsonConverter()
              .fromJson(extendedJson['fooWithDefault'] as Map<String, dynamic>),
      nullableFoo: _nullableFooJsonConverter
          .fromJson(extendedJson['nullableFoo'] as Map<String, dynamic>),
      nullableFooWithDefaultAnnotation: _FooJsonConverter().fromJson(
          extendedJson['nullableFooWithDefaultAnnotation']
              as Map<String, dynamic>),
      fieldValueAllowedInt: extendedJson['fieldValueAllowedInt'] as int,
      fieldValueAllowedNullableInt:
          extendedJson['fieldValueAllowedNullableInt'] as int?,
      fieldValueAllowedNullableIntWithDefaultAnnotation:
          extendedJson['fieldValueAllowedNullableIntWithDefaultAnnotation']
              as int?,
      entityId: extendedJson['entityId'] as String,
      path: extendedJson['path'] as String,
      entityReference:
          extendedJson['entityReference'] as DocumentReference<ReadEntity>,
    );
  }

  factory ReadEntity.fromDocumentSnapshot(DocumentSnapshot ds) {
    final data = ds.data()! as Map<String, dynamic>;
    return ReadEntity.fromJson(<String, dynamic>{
      ...data,
      'entityId': ds.id,
      'path': ds.reference.path,
      'entityReference': ds.reference.parent.doc(ds.id).withConverter(
            fromFirestore: (ds, _) => ReadEntity.fromDocumentSnapshot(ds),
            toFirestore: (obj, _) => throw UnimplementedError(),
          ),
    });
  }

  ReadEntity copyWith({
    String? text,
    String? textWithDefault,
    String? nullableText,
    int? integer,
    int? integerWithDefault,
    int? nullableInteger,
    double? doubleNumber,
    double? doubleNumberWithDefault,
    double? nullableDoubleNumber,
    bool? isBool,
    bool? isBoolWithDefault,
    bool? nullableIsBool,
    List<String>? texts,
    List<String>? textsWithDefault,
    List<String>? nullableTexts,
    Map<String, dynamic>? map,
    Map<String, dynamic>? mapWithDefault,
    Map<String, dynamic>? nullableMap,
    Map<String, String>? stringMap,
    Map<String, String>? stringMapWithDefault,
    Map<String, String>? nullableStringMap,
    Map<String, Map<String, int>>? nestedMap,
    Map<String, Map<String, int>>? nestedMapWithDefault,
    Map<String, Map<String, int>>? nullableNestedMap,
    Map<String, List<int>>? listMap,
    Map<String, List<int>>? listMapWithDefault,
    Map<String, List<int>>? nullableListMap,
    List<Map<String, int>>? mapList,
    List<Map<String, int>>? mapListWithDefault,
    List<Map<String, int>>? nullableMapList,
    GeoPoint? geoPoint,
    GeoPoint? geoPointWithDefault,
    GeoPoint? nullableGeoPoint,
    DateTime? dateTime,
    DateTime? nullableDateTime,
    Timestamp? timestamp,
    Timestamp? nullableTimestamp,
    DocumentReference<Object?>? documentReference,
    DocumentReference<Object?>? nullableDocumentReference,
    Foo? foo,
    Foo? fooWithDefault,
    Foo? nullableFoo,
    Foo? nullableFooWithDefaultAnnotation,
    int? fieldValueAllowedInt,
    int? fieldValueAllowedNullableInt,
    int? fieldValueAllowedNullableIntWithDefaultAnnotation,
    String? entityId,
    String? path,
    DocumentReference<ReadEntity>? entityReference,
  }) {
    return ReadEntity(
      text: text ?? this.text,
      textWithDefault: textWithDefault ?? this.textWithDefault,
      nullableText: nullableText ?? this.nullableText,
      integer: integer ?? this.integer,
      integerWithDefault: integerWithDefault ?? this.integerWithDefault,
      nullableInteger: nullableInteger ?? this.nullableInteger,
      doubleNumber: doubleNumber ?? this.doubleNumber,
      doubleNumberWithDefault:
          doubleNumberWithDefault ?? this.doubleNumberWithDefault,
      nullableDoubleNumber: nullableDoubleNumber ?? this.nullableDoubleNumber,
      isBool: isBool ?? this.isBool,
      isBoolWithDefault: isBoolWithDefault ?? this.isBoolWithDefault,
      nullableIsBool: nullableIsBool ?? this.nullableIsBool,
      texts: texts ?? this.texts,
      textsWithDefault: textsWithDefault ?? this.textsWithDefault,
      nullableTexts: nullableTexts ?? this.nullableTexts,
      map: map ?? this.map,
      mapWithDefault: mapWithDefault ?? this.mapWithDefault,
      nullableMap: nullableMap ?? this.nullableMap,
      stringMap: stringMap ?? this.stringMap,
      stringMapWithDefault: stringMapWithDefault ?? this.stringMapWithDefault,
      nullableStringMap: nullableStringMap ?? this.nullableStringMap,
      nestedMap: nestedMap ?? this.nestedMap,
      nestedMapWithDefault: nestedMapWithDefault ?? this.nestedMapWithDefault,
      nullableNestedMap: nullableNestedMap ?? this.nullableNestedMap,
      listMap: listMap ?? this.listMap,
      listMapWithDefault: listMapWithDefault ?? this.listMapWithDefault,
      nullableListMap: nullableListMap ?? this.nullableListMap,
      mapList: mapList ?? this.mapList,
      mapListWithDefault: mapListWithDefault ?? this.mapListWithDefault,
      nullableMapList: nullableMapList ?? this.nullableMapList,
      geoPoint: geoPoint ?? this.geoPoint,
      geoPointWithDefault: geoPointWithDefault ?? this.geoPointWithDefault,
      nullableGeoPoint: nullableGeoPoint ?? this.nullableGeoPoint,
      dateTime: dateTime ?? this.dateTime,
      nullableDateTime: nullableDateTime ?? this.nullableDateTime,
      timestamp: timestamp ?? this.timestamp,
      nullableTimestamp: nullableTimestamp ?? this.nullableTimestamp,
      documentReference: documentReference ?? this.documentReference,
      nullableDocumentReference:
          nullableDocumentReference ?? this.nullableDocumentReference,
      foo: foo ?? this.foo,
      fooWithDefault: fooWithDefault ?? this.fooWithDefault,
      nullableFoo: nullableFoo ?? this.nullableFoo,
      nullableFooWithDefaultAnnotation: nullableFooWithDefaultAnnotation ??
          this.nullableFooWithDefaultAnnotation,
      fieldValueAllowedInt: fieldValueAllowedInt ?? this.fieldValueAllowedInt,
      fieldValueAllowedNullableInt:
          fieldValueAllowedNullableInt ?? this.fieldValueAllowedNullableInt,
      fieldValueAllowedNullableIntWithDefaultAnnotation:
          fieldValueAllowedNullableIntWithDefaultAnnotation ??
              this.fieldValueAllowedNullableIntWithDefaultAnnotation,
      entityId: entityId ?? this.entityId,
      path: path ?? this.path,
      entityReference: entityReference ?? this.entityReference,
    );
  }
}

class CreateEntity {
  const CreateEntity({
    required this.text,
    this.textWithDefault,
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
  final String? textWithDefault;
  final String? nullableText;
  final int integer;
  final int integerWithDefault;
  final int? nullableInteger;
  final double doubleNumber;
  final double doubleNumberWithDefault;
  final double? nullableDoubleNumber;
  final bool isBool;
  final bool isBoolWithDefault;
  final bool? nullableIsBool;
  final List<String> texts;
  final List<String> textsWithDefault;
  final List<String>? nullableTexts;
  final Map<String, dynamic> map;
  final Map<String, dynamic> mapWithDefault;
  final Map<String, dynamic>? nullableMap;
  final Map<String, String> stringMap;
  final Map<String, String> stringMapWithDefault;
  final Map<String, String>? nullableStringMap;
  final Map<String, Map<String, int>> nestedMap;
  final Map<String, Map<String, int>> nestedMapWithDefault;
  final Map<String, Map<String, int>>? nullableNestedMap;
  final Map<String, List<int>> listMap;
  final Map<String, List<int>> listMapWithDefault;
  final Map<String, List<int>>? nullableListMap;
  final List<Map<String, int>> mapList;
  final List<Map<String, int>> mapListWithDefault;
  final List<Map<String, int>>? nullableMapList;
  final GeoPoint geoPoint;
  final GeoPoint geoPointWithDefault;
  final GeoPoint? nullableGeoPoint;
  final DateTime dateTime;
  final DateTime? nullableDateTime;
  final Timestamp timestamp;
  final Timestamp? nullableTimestamp;
  final DocumentReference<Object?> documentReference;
  final DocumentReference<Object?>? nullableDocumentReference;
  final Foo foo;
  final Foo fooWithDefault;
  final Foo? nullableFoo;
  final Foo? nullableFooWithDefaultAnnotation;
  final FirestoreData<int> fieldValueAllowedInt;
  final FirestoreData<int>? fieldValueAllowedNullableInt;
  final FirestoreData<int>? fieldValueAllowedNullableIntWithDefaultAnnotation;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'text': text,
      'textWithDefault': textWithDefault ?? 'createDefault',
      'nullableText': nullableText ?? 'createDefault',
      'integer': integer,
      'integerWithDefault': integerWithDefault,
      'nullableInteger': nullableInteger,
      'doubleNumber': doubleNumber,
      'doubleNumberWithDefault': doubleNumberWithDefault,
      'nullableDoubleNumber': nullableDoubleNumber,
      'isBool': isBool,
      'isBoolWithDefault': isBoolWithDefault,
      'nullableIsBool': nullableIsBool,
      'texts': texts,
      'textsWithDefault': textsWithDefault,
      'nullableTexts': nullableTexts,
      'map': map,
      'mapWithDefault': mapWithDefault,
      'nullableMap': nullableMap,
      'stringMap': stringMap,
      'stringMapWithDefault': stringMapWithDefault,
      'nullableStringMap': nullableStringMap,
      'nestedMap': nestedMap,
      'nestedMapWithDefault': nestedMapWithDefault,
      'nullableNestedMap': nullableNestedMap,
      'listMap': listMap,
      'listMapWithDefault': listMapWithDefault,
      'nullableListMap': nullableListMap,
      'mapList': mapList,
      'mapListWithDefault': mapListWithDefault,
      'nullableMapList': nullableMapList,
      'geoPoint': geoPoint,
      'geoPointWithDefault': geoPointWithDefault,
      'nullableGeoPoint': nullableGeoPoint,
      'dateTime': Timestamp.fromDate(dateTime),
      'nullableDateTime': nullableDateTime == null
          ? null
          : Timestamp.fromDate(nullableDateTime!),
      'timestamp': timestamp,
      'nullableTimestamp': nullableTimestamp,
      'documentReference': documentReference,
      'nullableDocumentReference': nullableDocumentReference,
      'foo': _FooJsonConverter().toJson(foo),
      'fooWithDefault': _FooJsonConverter().toJson(fooWithDefault),
      'nullableFoo': _nullableFooJsonConverter.toJson(nullableFoo),
      'nullableFooWithDefaultAnnotation':
          nullableFooWithDefaultAnnotation == null
              ? const Foo('defaultBar')
              : _FooJsonConverter().toJson(nullableFooWithDefaultAnnotation!),
      'fieldValueAllowedInt': fieldValueAllowedInt.value,
      'fieldValueAllowedNullableInt': fieldValueAllowedNullableInt?.value,
      'fieldValueAllowedNullableIntWithDefaultAnnotation':
          fieldValueAllowedNullableIntWithDefaultAnnotation?.value ?? 0,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class UpdateEntity {
  const UpdateEntity({
    this.text,
    this.textWithDefault,
    this.nullableText,
    this.integer,
    this.integerWithDefault,
    this.nullableInteger,
    this.doubleNumber,
    this.doubleNumberWithDefault,
    this.nullableDoubleNumber,
    this.isBool,
    this.isBoolWithDefault,
    this.nullableIsBool,
    this.texts,
    this.textsWithDefault,
    this.nullableTexts,
    this.map,
    this.mapWithDefault,
    this.nullableMap,
    this.stringMap,
    this.stringMapWithDefault,
    this.nullableStringMap,
    this.nestedMap,
    this.nestedMapWithDefault,
    this.nullableNestedMap,
    this.listMap,
    this.listMapWithDefault,
    this.nullableListMap,
    this.mapList,
    this.mapListWithDefault,
    this.nullableMapList,
    this.geoPoint,
    this.geoPointWithDefault,
    this.nullableGeoPoint,
    this.dateTime,
    this.nullableDateTime,
    this.timestamp,
    this.nullableTimestamp,
    this.documentReference,
    this.nullableDocumentReference,
    this.foo,
    this.fooWithDefault,
    this.nullableFoo,
    this.nullableFooWithDefaultAnnotation,
    this.fieldValueAllowedInt,
    this.fieldValueAllowedNullableInt,
    this.fieldValueAllowedNullableIntWithDefaultAnnotation,
  });

  final String? text;
  final String? textWithDefault;
  final String? nullableText;
  final int? integer;
  final int? integerWithDefault;
  final int? nullableInteger;
  final double? doubleNumber;
  final double? doubleNumberWithDefault;
  final double? nullableDoubleNumber;
  final bool? isBool;
  final bool? isBoolWithDefault;
  final bool? nullableIsBool;
  final List<String>? texts;
  final List<String>? textsWithDefault;
  final List<String>? nullableTexts;
  final Map<String, dynamic>? map;
  final Map<String, dynamic>? mapWithDefault;
  final Map<String, dynamic>? nullableMap;
  final Map<String, String>? stringMap;
  final Map<String, String>? stringMapWithDefault;
  final Map<String, String>? nullableStringMap;
  final Map<String, Map<String, int>>? nestedMap;
  final Map<String, Map<String, int>>? nestedMapWithDefault;
  final Map<String, Map<String, int>>? nullableNestedMap;
  final Map<String, List<int>>? listMap;
  final Map<String, List<int>>? listMapWithDefault;
  final Map<String, List<int>>? nullableListMap;
  final List<Map<String, int>>? mapList;
  final List<Map<String, int>>? mapListWithDefault;
  final List<Map<String, int>>? nullableMapList;
  final GeoPoint? geoPoint;
  final GeoPoint? geoPointWithDefault;
  final GeoPoint? nullableGeoPoint;
  final DateTime? dateTime;
  final DateTime? nullableDateTime;
  final Timestamp? timestamp;
  final Timestamp? nullableTimestamp;
  final DocumentReference<Object?>? documentReference;
  final DocumentReference<Object?>? nullableDocumentReference;
  final Foo? foo;
  final Foo? fooWithDefault;
  final Foo? nullableFoo;
  final Foo? nullableFooWithDefaultAnnotation;
  final FirestoreData<int>? fieldValueAllowedInt;
  final FirestoreData<int>? fieldValueAllowedNullableInt;
  final FirestoreData<int>? fieldValueAllowedNullableIntWithDefaultAnnotation;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      if (text != null) 'text': text,
      'textWithDefault': textWithDefault ?? 'updateDefault',
      'nullableText': nullableText ?? 'updateDefault',
      if (integer != null) 'integer': integer,
      if (integerWithDefault != null) 'integerWithDefault': integerWithDefault,
      if (nullableInteger != null) 'nullableInteger': nullableInteger,
      if (doubleNumber != null) 'doubleNumber': doubleNumber,
      if (doubleNumberWithDefault != null)
        'doubleNumberWithDefault': doubleNumberWithDefault,
      if (nullableDoubleNumber != null)
        'nullableDoubleNumber': nullableDoubleNumber,
      if (isBool != null) 'isBool': isBool,
      if (isBoolWithDefault != null) 'isBoolWithDefault': isBoolWithDefault,
      if (nullableIsBool != null) 'nullableIsBool': nullableIsBool,
      if (texts != null) 'texts': texts,
      if (textsWithDefault != null) 'textsWithDefault': textsWithDefault,
      if (nullableTexts != null) 'nullableTexts': nullableTexts,
      if (map != null) 'map': map,
      if (mapWithDefault != null) 'mapWithDefault': mapWithDefault,
      if (nullableMap != null) 'nullableMap': nullableMap,
      if (stringMap != null) 'stringMap': stringMap,
      if (stringMapWithDefault != null)
        'stringMapWithDefault': stringMapWithDefault,
      if (nullableStringMap != null) 'nullableStringMap': nullableStringMap,
      if (nestedMap != null) 'nestedMap': nestedMap,
      if (nestedMapWithDefault != null)
        'nestedMapWithDefault': nestedMapWithDefault,
      if (nullableNestedMap != null) 'nullableNestedMap': nullableNestedMap,
      if (listMap != null) 'listMap': listMap,
      if (listMapWithDefault != null) 'listMapWithDefault': listMapWithDefault,
      if (nullableListMap != null) 'nullableListMap': nullableListMap,
      if (mapList != null) 'mapList': mapList,
      if (mapListWithDefault != null) 'mapListWithDefault': mapListWithDefault,
      if (nullableMapList != null) 'nullableMapList': nullableMapList,
      if (geoPoint != null) 'geoPoint': geoPoint,
      if (geoPointWithDefault != null)
        'geoPointWithDefault': geoPointWithDefault,
      if (nullableGeoPoint != null) 'nullableGeoPoint': nullableGeoPoint,
      if (dateTime != null) 'dateTime': Timestamp.fromDate(dateTime!),
      if (nullableDateTime != null)
        'nullableDateTime': nullableDateTime == null
            ? null
            : Timestamp.fromDate(nullableDateTime!),
      if (timestamp != null) 'timestamp': timestamp,
      if (nullableTimestamp != null) 'nullableTimestamp': nullableTimestamp,
      if (documentReference != null) 'documentReference': documentReference,
      if (nullableDocumentReference != null)
        'nullableDocumentReference': nullableDocumentReference,
      if (foo != null) 'foo': _FooJsonConverter().toJson(foo!),
      if (fooWithDefault != null)
        'fooWithDefault': _FooJsonConverter().toJson(fooWithDefault!),
      if (nullableFoo != null)
        'nullableFoo': _nullableFooJsonConverter.toJson(nullableFoo!),
      if (nullableFooWithDefaultAnnotation != null)
        'nullableFooWithDefaultAnnotation':
            _FooJsonConverter().toJson(nullableFooWithDefaultAnnotation!),
      if (fieldValueAllowedInt != null)
        'fieldValueAllowedInt': fieldValueAllowedInt!.value,
      if (fieldValueAllowedNullableInt != null)
        'fieldValueAllowedNullableInt': fieldValueAllowedNullableInt!.value,
      if (fieldValueAllowedNullableIntWithDefaultAnnotation != null)
        'fieldValueAllowedNullableIntWithDefaultAnnotation':
            fieldValueAllowedNullableIntWithDefaultAnnotation!.value,
    };
    final jsonPostProcessors = <({String key, dynamic value})>[];
    return {
      ...json,
      ...Map.fromEntries(jsonPostProcessors
          .map((record) => MapEntry(record.key, record.value))),
    };
  }
}

class DeleteEntity {}

/// Reference to the 'entities' collection with a converter for [ReadEntity].
/// This allows for type-safe read operations from Firestore, converting
/// Firestore documents to [ReadEntity] objects.
final readEntityCollectionReference =
    FirebaseFirestore.instance.collection('entities').withConverter<ReadEntity>(
          fromFirestore: (ds, _) => ReadEntity.fromDocumentSnapshot(ds),
          toFirestore: (_, __) => throw UnimplementedError(),
        );

/// Creates a [DocumentReference] for a specific Entity document.
DocumentReference<ReadEntity> readEntityDocumentReference({
  required String entityId,
}) =>
    readEntityCollectionReference.doc(entityId);

/// Reference to the 'entities' collection with a converter for [CreateEntity].
/// This enables type-safe create operations in Firestore, converting
/// [CreateEntity] objects to Firestore document data.
final createEntityCollectionReference = FirebaseFirestore.instance
    .collection('entities')
    .withConverter<CreateEntity>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Entity document.
DocumentReference<CreateEntity> createEntityDocumentReference({
  required String entityId,
}) =>
    createEntityCollectionReference.doc(entityId);

/// Reference to the 'entities' collection with a converter for [UpdateEntity].
/// This allows for type-safe update operations in Firestore, converting
/// [UpdateEntity] objects to Firestore document data.
final updateEntityCollectionReference = FirebaseFirestore.instance
    .collection('entities')
    .withConverter<UpdateEntity>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// Creates a [DocumentReference] for a specific Entity document.
DocumentReference<UpdateEntity> updateEntityDocumentReference({
  required String entityId,
}) =>
    updateEntityCollectionReference.doc(entityId);

/// Reference to the 'entities' collection with a converter for [DeleteEntity].
/// This reference is used specifically for delete operations and does not
/// support reading or writing data to Firestore.
final deleteEntityCollectionReference = FirebaseFirestore.instance
    .collection('entities')
    .withConverter<DeleteEntity>(
      fromFirestore: (_, __) => throw UnimplementedError(),
      toFirestore: (_, __) => throw UnimplementedError(),
    );

/// Creates a [DocumentReference] for a specific Entity document.
DocumentReference<DeleteEntity> deleteEntityDocumentReference({
  required String entityId,
}) =>
    deleteEntityCollectionReference.doc(entityId);

/// A service class for managing entity documents in the database.
///
/// This class provides methods to perform CRUD (Create, Read, Update, Delete)
/// operations on entity documents.
///
/// It includes methods to fetch and subscribe to single or multiple [ReadEntity]
/// documents, as well as methods to add, set, update, and delete documents.
///
/// The class uses Firebase Firestore as the backend, assuming [ReadEntity],
/// [CreateEntity], [UpdateEntity] are models representing the data.
///
/// Usage:
///
/// - To fetch or subscribe to one or more entity documents, use [fetchDocuments],
/// [subscribeDocuments], [fetchDocument], or [subscribeDocument].
/// - To modify entity documents, use [add], [set], [update], or [delete].
///
/// This class is designed to abstract the complexities of direct Firestore
/// usage and provide a straightforward API for entity document operations.

class EntityQuery {
  /// Fetches a list of [ReadEntity] documents from Cloud Firestore.
  ///
  /// This method retrieves documents based on the provided query and sorts them
  /// if a [compare] function is given.
  /// You can customize the query by using the [queryBuilder] and control the

  Future<List<ReadEntity>> fetchDocuments({
    GetOptions? options,
    Query<ReadEntity>? Function(Query<ReadEntity> query)? queryBuilder,
    int Function(ReadEntity lhs, ReadEntity rhs)? compare,
  }) async {
    Query<ReadEntity> query = readEntityCollectionReference;
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

  /// Subscribes to a stream of [ReadEntity] documents from Cloud Firestore.
  ///
  /// This method returns a stream of [ReadEntity] documents, which updates in
  /// real-time based on the database changes. You can customize the query using
  /// [queryBuilder]. The documents can be sorted using the [compare] function.

  Stream<List<ReadEntity>> subscribeDocuments({
    Query<ReadEntity>? Function(Query<ReadEntity> query)? queryBuilder,
    int Function(ReadEntity lhs, ReadEntity rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<ReadEntity> query = readEntityCollectionReference;
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

  /// Fetches a single [ReadEntity] document from Cloud Firestore by its ID.
  ///
  /// This method retrieves a specific document using the provided [entityId].
  /// You can control the data retrieval with [GetOptions].

  Future<ReadEntity?> fetchDocument({
    required String entityId,
    GetOptions? options,
  }) async {
    final ds = await readEntityDocumentReference(
      entityId: entityId,
    ).get(options);
    return ds.data();
  }

  /// Subscribes to a stream of a single [ReadEntity] document from Cloud Firestore by its ID.
  ///
  /// This method returns a stream of a single [ReadEntity] document, which updates in
  /// real-time based on the database changes. You can control the data retrieval with [GetOptions].

  Stream<ReadEntity?> subscribeDocument({
    required String entityId,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = readEntityDocumentReference(
      entityId: entityId,
    ).snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [entity] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [createEntity] data.

  Future<DocumentReference<CreateEntity>> add({
    required CreateEntity createEntity,
  }) =>
      createEntityCollectionReference.add(createEntity);

  /// Sets a [entity] document to Cloud Firestore.
  ///
  /// This method creates a new document in Cloud Firestore using the provided
  /// [updateEntity] data.

  Future<void> set({
    required String entityId,
    required CreateEntity createEntity,
    SetOptions? options,
  }) =>
      createEntityDocumentReference(
        entityId: entityId,
      ).set(createEntity, options);

  /// Updates a entity document in Cloud Firestore.
  ///
  /// This method partially updates the document identified by [entityId] with the
  /// provided [updateEntity] data.
  /// The update is based on the structure defined in `UpdateEntity.toJson()`.

  Future<void> update({
    required String entityId,
    required UpdateEntity updateEntity,
  }) =>
      updateEntityDocumentReference(
        entityId: entityId,
      ).update(updateEntity.toJson());

  /// Deletes a [entity] document from Cloud Firestore.
  ///
  /// This method deletes an existing document identified by [entityId].

  Future<void> delete({
    required String entityId,
  }) =>
      deleteEntityDocumentReference(
        entityId: entityId,
      ).delete();
}
