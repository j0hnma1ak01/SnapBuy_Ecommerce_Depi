import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();
  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? header,
      String? contentType}) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: header ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }
}
