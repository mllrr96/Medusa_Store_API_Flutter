import 'index.dart';

class GiftCardTransaction {
  /// The gift card transaction's id
  ///
  /// Example: "gct_01G8X9A7ESKAJXG2H0E6F1MW7A"
  final String? id;

  /// The id of the gift card that was used in the transaction.
  ///
  /// Example: "gift_01G8XKBPBQY2R7RBET4J7E0XQZ"
  final String? giftCardId;

  /// The details of the gift card associated used in this transaction.
  final GiftCard? giftCard;

  /// The id of the order that the gift card was used for payment.
  ///
  /// Example: "order_01G8TJSYT9M6AVS5N4EMNFS1EK"
  final String? orderId;

  /// The details of the order that the gift card was used for payment.
  final Order? order;

  /// The amount that was used from the gift card.
  final int? amount;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// Whether the transaction is taxable or not.
  final bool? isTaxable;

  /// The tax rate of the transaction
  final num? taxRate;

  GiftCardTransaction({
    this.id,
    required this.giftCardId,
    this.giftCard,
    this.orderId,
    this.order,
    required this.amount,
    this.createdAt,
    this.isTaxable,
    this.taxRate,
  });

  factory GiftCardTransaction.fromJson(Map<String, dynamic> json) {
    return GiftCardTransaction(
      id: json['id'],
      giftCardId: json['gift_card_id'],
      giftCard: json['gift_card'] != null ? GiftCard.fromJson(json['gift_card']) : null,
      orderId: json['order_id'],
      order: json['order'] != null ? Order.fromJson(json['order']) : null,
      amount: json['amount'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      isTaxable: json['is_taxable'],
      taxRate: json['tax_rate'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['gift_card_id'] = giftCardId;
    json['gift_card'] = giftCard?.toJson();
    json['order_id'] = orderId;
    json['order'] = order?.toJson();
    json['amount'] = amount;
    json['created_at'] = createdAt.toString();
    json['is_taxable'] = isTaxable;
    json['tax_rate'] = taxRate;
    return json;
  }
}
