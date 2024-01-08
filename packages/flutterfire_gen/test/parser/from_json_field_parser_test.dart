import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/parser/from_json_field_parser.dart';
import 'package:flutterfire_gen/src/utils/dart_type_util.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'from_json_field_parser_test.mocks.dart';

@GenerateMocks([InterfaceType, InterfaceElement, DynamicType])
void main() {
  group('FromJsonFieldParser test', () {
    late final MockDynamicType dynamicType;
    late final MockInterfaceType stringType;
    late final MockInterfaceElement stringElement;
    late final MockInterfaceType nullableStringType;
    late final MockInterfaceElement nullableStringElement;
    late final MockInterfaceType dateTimeType;
    late final MockInterfaceElement dateTimeElement;
    late final MockInterfaceType nullableDateTimeType;
    late final MockInterfaceElement nullableDateTimeElement;
    late final MockInterfaceType jsonMapType;
    late final MockInterfaceElement jsonMapElement;
    late final MockInterfaceType nullableJsonMapType;
    late final MockInterfaceElement nullableJsonMapElement;
    late final MockInterfaceType mapStringDynamicJsonMapType;
    late final MockInterfaceElement mapStringDynamicJsonMapElement;
    late final MockInterfaceType mapStringIntType;
    late final MockInterfaceElement mapStringIntElement;
    late final MockInterfaceType mapStringIntJsonMapType;
    late final MockInterfaceElement mapStringIntJsonMapElement;
    late final MockInterfaceType nullableMapStringIntJsonMapType;
    late final MockInterfaceElement nullableMapStringIntJsonMapElement;
    late final MockInterfaceType nullableMapStringIntType;
    late final MockInterfaceElement nullableMapStringIntElement;
    late final MockInterfaceType listStringType;
    late final MockInterfaceElement listStringElement;

    setUpAll(() {
      dynamicType = MockDynamicType();

      final intType = MockInterfaceType();
      final intElement = MockInterfaceElement();
      when(intElement.name).thenReturn('int');
      when(intType.isDartCoreList).thenReturn(false);
      when(intType.isJsonMap).thenReturn(false);
      when(intType.isDartCoreInt).thenReturn(true);
      when(intType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(intType.element).thenReturn(intElement);
      when(intType.typeArguments).thenReturn([]);

      stringType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringType.isDartCoreList).thenReturn(false);
      when(stringType.isJsonMap).thenReturn(false);
      when(stringType.isDartCoreString).thenReturn(true);
      when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringType.element).thenReturn(stringElement);
      when(stringType.typeArguments).thenReturn([]);

      nullableStringType = MockInterfaceType();
      nullableStringElement = MockInterfaceElement();
      when(nullableStringElement.name).thenReturn('String');
      when(nullableStringType.isDartCoreList).thenReturn(false);
      when(nullableStringType.isJsonMap).thenReturn(false);
      when(nullableStringType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableStringType.element).thenReturn(nullableStringElement);
      when(nullableStringType.typeArguments).thenReturn([]);

      dateTimeType = MockInterfaceType();
      dateTimeElement = MockInterfaceElement();
      when(dateTimeElement.name).thenReturn('DateTime');
      when(dateTimeType.isDartCoreList).thenReturn(false);
      when(dateTimeType.isJsonMap).thenReturn(false);
      when(dateTimeType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(dateTimeType.element).thenReturn(dateTimeElement);
      when(dateTimeType.typeArguments).thenReturn([]);

      nullableDateTimeType = MockInterfaceType();
      nullableDateTimeElement = MockInterfaceElement();
      when(nullableDateTimeElement.name).thenReturn('DateTime');
      when(nullableDateTimeType.isDartCoreList).thenReturn(false);
      when(nullableDateTimeType.isJsonMap).thenReturn(false);
      when(nullableDateTimeType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableDateTimeType.element).thenReturn(nullableDateTimeElement);
      when(nullableDateTimeType.typeArguments).thenReturn([]);

      jsonMapType = MockInterfaceType();
      jsonMapElement = MockInterfaceElement();
      when(jsonMapElement.name).thenReturn('Map');
      when(jsonMapType.isDartCoreList).thenReturn(false);
      when(jsonMapType.isDartCoreMap).thenReturn(true);
      when(jsonMapType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(jsonMapType.element).thenReturn(jsonMapElement);
      when(jsonMapType.typeArguments).thenReturn([
        stringType,
        dynamicType,
      ]);

      nullableJsonMapType = MockInterfaceType();
      nullableJsonMapElement = MockInterfaceElement();
      when(nullableJsonMapElement.name).thenReturn('Map');
      when(nullableJsonMapType.isDartCoreList).thenReturn(false);
      when(nullableJsonMapType.isDartCoreMap).thenReturn(true);
      when(nullableJsonMapType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableJsonMapType.element).thenReturn(nullableJsonMapElement);
      when(nullableJsonMapType.typeArguments).thenReturn([
        stringType,
        dynamicType,
      ]);

      mapStringDynamicJsonMapType = MockInterfaceType();
      mapStringDynamicJsonMapElement = MockInterfaceElement();
      when(mapStringDynamicJsonMapElement.name).thenReturn('Map');
      when(mapStringDynamicJsonMapType.isDartCoreList).thenReturn(false);
      when(mapStringDynamicJsonMapType.isDartCoreMap).thenReturn(true);
      when(mapStringDynamicJsonMapType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(mapStringDynamicJsonMapType.element)
          .thenReturn(mapStringDynamicJsonMapElement);
      when(mapStringDynamicJsonMapType.typeArguments).thenReturn([
        stringType,
        jsonMapType,
      ]);

      mapStringIntType = MockInterfaceType();
      mapStringIntElement = MockInterfaceElement();
      when(mapStringIntElement.name).thenReturn('Map');
      when(mapStringIntType.isDartCoreList).thenReturn(false);
      when(mapStringIntType.isDartCoreMap).thenReturn(true);
      when(mapStringIntType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(mapStringIntType.element).thenReturn(mapStringIntElement);
      when(mapStringIntType.typeArguments).thenReturn([
        stringType,
        intType,
      ]);

      mapStringIntJsonMapType = MockInterfaceType();
      mapStringIntJsonMapElement = MockInterfaceElement();
      when(mapStringIntJsonMapElement.name).thenReturn('Map');
      when(mapStringIntJsonMapType.isDartCoreList).thenReturn(false);
      when(mapStringIntJsonMapType.isDartCoreMap).thenReturn(true);
      when(mapStringIntJsonMapType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(mapStringIntJsonMapType.element)
          .thenReturn(mapStringIntJsonMapElement);
      when(mapStringIntJsonMapType.typeArguments).thenReturn([
        stringType,
        mapStringIntType,
      ]);

      nullableMapStringIntType = MockInterfaceType();
      nullableMapStringIntElement = MockInterfaceElement();
      when(mapStringIntElement.name).thenReturn('Map');
      when(nullableMapStringIntType.isDartCoreList).thenReturn(false);
      when(nullableMapStringIntType.isDartCoreMap).thenReturn(true);
      when(nullableMapStringIntType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableMapStringIntType.element)
          .thenReturn(nullableMapStringIntElement);
      when(nullableMapStringIntType.typeArguments).thenReturn([
        stringType,
        intType,
      ]);

      nullableMapStringIntJsonMapType = MockInterfaceType();
      nullableMapStringIntJsonMapElement = MockInterfaceElement();
      when(nullableMapStringIntJsonMapElement.name).thenReturn('Map');
      when(nullableMapStringIntJsonMapType.isDartCoreList).thenReturn(false);
      when(nullableMapStringIntJsonMapType.isDartCoreMap).thenReturn(true);
      when(nullableMapStringIntJsonMapType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(nullableMapStringIntJsonMapType.element)
          .thenReturn(nullableMapStringIntJsonMapElement);
      when(nullableMapStringIntJsonMapType.typeArguments).thenReturn([
        stringType,
        nullableMapStringIntType,
      ]);

      listStringType = MockInterfaceType();
      listStringElement = MockInterfaceElement();
      when(listStringElement.name).thenReturn('List');
      when(listStringType.isDartCoreList).thenReturn(true);
      when(listStringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(listStringType.element).thenReturn(listStringElement);
      when(listStringType.typeArguments).thenReturn([stringType]);
    });

    test('test String field', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: stringType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String,");
    });

    test('test String field with default value', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: stringType,
        defaultValueString: "'defaultText'",
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String? ?? 'defaultText',");
    });

    test('test String? field', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: nullableStringType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String?,");
    });

    test('test String? field with default value', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: nullableStringType,
        defaultValueString: "'defaultText'",
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String? ?? 'defaultText',");
    });

    test('test DateTime field', () {
      final parser = FromJsonFieldParser(
        name: 'createdAt',
        dartType: dateTimeType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        "createdAt: (extendedJson['createdAt'] as Timestamp).toDate(),",
      );
    });

    test('test DateTime? field', () {
      final parser = FromJsonFieldParser(
        name: 'createdAt',
        dartType: nullableDateTimeType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        "createdAt: (extendedJson['createdAt'] as Timestamp?)?.toDate(),",
      );
    });

    test('test Map<String, dynamic> field', () {
      final parser = FromJsonFieldParser(
        name: 'jsonMap',
        dartType: jsonMapType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        "jsonMap: extendedJson['jsonMap'] as Map<String, dynamic>,",
      );
    });

    test('test Map<String, dynamic>? field', () {
      final parser = FromJsonFieldParser(
        name: 'jsonMap',
        dartType: nullableJsonMapType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        "jsonMap: extendedJson['jsonMap'] as Map<String, dynamic>?,",
      );
    });

    test('test Map<String, Map<String, dynamic>> field', () {
      final parser = FromJsonFieldParser(
        name: 'mapStringDynamicJsonMap',
        dartType: mapStringDynamicJsonMapType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        """mapStringDynamicJsonMap: (extendedJson['mapStringDynamicJsonMap'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v as Map<String, dynamic>)),""",
      );
    });

    test('test Map<String, Map<String, int>> field', () {
      final parser = FromJsonFieldParser(
        name: 'mapStringIntJsonMap',
        dartType: mapStringIntJsonMapType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        """mapStringIntJsonMap: (extendedJson['mapStringIntJsonMap'] as Map<String, dynamic>).map((k, v) => MapEntry(k, (v as Map<String, dynamic>).map((k, v) => MapEntry(k, v as int)))),""",
      );
    });

    test('test Map<String, Map<String, int>?> field', () {
      final parser = FromJsonFieldParser(
        name: 'nullableMapStringIntJsonMap',
        dartType: nullableMapStringIntJsonMapType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        """nullableMapStringIntJsonMap: (extendedJson['nullableMapStringIntJsonMap'] as Map<String, dynamic>).map((k, v) => MapEntry(k, (v as Map<String, dynamic>?)?.map((k, v) => MapEntry(k, v as int)))),""",
      );
    });

    test('test List<String> field', () {
      final parser = FromJsonFieldParser(
        name: 'texts',
        dartType: listStringType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(
        result,
        '''texts: (extendedJson['texts'] as List<dynamic>).map((e) => e as String).toList(),''',
      );
    });
  });
}
