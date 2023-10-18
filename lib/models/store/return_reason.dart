class ReturnReason {
  /// The return reason's ID
  ///
  /// Example: "rr_01G8X82GCCV2KSQHDBHSSAH5TQ"
  final String? id;

  /// A description of the Reason.
  ///
  /// Example: "Items that are damaged"
  final String? description;

  /// A text that can be displayed to the Customer as a reason.
  ///
  /// Example: "Damaged goods"
  final String? label;

  /// The value to identify the reason by.
  ///
  /// Example: "damaged"
  final String? value;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  ///
  /// Example: {"car":"white"}
  final Map<String, dynamic>? metadata;

  /// The ID of the parent reason.
  final String? parentReturnReasonId;
  final ReturnReason? parentReturnReason;
  final List<ReturnReason>? returnReasonChildren;

  ReturnReason({
    this.id,
    this.description,
    required this.label,
    required this.value,
    this.parentReturnReasonId,
    this.parentReturnReason,
    this.returnReasonChildren,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory ReturnReason.fromJson(Map<String, dynamic> json) {
    List<ReturnReason>? returnReasonChildren;
    if (json['return_reason_children'] != null) {
      returnReasonChildren = [];
      for (var element in (json['return_reason_children'] as List)) {
        returnReasonChildren.add(ReturnReason.fromJson(element));
      }
    }
    return ReturnReason(
      id: json['id'],
      description: json['description'],
      label: json['label'],
      value: json['value'],
      returnReasonChildren: returnReasonChildren,
      parentReturnReasonId: json['parent_return_reason_id'],
      parentReturnReason:
          json['parent_return_reason'] != null ? ReturnReason.fromJson(json['parent_return_reason']) : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['description'] = description;
    json['label'] = label;
    json['value'] = value;
    json['parent_return_reason_id'] = parentReturnReasonId;
    json['parent_return_reason'] = parentReturnReason?.toJson();
    // json['return_reason_children'] = returnReasonChildren?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
