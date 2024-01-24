import 'dart:developer';

import 'package:medusa_store_flutter/src/data/models/store/others/address.dart';

import '../models/request/index.dart';
import '../models/response/index.dart';
import 'base.dart';

class CustomersResource extends BaseResource {
  CustomersResource(super.client);

  /// Creates a customer
  /// @param {StorePostCustomersReq} payload information of customer
  /// @param customHeaders
  /// @return { ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> create({StorePostCustomersReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers', data: req?.toJson());
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  ///Retrieves the customer that is currently logged
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> retrieve({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/customers/me',
      );
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// Updates a customer
  /// @param {StorePostCustomersCustomerReq} payload information to update customer with
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> update({StorePostCustomersCustomerReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers/me', data: req?.toJson());
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Retrieve customer orders
  /// @param {StoreGetCustomersCustomerOrdersParams} params optional params to retrieve orders
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersListOrdersRes>}

  Future<StoreCustomersListOrdersRes?> listOrders(
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get('/store/customers/me/orders', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return StoreCustomersListOrdersRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Resets customer password
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to reset customer password
  /// @param customHeaders
  /// @return {ResponsePromise<StoreCustomersRes>}
  Future<StoreCustomersRes?> resetPassword(
      {StorePostCustomersCustomerPasswordTokenReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers/password-reset', data: req?.toJson());
      if (response.statusCode == 200) {
        return StoreCustomersRes.fromJson(response.data);
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Generates a reset password token, which can be used to reset the password.
  /// The token is not returned but should be sent out to the customer in an email.
  /// @param {StorePostCustomersCustomerPasswordTokenReq} payload info used to generate token
  /// @param customHeaders
  /// @return {ResponsePromise}
  Future generatePasswordToken(
      {StorePostCustomersCustomerPasswordTokenReq? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers/password-token', data: req?.toJson());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Add a Shipping Address to a Customer's saved addresses.
  Future addShippingAddress(
      { required Address address, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers/me/addresses', data: address.toJson());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
  /// Update the logged-in customer's saved Shipping Address's details.
  Future updateShippingAddress(
      {
        required String addressId,
        required Address address, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.post('/store/customers/me/addresses/$addressId', data: address.toJson());
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Delete an Address from the Customer's saved addresses.
  Future deleteShippingAddress(
      {
        required String addressId,
       Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete('/store/customers/me/addresses/$addressId');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw response;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
