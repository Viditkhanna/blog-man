import 'package:dio/dio.dart';

import 'dio_client.dart';

class ApiClient {
  Future get(String path, {query}) async {}

  Future post(String path, body, {query}) async {}

  Future put(String path, body, {query}) async {}

  Future patch(String path, body, {query}) async {}

  Future delete(String path, {body, query}) async {}

  Future postProgress(
    String path,
    body, {
    query,
    ProgressCallback onProgress,
  }) async {}
}

final apiClient = DioClient();
