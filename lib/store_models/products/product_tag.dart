class ProductTag {
  /// The product tag's id
  ///
  /// Example: "ptag_01G8K2MTMG9168F2B70S1TAVK3"
  final String? id;

  /// The value that the product tag represents
  ///
  /// Example: "Pants"
  final String? value;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  ProductTag({
    this.id,
    required this.value,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory ProductTag.fromJson(Map<String, dynamic> json) {
    return ProductTag(
      id: json['id'],
      value: json['value'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['value'] = value;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
