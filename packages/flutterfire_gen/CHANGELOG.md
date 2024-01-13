## Unreleased changes

* Add `BuildYamlConfig` tests.

## 0.4.1

* Add `FromJsonFieldParser` tests.
* Add `ToJsonFieldParser` tests.
* Add `FieldConfig` tests.
* Update `flutterfire_gen`, `flutterfire_gen_utils` dependency versions.

## 0.4.0

> [!NOTE]
> This release has breaking changes.

* **Breaking**: Update `cloud_firestore` package version to `4.14.0`, which is not compatible with its previous version `4.13.6` or lower because of the `count` query return type change. See the `cloud_firestore` package diff [here](https://github.com/firebase/flutterfire/commit/82af6c2f40160a9e2f74e2d48652003fa48bb161#diff-a7d6f2f7fa9f6ad84f9faf884d4a507f5e85a06d88e64b99578de885a0b637d5R19).
* Update `flutterfire_gen`, `flutterfire_gen_utils` dependency versions.
* Refactor `FieldElementParser` to enable to write unit test.
* Add `field_element_parser_test.dart`.
* Add `dart_type_util.dart` tests.

## 0.3.0-dev.5

* Update dependency version.

## 0.3.0-dev.4

* Remove direct dependency on Flutter SDK.

## 0.3.0-dev.3

* Update dependency versions to enable to build when `flutter pub downgrade`.
* Improve pub.dev score.

## 0.3.0-dev.2

* Enable to generate `count` method in query class.
* Enable to call read methods as `CollectionGroupQuery` for `fetchDocuments`, `subscribeDocuments`, and `count` methods.
* Fix read `DocumentReference` name bug in `fetchDocument` and `subscribeDocument` methods (thanks to @iincho).
* Update doc comments.
* Refactor codes.

## 0.3.0-dev.1

* Enable to set `schema_definition_class_prefix`, `read_class_prefix`, `create_class_prefix`, `update_class_prefix`, `delete_class_prefix`, `read_class_suffix`, `create_class_suffix`, `update_class_suffix`, `delete_class_suffix` to customize schema definition and generated class names.
* Update generated `CollectionReference` variable name.
* Update doc comments.
* Refactor codes.

## 0.2.0-dev.5

* Update generated codes' doc comments.

## 0.2.0-dev.4

* Update `README.md`.

## 0.2.0-dev.3

* Update `README.md`.

## 0.2.0-dev.2

* Update `ToJsonParser` logic for `DateTime` fields.

## 0.2.0-dev.1

* Refactor entire codes.

## 0.0.1-dev.9

* Enable to use `JsonPostProcessor` annotation.

## 0.0.1-dev.8

* Fix create and update class template.

## 0.0.1-dev.7

* Stop using constructor default value.
* Enable to use `AlwaysUseFieldValueServerTimestampWhenCreating`, and `AlwaysUseFieldValueServerTimestampWhenCreating` annotations.
* Update dependency packages.

## 0.0.1-dev.6

* Make `DocumentReference` field generation in `ReadEntity` class optional.
* Generate `path` field in `ReadEntity` class instead.
* Make `copyWith` method generation in `ReadEntity` class optional.

## 0.0.1-dev.5

* Fix `subscribeDocument` method template bug.

## 0.0.1-dev.4

* Update adding Cloud Firestore document method name.
* Refactor generating delete Cloud Firestore document related codes.

## 0.0.1-dev.3

* Generate delete document method in Query class.

## 0.0.1-dev.2

* Fix a bug in build.yaml.

## 0.0.1-dev.1

* Initial preview release.
