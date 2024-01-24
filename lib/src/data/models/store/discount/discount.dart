import '../others/index.dart';
import 'discount_rule.dart';

class Discount {
  /// The discount's id
  ///
  /// Example: "disc_01F0YESMW10MGHWJKZSDDMN0VN"
  final String? id;

  /// A unique code for the discount - this will be used by the customer to apply the discount
  ///
  /// Example: "10DISC"
  final String? code;

  /// A flag to indicate if multiple instances of the discount can be generated. i.e. for newsletter discounts
  final bool? isDynamic;

  /// The id of the discount rule that defines how the discount will be applied to a cart.
  ///
  /// Example: "dru_01F0YESMVK96HVX7N419E3CJ7C"
  final String? ruleId;

  /// The details of the discount rule that defines how the discount will be applied to a cart..
  final DiscountRule? rule;

  /// Whether the discount has been disabled. disabled discounts cannot be applied to carts
  final bool? isDisabled;

  /// The discount that the discount was created from. this will always be a dynamic discount
  ///
  /// Example: "disc_01G8ZH853YPY9B94857DY91YGW"
  final String? parentDiscountId;

  /// The details of the parent discount that this discount was created from.
  final Discount? parentDiscount;

  /// The time at which the discount can be used.
  final DateTime? startsAt;

  /// The time at which the discount can no longer be used.
  final DateTime? endsAt;

  /// Duration the discount runs between
  ///
  /// Example: "P3Y6M4DT12H30M5S"
  final String? validDuration;

  /// The details of the regions in which the discount can be used.
  final List<Region>? regions;

  /// The maximum number of times that a discount can be used.
  ///
  /// Example: 100
  final int? usageLimit;

  /// The number of times a discount has been used.
  final int usageCount;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  Discount({
    this.id,
    required this.code,
    required this.isDynamic,
    this.ruleId,
    this.rule,
    this.isDisabled,
    this.parentDiscountId,
    this.parentDiscount,
    this.startsAt,
    this.endsAt,
    this.validDuration,
    this.regions,
    this.usageLimit,
    this.usageCount = 0,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    List<Region>? regions;
    if (json['regions'] != null) {
      regions = <Region>[];
      json['regions'].forEach((e) => regions?.add(Region.fromJson(e)));
    }
    return Discount(
      id: json['id'],
      code: json['code'],
      isDynamic: json['is_dynamic'],
      ruleId: json['rule_id'],
      rule: json['rule'] != null ? DiscountRule.fromJson(json['rule']) : null,
      isDisabled: json['is_disabled'],
      parentDiscountId: json['parent_discount_id'],
      parentDiscount: json['parent_discount'] != null ? Discount.fromJson(json['parent_discount']) : null,
      startsAt: DateTime.tryParse(json['starts_at'] ?? '')?.toLocal(),
      endsAt: DateTime.tryParse(json['ends_at'] ?? '')?.toLocal(),
      validDuration: json['valid_duration'],
      regions: regions,
      usageLimit: json['usage_limit'],
      usageCount: json['usage_count'],
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
    json['is_dynamic'] = isDynamic;
    json['rule_id'] = ruleId;
    json['rule'] = rule;
    json['is_disabled'] = isDisabled;
    json['parent_discount_id'] = parentDiscountId;
    json['parent_discount'] = parentDiscount?.toJson();
    json['starts_at'] = startsAt;
    json['ends_at'] = endsAt;
    json['valid_duration'] = validDuration;
    json['regions'] = regions?.map((e) => e.toJson()).toList();
    json['usage_limit'] = usageLimit;
    json['usage_count'] = usageCount;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
