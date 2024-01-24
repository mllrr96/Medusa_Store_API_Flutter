import '../../../enum/enums.dart';
import 'discount_condition.dart';

class DiscountRule {
  /// The discount rule's id
  ///
  /// Example: "dru_01F0YESMVK96HVX7N419E3CJ7C"
  final String? id;

  /// The type of the discount, can be fixed for discounts that reduce the price by a fixed amount, percentage for percentage reductions or free_shipping for shipping vouchers.
  final DiscountRuleType? type;

  /// A short description of the discount
  ///
  /// Example: "10 Percent"
  final String? description;

  /// The value that the discount represents; this will depend on the type of the discount
  ///
  /// Example: 10
  final int? value;

  /// The scope that the discount should apply to.
  final AllocationType? allocation;

  /// The details of the discount conditions associated with the rule. they can be used to limit when the discount can be used.
  final List<DiscountCondition>? conditions;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  DiscountRule({
    this.id,
    required this.type,
    this.description,
    required this.value,
    this.allocation,
    this.conditions,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory DiscountRule.fromJson(Map<String, dynamic> json) {
    List<DiscountCondition>? conditions;
    if (json['conditions'] != null) {
      conditions = <DiscountCondition>[];
      json['conditions'].forEach((e) => conditions!.add(DiscountCondition.fromJson(e)));
    }

    return DiscountRule(
      id: json['id'],
      type: DiscountRuleType.values.firstWhere((e) => e.value == (json['type'] ?? '')),
      description: json['description'],
      value: json['value'],
      conditions: conditions,
      allocation:
          AllocationType.values.where((e) => e.value == (json['allocation'])).firstOrNull ?? AllocationType.total,
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['type'] = type?.value;
    json['description'] = description;
    json['value'] = value;
    json['allocation'] = allocation?.value;
    json['conditions'] = conditions?.map((e) => e.toJson()).toList();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
