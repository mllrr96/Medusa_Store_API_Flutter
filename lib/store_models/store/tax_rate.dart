import 'index.dart';

class TaxRate {
  /// The tax rate's ID
  ///
  /// Example: "txr_01G8XDBAWKBHHJRKH0AV02KXBR"
  final String? id;

  final double? rate;

  /// A code to identify the tax type by
  final String? code;

  /// A human friendly name for the tax
  final String? name;

  /// The id of the Region that the rate belongs to
  final String? regionId;

  /// A region object.
  ///
  /// Available if the relation region is expanded.
  final Region? region;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  /// The products that belong to this tax rate.
  ///
  /// Available if the relation products is expanded.
  final List<Product>? products;

  /// The product types that belong to this tax rate.
  ///
  /// Available if the relation product_types is expanded.
  final List<ProductType>? productTypes;

  /// The shipping options that belong to this tax rate.
  ///
  /// Available if the relation shipping_options is expanded.
  final List<ShippingOption>? shippingOptions;

  /// The count of products
  final int? productCount;

  /// The count of product types
  final int? productTypeCount;

  /// The count of shipping options
  final int? shippingOptionCount;

  TaxRate({
    this.id,
    this.rate,
    this.code,
    this.name,
    this.regionId,
    this.region,
    this.metadata,
    this.products,
    this.productTypes,
    this.shippingOptions,
    this.productCount,
    this.productTypeCount,
    this.shippingOptionCount,
  });

  factory TaxRate.fromJson(Map<String, dynamic> json) {
    List<Product>? products;
    List<ProductType>? productTypes;
    List<ShippingOption>? shippingOptions;

    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products!.add(Product.fromJson(v));
      });
    }
    if (json['product_types'] != null) {
      productTypes = <ProductType>[];
      json['product_types'].forEach((v) {
        productTypes!.add(ProductType.fromJson(v));
      });
    }
    if (json['shipping_options'] != null) {
      shippingOptions = <ShippingOption>[];
      json['shipping_options'].forEach((v) {
        shippingOptions!.add(ShippingOption.fromJson(v));
      });
    }

    return TaxRate(
      id: json['id'],
      rate: json['rate'],
      code: json['code'],
      name: json['name'],
      regionId: json['region_id'],
      productCount: json['product_count'],
      productTypeCount: json['product_type_count'],
      shippingOptionCount: json['shipping_option_count'],
      region: json['region'] != null ? Region.fromJson(json['region']) : null,
      products: products,
      productTypes: productTypes,
      shippingOptions: shippingOptions,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['code'] = code;
    data['name'] = name;
    data['region_id'] = regionId;
    data['region'] = region?.toJson();
    data['metadata'] = metadata;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (productTypes != null) {
      data['product_types'] = productTypes!.map((v) => v.toJson()).toList();
    }
    if (shippingOptions != null) {
      data['shipping_options'] = shippingOptions!.map((v) => v.toJson()).toList();
    }
    data['product_count'] = productCount;
    data['product_type_count'] = productTypeCount;
    data['shipping_option_count'] = shippingOptionCount;
    return data;
  }
}
