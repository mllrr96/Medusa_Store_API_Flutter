import '../store_models/store/index.dart';

class StoreProductsListRes {
  final List<Product>? products;
  StoreProductsListRes(this.products);
  factory StoreProductsListRes.fromJson(json) {
    if (json['products'] != null) {
      final products =
          List<Product>.from((json['products'] as List<Map<String, dynamic>>).map((x) => Product.fromJson(x)));

      return StoreProductsListRes(products);
    }

    return StoreProductsListRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['products'] = products?.map((e) => e.toJson()).toList();
    return data;
  }
}

class StoreProductsRes {
  Product? product;

  StoreProductsRes.fromJson(json) {
    product = json["product"] != null ? Product.fromJson(json["product"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product?.toJson();
    return data;
  }
}

class StorePostSearchRes {
  List<dynamic>? hits;

  StorePostSearchRes.fromJson(json) {
    if (json['hits'] != null) {
      hits = json['hits'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hits'] = hits;
    return data;
  }
}
