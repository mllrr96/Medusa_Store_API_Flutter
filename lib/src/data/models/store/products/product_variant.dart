import '../others/money_amount.dart';
import 'product.dart';
import 'product_option_value.dart';

class ProductVariant {
  /// The product variant's id
  ///
  /// Example: "variant_01G1G5V2MRX2V3PVSR2WXYPFB6"Copy to Clipboard
  final String? id;

  /// A title that can be displayed for easy identification of the product variant.
  ///
  /// Example: "Small"
  final String? title;

  /// The id of the product that the product variant belongs to.
  ///
  /// Example: "prod_01G1G5V2MBA328390B5AXJ610F"Copy to Clipboard
  final String? productId;

  /// The details of the product that the product variant belongs to.
  final Product? product;

  /// The details of the prices of the product variant, each represented as a money amount. each money amount represents a price in a given currency or a specific region.
  final List<MoneyAmount>? prices;

  /// The unique stock keeping unit used to identify the product variant. this will usually be a unique identifer for the item that is to be shipped, and can be referenced across multiple systems.
  ///
  /// Example: "shirt-123"
  final String? sku;

  /// A generic field for a gtin number that can be used to identify the product variant.
  ///
  /// Example: null
  final String? barcode;

  /// An ean barcode number that can be used to identify the product variant.
  ///
  /// Example: null
  final String? ean;

  /// A upc barcode number that can be used to identify the product variant.
  final String? upc;

  /// The ranking of this variant
  ///
  /// Default: 0
  final int? variantRank;

  /// The current quantity of the item that is stocked.
  ///
  /// Example: 100
  final int? inventoryQuantity;

  /// Whether the product variant should be purchasable when
  ///
  /// Default: false
  final bool? allowBackorder;

  /// Whether medusa should manage inventory for the product variant.
  ///
  /// Default: true
  final bool? manageInventory;

  /// The harmonized system code of the product variant. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? hsCode;

  ///The country in which the product variant was produced. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? originCountry;

  /// The manufacturers identification code that identifies the manufacturer of the product variant. may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? midCode;

  /// The material and composition that the product variant is made of, may be used by fulfillment providers to pass customs information to shipping carriers.
  final String? material;

  /// The weight of the product variant. may be used in shipping rate calculations.
  final num? weight;

  /// The length of the product variant. may be used in shipping rate calculations.
  final num? length;

  /// The height of the product variant. may be used in shipping rate calculations.
  final num? height;

  /// The width of the product variant. may be used in shipping rate calculations.
  final num? width;

  /// The details of the product options that this product variant defines values for.
  final List<ProductOptionValue>? options;

  /// Only used with the inventory modules. a boolean value indicating whether the product variant is purchasable. a variant is purchasable if:
  ///
  /// inventory is not managed
  /// it has no inventory items
  /// it is in stock
  /// it is backorderable.
  final bool? purchasable;

  /// The details inventory items of the product variant.
  final List<InventoryItem>? inventoryItews;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// An optional key-value map with additional details
  final Map<String, dynamic>? metadata;

  ProductVariant({
    this.id,
    this.title,
    this.productId,
    this.product,
    this.prices,
    this.sku,
    this.barcode,
    this.ean,
    this.upc,
    this.variantRank,
    this.inventoryQuantity,
    this.allowBackorder,
    this.manageInventory,
    this.hsCode,
    this.originCountry,
    this.midCode,
    this.material,
    this.weight,
    this.length,
    this.height,
    this.width,
    this.options,
    this.metadata,
    this.purchasable,
    this.inventoryItews,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    List<MoneyAmount>? prices;
    List<ProductOptionValue>? options;
    if (json['prices'] != null) {
      prices = <MoneyAmount>[];
      json['prices'].forEach((v) {
        prices!.add(MoneyAmount.fromJson(v));
      });
    }
    if (json['options'] != null) {
      options = <ProductOptionValue>[];
      json['options'].forEach((v) {
        options!.add(ProductOptionValue.fromJson(v));
      });
    }

    return ProductVariant(
      id: json['id'],
      title: json['title'],
      productId: json['product_id'],
      product: json['product'] != null ? Product.fromJson(json) : null,
      prices: prices,
      sku: json['sku'],
      barcode: json['barcode'],
      ean: json['ean'],
      upc: json['upc'],
      variantRank: json['variant_rank'],
      inventoryQuantity: json['inventory_quantity'],
      allowBackorder: json['allow_backorder'],
      manageInventory: json['manage_inventory'],
      hsCode: json['hs_code'],
      originCountry: json['origin_country'],
      midCode: json['mid_code'],
      material: json['material'],
      weight: json['weight'],
      length: json['length'],
      height: json['height'],
      width: json['width'],
      options: options,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['product_id'] = productId;
    data['product'] = product?.toJson();
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    data['sku'] = sku;
    data['barcode'] = barcode;
    data['ean'] = ean;
    data['upc'] = upc;
    data['variant_rank'] = variantRank;
    data['inventory_quantity'] = inventoryQuantity;
    data['allow_backorder'] = allowBackorder;
    data['manage_inventory'] = manageInventory;
    data['hs_code'] = hsCode;
    data['origin_country'] = originCountry;
    data['mid_code'] = midCode;
    data['material'] = material;
    data['weight'] = weight;
    data['length'] = length;
    data['height'] = height;
    data['width'] = width;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['metadata'] = metadata;
    return data;
  }
}

class InventoryItem {
  /// The product variant inventory item's id
  ///
  /// Example: "pvitem_01G8X9A7ESKAJXG2H0E6F1MW7A"Copy to Clipboard
  final String? id;

  /// The id of the inventory item
  final String? inventoryItemId;

  /// The id of the variant.
  final String? variantId;

  /// The quantity of an inventory item required for the variant.
  ///
  /// Default: 1
  final int? requiredQuantity;

  /// The date with timezone at which the resource was created.
  final DateTime? createdAt;

  /// The date with timezone at which the resource was updated.
  final DateTime? updatedAt;

  /// The date with timezone at which the resource was deleted.
  final DateTime? deletedAt;

  /// The details of the product variant.
  final ProductVariant? productVariant;

  InventoryItem({
    this.id,
    this.inventoryItemId,
    this.variantId,
    this.requiredQuantity,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.productVariant,
  });

  factory InventoryItem.fromJson(Map<String, dynamic> json) {
    return InventoryItem(
      id: json['id'],
      inventoryItemId: json['inventory_item_id'],
      variantId: json['variant_id'],
      requiredQuantity: json['required_quantity'],
      createdAt: DateTime.tryParse(json['created_at'] ?? '')?.toLocal(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '')?.toLocal(),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? '')?.toLocal(),
    );
  }
}
