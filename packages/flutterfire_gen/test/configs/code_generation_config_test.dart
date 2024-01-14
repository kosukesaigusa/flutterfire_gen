import 'package:flutterfire_gen/src/configs/code_generation_config.dart';
import 'package:flutterfire_gen/src/configs/reference_class_type.dart';
import 'package:test/test.dart';

void main() {
  group('CodeGenerationConfig test', () {
    test('CodeGenerationConfig constructor', () {
      final config = CodeGenerationConfig(
        path: 'users/{userId}',
        baseClassName: 'User',
        readClassPrefix: '',
        readClassSuffix: '',
        createClassPrefix: 'Create',
        createClassSuffix: 'Data',
        updateClassPrefix: 'Update',
        updateClassSuffix: 'Data',
        deleteClassPrefix: 'Delete',
        deleteClassSuffix: 'Data',
        includePathField: true,
        includeDocumentReferenceField: true,
        generateCopyWith: true,
        fieldConfigs: [],
      );

      expect(config.firestoreDocumentPath.path, 'users/{userId}');
      expect(config.baseClassName, 'User');
      expect(config.readClassPrefix, '');
      expect(config.readClassSuffix, '');
      expect(config.createClassPrefix, 'Create');
      expect(config.createClassSuffix, 'Data');
      expect(config.updateClassPrefix, 'Update');
      expect(config.updateClassSuffix, 'Data');
      expect(config.deleteClassPrefix, 'Delete');
      expect(config.deleteClassSuffix, 'Data');
      expect(config.includePathField, true);
      expect(config.includeDocumentReferenceField, true);
      expect(config.generateCopyWith, true);
      expect(config.fieldConfigs.isEmpty, true);
      expect(config.collectionName, 'users');
      expect(config.documentId, 'userId');
      expect(config.documentName, 'user');
      expect(config.capitalizedDocumentName, 'User');
      expect(config.readClassName, 'User');
      expect(config.createClassName, 'CreateUserData');
      expect(config.updateClassName, 'UpdateUserData');
      expect(config.deleteClassName, 'DeleteUserData');
      expect(config.createClassInstanceName, 'createUserData');
      expect(config.updateClassInstanceName, 'updateUserData');
      expect(config.deleteClassInstanceName, 'deleteUserData');
      expect(config.documentReferenceFieldName, 'userReference');
      expect(config.readDocumentReferenceName, 'readUserDocumentReference');
      expect(config.createDocumentReferenceName, 'createUserDocumentReference');
      expect(config.updateDocumentReferenceName, 'updateUserDocumentReference');
      expect(config.deleteDocumentReferenceName, 'deleteUserDocumentReference');
      expect(
        config.documentReferenceName(ReferenceClassType.read),
        'readUserDocumentReference',
      );
      expect(
        config.documentReferenceName(ReferenceClassType.create),
        'createUserDocumentReference',
      );
      expect(
        config.documentReferenceName(ReferenceClassType.update),
        'updateUserDocumentReference',
      );
      expect(
        config.documentReferenceName(ReferenceClassType.delete),
        'deleteUserDocumentReference',
      );
      expect(
        config.collectionReferenceName(ReferenceClassType.read),
        'readUsersCollectionReference',
      );
      expect(
        config.collectionReferenceName(ReferenceClassType.create),
        'createUsersCollectionReference',
      );
      expect(
        config.collectionReferenceName(ReferenceClassType.update),
        'updateUsersCollectionReference',
      );
      expect(
        config.collectionReferenceName(ReferenceClassType.delete),
        'deleteUsersCollectionReference',
      );
      expect(
        config.collectionGroupReferenceName,
        'readUsersCollectionGroupReference',
      );
      expect(
        config.documentReferenceTypeName(ReferenceClassType.read),
        'DocumentReference<User>',
      );
      expect(
        config.documentReferenceTypeName(ReferenceClassType.create),
        'DocumentReference<CreateUserData>',
      );
      expect(
        config.documentReferenceTypeName(ReferenceClassType.update),
        'DocumentReference<UpdateUserData>',
      );
      expect(
        config.documentReferenceTypeName(ReferenceClassType.delete),
        'DocumentReference<DeleteUserData>',
      );
      expect(
        config.collectionReferenceTypeName(ReferenceClassType.read),
        'CollectionReference<User>',
      );
      expect(
        config.collectionReferenceTypeName(ReferenceClassType.create),
        'CollectionReference<CreateUserData>',
      );
      expect(
        config.collectionReferenceTypeName(ReferenceClassType.update),
        'CollectionReference<UpdateUserData>',
      );
      expect(
        config.collectionReferenceTypeName(ReferenceClassType.delete),
        'CollectionReference<DeleteUserData>',
      );
      expect(
        config.classNameFromReferenceClassType(ReferenceClassType.read),
        'User',
      );
      expect(
        config.classNameFromReferenceClassType(ReferenceClassType.create),
        'CreateUserData',
      );
      expect(
        config.classNameFromReferenceClassType(ReferenceClassType.update),
        'UpdateUserData',
      );
      expect(
        config.classNameFromReferenceClassType(ReferenceClassType.delete),
        'DeleteUserData',
      );
    });
  });
}
