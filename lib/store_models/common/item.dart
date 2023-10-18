class Item {
  final String? variantId;
  final int? quantity;

  Item({
    required this.variantId,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(variantId: json['variant_id'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant_id'] = variantId;
    data['quantity'] = quantity;
    return data;
  }
}
