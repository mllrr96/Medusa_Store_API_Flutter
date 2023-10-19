import '../store_models/store/index.dart';

class StoreCollectionsRes {
  ProductCollection? collection;

  StoreCollectionsRes.fromJson(Map<String, dynamic> json) {
    collection = json['collection'] != null ? ProductCollection.fromJson(json["collection"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (collection != null) {
      data['collection'] = collection?.toJson();
    }
    return data;
  }
}

class StoreCollectionsListRes {
  final List<ProductCollection>? collections;
  StoreCollectionsListRes(this.collections);

  factory StoreCollectionsListRes.fromJson(json) {
    if (json['collections'] != null) {
      final collection = List<ProductCollection>.from(
          (json['collections'] as List<Map<String, dynamic>>).map((x) => ProductCollection.fromJson(x)));

      return StoreCollectionsListRes(collection);
    }

    return StoreCollectionsListRes(null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collections'] = collections?.map((e) => e.toJson()).toList();
    return data;
  }
}
