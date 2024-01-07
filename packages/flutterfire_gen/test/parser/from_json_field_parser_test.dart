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

    setUpAll(() {
      stringDartType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringDartType.isDartCoreList).thenReturn(false);
      when(stringDartType.isJsonMap).thenReturn(false);
      when(stringDartType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringDartType.element).thenReturn(stringElement);
      when(stringDartType.typeArguments).thenReturn([]);
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
  });
}
