import 'index.dart';

class GiftCard {
  /// The gift card's id
  ///
  /// Example: "gift_01G8XKBPBQY2R7RBET4J7E0XQZ"
  final String? id;

  /// The unique code that identifies the gift card. this is used by the customer to redeem the value of the gift card.
  ///
  /// Example: "3RFT-MH2C-Y4YZ-XMN4"
  final String? code;

  /// The value that the gift card represents.
  final int? value;

  /// The remaining value on the gift card.
  final int? balance;

  /// The id of the region this gift card is available in.
  ///
  /// Example: "reg_01G1G5V26T9H8Y0M4JNE3YGA4G"
  final String? regionId;

  ///
  final Region? region;

  /// The id of the order that the gift card was purchased in.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  ///
  final Order? order;

  /// Whether the gift card has been disabled. disabled gift cards cannot be applied to carts.
  final bool isDisabled;

  /// The time at which the gift card can no longer be used.
  final DateTime? endsAt;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  GiftCard({
    this.id,
    required this.code,
    required this.value,
    required this.balance,
    required this.regionId,
    this.region,
    this.orderId,
    this.order,
    this.isDisabled = false,
    this.endsAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory GiftCard.fromJson(Map<String, dynamic> json) {
    return GiftCard(
      id: json['id'],
      code: json['code'],
      value: json['value'],
      balance: json['balance'],
      regionId: json['region_id'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      isDisabled: json['is_disabled'] ?? false,
      endsAt: DateTime.tryParse(json['ends_at'] ?? '')?.toLocal(),
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['value'] = value;
    json['balance'] = balance;
    json['region_id'] = regionId;
    json['region'] = region?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['is_disabled'] = isDisabled;
    json['ends_at'] = endsAt.toString();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
