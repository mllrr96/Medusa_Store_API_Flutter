import 'shipping_method.dart';

class ShippingMethodTaxLine {
  /// The line item tax line's id
  ///
  /// Example: "smtl_01G1G5V2DRX1SK6NQQ8VVX4HQ8"
  final String? id;

  /// The id of the line item
  ///
  /// Example: "sm_01F0YET7DR2E7CYVSDHM593QG2"
  final String? shippingMethodId;

  /// The details of the associated shipping method.
  final ShippingMethod? shippingMethod;

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

  ShippingMethodTaxLine({
    this.id,
    required this.shippingMethodId,
    this.shippingMethod,
    this.code,
    required this.name,
    required this.rate,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory ShippingMethodTaxLine.fromJson(Map<String, dynamic> json) {
    return ShippingMethodTaxLine(
      id: json['id'],
      shippingMethodId: json['shipping_method_id'],
      shippingMethod: json['shipping_method'] != null ? ShippingMethod.fromJson(json['shipping_method']) : null,
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
    json['shipping_method_id'] = shippingMethodId;
    json['shipping_method'] = shippingMethod?.toJson();
    json['code'] = code;
    json['name'] = name;
    json['rate'] = rate;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
