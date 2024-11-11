import 'package:dio/dio.dart';
import 'package:snap_buy_app/core/service/remote/api/api_consumer.dart';
import 'package:snap_buy_app/core/service/remote/api/end_points.dart';

class DioConsumer implements ApiConsumer {
  final Dio dio = Dio();

  DioConsumer() {
    dio.options.baseUrl = EndPoints.baseUrl;
  }

  @override
  Future get(String url, {Map<String, dynamic>? headers}) {
    final response = dio.get(url, options: Options(headers: headers));
    return response;
  }

  @override
  Future delete(String url, {Map<String, dynamic>? headers}) {
    final response = dio.delete(url, options: Options(headers: headers));
    return response;
  }

  @override
  Future post(String url, {Map<String, dynamic>? headers, body}) {
    final response =
        dio.post(url, data: body, options: Options(headers: headers));
    return response;
  }

  @override
  Future put(String url, {Map<String, dynamic>? headers, body}) {
    final response =
        dio.put(url, data: body, options: Options(headers: headers));
    return response;
  }
}
