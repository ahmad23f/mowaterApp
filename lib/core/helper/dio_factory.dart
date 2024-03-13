import 'package:dio/dio.dart';

class DioFactory {
  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.headers = {
          'Cookie': 'Cookie_1=value',
          'Content-Type': 'application/x-www-form-urlencoded',
        };

      // Add interceptor for error handling
      dio!.interceptors.add(
        InterceptorsWrapper(
          onError: (error, handler) {
            // Handle Dio errors here
            print('Dio Error: $error');
            // You can add more sophisticated error handling here
            handler.next(error); // Propagate the error
          },
        ),
      );

      return dio!;
    } else {
      return dio!;
    }
  }
}
