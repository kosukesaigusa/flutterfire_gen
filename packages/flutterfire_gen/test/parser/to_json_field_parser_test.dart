import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/configs/json_converter_config.dart';
import 'package:flutterfire_gen/src/parser/to_json_field_parser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'to_json_field_parser_test.mocks.dart';

@GenerateMocks([InterfaceType, InterfaceElement, DynamicType])
void main() {
  group('ToJsonFieldParser test', () {
    late final MockDynamicType dynamicType;
    late final MockInterfaceType intType;
    late final MockInterfaceElement intElement;
    late final MockInterfaceType nullableIntType;
    late final MockInterfaceElement nullableIntElement;
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

    setUpAll(() {
      dynamicType = MockDynamicType();

      intType = MockInterfaceType();
      intElement = MockInterfaceElement();
      when(intElement.name).thenReturn('int');
      when(intType.isDartCoreList).thenReturn(false);
      when(intType.isDartCoreInt).thenReturn(true);
      when(intType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(intType.element).thenReturn(intElement);
      when(intType.typeArguments).thenReturn([]);

      nullableIntType = MockInterfaceType();
      nullableIntElement = MockInterfaceElement();
      when(nullableIntElement.name).thenReturn('int');
      when(nullableIntType.isDartCoreList).thenReturn(false);
      when(nullableIntType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableIntType.element).thenReturn(nullableIntElement);
      when(nullableIntType.typeArguments).thenReturn([]);

      stringType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringType.isDartCoreList).thenReturn(false);
      when(stringType.isDartCoreString).thenReturn(true);
      when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringType.element).thenReturn(stringElement);
      when(stringType.typeArguments).thenReturn([]);

      nullableStringType = MockInterfaceType();
      nullableStringElement = MockInterfaceElement();
      when(nullableStringElement.name).thenReturn('String');
      when(nullableStringType.isDartCoreList).thenReturn(false);
      when(nullableStringType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);
      when(nullableStringType.element).thenReturn(nullableStringElement);
      when(nullableStringType.typeArguments).thenReturn([]);

      dateTimeType = MockInterfaceType();
      dateTimeElement = MockInterfaceElement();
      when(dateTimeElement.name).thenReturn('DateTime');
      when(dateTimeType.isDartCoreList).thenReturn(false);
      when(dateTimeType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(dateTimeType.element).thenReturn(dateTimeElement);
      when(dateTimeType.typeArguments).thenReturn([]);

      nullableDateTimeType = MockInterfaceType();
      nullableDateTimeElement = MockInterfaceElement();
      when(nullableDateTimeElement.name).thenReturn('DateTime');
      when(nullableDateTimeType.isDartCoreList).thenReturn(false);
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
    });

    test('test String field', () {
      final parser = ToJsonFieldParser(
        name: 'text',
        dartType: stringType,
        defaultValueString: null,
        allowFieldValue: false,
        alwaysUseFieldValueServerTimestamp: false,
        jsonConverterConfig: null,
        skipIfNull: false,
      );
      final result = parser.toString();
      expect(result, "'text': text,");
    });

    test('test String field with default value', () {
      final parser = ToJsonFieldParser(
        name: 'text',
        dartType: stringType,
        defaultValueString: "'defaultText'",
        allowFieldValue: false,
        alwaysUseFieldValueServerTimestamp: false,
        jsonConverterConfig: null,
        skipIfNull: false,
      );
      final result = parser.toString();
      expect(result, "'text': text ?? 'defaultText',");
    });

    test('test skipIfNull true', () {
      final parser = ToJsonFieldParser(
        name: 'text',
        dartType: nullableStringType,
        defaultValueString: null,
        allowFieldValue: false,
        alwaysUseFieldValueServerTimestamp: false,
        jsonConverterConfig: null,
        skipIfNull: true,
      );
      final result = parser.toString();
      expect(result, "if (text != null) 'text': text,");
    });

    test('test isAlwaysUseFieldValueServerTimestamp true', () {
      final parser = ToJsonFieldParser(
        name: 'createdAt',
        dartType: dateTimeType,
        defaultValueString: null,
        allowFieldValue: false,
        alwaysUseFieldValueServerTimestamp: true,
        jsonConverterConfig: null,
        skipIfNull: true,
      );
      final result = parser.toString();
      expect(result, "'createdAt': FieldValue.serverTimestamp(),");
    });

    group('test DateTime type field', () {
      test('test DateTime type field with skipIfNull false', () {
        final parser = ToJsonFieldParser(
          name: 'createdAt',
          dartType: dateTimeType,
          defaultValueString: null,
          allowFieldValue: false,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: false,
        );
        final result = parser.toString();
        expect(result, "'createdAt': Timestamp.fromDate(createdAt),");
      });

      test('test DateTime type field with skipIfNull true', () {
        final parser = ToJsonFieldParser(
          name: 'createdAt',
          dartType: dateTimeType,
          defaultValueString: null,
          allowFieldValue: false,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: true,
        );
        final result = parser.toString();
        expect(
          result,
          """if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),""",
        );
      });

      test('test DateTime? type field', () {
        final parser = ToJsonFieldParser(
          name: 'createdAt',
          dartType: nullableDateTimeType,
          defaultValueString: null,
          allowFieldValue: false,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: false,
        );
        final result = parser.toString();
        expect(
          result,
          """'createdAt': createdAt == null ? null : Timestamp.fromDate(createdAt!),""",
        );
      });
    });

    group('test isFieldValueAllowed field', () {
      test('test isFieldValueAllowed field with skipIfNull false', () {
        final parser = ToJsonFieldParser(
          name: 'count',
          dartType: intType,
          defaultValueString: null,
          allowFieldValue: true,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: false,
        );
        final result = parser.toString();
        expect(result, "'count': count.value,");
      });

      test('test isFieldValueAllowed field with skipIfNull true', () {
        final parser = ToJsonFieldParser(
          name: 'count',
          dartType: intType,
          defaultValueString: null,
          allowFieldValue: true,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: true,
        );
        final result = parser.toString();
        expect(result, "if (count != null) 'count': count!.value,");
      });

      test('test isFieldValueAllowed field with skipIfNull false', () {
        final parser = ToJsonFieldParser(
          name: 'count',
          dartType: nullableIntType,
          defaultValueString: null,
          allowFieldValue: true,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: false,
        );
        final result = parser.toString();
        expect(result, "'count': count?.value,");
      });

      test('test isFieldValueAllowed field with skipIfNull true', () {
        final parser = ToJsonFieldParser(
          name: 'count',
          dartType: nullableIntType,
          defaultValueString: null,
          allowFieldValue: true,
          alwaysUseFieldValueServerTimestamp: false,
          jsonConverterConfig: null,
          skipIfNull: true,
        );
        final result = parser.toString();
        expect(result, "if (count != null) 'count': count!.value,");
      });
    });

    group('test JsonConverter applied field test', () {
      test(
        'test JsonConverter applied field '
        'with isFieldValueAllowed false and skipIfNull false',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: jsonMapType,
            defaultValueString: null,
            allowFieldValue: false,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>',
            ),
            skipIfNull: false,
          );
          final result = parser.toString();
          expect(result, "'foo': _FooJsonConverter().toJson(foo),");
        },
      );

      test(
        'test JsonConverter applied field '
        'with isFieldValueAllowed false and skipIfNull true',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: jsonMapType,
            defaultValueString: null,
            allowFieldValue: false,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>',
            ),
            skipIfNull: true,
          );
          final result = parser.toString();
          expect(
            result,
            "if (foo != null) 'foo': _FooJsonConverter().toJson(foo!),",
          );
        },
      );

      test(
        'test JsonConverter applied field '
        'with isFieldValueAllowed true and skipIfNull false',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: jsonMapType,
            defaultValueString: null,
            allowFieldValue: true,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>',
            ),
            skipIfNull: false,
          );
          final result = parser.toString();
          expect(
            result,
            "'foo': _FooJsonConverter().toJson(foo.actualValue),",
          );
        },
      );

      test(
        'test JsonConverter applied field '
        'with isFieldValueAllowed true and skipIfNull false',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: jsonMapType,
            defaultValueString: null,
            allowFieldValue: true,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>',
            ),
            skipIfNull: true,
          );
          final result = parser.toString();
          expect(
            result,
            """if (foo != null) 'foo': _FooJsonConverter().toJson(foo!.actualValue),""",
          );
        },
      );

      test(
        'test JsonConverter applied nullable field '
        'with isFieldValueAllowed false and default value',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: nullableJsonMapType,
            defaultValueString: 'const Map<String, dynamic>',
            allowFieldValue: false,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>?',
            ),
            skipIfNull: false,
          );
          final result = parser.toString();
          expect(
            result,
            """'foo': foo == null ? const Map<String, dynamic> : _FooJsonConverter().toJson(foo!),""",
          );
        },
      );

      test(
        'test JsonConverter applied nullable field '
        'with isFieldValueAllowed true and default value',
        () {
          final parser = ToJsonFieldParser(
            name: 'foo',
            dartType: nullableJsonMapType,
            defaultValueString: 'const Map<String, dynamic>',
            allowFieldValue: true,
            alwaysUseFieldValueServerTimestamp: false,
            jsonConverterConfig: const JsonConverterConfig(
              jsonConverterString: '_FooJsonConverter()',
              clientTypeString: 'Foo',
              firestoreTypeString: 'Map<String, dynamic>?',
            ),
            skipIfNull: false,
          );
          final result = parser.toString();
          expect(
            result,
            """'foo': foo == null ? const Map<String, dynamic> : _FooJsonConverter().toJson(foo!.actualValue),""",
          );
        },
      );
    });
  });
}
