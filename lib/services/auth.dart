import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../request_models/index.dart';
import '../response_models/index.dart';
import 'base.dart';

class AuthResource extends BaseResource {
  AuthResource(super.client);

  /// Log a customer in and includes the Cookie session in the response header.
  ///
  /// The cookie session can be used in subsequent requests to authenticate the customer.
  Future<StoreAuthRes?> authenticate({StoreAuthRequest? req, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      Response response = await client.post('/store/auth', data: req);
      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var cookie = response.headers['set-cookie']!.first.split(';').first;
        prefs.setString('Cookie', cookie);
        return StoreAuthRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  /// Delete the current session for the logged in customer.
  Future<void> logout({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.delete(
        '/store/auth',
      );
      if (response.statusCode != 200) {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
    }
  }

  /// Retrieve the currently logged in Customer's details.
  ///
  /// Usually used to check if authenticated session is alive.
  Future<StoreAuthRes?> getCurrentSession({Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/auth',
      );
      if (response.statusCode == 200) {
        return StoreAuthRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  /// Check if there's a customer already registered with the provided email.
  Future<StoreGetAuthEmailRes?> emailExists({required String email, Map<String, dynamic>? customHeaders}) async {
    try {
      if (customHeaders != null) {
        client.options.headers.addAll(customHeaders);
      }
      final response = await client.get(
        '/store/auth/$email',
      );
      if (response.statusCode == 200) {
        return StoreGetAuthEmailRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }
}
