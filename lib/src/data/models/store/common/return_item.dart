class ReturnItem {

  /// The id of the order's line item to return.
  final String? itemId;

  /// The quantity to return.
  final int? quantity;
  /// The id of the reason of this return. return reasons can be retrieved from the list return reasons endpoint.
  final String? reasonId;
  /// The note to add to the item being swapped.
  final String? note;

  ReturnItem({this.itemId, this.quantity, this.reasonId, this.note});

  factory ReturnItem.fromJson(Map<String, dynamic> json) {
    return ReturnItem(
        itemId: json['item_id'], quantity: json['quantity'], reasonId: json['reason_id'], note: json['note']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['quantity'] = quantity;
    data['reason_id'] = reasonId;
    data['note'] = note;
    return data;
  }
}
