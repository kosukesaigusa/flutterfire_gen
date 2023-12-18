import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';
import '../path_segment_parameters_template.dart';
import 'doc_comment_template.dart';

/// A template for generating a query class for Firestore document operations.
///
/// This class constructs the necessary Dart code for a query class that
/// encapsulates various operations on Firestore documents, such as fetching,
/// subscribing, adding, setting, updating, and deleting. The query class
/// provides a simplified and structured way to interact with Firestore.
class QueryClassTemplate {
  /// Creates a new instance of [QueryClassTemplate].
  ///
  /// Parameters:
  ///
  /// - [config] Configuration for code generation, including details about the
  /// Firestore document and operations.
  const QueryClassTemplate(this.config);

  /// Configurations used for generating the query class.
  final CodeGenerationConfig config;

  @override
  String toString() {
    final documentIdConstructorParametersDefinition =
        DocumentIdParametersTemplate.constructorParameterDefinition(
      config.firestoreDocumentPath,
    );
    final documentIdMethodParametersDefinition =
        DocumentIdParametersTemplate.methodParameterDefinition(
      config.firestoreDocumentPath,
    );
    final documentIdParametersArgumentInvocation =
        DocumentIdParametersTemplate.argumentInvocation(
      config.firestoreDocumentPath,
    );
    final documentIdFieldDefinitions =
        DocumentIdParametersTemplate.fieldDefinition(
      config.firestoreDocumentPath,
    );
    final caseParameter = DocumentIdParametersTemplate.caseParameter(
      config.firestoreDocumentPath,
    );
    final docCommentTemplate = QueryClassDocCommentTemplate(config);
    return '''
${docCommentTemplate.forBatchWriteSealedClass()}sealed class BatchWrite${config.capitalizedDocumentName} {
  const BatchWrite${config.capitalizedDocumentName}();
}

${docCommentTemplate.forBatchWriteCreateClass()}final class BatchCreate${config.capitalizedDocumentName} extends BatchWrite${config.capitalizedDocumentName} {
  const BatchCreate${config.capitalizedDocumentName}({
    $documentIdConstructorParametersDefinition
    required this.${config.documentId},
    required this.${config.createClassInstanceName},
});

  $documentIdFieldDefinitions

  final String ${config.documentId};

  final ${config.createClassName} ${config.createClassInstanceName};
}

${docCommentTemplate.forBatchWriteUpdateClass()}final class BatchUpdate${config.capitalizedDocumentName} extends BatchWrite${config.capitalizedDocumentName} {
  const BatchUpdate${config.capitalizedDocumentName}({
    $documentIdConstructorParametersDefinition
    required this.${config.documentId},
    required this.${config.updateClassInstanceName},
  });

  $documentIdFieldDefinitions

  final String ${config.documentId};

  final ${config.updateClassName} ${config.updateClassInstanceName};
}

${docCommentTemplate.forBatchWriteDeleteClass()}final class BatchDelete${config.capitalizedDocumentName} extends BatchWrite${config.capitalizedDocumentName} {
  const BatchDelete${config.capitalizedDocumentName}({
    $documentIdConstructorParametersDefinition
    required this.${config.documentId},
  });

  $documentIdFieldDefinitions

  final String ${config.documentId};
}

${docCommentTemplate.forClass()}class ${config.baseClassName}Query {
  ${docCommentTemplate.forFetchDocumentsMethod()}Future<List<${config.readClassName}>> fetchDocuments({
    $documentIdMethodParametersDefinition
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

  ${docCommentTemplate.forSubscribeDocumentsMethod()}Stream<List<${config.readClassName}>> subscribeDocuments({
    $documentIdMethodParametersDefinition
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

  ${docCommentTemplate.forCountMethod()}Future<int> count({
    $documentIdMethodParametersDefinition
    Query<${config.readClassName}>? Function(Query<${config.readClassName}> query)? queryBuilder,
    AggregateSource source = AggregateSource.server,
  }) async {
    Query<${config.readClassName}> query = ${_collectionReference(ReferenceClassType.read)};
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final aggregateQuery = await query.count();
    final aggregateQs = await aggregateQuery.get(source: source);
    return aggregateQs.count;
  }

  ${docCommentTemplate.forFetchDocumentMethod()}Future<${config.readClassName}?> fetchDocument({
    $documentIdMethodParametersDefinition
    required String ${config.documentId},
    GetOptions? options,
  }) async {
    final ds =
        await read${config.baseClassName}DocumentReference(
          $documentIdParametersArgumentInvocation
          ${config.documentId}: ${config.documentId},
        ).get(options);
    return ds.data();
  }

  ${docCommentTemplate.forSubscribeDocumentMethod()}Stream<${config.readClassName}?> subscribeDocument({
    $documentIdMethodParametersDefinition
    required String ${config.documentId},
    bool includeMetadataChanges = false,
    bool excludePendingWrites = false,
  }) {
    var streamDs = read${config.baseClassName}DocumentReference(
      $documentIdParametersArgumentInvocation
      ${config.documentId}: ${config.documentId},
    )
        .snapshots(includeMetadataChanges: includeMetadataChanges);
    if (excludePendingWrites) {
      streamDs = streamDs.where((ds) => !ds.metadata.hasPendingWrites);
    }
    return streamDs.map((ds) => ds.data());
  }

  ${docCommentTemplate.forAddMethod()}Future<DocumentReference<${config.createClassName}>> add({
    $documentIdMethodParametersDefinition
    required ${config.createClassName} ${config.createClassInstanceName},
  }) =>
      ${_collectionReference(ReferenceClassType.create)}.add(${config.createClassInstanceName});

  ${docCommentTemplate.forSetMethod()}Future<void> set({
    $documentIdMethodParametersDefinition
    required String ${config.documentId},
    required ${config.createClassName} ${config.createClassInstanceName},
    SetOptions? options,
  }) =>
      ${config.createDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).set(${config.createClassInstanceName}, options);

  ${docCommentTemplate.forUpdateMethod()}Future<void> update({
    $documentIdMethodParametersDefinition
    required String ${config.documentId},
    required ${config.updateClassName} ${config.updateClassInstanceName},
  }) =>
      ${config.updateDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).update(${config.updateClassInstanceName}.toJson());

  ${docCommentTemplate.forDeleteMethod()}Future<void> delete({
    $documentIdMethodParametersDefinition
    required String ${config.documentId},
  }) =>
      ${config.deleteDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).delete();

  ${docCommentTemplate.forBatchWriteMethod()}Future<void> batchWrite(List<BatchWrite${config.capitalizedDocumentName}> batchWriteTasks) {
    final batch = FirebaseFirestore.instance.batch();
    for (final task in batchWriteTasks) {
      switch (task) {
        case BatchCreate${config.capitalizedDocumentName}(
            $caseParameter
            ${config.documentId}: final ${config.documentId},
            ${config.createClassInstanceName}: final ${config.createClassInstanceName},
          ):
          batch.set(
            ${config.createDocumentReferenceName}(
              $documentIdParametersArgumentInvocation
              ${config.documentId}: ${config.documentId},
            ),
            ${config.createClassInstanceName},
          );
        case BatchUpdate${config.capitalizedDocumentName}(
            $caseParameter
            ${config.documentId}: final ${config.documentId},
            ${config.updateClassInstanceName}: final ${config.updateClassInstanceName},
          ):
          batch.update(
            ${config.updateDocumentReferenceName}(
              $documentIdParametersArgumentInvocation
              ${config.documentId}: ${config.documentId},
            ),
            ${config.updateClassInstanceName}.toJson(),
          );
        case BatchDelete${config.capitalizedDocumentName}(
            $caseParameter
            ${config.documentId}: final ${config.documentId}
          ):
          batch.delete(${config.deleteDocumentReferenceName}(
            $documentIdParametersArgumentInvocation
            ${config.documentId}: ${config.documentId},
          ));
      }
    }
    return batch.commit();
  }
}
''';
  }

  String _collectionReference(ReferenceClassType referenceClassType) {
    final name = config.collectionReferenceName(referenceClassType);
    final ancestors = config.firestoreDocumentPath.ancestors;
    if (config.firestoreDocumentPath.ancestors.isEmpty) {
      return name;
    } else {
      final buffer = StringBuffer();
      for (final segment in ancestors) {
        final documentId = segment.documentId;
        buffer.writeln('$documentId: $documentId,');
      }
      return '$name($buffer)';
    }
  }
}
