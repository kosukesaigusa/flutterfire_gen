// ignore_for_file: lines_longer_than_80_chars

import 'package:source_gen/source_gen.dart';

import '../configs/code_generation_config.dart';

/// Returns Query class template.
class QueryClassTemplate {
  /// Creates a [QueryClassTemplate].
  const QueryClassTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    return '''
/// Manages queries against the ${config.collectionName} collection.
class ${config.baseClassName}Query {
  /// Fetches [${config.readClassName}] documents.
  Future<List<${config.readClassName}>> fetchDocuments({
    ${_parentDocumentIdArguments()}
    GetOptions? options,
    Query<${config.readClassName}>? Function(Query<${config.readClassName}> query)? queryBuilder,
    int Function(${config.readClassName} lhs, ${config.readClassName} rhs)? compare,
  }) async {
    Query<${config.readClassName}> query = ${_collectionReference(ReferenceClassType.read)};
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final qs = await query.get(options);
    final result = qs.docs.map((qds) => qds.data()).toList();
    if (compare != null) {
      result.sort(compare);
    }
    return result;
  }

  /// Subscribes [${config.baseClassName}] documents.
  Stream<List<${config.readClassName}>> subscribeDocuments({
    ${_parentDocumentIdArguments()}
    Query<${config.readClassName}>? Function(Query<${config.readClassName}> query)? queryBuilder,
    int Function(${config.readClassName} lhs, ${config.readClassName} rhs)? compare,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    Query<${config.readClassName}> query = ${_collectionReference(ReferenceClassType.read)};
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    var streamQs =
        query.snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamQs = streamQs.where((qs) => !qs.metadata.hasPendingWrites);
    }
    return streamQs.map((qs) {
      final result = qs.docs.map((qds) => qds.data()).toList();
      if (compare != null) {
        result.sort(compare);
      }
      return result;
    });
  }

  /// Fetches a specific [${config.readClassName}] document.
  Future<${config.readClassName}?> fetchDocument({
    ${_parentDocumentIdArguments()}
    required String ${config.documentName}Id,
    GetOptions? options,
  }) async {
    final ds =
        await read${config.baseClassName}DocumentReference(
          ${_parentDocumentIdParameters()}
          ${config.documentName}Id: ${config.documentName}Id,
        ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [${config.baseClassName}] document.
  Stream<${config.readClassName}?> subscribeDocument({
    ${_parentDocumentIdArguments()}
    required String ${config.documentName}Id,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = read${config.baseClassName}DocumentReference(
      ${_parentDocumentIdParameters()}
      ${config.documentName}Id: ${config.documentName}Id,
    )
        .snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  /// Adds a [${config.baseClassName}] document.
  Future<DocumentReference<${config.createClassName}>> add({
    ${_parentDocumentIdArguments()}
    required ${config.createClassName} ${config.createClassInstanceName},
  }) =>
      ${_collectionReference(ReferenceClassType.create)}.add(${config.createClassInstanceName});

  /// Sets a [${config.baseClassName}] document.
  Future<void> set({
    ${_parentDocumentIdArguments()}
    required String ${config.documentName}Id,
    required ${config.createClassName} ${config.createClassInstanceName},
    SetOptions? options,
  }) =>
      ${config.createDocumentReferenceName}(
        ${_parentDocumentIdParameters()}
        ${config.documentName}Id: ${config.documentName}Id,
      ).set(${config.createClassInstanceName}, options);

  /// Updates a specific [${config.baseClassName}] document.
  Future<void> update({
    ${_parentDocumentIdArguments()}
    required String ${config.documentName}Id,
    required ${config.updateClassName} ${config.updateClassInstanceName},
  }) =>
      ${config.updateDocumentReferenceName}(
        ${_parentDocumentIdParameters()}
        ${config.documentName}Id: ${config.documentName}Id,
      ).update(${config.updateClassInstanceName}.toJson());

  /// Deletes a specific [${config.baseClassName}] document.
  Future<void> delete({
    ${_parentDocumentIdArguments()}
    required String ${config.documentName}Id,
  }) =>
      ${config.deleteDocumentReferenceName}(
        ${_parentDocumentIdParameters()}
        ${config.documentName}Id: ${config.documentName}Id,
      ).delete();
}
''';
  }

  String _parentDocumentIdArguments() {
    final buffer = StringBuffer();
    for (final segment in config.firestorePathSegments) {
      final documentName = segment.documentName;
      if (documentName != null) {
        buffer.writeln('required String $documentName,');
      }
    }
    return buffer.toString();
  }

  String _parentDocumentIdParameters() {
    final buffer = StringBuffer();
    for (final segment in config.firestorePathSegments) {
      final documentName = segment.documentName;
      if (documentName != null) {
        buffer.writeln('$documentName: $documentName,');
      }
    }
    return buffer.toString();
  }

  String _collectionReference(ReferenceClassType referenceClassType) {
    if (config.firestorePathSegments.isEmpty) {
      throw InvalidGenerationSourceError(
        '@FirestoreDocument(path: ...) must be provided.',
      );
    }
    if (config.firestorePathSegments.length == 1) {
      return config.collectionReferenceName(referenceClassType);
    } else {
      final buffer = StringBuffer();
      for (final segment in config.firestorePathSegments) {
        final documentName = segment.documentName;
        if (documentName != null) {
          buffer.writeln('$documentName: $documentName,');
        }
      }
      return '${config.collectionReferenceName(referenceClassType)}($buffer)';
    }
  }
}
