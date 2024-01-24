import '../../../enum/enums.dart';
import 'shipping_option.dart';

class ShippingOptionRequirement {
  String? id;
  String? shippingOptionId;
  ShippingOption? shippingOption;
  RequirementType? type;
  int? amount;
  DateTime? deletedAt;

  ShippingOptionRequirement({
    this.id,
    required this.shippingOptionId,
    this.shippingOption,
    required this.type,
    required this.amount,
    this.deletedAt,
  });

  ShippingOptionRequirement.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingOptionId = json['shipping_option_id'];
    shippingOption = json['shipping_option'] != null
        ? ShippingOption.fromJson(json['shipping_option'])
        : null;
    type = json['type'] != null
        ? RequirementType.values.firstWhere((e) => e.value == json['type'])
        : null;
    amount = json['amount'];
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal();
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['shipping_option_id'] = shippingOptionId;
    json['shipping_option'] = shippingOption?.toJson();
    json['type'] = type?.value;
    json['amount'] = amount;
    json['deleted_at'] = deletedAt.toString();
    return json;
  }
}
