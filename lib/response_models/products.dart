import '../store_models/store/index.dart';

class StoreProductsListRes {
  final List<Product>? products;
  final int? count;
  final int? limit;
  final int? offset;
  StoreProductsListRes(this.products, {this.count, this.limit, this.offset});
  factory StoreProductsListRes.fromJson(json) {
    if (json['products'] != null) {
      var products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
      return StoreProductsListRes(products, count: json['count'], limit: json['limit'], offset: json['offset']);
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
