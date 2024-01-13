import 'package:flutterfire_gen/src/configs/build_yaml_config.dart';
import 'package:test/test.dart';

void main() {
  group('BuildYamlConfig test', () {
    test('test setting build yaml options', () {
      final buildYamlConfig = BuildYamlConfig.fromBuildYaml({
        'schema_definition_class_prefix': r'_$',
        'read_class_prefix': '',
        'read_class_suffix': '',
        'create_class_prefix': 'Create',
        'create_class_suffix': 'Data',
        'update_class_prefix': 'Update',
        'update_class_suffix': 'Data',
        'delete_class_prefix': 'Delete',
        'delete_class_suffix': 'Data',
        'include_path_field': true,
        'include_document_reference_field': true,
        'generate_copy_with': true,
      });
      expect(buildYamlConfig.schemaDefinitionClassPrefix, r'_$');
      expect(buildYamlConfig.readClassPrefix, '');
      expect(buildYamlConfig.readClassSuffix, '');
      expect(buildYamlConfig.createClassPrefix, 'Create');
      expect(buildYamlConfig.createClassSuffix, 'Data');
      expect(buildYamlConfig.updateClassPrefix, 'Update');
      expect(buildYamlConfig.updateClassSuffix, 'Data');
      expect(buildYamlConfig.deleteClassPrefix, 'Delete');
      expect(buildYamlConfig.deleteClassSuffix, 'Data');
      expect(buildYamlConfig.includePathField, true);
      expect(buildYamlConfig.includeDocumentReferenceField, true);
      expect(buildYamlConfig.generateCopyWith, true);
    });

    test('test default values', () {
      final buildYamlConfig = BuildYamlConfig.fromBuildYaml({});
      expect(buildYamlConfig.schemaDefinitionClassPrefix, '');
      expect(buildYamlConfig.readClassPrefix, 'Read');
      expect(buildYamlConfig.readClassSuffix, '');
      expect(buildYamlConfig.createClassPrefix, 'Create');
      expect(buildYamlConfig.createClassSuffix, '');
      expect(buildYamlConfig.updateClassPrefix, 'Update');
      expect(buildYamlConfig.updateClassSuffix, '');
      expect(buildYamlConfig.deleteClassPrefix, 'Delete');
      expect(buildYamlConfig.deleteClassSuffix, '');
      expect(buildYamlConfig.includePathField, false);
      expect(buildYamlConfig.includeDocumentReferenceField, false);
      expect(buildYamlConfig.generateCopyWith, false);
    });
  });
}
