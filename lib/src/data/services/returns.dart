import 'dart:developer';

import '../models/request/index.dart';
import '../models/response/index.dart';
import 'base.dart';

class ReturnsResource extends BaseResource {
  ReturnsResource(super.client);

  /// Creates a return request
  /// @param {StorePostReturnsReq} payload details needed to create a return
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnsRes>}

  Future<StoreReturnsRes?> search(
      {StorePostReturnsReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client
          .post('`/store/returns', data: req);
      if (response.statusCode == 200) {
        return StoreReturnsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
