import 'line_item.dart';

class LineItemTaxLine {
  /// The line item tax line's id
  ///
  /// Example: "litl_01G1G5V2DRX1SK6NQQ8VVX4HQ8"
  final String? id;

  /// The id of the line item
  ///
  /// Example: "item_01G8ZC9GWT6B2GP5FSXRXNFNGN"
  final String? itemId;

  /// The details of the line item.
  final LineItem? item;

  /// A code to identify the tax type by
  ///
  /// Example: "tax01"
  final String? code;

  /// A human friendly name for the tax
  ///
  /// Example: "Tax Example"
  final String? name;

  /// The numeric rate to charge tax by
  ///
  /// Example: 10
  final num? rate;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  LineItemTaxLine({
    this.id,
    required this.itemId,
    this.item,
    this.code,
    required this.name,
    required this.rate,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory LineItemTaxLine.fromJson(Map<String, dynamic> json) {
    return LineItemTaxLine(
      id: json['id'],
      itemId: json['item_id'],
      item: json['item'] != null ? LineItem.fromJson(json['item']) : null,
      code: json['code'],
      name: json['name'],
      rate: json['rate'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['item_id'] = itemId;
    json['item'] = item?.toJson();
    json['code'] = code;
    json['name'] = name;
    json['rate'] = rate;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
