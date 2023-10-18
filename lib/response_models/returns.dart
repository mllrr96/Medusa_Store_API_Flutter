import '../store_models/store/index.dart';

class StoreReturnsRes {
  Return? returnData;

  StoreReturnsRes.fromJson(json) {
    returnData =
        json["return"] != null ? Return.fromJson(json["return"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['return'] = returnData?.toJson();
    return data;
  }
}
