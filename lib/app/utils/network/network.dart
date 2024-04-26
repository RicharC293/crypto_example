import 'package:dio/dio.dart';

class Network {
  factory Network() => _instance;

  Network._privateConstructor();

  static final Network _instance = Network._privateConstructor();

  final Dio _dio = Dio();

  Dio request() {
    final interceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        options
          ..contentType = Headers.jsonContentType
          ..responseType = ResponseType.json
          ..baseUrl = 'https://data-api.binance.vision';

        return handler.next(options);
      },
      onError: (err, handler) {
        handler.reject(err);
      },
      onResponse: (response, handler) {
        handler.resolve(response);
      },
    );

    if (_dio.interceptors
        .any((element) => element.runtimeType == InterceptorsWrapper)) {
      _dio.interceptors
          .removeWhere((element) => element.runtimeType == InterceptorsWrapper);
    }

    _dio.interceptors.add(interceptor);

    return _dio;
  }
}
