class SalesChannel {
  /// The sales channel's id
  ///
  /// Example: "sc_01G8X9A7ESKAJXG2H0E6F1MW7A"
  final String? id;

  /// The name of the sales channel.
  ///
  /// Example: "Market"
  final String? name;

  /// The description of the sales channel.
  ///
  /// Example: "Multi-vendor market"
  final String? description;

  /// Specify if the sales channel is enabled or disabled.
  final bool? isDisabled;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  SalesChannel({
    this.id,
    required this.name,
    this.description,
    this.isDisabled,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory SalesChannel.fromJson(Map<String, dynamic> json) {
    return SalesChannel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isDisabled: json['is_disabled'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['description'] = description;
    json['is_disabled'] = isDisabled;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    return json;
  }
}
