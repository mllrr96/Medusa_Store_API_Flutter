import 'dart:developer';

import '../models/request/index.dart';
import '../models/response/index.dart';
import 'base.dart';

class CartsResource extends BaseResource {
  CartsResource(super.client);

  /// Adds a shipping method to cart
  /// @param {string} cart_id Id of cart
  /// @param {StorePostCartsCartShippingMethodReq} payload Containing id of shipping option and optional data
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> addShippingMethod(
      {required String cartId, StorePostCartsCartShippingMethodReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/shipping-methods', data: req);
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Complete a cart and place an order or create a swap, based on what the cart is created for.
  ///
  ///
  /// This includes attempting to authorize the cart's payment.
  /// If authorizing the payment requires more action, the cart will not be completed and the order will not be placed or the swap will not be created.
  ///
  ///
  /// An idempotency key will be generated if none is provided in the header Idempotency-Key and added to the response.
  /// If an error occurs during cart completion or the request is interrupted for any reason,
  /// the cart completion can be retried by passing the idempotency key in the Idempotency-Key header.
  Future<StoreCompleteCartRes?> complete({required String cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/complete');
      if (response.statusCode == 200) {
        return StoreCompleteCartRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Create a Cart. Although optional, specifying the cart's region and sales channel can affect the cart's pricing and the products that can be added to the cart respectively. So, make sure to set those early on and change them if necessary, such as when the customer changes their region.
  ///
  /// If a customer is logged in, the cart's customer ID and email will automatically be set.
  Future<StoreCartsRes?> createCart({StorePostCartReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts', data: req);
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Creates payment sessions.
  /// Initializes the payment sessions that can be used to pay for the items of the cart.
  /// This is usually called when a customer proceeds to checkout.
  /// @param {string} cart_id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> createPaymentSessions({required String cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/payment-sessions');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Removes a discount from cart.
  /// @param {string} cart_id is required
  /// @param {string} code discount code to remove
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> deleteDiscount(
      {required String cartId, String? code, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete('/store/carts/$cartId/discounts/$code');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Removes a payment session from a cart.
  /// Can be useful in case a payment has failed
  /// @param {string} cart_id is required
  /// @param {string} provider_id the provider id of the session e.g. "stripe"
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> deletePaymentSession(
      {required String cartId, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete('/store/carts/$cartId/payment-sessions/$providerId');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Refreshes a payment session.
  /// @param {string} cart_id is required
  /// @param {string} provider_id the provider id of the session e.g. "stripe"
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> refreshPaymentSession(
      {required String cartId, required String providerId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/payment-sessions/$providerId/refresh');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieves a cart
  /// @param {string} cart_id is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> retrieve({required String cartId, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get('/store/carts/$cartId');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Refreshes a payment session.
  /// @param {string} cart_id is required
  /// @param {StorePostCartsCartPaymentSessionReq} payload the provider id of the session e.g. "stripe"
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> setPaymentSession(
      {required String cartId,
      required StorePostCartsCartPaymentSessionReq? req,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/payment-sessions', data: req);
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// Updates a cart
  /// @param {string} cart_id is required
  /// @param {StorePostCartsCartReq} payload is required and can contain region_id, email, billing and shipping address
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> update(
      {required String cartId, required StorePostCartsCartReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId', data: req);
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Updates the payment method
  /// @param {string} cart_id is required
  /// @param {string} provider_id is required
  /// @param {StorePostCartsCartPaymentSessionUpdateReq} payload is required
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCartsRes>}
  Future<StoreCartsRes?> updatePaymentSession(
      {required String cartId,
      required String providerId,
      required Map<String, dynamic>? req,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/payment-sessions/$providerId', data: req);
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Generates a Line Item with a given Product Variant and adds it to the Cart
  ///
  /// Required fields:
  ///
  /// cartId: The id of the cart to add the line item to.
  ///
  /// variantId: The id of the product variant to generate the line item from.
  ///
  /// quantity: The quantity of the product variant to add to the line item.
  Future<StoreCartsRes?> addLineItem(
      {required String cartId,
      required String variantId,
      required int quantity,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/line-items', data: {
        'variant_id': variantId,
        'quantity': quantity,
      });
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Update a line item's quantity.
  ///
  /// Required fields:
  ///
  /// cartId: The id of the cart to add the line item to.
  ///
  /// lineId: The id of the line item.
  ///
  /// quantity: The quantity of the product variant to add to the line item.
  Future<StoreCartsRes?> updateLineItem(
      {required String cartId,
      required String lineId,
      required int quantity,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/carts/$cartId/line-items/$lineId', data: {'quantity': quantity});
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Delete a Line Item from a Cart. The payment sessions will be updated and the totals will be recalculated.
  ///
  /// Required fields:
  ///
  /// cartId: The id of the cart to add the line item to.
  ///
  /// lineId: The id of the line item.
  Future<StoreCartsRes?> deleteLineItem(
      {required String cartId,
      required String lineId,
      Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete('/store/carts/$cartId/line-items/$lineId');
      if (response.statusCode == 200) {
        return StoreCartsRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
