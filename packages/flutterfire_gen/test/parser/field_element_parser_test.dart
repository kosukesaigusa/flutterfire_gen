import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:flutterfire_gen/src/parser/field_element_parser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

import 'field_element_parser_test.mocks.dart';

@GenerateMocks([
  FieldElement,
  ElementAnnotation,
  DartObject,
  DartType,
  TypeChecker,
  ClassElement,
  InterfaceType,
])
void main() {
  late final MockTypeChecker readDefaultTypeChecker;
  late final MockTypeChecker createDefaultTypeChecker;
  late final MockTypeChecker updateDefaultTypeChecker;
  late final MockTypeChecker jsonConverterTypeChecker;
  late final MockTypeChecker jsonPostProcessorTypeChecker;
  late final MockTypeChecker allowFieldValueTypeChecker;
  late final MockTypeChecker
      alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker;
  late final MockTypeChecker
      alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker;

  setUpAll(() {
    readDefaultTypeChecker = MockTypeChecker();
    when(readDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
    createDefaultTypeChecker = MockTypeChecker();
    when(createDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
    updateDefaultTypeChecker = MockTypeChecker();
    when(updateDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
    jsonConverterTypeChecker = MockTypeChecker();
    when(jsonConverterTypeChecker.isAssignableFromType(any)).thenReturn(false);
    when(jsonConverterTypeChecker.isExactlyType(any)).thenReturn(false);
    jsonPostProcessorTypeChecker = MockTypeChecker();
    when(jsonPostProcessorTypeChecker.isAssignableFromType(any))
        .thenReturn(false);
    when(jsonPostProcessorTypeChecker.isExactlyType(any)).thenReturn(false);
    allowFieldValueTypeChecker = MockTypeChecker();
    when(allowFieldValueTypeChecker.isAssignableFromType(any))
        .thenReturn(false);
    when(allowFieldValueTypeChecker.isExactlyType(any)).thenReturn(false);
    alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker =
        MockTypeChecker();
    when(
      alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker
          .isExactlyType(any),
    ).thenReturn(false);
    alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker =
        MockTypeChecker();
    when(
      alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker
          .isExactlyType(any),
    ).thenReturn(false);
  });

  group('FieldElementParser.parse(FieldElement) test', () {
    test('parse Foo Type foo field', () {
      final fooReadDefaultAnnotation = MockElementAnnotation();
      final fooReadDefaultDartObject = MockDartObject();
      final fooReadDefaultDartType = MockDartType();
      when(fooReadDefaultAnnotation.toSource())
          .thenReturn('@ReadDefault(<String, dynamic>{})');
      when(fooReadDefaultAnnotation.computeConstantValue())
          .thenReturn(fooReadDefaultDartObject);
      when(fooReadDefaultDartObject.type).thenReturn(fooReadDefaultDartType);
      when(readDefaultTypeChecker.isAssignableFromType(fooReadDefaultDartType))
          .thenReturn(true);
      when(fooReadDefaultDartType.getDisplayString(withNullability: false))
          .thenReturn('ReadDefault');
      when(fooReadDefaultDartType.isDartCoreString).thenReturn(false);

      final fooCreateDefaultAnnotation = MockElementAnnotation();
      final fooCreateDefaultDartObject = MockDartObject();
      final fooCreateDefaultDartType = MockDartType();
      when(fooCreateDefaultAnnotation.toSource())
          .thenReturn('@CreateDefault(<String, dynamic>{})');
      when(fooCreateDefaultAnnotation.computeConstantValue())
          .thenReturn(fooCreateDefaultDartObject);
      when(fooCreateDefaultDartObject.type)
          .thenReturn(fooCreateDefaultDartType);
      when(
        createDefaultTypeChecker.isAssignableFromType(fooCreateDefaultDartType),
      ).thenReturn(true);
      when(fooCreateDefaultDartType.getDisplayString(withNullability: false))
          .thenReturn('CreateDefault');
      when(fooCreateDefaultDartType.isDartCoreString).thenReturn(false);

      final fooUpdateDefaultAnnotation = MockElementAnnotation();
      final fooUpdateDefaultDartObject = MockDartObject();
      final fooUpdateDefaultDartType = MockDartType();
      when(fooUpdateDefaultAnnotation.toSource())
          .thenReturn('@UpdateDefault(<String, dynamic>{})');
      when(fooUpdateDefaultAnnotation.computeConstantValue())
          .thenReturn(fooUpdateDefaultDartObject);
      when(fooUpdateDefaultDartObject.type)
          .thenReturn(fooUpdateDefaultDartType);
      when(
        updateDefaultTypeChecker.isAssignableFromType(fooUpdateDefaultDartType),
      ).thenReturn(true);
      when(fooUpdateDefaultDartType.getDisplayString(withNullability: false))
          .thenReturn('UpdateDefault');
      when(fooUpdateDefaultDartType.isDartCoreString).thenReturn(false);

      final fooJsonConverterAnnotation = MockElementAnnotation();
      final fooJsonConverterDartObject = MockDartObject();
      final fooJsonConverterDartType = MockDartType();
      final fooJsonConverterClassElement = MockClassElement();
      final fooJsonConverterInterfaceType = MockInterfaceType();
      final fooJsonConverterClientDartType = MockDartType();
      final fooJsonConverterJsonType = MockDartType();
      when(fooJsonConverterAnnotation.toSource())
          .thenReturn('@_FooJsonConverter()');
      when(fooJsonConverterAnnotation.computeConstantValue())
          .thenReturn(fooJsonConverterDartObject);
      when(fooJsonConverterDartObject.type)
          .thenReturn(fooJsonConverterDartType);
      when(fooJsonConverterDartType.element)
          .thenReturn(fooJsonConverterClassElement);
      when(fooJsonConverterClassElement.allSupertypes).thenReturn([
        fooJsonConverterInterfaceType,
      ]);
      when(fooJsonConverterInterfaceType.typeArguments).thenReturn([
        fooJsonConverterClientDartType,
        fooJsonConverterJsonType,
      ]);
      when(
        fooJsonConverterClientDartType.getDisplayString(
          withNullability: true,
        ),
      ).thenReturn('Foo');
      when(fooJsonConverterJsonType.getDisplayString(withNullability: true))
          .thenReturn('Map<String, dynamic>');
      when(
        jsonConverterTypeChecker.isAssignableFromType(fooJsonConverterDartType),
      ).thenReturn(true);
      when(
        jsonConverterTypeChecker.isExactlyType(fooJsonConverterInterfaceType),
      ).thenReturn(true);

      final fooJsonPostProcessorAnnotation = MockElementAnnotation();
      final fooJsonPostProcessorDartObject = MockDartObject();
      final fooJsonPostProcessorDartType = MockDartType();
      final fooJsonPostProcessorClassElement = MockClassElement();
      final fooJsonPostProcessorInterfaceType = MockInterfaceType();
      final fooJsonPostProcessorClientDartType = MockDartType();
      final fooJsonPostProcessorJsonType = MockDartType();
      when(fooJsonPostProcessorAnnotation.toSource())
          .thenReturn('@_FooJsonConverter()');
      when(fooJsonPostProcessorAnnotation.computeConstantValue())
          .thenReturn(fooJsonPostProcessorDartObject);
      when(fooJsonPostProcessorDartObject.type)
          .thenReturn(fooJsonPostProcessorDartType);
      when(fooJsonPostProcessorDartType.element)
          .thenReturn(fooJsonPostProcessorClassElement);
      when(fooJsonPostProcessorClassElement.allSupertypes).thenReturn([
        fooJsonPostProcessorInterfaceType,
      ]);
      when(fooJsonPostProcessorInterfaceType.typeArguments).thenReturn([
        fooJsonPostProcessorClientDartType,
        fooJsonPostProcessorJsonType,
      ]);
      when(
        fooJsonPostProcessorClientDartType.getDisplayString(
          withNullability: true,
        ),
      ).thenReturn('Foo');
      when(
        fooJsonPostProcessorJsonType.getDisplayString(withNullability: true),
      ).thenReturn('Map<String, dynamic>');
      when(
        jsonPostProcessorTypeChecker
            .isAssignableFromType(fooJsonPostProcessorDartType),
      ).thenReturn(true);
      when(
        jsonPostProcessorTypeChecker
            .isExactlyType(fooJsonPostProcessorInterfaceType),
      ).thenReturn(true);

      final fooAllowFieldValueAnnotation = MockElementAnnotation();
      final fooAllowFieldValueDartObject = MockDartObject();
      final fooAllowFieldValueDartType = MockDartType();
      when(fooAllowFieldValueAnnotation.computeConstantValue())
          .thenReturn(fooAllowFieldValueDartObject);
      when(fooAllowFieldValueDartObject.type)
          .thenReturn(fooAllowFieldValueDartType);
      when(allowFieldValueTypeChecker.isExactlyType(fooAllowFieldValueDartType))
          .thenReturn(true);

      final fooFieldElement = MockFieldElement();
      final fieldElementDartType = MockDartType();
      when(fooFieldElement.name).thenReturn('foo');
      when(fooFieldElement.type).thenReturn(fieldElementDartType);
      when(fooFieldElement.metadata).thenReturn([
        fooReadDefaultAnnotation,
        fooCreateDefaultAnnotation,
        fooUpdateDefaultAnnotation,
        fooJsonConverterAnnotation,
        fooJsonPostProcessorAnnotation,
        fooAllowFieldValueAnnotation,
      ]);

      final fieldElementParser = FieldElementParser(
        readDefaultTypeChecker: readDefaultTypeChecker,
        createDefaultTypeChecker: createDefaultTypeChecker,
        updateDefaultTypeChecker: updateDefaultTypeChecker,
        jsonConverterTypeChecker: jsonConverterTypeChecker,
        jsonPostProcessorTypeChecker: jsonPostProcessorTypeChecker,
        allowFieldValueTypeChecker: allowFieldValueTypeChecker,
        alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker: null,
        alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker: null,
      );
      final fieldConfig = fieldElementParser.parse(fooFieldElement);
      expect(fieldConfig.name, 'foo');
      expect(fieldConfig.readDefaultValueString, 'const <String, dynamic>{}');
      expect(fieldConfig.createDefaultValueString, 'const <String, dynamic>{}');
      expect(fieldConfig.updateDefaultValueString, 'const <String, dynamic>{}');
      expect(fieldConfig.jsonConverterConfig, isNotNull);
      expect(
        fieldConfig.jsonConverterConfig!.clientTypeString,
        'Foo',
      );
      expect(
        fieldConfig.jsonConverterConfig!.firestoreTypeString,
        'Map<String, dynamic>',
      );
      expect(fieldConfig.jsonPostProcessorConfig, isNotNull);
      expect(
        fieldConfig.jsonPostProcessorConfig!.clientTypeString,
        'Foo',
      );
      expect(
        fieldConfig.jsonPostProcessorConfig!.firestoreTypeString,
        'Map<String, dynamic>',
      );
      expect(fieldConfig.allowFieldValue, isTrue);
    });

    test('parse DateTime? type updatedAt field', () {
      final updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation =
          MockElementAnnotation();
      final updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartObject =
          MockDartObject();
      final updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartType =
          MockDartType();
      when(
        updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation
            .computeConstantValue(),
      ).thenReturn(
        updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartObject,
      );
      when(
        updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartObject.type,
      ).thenReturn(
        updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartType,
      );
      when(
        alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker.isExactlyType(
          updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingDartType,
        ),
      ).thenReturn(true);

      final updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation =
          MockElementAnnotation();
      final updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartObject =
          MockDartObject();
      final updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartType =
          MockDartType();
      when(
        updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation
            .computeConstantValue(),
      ).thenReturn(
        updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartObject,
      );
      when(
        updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartObject.type,
      ).thenReturn(
        updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartType,
      );
      when(
        alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker.isExactlyType(
          updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingDartType,
        ),
      ).thenReturn(true);

      final updatedAtFieldElement = MockFieldElement();
      final updatedAtFieldElementDartType = MockDartType();
      when(updatedAtFieldElement.name).thenReturn('updatedAt');
      when(updatedAtFieldElement.type)
          .thenReturn(updatedAtFieldElementDartType);
      when(updatedAtFieldElement.metadata).thenReturn([
        updatedAtAlwaysUseFieldValueServerTimestampWhenCreatingAnnotation,
        updatedAtAlwaysUseFieldValueServerTimestampWhenUpdatingAnnotation,
      ]);

      final fieldElementParser = FieldElementParser(
        readDefaultTypeChecker: null,
        createDefaultTypeChecker: null,
        updateDefaultTypeChecker: null,
        jsonConverterTypeChecker: null,
        jsonPostProcessorTypeChecker: null,
        allowFieldValueTypeChecker: null,
        alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker:
            alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker,
        alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker:
            alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker,
      );
      final fieldConfig = fieldElementParser.parse(updatedAtFieldElement);
      expect(
        fieldConfig.alwaysUseFieldValueServerTimestampWhenCreating,
        isTrue,
      );
      expect(
        fieldConfig.alwaysUseFieldValueServerTimestampWhenUpdating,
        isTrue,
      );
    });
  });
}
