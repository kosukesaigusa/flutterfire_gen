## 0.6.0

* Adopt unified versioning across the `flutterfire_gen` family. From this release onwards, `flutterfire_gen`, `flutterfire_gen_annotation`, and `flutterfire_gen_utils` are released together under the same version number, which makes it easier for users to pick a compatible set.
* Raise the minimum Dart SDK to `>=3.5.0` so the package can participate in Dart workspaces (`resolution: workspace` requires language version 3.5+).
* Use the Dart pattern-matching shorthand (`(:final field)`) in `FirestoreData` switch expressions to satisfy the up-to-date pattern-style lints. No behavioural change.

## 0.5.1

* Update `cloud_firestore` dependency to `>=5.5.0` to support wider range of versions.

## 0.5.0

> [!NOTE]
> This release has breaking changes.

* Update `cloud_firestore` package version to `5.5.0`, which might be not compatible with previous versions (thanks to @masa-tokyo).

## 0.4.1

* Update `README.md`.

## 0.4.0

> [!NOTE]
> This release has breaking changes.

* Update `cloud_firestore` package version to `4.14.0`, which might be not compatible with previous versions.

## 0.3.0-dev.2

* Remove direct dependency on Flutter SDK.

## 0.3.0-dev.1

* Update doc comments.

## 0.2.0-dev.1

* Refactor entire codes.

## 0.0.1-dev.3

* Improve `FirestoreData` class.

## 0.0.1-dev.2

* Fix pubspec.yaml description.

## 0.0.1-dev.1

* Initial preview release.
