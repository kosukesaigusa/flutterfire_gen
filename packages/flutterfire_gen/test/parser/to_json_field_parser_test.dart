import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/parser/to_json_field_parser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'to_json_field_parser_test.mocks.dart';

@GenerateMocks([InterfaceType, InterfaceElement, DynamicType])
void main() {
  group('ToJsonFieldParser test', () {
    late final MockInterfaceType stringType;
    late final MockInterfaceElement stringElement;

    setUpAll(() {
      stringType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringType.isDartCoreList).thenReturn(false);
      when(stringType.isDartCoreString).thenReturn(true);
      when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringType.element).thenReturn(stringElement);
      when(stringType.typeArguments).thenReturn([]);
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
  });
}
