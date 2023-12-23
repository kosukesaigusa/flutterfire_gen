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
  final readDefaultAnnotation = MockElementAnnotation();
  final readDefaultDartObject = MockDartObject();
  final readDefaultDartType = MockDartType();
  when(readDefaultAnnotation.toSource())
      .thenReturn("@ReadDefault('defaultString')");
  when(readDefaultAnnotation.computeConstantValue())
      .thenReturn(readDefaultDartObject);
  when(readDefaultDartObject.type).thenReturn(readDefaultDartType);
  final readDefaultTypeChecker = MockTypeChecker();
  when(readDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
  when(readDefaultTypeChecker.isAssignableFromType(readDefaultDartType))
      .thenReturn(true);
  when(readDefaultDartType.getDisplayString(withNullability: false))
      .thenReturn('ReadDefault');
  when(readDefaultDartType.isDartCoreString).thenReturn(false);

  final createDefaultAnnotation = MockElementAnnotation();
  final createDefaultDartObject = MockDartObject();
  final createDefaultDartType = MockDartType();
  when(createDefaultAnnotation.toSource())
      .thenReturn("@CreateDefault('defaultString')");
  when(createDefaultAnnotation.computeConstantValue())
      .thenReturn(createDefaultDartObject);
  when(createDefaultDartObject.type).thenReturn(createDefaultDartType);
  final createDefaultTypeChecker = MockTypeChecker();
  when(createDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
  when(createDefaultTypeChecker.isAssignableFromType(createDefaultDartType))
      .thenReturn(true);
  when(createDefaultDartType.getDisplayString(withNullability: false))
      .thenReturn('CreateDefault');
  when(createDefaultDartType.isDartCoreString).thenReturn(false);

  final updateDefaultAnnotation = MockElementAnnotation();
  final updateDefaultDartObject = MockDartObject();
  final updateDefaultDartType = MockDartType();
  when(updateDefaultAnnotation.toSource())
      .thenReturn("@UpdateDefault('defaultString')");
  when(updateDefaultAnnotation.computeConstantValue())
      .thenReturn(updateDefaultDartObject);
  when(updateDefaultDartObject.type).thenReturn(updateDefaultDartType);
  final updateDefaultTypeChecker = MockTypeChecker();
  when(updateDefaultTypeChecker.isAssignableFromType(any)).thenReturn(false);
  when(updateDefaultTypeChecker.isAssignableFromType(updateDefaultDartType))
      .thenReturn(true);
  when(updateDefaultDartType.getDisplayString(withNullability: false))
      .thenReturn('UpdateDefault');
  when(updateDefaultDartType.isDartCoreString).thenReturn(false);

  final jsonConverterAnnotation = MockElementAnnotation();
  final jsonConverterDartObject = MockDartObject();
  final jsonConverterDartType = MockDartType();
  final jsonConverterClassElement = MockClassElement();
  final jsonConverterInterfaceType = MockInterfaceType();
  final jsonConverterClientDartType = MockDartType();
  final jsonConverterJsonType = MockDartType();
  when(jsonConverterAnnotation.toSource())
      .thenReturn('@JsonConverter(DateTimeConverter)');
  when(jsonConverterAnnotation.computeConstantValue())
      .thenReturn(jsonConverterDartObject);
  when(jsonConverterDartObject.type).thenReturn(jsonConverterDartType);
  final jsonConverterTypeChecker = MockTypeChecker();
  when(jsonConverterTypeChecker.isAssignableFromType(any)).thenReturn(false);
  when(jsonConverterTypeChecker.isAssignableFromType(jsonConverterDartType))
      .thenReturn(true);
  when(jsonConverterTypeChecker.isExactlyType(any)).thenReturn(true);
  when(jsonConverterDartType.element).thenReturn(jsonConverterClassElement);
  when(jsonConverterClassElement.allSupertypes).thenReturn([
    jsonConverterInterfaceType,
  ]);
  when(jsonConverterInterfaceType.typeArguments).thenReturn([
    jsonConverterClientDartType,
    jsonConverterJsonType,
  ]);
  when(jsonConverterClientDartType.getDisplayString(withNullability: true))
      .thenReturn('DateTime');
  when(jsonConverterJsonType.getDisplayString(withNullability: true))
      .thenReturn('String');

  final jsonPostProcessorAnnotation = MockElementAnnotation();
  final jsonPostProcessorDartObject = MockDartObject();
  final jsonPostProcessorDartType = MockDartType();
  final jsonPostProcessorClassElement = MockClassElement();
  final jsonPostProcessorInterfaceType = MockInterfaceType();
  final jsonPostProcessorClientDartType = MockDartType();
  final jsonPostProcessorJsonType = MockDartType();
  when(jsonPostProcessorAnnotation.toSource())
      .thenReturn('@JsonPostProcessor(DateTimePostProcessor)');
  when(jsonPostProcessorAnnotation.computeConstantValue())
      .thenReturn(jsonPostProcessorDartObject);
  when(jsonPostProcessorDartObject.type).thenReturn(jsonPostProcessorDartType);
  final jsonPostProcessorTypeChecker = MockTypeChecker();
  when(jsonPostProcessorTypeChecker.isAssignableFromType(any))
      .thenReturn(false);
  when(
    jsonPostProcessorTypeChecker.isAssignableFromType(
      jsonPostProcessorDartType,
    ),
  ).thenReturn(true);
  when(jsonPostProcessorTypeChecker.isExactlyType(any)).thenReturn(true);
  when(jsonPostProcessorDartType.element)
      .thenReturn(jsonPostProcessorClassElement);
  when(jsonPostProcessorClassElement.allSupertypes).thenReturn([
    jsonPostProcessorInterfaceType,
  ]);
  when(jsonPostProcessorInterfaceType.typeArguments).thenReturn([
    jsonPostProcessorClientDartType,
    jsonPostProcessorJsonType,
  ]);
  when(
    jsonPostProcessorClientDartType.getDisplayString(withNullability: true),
  ).thenReturn('DateTime');
  when(
    jsonPostProcessorJsonType.getDisplayString(withNullability: true),
  ).thenReturn('String');

  final allowFieldValueAnnotation = MockElementAnnotation();
  final allowFieldValueDartObject = MockDartObject();
  final allowFieldValueDartType = MockDartType();
  when(allowFieldValueAnnotation.toSource())
      .thenReturn('@AllowFieldValue(FieldValue.serverTimestamp)');
  when(allowFieldValueAnnotation.computeConstantValue())
      .thenReturn(allowFieldValueDartObject);
  when(allowFieldValueDartObject.type).thenReturn(allowFieldValueDartType);
  final allowFieldValueTypeChecker = MockTypeChecker();
  when(allowFieldValueTypeChecker.isAssignableFromType(any)).thenReturn(false);
  when(allowFieldValueTypeChecker.isExactlyType(any)).thenReturn(false);
  when(allowFieldValueTypeChecker.isExactlyType(allowFieldValueDartType))
      .thenReturn(false);

  final alwaysUseFieldValueServerTimestampWhenCreatingAnnotation =
      MockElementAnnotation();
  final alwaysUseFieldValueServerTimestampWhenCreatingDartObject =
      MockDartObject();
  final alwaysUseFieldValueServerTimestampWhenCreatingDartType = MockDartType();
  when(alwaysUseFieldValueServerTimestampWhenCreatingAnnotation.toSource())
      .thenReturn(
    '@AlwaysUseFieldValueServerTimestampWhenCreating'
    '(FieldValue.serverTimestamp)',
  );
  when(
    alwaysUseFieldValueServerTimestampWhenCreatingAnnotation
        .computeConstantValue(),
  ).thenReturn(
    alwaysUseFieldValueServerTimestampWhenCreatingDartObject,
  );
  when(alwaysUseFieldValueServerTimestampWhenCreatingDartObject.type)
      .thenReturn(alwaysUseFieldValueServerTimestampWhenCreatingDartType);
  final alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker =
      MockTypeChecker();
  when(
    alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker
        .isExactlyType(any),
  ).thenReturn(false);
  when(
    alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker.isExactlyType(
      alwaysUseFieldValueServerTimestampWhenCreatingDartType,
    ),
  ).thenReturn(false);

  final alwaysUseFieldValueServerTimestampWhenUpdatingAnnotation =
      MockElementAnnotation();
  final alwaysUseFieldValueServerTimestampWhenUpdatingDartObject =
      MockDartObject();
  final alwaysUseFieldValueServerTimestampWhenUpdatingDartType = MockDartType();
  when(alwaysUseFieldValueServerTimestampWhenUpdatingAnnotation.toSource())
      .thenReturn(
    '@AlwaysUseFieldValueServerTimestampWhenUpdating'
    '(FieldValue.serverTimestamp)',
  );
  when(
    alwaysUseFieldValueServerTimestampWhenUpdatingAnnotation
        .computeConstantValue(),
  ).thenReturn(
    alwaysUseFieldValueServerTimestampWhenUpdatingDartObject,
  );
  when(alwaysUseFieldValueServerTimestampWhenUpdatingDartObject.type)
      .thenReturn(alwaysUseFieldValueServerTimestampWhenUpdatingDartType);

  final alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker =
      MockTypeChecker();
  when(
    alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker
        .isExactlyType(any),
  ).thenReturn(false);
  when(
    alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker.isExactlyType(
      alwaysUseFieldValueServerTimestampWhenUpdatingDartType,
    ),
  ).thenReturn(false);

  final fieldElement = MockFieldElement();
  final fieldElementDartType = MockDartType();
  when(fieldElement.name).thenReturn('text');
  when(fieldElement.type).thenReturn(fieldElementDartType);
  when(fieldElement.metadata).thenReturn([
    readDefaultAnnotation,
    createDefaultAnnotation,
    updateDefaultAnnotation,
    jsonConverterAnnotation,
    jsonPostProcessorAnnotation,
    allowFieldValueAnnotation,
    alwaysUseFieldValueServerTimestampWhenCreatingAnnotation,
    alwaysUseFieldValueServerTimestampWhenUpdatingAnnotation,
  ]);

  test('FieldElementParser.parse(FieldElement) test', () {
    final fieldElementParser = FieldElementParser(
      readDefaultTypeChecker: readDefaultTypeChecker,
      createDefaultTypeChecker: createDefaultTypeChecker,
      updateDefaultTypeChecker: updateDefaultTypeChecker,
      jsonConverterTypeChecker: jsonConverterTypeChecker,
      jsonPostProcessorTypeChecker: jsonPostProcessorTypeChecker,
      allowFieldValueTypeChecker: allowFieldValueTypeChecker,
      alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker:
          alwaysUseFieldValueServerTimestampWhenCreatingTypeChecker,
      alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker:
          alwaysUseFieldValueServerTimestampWhenUpdatingTypeChecker,
    );
    final fieldConfig = fieldElementParser.parse(fieldElement);
    expect(fieldConfig.readDefaultValueString, "'defaultString'");
  });
}
