class ReturnItem {
  final String? itemId;
  final int? quantity;
  final String? reasonId;
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
