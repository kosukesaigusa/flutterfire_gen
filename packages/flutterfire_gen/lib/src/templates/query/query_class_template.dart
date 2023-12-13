import '../../configs/code_generation_config.dart';
import '../../configs/reference_class_type.dart';
import '../path_segment_parameters_template.dart';
import 'doc_comment_template.dart';

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
      config.firestoreDocumentPath,
    );
    final documentIdParametersArgumentInvocation =
        DocumentIdParametersTemplate.argumentInvocation(
      config.firestoreDocumentPath,
    );
    final docCommentTemplate = QueryClassDocCommentTemplate(config);
    return '''
${docCommentTemplate.forClass()}
class ${config.baseClassName}Query {
  ${docCommentTemplate.forFetchDocumentsMethod()}
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

  ${docCommentTemplate.forSubscribeDocumentsMethod()}
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

  ${docCommentTemplate.forFetchDocumentMethod()}
  Future<${config.readClassName}?> fetchDocument({
    $documentIdParametersDefinition
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

  ${docCommentTemplate.forSubscribeDocumentMethod()}
  Stream<${config.readClassName}?> subscribeDocument({
    $documentIdParametersDefinition
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

  ${docCommentTemplate.forAddMethod()}
  Future<DocumentReference<${config.createClassName}>> add({
    $documentIdParametersDefinition
    required ${config.createClassName} ${config.createClassInstanceName},
  }) =>
      ${_collectionReference(ReferenceClassType.create)}.add(${config.createClassInstanceName});

  ${docCommentTemplate.forSetMethod()}
  Future<void> set({
    $documentIdParametersDefinition
    required String ${config.documentId},
    required ${config.createClassName} ${config.createClassInstanceName},
    SetOptions? options,
  }) =>
      ${config.createDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).set(${config.createClassInstanceName}, options);

  ${docCommentTemplate.forUpdateMethod()}
  Future<void> update({
    $documentIdParametersDefinition
    required String ${config.documentId},
    required ${config.updateClassName} ${config.updateClassInstanceName},
  }) =>
      ${config.updateDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).update(${config.updateClassInstanceName}.toJson());

  ${docCommentTemplate.forDeleteMethod()}
  Future<void> delete({
    $documentIdParametersDefinition
    required String ${config.documentId},
  }) =>
      ${config.deleteDocumentReferenceName}(
        $documentIdParametersArgumentInvocation
        ${config.documentId}: ${config.documentId},
      ).delete();
}
''';
  }

  ///
  String _collectionReference(ReferenceClassType referenceClassType) {
    final name =
        '${referenceClassType.name}${config.baseClassName}CollectionReference';
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
