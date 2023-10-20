import 'dart:developer';
import '../response_models/index.dart';
import 'base.dart';

class PaymentMethodsResource extends BaseResource {
  PaymentMethodsResource(super.client);

  /// Lists customer payment methods
  /// @param {string} id id of cart
  /// @param customHeaders
  /// @return {StoreCustomersListPaymentMethodsRes}
  Future<StoreCustomersListPaymentMethodsRes?> list(
      {Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client
          .get('/store/customers/me/payment-methods');
      if (response.statusCode == 200) {
        return StoreCustomersListPaymentMethodsRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error,stackTrace) {
      log(error.toString(),stackTrace:stackTrace);
      rethrow;
    }
  }
}
