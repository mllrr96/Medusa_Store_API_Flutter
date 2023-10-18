import '../store_models/store/index.dart';


class StoreGiftCardsRes {
  GiftCard? giftCard;

  StoreGiftCardsRes.fromJson(json) {
    giftCard =
        json["gift_card"] != null ? GiftCard.fromJson(json["gift_card"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["gift_card"] = giftCard?.toJson();
    return data;
  }
}
