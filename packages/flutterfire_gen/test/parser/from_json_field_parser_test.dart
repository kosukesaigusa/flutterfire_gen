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

    setUpAll(() {
      dynamicType = MockDynamicType();

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
  });
}
