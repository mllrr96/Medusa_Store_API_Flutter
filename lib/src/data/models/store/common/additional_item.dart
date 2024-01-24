class AdditionalItem {
  /// The id of the product variant.
  final String? variantId;

  /// The quantity of the variant.
  final int? quantity;

  AdditionalItem({
    required this.variantId,
    required this.quantity,
  });

  factory AdditionalItem.fromJson(Map<String, dynamic> json) {
    return AdditionalItem(variantId: json['variant_id'], quantity: json['quantity']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variant_id'] = variantId;
    data['quantity'] = quantity;
    return data;
  }
}
