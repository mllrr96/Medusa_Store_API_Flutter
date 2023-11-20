import 'dart:developer';

import '../response_models/index.dart';
import 'base.dart';

class OrderEditsResource extends BaseResource {
  OrderEditsResource(super.client);

  /// @description Retrieves a editing order
  /// @param {string} id of the order to be edited
  /// @param customHeaders
  /// @return {ResponsePromise<StoreOrderEditsRes>}
  Future<StoreOrderEditsRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response =
          await client.get('/store/order-edits/$id');
      if (response.statusCode == 200) {
        return StoreOrderEditsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
