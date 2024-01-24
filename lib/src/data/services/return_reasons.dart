import 'dart:developer';
import '../models/response/index.dart';
import 'base.dart';

class ReturnReasonsResource extends BaseResource {
  ReturnReasonsResource(super.client);

  /// @description Retrieves a single Return Reason
  /// @param {string} id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnReasonsRes>}
  Future<StoreReturnReasonsRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/return-reasons/$id',
      );
      if (response.statusCode == 200) {
        return StoreReturnReasonsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }

  ///Lists return reasons defined in Medusa Admin
  /// @param customHeaders
  /// @return {ResponsePromise<StoreReturnReasonsListRes>}

  Future<StoreReturnReasonsListRes?> list(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/return-reasons',
      );
      if (response.statusCode == 200) {
        return StoreReturnReasonsListRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
