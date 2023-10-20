import 'dart:developer';

import '../response_models/index.dart';
import 'base.dart';

class GiftCardsResource extends BaseResource {
  GiftCardsResource(super.client);

  /// @description Retrieves a single GiftCard
  /// @param {string} code code of the gift card
  /// @param customHeaders
  /// @return {ResponsePromise<StoreGiftCardsRes>}
  Future<StoreGiftCardsRes?> retrieve(
      {required String code, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('/store/gift-cards/$code');
      if (response.statusCode == 200) {
        return StoreGiftCardsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
