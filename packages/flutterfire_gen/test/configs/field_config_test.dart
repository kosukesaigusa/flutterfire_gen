import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/configs/field_config.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'field_config_test.mocks.dart';

@GenerateMocks([InterfaceType, InterfaceElement])
void main() {
  late final MockInterfaceType stringType;
  late final MockInterfaceElement stringElement;

  setUpAll(() {
    stringType = MockInterfaceType();
    stringElement = MockInterfaceElement();
    when(stringElement.name).thenReturn('String');
    when(stringType.element).thenReturn(stringElement);
    when(stringType.typeArguments).thenReturn([]);
    when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
    when(stringType.isDartCoreString).thenReturn(true);
    when(stringType.isDartCoreList).thenReturn(false);
  });

  group('FieldConfig test', () {
    group('typeName test', () {
      test('test String type', () {
        final config = FieldConfig(name: 'text', dartType: stringType);
        expect(config.typeName(), 'String');
      });

      test('test String type force nullable', () {
        final config = FieldConfig(name: 'text', dartType: stringType);
        expect(config.typeName(forceNullable: true), 'String?');
      });

      test('test String type wrap by FirestoreData', () {
        final config = FieldConfig(name: 'text', dartType: stringType);
        expect(
          config.typeName(wrapByFirestoreData: true),
          'FirestoreData<String>',
        );
      });
    });
  });
}
