import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/parser/from_json_field_parser.dart';
import 'package:flutterfire_gen/src/utils/dart_type_util.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'from_json_field_parser_test.mocks.dart';

@GenerateMocks([InterfaceType, InterfaceElement])
void main() {
  group('FromJsonFieldParser test', () {
    late final MockInterfaceType stringDartType;
    late final MockInterfaceElement stringElement;
    late final MockInterfaceType nullableStringDartType;
    late final MockInterfaceElement nullableStringElement;

    setUpAll(() {
      stringDartType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringDartType.isDartCoreList).thenReturn(false);
      when(stringDartType.isJsonMap).thenReturn(false);
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
  });
}
