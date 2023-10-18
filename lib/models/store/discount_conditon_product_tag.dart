
import 'index.dart';

class DiscountConditionProductTag {
  String? productTagId;
  String? conditionId;
  ProductTag? productTag;
  DiscountCondition? discountCondition;
  DateTime? createdAt;
  DateTime? updatedAt;
  Map<String, dynamic>? metadata;

  DiscountConditionProductTag({
    required this.productTagId,
    required this.conditionId,
    this.productTag,
    this.discountCondition,
    this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  DiscountConditionProductTag.fromJson(Map<String, dynamic> json) {
    productTagId = json['product_tag_id'];
    conditionId = json['condition_id'];
    productTag = json['product_tag'] != null
        ? ProductTag.fromJson(json['product_tag'])
        : null;
    discountCondition = json['discount_condition'] != null
        ? DiscountCondition.fromJson(json['discount_condition'])
        : null;
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    metadata = json['metadata'] ;
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['product_tag_id'] = productTagId;
    json['condition_id'] = conditionId;
    json['product_tag'] = productTag?.toJson();
    json['discount_condition'] = discountCondition?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
