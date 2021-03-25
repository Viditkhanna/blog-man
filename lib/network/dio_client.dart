import 'package:dio/dio.dart';
import 'package:homeward/data/shared_prefs.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'api_client.dart';

class DioClient implements ApiClient {
  Dio dio;

  static const BaseUrl = 'https://60585b2ec3f49200173adcec.mockapi.io/api/v1';

  DioClient() {
    dio = Dio();
    dio.options = BaseOptions(baseUrl: BaseUrl);

    dio.interceptors.add(
      PrettyDioLogger(requestBody: true, maxWidth: 80, error: true),
    );
  }

  Future<Options> getOptions({bool isFile = false}) async {
    Map<String, dynamic> headers = {'Accept': 'application/json'};
    var token = await Prefs.getToken();
    if (token != null) {
      headers['Authorization'] = token;
    }
    return Options(
      sendTimeout: isFile ? null : 50000,
      receiveTimeout: isFile ? null : 50000,
      headers: headers,
      responseType: ResponseType.json,
    );
  }

  @override
  Future delete(String path, {body, query}) async {
    var response = await dio.delete(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future get(String path, {query}) async {
    var response = await dio.get(
      path,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future patch(String path, body, {query}) async {
    var response = await dio.patch(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future post(String path, body, {query}) async {
    var response = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future postProgress(
    String path,
    body, {
    query,
    ProgressCallback onProgress,
  }) async {
    var response = await dio.post(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }

  @override
  Future put(String path, body, {query}) async {
    var response = await dio.put(
      path,
      data: body,
      queryParameters: query,
      options: await getOptions(),
    );
    return response.data;
  }
}
