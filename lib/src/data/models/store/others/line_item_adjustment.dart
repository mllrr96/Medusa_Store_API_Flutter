import '../index.dart';
import 'index.dart';

class LineItemAdjustment {
  /// The line item adjustment's id
  ///
  /// Example: "lia_01G8TKE4XYCTHSCK2GDEP47RE1"
  final String? id;

  /// The id of the line item
  ///
  /// Example: "item_01G8ZC9GWT6B2GP5FSXRXNFNGN"
  final String? itemId;

  /// The details of the line item.
  final LineItem? item;

  /// The line item's adjustment description
  ///
  /// Example: "Adjusted item's price."
  final String? description;

  /// The id of the discount associated with the adjustment
  ///
  /// Example: "disc_01F0YESMW10MGHWJKZSDDMN0VN"
  final String? discountId;

  /// The details of the discount associated with the adjustment.
  final Discount? discount;

  /// The adjustment amount
  ///
  /// Example: 1000
  final num? amount;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  LineItemAdjustment({
    this.id,
    required this.itemId,
    this.item,
    required this.description,
    this.discountId,
    this.discount,
    required this.amount,
    this.metadata,
  });

  factory LineItemAdjustment.fromJson(Map<String, dynamic> json) {
    return LineItemAdjustment(
      id: json['id'],
      itemId: json['item_id'],
      item: json['item'] != null ? LineItem.fromJson(json['item']) : null,
      description: json['description'],
      discountId: json['discount_id'],
      discount: json['discount'] != null ? Discount.fromJson(json['discount']) : null,
      amount: json['amount'],
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['item_id'] = itemId;
    json['item'] = item?.toJson();
    json['description'] = description;
    json['discount_id'] = discountId;
    json['amount'] = amount;
    json['metadata'] = metadata;
    return json;
  }
}
