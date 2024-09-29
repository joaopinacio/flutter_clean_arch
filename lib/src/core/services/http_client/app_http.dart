import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gestao_obra_mobile/src/core/services/http_client/app_http_enum.dart';

/// The `AppHttp` class is designed to simplify HTTP API calls using the Dio library.
/// It provides methods for sending HTTP requests such as GET, POST, PUT, DELETE, and PATCH.
class AppHttp extends BaseOptions {
  /// Creates an instance of `AppHttp`.
  ///
  /// [baseUrl]: The base URL for all HTTP requests.
  /// [headers]: Default HTTP headers to include in all requests.
  /// [interceptors]: A list of Dio interceptors to be applied to all requests.
  ///
  AppHttp({
    super.baseUrl,
    super.headers,
    this.interceptors,
  }) {
    _init();
  }

  /// Private instance of the Dio client that executes HTTP requests.
  late final Dio _client;

  /// List of interceptors that can be applied to each request.
  final List<Interceptor>? interceptors;

  /// Initializes the Dio client with the provided base URL and interceptors.
  void _init() {
    _client = Dio(
      BaseOptions(
        // ignore: avoid_redundant_argument_values
        baseUrl: const String.fromEnvironment('BASE_URL'),
        validateStatus: (status) => (status ?? 200) != 401,
      ),
    );

    final interceptorsList = [
      // DefaultInterceptor(),
      ...?interceptors,
    ];

    _client.interceptors.addAll(interceptorsList);
  }

  // void updateHeader({required AuthModel auth}) {
  //   _client.options = _client.options.copyWith(
  //     headers: {
  //       'Authorization': 'Bearer ${auth.accessToken}',
  //     },
  //   );
  // }

  /// Sends an HTTP request with the specified method.
  ///
  /// [path]: The API endpoint path.
  /// [method]: The HTTP method of the request (GET, POST, PUT, DELETE, or PATCH).
  /// [data]: The data to include in the request (e.g., JSON body).
  /// [options]: Additional configuration options for the request.
  /// [interceptors]: A list of custom interceptors for this specific request.
  ///
  /// Returns a [Future] containing the HTTP response.
  Future<Response<T>> request<T>({
    required String path,
    required RequestMethod method,
    Object? data,
    Map<String, dynamic>? params,
    Options? options,
    List<Interceptor>? interceptors,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
  }) {
    try {
      if (interceptors != null) {
        _client.interceptors.addAll(interceptors);
      }

      final response = _client.request<T>(
        path,
        data: data,
        queryParameters: params,
        options: options?.copyWith(method: method.value) ??
            Options(
              method: method.value,
              headers: _client.options.headers,
            ),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );

      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    } finally {
      if (interceptors != null) {
        _client.interceptors.removeRange(
          _client.interceptors.length - interceptors.length,
          _client.interceptors.length,
        );
      }
    }
  }
}
