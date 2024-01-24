import '../store/others/index.dart';

class StoreSwapsRes {
  Swap? swap;

  StoreSwapsRes.fromJson(json) {
    swap = json["swap"] != null ? Swap.fromJson(json["swap"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['swap'] = swap?.toJson();
    return data;
  }
}
