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
    final intType = MockInterfaceType();
    final intElement = MockInterfaceElement();

    when(intElement.name).thenReturn('int');
    when(intType.element).thenReturn(intElement);
    when(intType.typeArguments).thenReturn([]);
    when(intType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);

    final nullableIntType = MockInterfaceType();
    final nullableIntElement = MockInterfaceElement();
    when(nullableIntElement.name).thenReturn('int');
    when(nullableIntType.element).thenReturn(nullableIntElement);
    when(nullableIntType.typeArguments).thenReturn([]);
    when(nullableIntType.nullabilitySuffix)
        .thenReturn(NullabilitySuffix.question);

    final stringType = MockInterfaceType();
    final stringElement = MockInterfaceElement();
    when(stringElement.name).thenReturn('String');
    when(stringType.element).thenReturn(stringElement);
    when(stringType.typeArguments).thenReturn([]);
    when(stringType.nullabilitySuffix).thenReturn(NullabilitySuffix.none);

    final nullableStringType = MockInterfaceType();
    final nullableStringElement = MockInterfaceElement();
    when(nullableStringElement.name).thenReturn('String');
    when(nullableStringType.element).thenReturn(nullableStringElement);
    when(nullableStringType.typeArguments).thenReturn([]);
    when(nullableStringType.nullabilitySuffix)
        .thenReturn(NullabilitySuffix.question);

    final listOfStringsType = MockInterfaceType();
    final listOfStringsElement = MockInterfaceElement();
    when(listOfStringsElement.name).thenReturn('List');
    when(listOfStringsType.element).thenReturn(listOfStringsElement);
    when(listOfStringsType.typeArguments).thenReturn([
      stringType,
    ]);
    when(listOfStringsType.nullabilitySuffix)
        .thenReturn(NullabilitySuffix.none);

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
  });
}
