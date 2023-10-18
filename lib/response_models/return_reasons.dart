import '../store_models/store/index.dart';

class StoreReturnReasonsRes {
  ReturnReason? returnReason;

  StoreReturnReasonsRes.fromJson(json) {
    returnReason = json["return_reason"] != null
        ? ReturnReason.fromJson(json["return_reason"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['return_reason'] = returnReason?.toJson();
    return data;
  }
}

class StoreReturnReasonsListRes {
  List<ReturnReason>? returnReasons;

  StoreReturnReasonsListRes.fromJson(json) {
    if (json['return_reasons'] != null) {
      returnReasons = <ReturnReason>[];
      json['return_reasons'].forEach((v) {
        returnReasons?.add(ReturnReason.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['return_reasons'] =
        returnReasons?.map((e) => e.toJson()).toList() ;
    return data;
  }
}
