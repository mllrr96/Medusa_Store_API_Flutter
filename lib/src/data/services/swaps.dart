import 'dart:developer';
import '../models/request/index.dart';
import '../models/response/index.dart';
import 'base.dart';

class SwapsResource extends BaseResource {
  SwapsResource(super.client);

  /// @description Creates a swap from a cart
  /// @param {StorePostSwapsReq} payload
  /// @param customHeaders
  /// @return {ResponsePromise<StoreSwapsRes>}
  Future<StoreSwapsRes?> create({StorePostSwapsReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/swaps', data: req);
      if (response.statusCode == 200) {
        return StoreSwapsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// @description Retrieves a swap by cart id
  /// @param {string} cart_id id of cart
  /// @param customHeaders
  /// @return {ResponsePromise<StoreSwapsRes>}
  Future<StoreSwapsRes?> retrieveByCartId({required String cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/swaps/$cartId',
      );
      if (response.statusCode == 200) {
        return StoreSwapsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
