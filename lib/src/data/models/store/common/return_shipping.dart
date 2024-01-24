class ReturnShipping {
  final String? optionId;
  final int? price;

  ReturnShipping({this.optionId, this.price});

  factory ReturnShipping.fromJson(Map<String, dynamic> json) {
    return ReturnShipping(optionId: json['option_id'], price:json['price'] );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['option_id'] = optionId;
    json['price'] = price;
    return json;
  }
}
