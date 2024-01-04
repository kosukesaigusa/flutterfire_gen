import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/utils/dart_type_util.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'dart_type_util_test.mocks.dart';

@GenerateMocks([
  DynamicType,
  InterfaceType,
  InterfaceElement,
  TypeParameterType,
])
void main() {
  group('DartTypeExtension tests', () {
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
    late final MockInterfaceType listOfStringsType;
    late final MockInterfaceElement listOfStringsElement;
    late final MockInterfaceType jsonMapType;
    late final MockDynamicType dynamicType;
    late final MockInterfaceElement mapElement;
    late final MockInterfaceType intDynamicMapType;
    late final MockInterfaceElement intDynamicMapElement;

    setUpAll(() {
      intType = MockInterfaceType();
      intElement = MockInterfaceElement();
      when(intElement.name).thenReturn('int');
      when(intType.element).thenReturn(intElement);
      when(intType.typeArguments).thenReturn([]);
      when(intType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(intType.isDartCoreString).thenReturn(false);

      nullableIntType = MockInterfaceType();
      nullableIntElement = MockInterfaceElement();
      when(nullableIntElement.name).thenReturn('int');
      when(nullableIntType.element).thenReturn(nullableIntElement);
      when(nullableIntType.typeArguments).thenReturn([]);
      when(nullableIntType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);

      stringType = MockInterfaceType();
      stringElement = MockInterfaceElement();
      when(stringElement.name).thenReturn('String');
      when(stringType.element).thenReturn(stringElement);
      when(stringType.typeArguments).thenReturn([]);
      when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);
      when(stringType.isDartCoreString).thenReturn(true);

      nullableStringType = MockInterfaceType();
      nullableStringElement = MockInterfaceElement();
      when(nullableStringElement.name).thenReturn('String');
      when(nullableStringType.element).thenReturn(nullableStringElement);
      when(nullableStringType.typeArguments).thenReturn([]);
      when(nullableStringType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.question);

      dateTimeType = MockInterfaceType();
      dateTimeElement = MockInterfaceElement();
      when(dateTimeElement.name).thenReturn('DateTime');
      when(dateTimeType.element).thenReturn(dateTimeElement);
      when(dateTimeType.typeArguments).thenReturn([]);
      when(dateTimeType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);

      listOfStringsType = MockInterfaceType();
      listOfStringsElement = MockInterfaceElement();
      when(listOfStringsElement.name).thenReturn('List');
      when(listOfStringsType.element).thenReturn(listOfStringsElement);
      when(listOfStringsType.typeArguments).thenReturn([
        stringType,
      ]);
      when(listOfStringsType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);

      jsonMapType = MockInterfaceType();
      dynamicType = MockDynamicType();
      mapElement = MockInterfaceElement();
      when(mapElement.name).thenReturn('Map');
      when(jsonMapType.isDartCoreMap).thenReturn(true);
      when(jsonMapType.element).thenReturn(mapElement);
      when(jsonMapType.typeArguments).thenReturn([
        stringType,
        dynamicType,
      ]);
      when(jsonMapType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);

      intDynamicMapType = MockInterfaceType();
      intDynamicMapElement = MockInterfaceElement();
      when(intDynamicMapElement.name).thenReturn('Map');
      when(intDynamicMapType.isDartCoreMap).thenReturn(true);
      when(intDynamicMapType.element).thenReturn(mapElement);
      when(intDynamicMapType.typeArguments).thenReturn([intType, dynamicType]);
      when(intDynamicMapType.nullabilitySuffix)
          .thenReturn(NullabilitySuffix.none);
    });

    group('DartType.typeName tests', () {
      test('dynamic type returns "dynamic"', () {
        final dynamicType = MockDynamicType();
        expect(dynamicType.typeName(), 'dynamic');
      });

      test('int type returns "int"', () {
        expect(intType.typeName(), 'int');
      });

      test('String? type returns "String?"', () {
        expect(nullableStringType.typeName(), 'String?');
      });

      test('List<String> type returns "List<String>"', () {
        expect(listOfStringsType.typeName(), 'List<String>');
      });

      test(
          'int? type (wrapByFirestoreData: true) '
          'returns "FirestoreData<int>?"', () {
        expect(
          nullableIntType.typeName(wrapByFirestoreData: true),
          'FirestoreData<int>?',
        );
      });

      test(
          'List<String> type (wrapByFirestoreData: true) '
          'returns "FirestoreData<List<String>>"', () {
        expect(
          listOfStringsType.typeName(wrapByFirestoreData: true),
          'FirestoreData<List<String>>',
        );
      });

      test(
        'TypeParameterType (Generics T) type throws Unimplemented error',
        () {
          final typeParameterType = MockTypeParameterType();
          expect(
            typeParameterType.typeName,
            throwsA(isA<UnimplementedError>()),
          );
        },
      );
    });

    test('isDateTimeType test', () {
      expect(dateTimeType.isDateTimeType, true);
      expect(intType.isDateTimeType, false);
    });

    group('isJsonMap test', () {
      test('Map<String, dynamic> type is JSON map', () {
        expect(jsonMapType.isJsonMap, true);
      });

      test('Map<int, dynamic> type is not JSON map', () {
        expect(intDynamicMapType.isJsonMap, false);
      });
    });
  });
}
