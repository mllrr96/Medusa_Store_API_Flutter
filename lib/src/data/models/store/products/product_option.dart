import 'product_option_value.dart';
import 'product.dart';
class ProductOption {
  /// The product option's id
  ///
  /// Example: "opt_01F0YESHQBZVKCEXJ24BS6PCX3"

  final String? id;

  /// The title that the product option is defined by.
  ///
  /// Example: "Size"
  final String? title;

  /// The details of the values of the product option.
  final List<ProductOptionValue>? values;

  /// The id of the product that this product option belongs to.
  ///
  /// Example: "prod_01G1G5V2MBA328390B5AXJ610F"Copy to Clipboard
  final String? productId;

  /// The details of the product that this product option belongs to.
  final Product? product;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  ProductOption({
    this.id,
    required this.title,
    this.values,
    required this.productId,
    this.product,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata,
  });

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    List<ProductOptionValue>? values;

    if (json['values'] != null) {
      values = <ProductOptionValue>[];
      json['values'].forEach((e) => values!.add(ProductOptionValue.fromJson(e)));
    }

    return ProductOption(
      id: json['id'],
      title: json['title'],
      productId: json['product_id'],
      product: json['product'] != null ? Product.fromJson(json['product']) : null,
      values: values,
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['values'] = values?.map((e) => e.toJson()).toList();
    json['product_id'] = productId;
    json['product'] = product?.toJson();
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;

    return json;
  }
}
