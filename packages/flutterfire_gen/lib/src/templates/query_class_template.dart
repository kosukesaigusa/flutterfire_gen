import 'package:source_gen/source_gen.dart';

import '../configs/code_generation_config.dart';
import 'path_segment_parameters_template.dart';

/// Returns Query class template.
class QueryClassTemplate {
  /// Creates a [QueryClassTemplate].
  const QueryClassTemplate(this.config);

  /// Configurations for code generation.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final documentIdParametersDefinition =
        DocumentIdParametersTemplate.parameterDefinition(
      config.firestorePathSegments,
    );
    final documentIdParametersArgumentInvocation =
        DocumentIdParametersTemplate.argumentInvocation(
      config.firestorePathSegments,
    );
    return '''
/// Manages queries against the ${config.collectionName} collection.
class ${config.baseClassName}Query {
  /// Fetches [${config.readClassName}] documents.
  Future<List<${config.readClassName}>> fetchDocuments({
    $documentIdParametersDefinition
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
    $documentIdParametersDefinition
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
    $documentIdParametersDefinition
    required String ${config.documentName}Id,
    GetOptions? options,
  }) async {
    final ds =
        await read${config.baseClassName}DocumentReference(
          $documentIdParametersArgumentInvocation
          ${config.documentName}Id: ${config.documentName}Id,
        ).get(options);
    return ds.data();
  }

  /// Subscribes a specific [${config.baseClassName}] document.
  Stream<${config.readClassName}?> subscribeDocument({
    $documentIdParametersDefinition
    required String ${config.documentName}Id,
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = read${config.baseClassName}DocumentReference(
      $documentIdParametersArgumentInvocation
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
    $documentIdParametersDefinition
    required ${config.createClassName} ${config.createClassInstanceName},
  }) =>
      ${_collectionReference(ReferenceClassType.create)}.add(${config.createClassInstanceName});

  /// Sets a [${config.baseClassName}] document.
  Future<void> set({
    $documentIdParametersDefinition
    required String ${config.documentName}Id,
    required ${config.createClassName} ${config.createClassInstanceName},
    SetOptions? options,
  }) =>
      ${config.createDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentName}Id: ${config.documentName}Id,
      ).set(${config.createClassInstanceName}, options);

  /// Updates a specific [${config.baseClassName}] document.
  Future<void> update({
    $documentIdParametersDefinition
    required String ${config.documentName}Id,
    required ${config.updateClassName} ${config.updateClassInstanceName},
  }) =>
      ${config.updateDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentName}Id: ${config.documentName}Id,
      ).update(${config.updateClassInstanceName}.toJson());

  /// Deletes a specific [${config.baseClassName}] document.
  Future<void> delete({
    $documentIdParametersDefinition
    required String ${config.documentName}Id,
  }) =>
      ${config.deleteDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentName}Id: ${config.documentName}Id,
      ).delete();
}
''';
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
