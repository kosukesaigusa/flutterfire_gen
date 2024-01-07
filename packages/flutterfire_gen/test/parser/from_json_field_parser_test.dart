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
    late final MockInterfaceType stringDartType;
    late final MockInterfaceElement stringElement;
    late final MockInterfaceType nullableStringDartType;
    late final MockInterfaceElement nullableStringElement;
    late final MockInterfaceType dateTimeDartType;
    late final MockInterfaceElement dateTimeElement;
    late final MockInterfaceType nullableDateTimeDartType;
    late final MockInterfaceElement nullableDateTimeElement;
    late final MockInterfaceType jsonMapDartType;
    late final MockInterfaceElement jsonMapElement;

    setUpAll(() {
      dynamicType = MockDynamicType();

      stringDartType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringDartType.isDartCoreList).thenReturn(false);
      when(stringDartType.isJsonMap).thenReturn(false);
      when(stringDartType.isDartCoreString).thenReturn(true);
      when(stringDartType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringDartType.element).thenReturn(stringElement);
      when(stringDartType.typeArguments).thenReturn([]);

      nullableStringDartType = MockInterfaceType();
      nullableStringElement = MockInterfaceElement();
      when(nullableStringElement.name).thenReturn('String');
      when(nullableStringDartType.isDartCoreList).thenReturn(false);
      when(nullableStringDartType.isJsonMap).thenReturn(false);
      when(nullableStringDartType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableStringDartType.element).thenReturn(nullableStringElement);
      when(nullableStringDartType.typeArguments).thenReturn([]);

      dateTimeDartType = MockInterfaceType();
      dateTimeElement = MockInterfaceElement();
      when(dateTimeElement.name).thenReturn('DateTime');
      when(dateTimeDartType.isDartCoreList).thenReturn(false);
      when(dateTimeDartType.isJsonMap).thenReturn(false);
      when(dateTimeDartType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(dateTimeDartType.element).thenReturn(dateTimeElement);
      when(dateTimeDartType.typeArguments).thenReturn([]);

      nullableDateTimeDartType = MockInterfaceType();
      nullableDateTimeElement = MockInterfaceElement();
      when(nullableDateTimeElement.name).thenReturn('DateTime');
      when(nullableDateTimeDartType.isDartCoreList).thenReturn(false);
      when(nullableDateTimeDartType.isJsonMap).thenReturn(false);
      when(nullableDateTimeDartType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableDateTimeDartType.element)
          .thenReturn(nullableDateTimeElement);
      when(nullableDateTimeDartType.typeArguments).thenReturn([]);

      jsonMapDartType = MockInterfaceType();
      jsonMapElement = MockInterfaceElement();
      when(jsonMapElement.name).thenReturn('Map');
      when(jsonMapDartType.isDartCoreList).thenReturn(false);
      when(jsonMapDartType.isDartCoreMap).thenReturn(true);
      when(jsonMapDartType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
      when(jsonMapDartType.element).thenReturn(jsonMapElement);
      when(jsonMapDartType.typeArguments).thenReturn([
        stringDartType,
        dynamicType,
      ]);
    });

    test('test String field', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: stringDartType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String,");
    });

    test('test String field with default value', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: stringDartType,
        defaultValueString: "'defaultText'",
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String? ?? 'defaultText',");
    });

    test('test String? field', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: nullableStringDartType,
        defaultValueString: null,
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String?,");
    });

    test('test String? field with default value', () {
      final parser = FromJsonFieldParser(
        name: 'text',
        dartType: nullableStringDartType,
        defaultValueString: "'defaultText'",
        jsonConverterConfig: null,
      );
      final result = parser.toString();
      expect(result, "text: extendedJson['text'] as String? ?? 'defaultText',");
    });

    test('test DateTime field', () {
      final parser = FromJsonFieldParser(
        name: 'createdAt',
        dartType: dateTimeDartType,
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
        dartType: nullableDateTimeDartType,
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
        dartType: jsonMapDartType,
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
